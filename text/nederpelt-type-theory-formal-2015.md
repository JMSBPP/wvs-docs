---
sha256: 75c1cf7dfd25935401a1446b67f4347bc4c9ef153977c8a67658b9154f43d581
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 919915
---
TYPE THEORY AND FORMAL PROOF
Type theory is a fast-evolving field at the crossroads of logic, computer science
and mathematics. This gentle step-by-step introduction is ideal for graduate stu-
dents and researchers who need to understand the ins and outs of the mathematical
machinery, the role of logical rules therein, the essential contribution of definitions
and the decisive nature of well-structured proofs.
The authors begin with untyped lambda calculus and proceed to several fun-
damental type systems, including the well-known and powerful Calculus of
Constructions. The book also covers the essence of proof checking and proof
development, and the use of dependent type theory to formalise mathematics.
The only prerequisite is a basic knowledge of undergraduate mathematics.
Carefully chosen examples illustrate the theory throughout. Each chapter ends
with a summary of the content, some historical context, suggestions for further
reading and a selection of exercises to help readers familiarise themselves with the
material.
Rob Nederpelt was Lecturer in Logic for Computer Science until his retire-
ment. Currently he is a guest researcher in the Faculty of Mathematics and
Computer Science at Eindhoven University of Technology, the Netherlands.
Herman Geuvers is Professor in Theoretical Informatics at the Radboud
University Nijmegen, and Professor in Proving with Computer Assistance at
Eindhoven University of Technology, both in the Netherlands.TYPE THEORY AND FORMAL PROOF
An Introduction
ROB NEDERPELT
Eindhoven University of Technology,
The Netherlands
HERMAN GEUVERS
Radboud University Nijmegen,
and
Eindhoven University of Technology,
The NetherlandsUniversity Printing House, Cambridge CB2 8BS, United Kingdom
Cambridge University Press is part of the University of Cambridge.
It furthers the University’s mission by disseminating knowledge in the pursuit of
education, learning and research at the highest international levels of excellence.
www.cambridge.org
Information on this title: www.cambridge.org/9781107036505
© Rob Nederpelt and Herman Geuvers 2014
This publication is in copyright. Subject to statutory exception
and to the provisions of relevant collective licensing agreements,
no reproduction of any part may take place without the written
permission of Cambridge University Press.
First published 2014
Printed in the United Kingdom by CPI Group Ltd, Croydon CR0 4YY
A catalogue record for this publication is available from the British Library
Library of Congress Cataloguing in Publication data
ISBN 978-1-107-03650-5 Hardback
Cambridge University Press has no responsibility for the persistence or accuracy of
URLs for external or third-party internet websites referred to in this publication,
and does not guarantee that any content on such websites is, or will remain,
accurate or appropriate.To the memory of N.G. de BruijnContents
Foreword, by Henk Barendregt page xiii
Preface xv
Acknowledgements xxvii
Greek alphabet xxviii
## 1 Untyped lambda calculus 1
## 1.1 Input–output behaviour of functions 1
## 1.2 The essence of functions 2
## 1.3 Lambda-terms 4
## 1.4 Free and bound variables 8
## 1.5 Alpha conversion 9
## 1.6 Substitution 11
## 1.7 Lambda-terms modulo α-equivalence 14
## 1.8 Beta reduction 16
## 1.9 Normal forms and conﬂuence 19
## 1.10 Fixed Point Theorem 24
## 1.11 Conclusions 26
## 1.12 Further reading 27
Exercises 29
## 2 Simply typed lambda calculus 33
## 2.1 Adding types 33
## 2.2 Simple types 34
## 2.3 Church-typing and Curry-typing 36
## 2.4 Derivation rules for Church’s λ→ 39
## 2.5 Diﬀerent formats for a derivation in λ→ 44
## 2.6 Kinds of problems to be solved in type theory 46
## 2.7 Well-typedness in λ→ 47
## 2.8 Type Checking in λ→ 50
2.9 Term Finding in λ→ 51viii Contents
## 2.10 General properties of λ→ 53
## 2.11 Reduction and λ→ 59
## 2.12 Consequences 63
## 2.13 Conclusions 64
## 2.14 Further reading 65
Exercises 66
## 3 Second order typed lambda calculus 69
## 3.1 Type-abstraction and type-application 69
3.2 Π-types 71
## 3.3 Second order abstraction and application rules 72
## 3.4 The system λ2 73
## 3.5 Example of a derivation in λ2 76
## 3.6 Properties of λ2 78
## 3.7 Conclusions 80
## 3.8 Further reading 80
Exercises 82
## 4 Types dependent on types 85
## 4.1 Type constructors 85
4.2 Sort-rule and var-rule in λω 88
4.3 The weakening rule in λω 90
4.4 The formation rule in λω 93
4.5 Application and abstraction rules in λω 94
## 4.6 Shortened derivations 95
## 4.7 The conversion rule 97
4.8 Properties of λω 99
## 4.9 Conclusions 100
## 4.10 Further reading 100
Exercises 101
## 5 Types dependent on terms 103
## 5.1 The missing extension 103
## 5.2 Derivation rules of λP 105
## 5.3 An example derivation in λP 107
## 5.4 Minimal predicate logic in λP 109
## 5.5 Example of a logical derivation in λP 115
## 5.6 Conclusions 118
## 5.7 Further reading 119
Exercises 121
## 6 The Calculus of Constructions 123
## 6.1 The system λC 123
6.2 The λ-cube 125Contents ix
## 6.3 Properties of λC 128
## 6.4 Conclusions 132
## 6.5 Further reading 133
Exercises 134
## 7 The encoding of logical notions in λC 137
## 7.1 Absurdity and negation in type theory 137
## 7.2 Conjunction and disjunction in type theory 139
## 7.3 An example of propositional logic in λC 144
## 7.4 Classical logic in λC 146
## 7.5 Predicate logic in λC 150
## 7.6 An example of predicate logic in λC 154
## 7.7 Conclusions 157
## 7.8 Further reading 159
Exercises 162
## 8 Deﬁnitions 165
## 8.1 The nature of deﬁnitions 165
## 8.2 Inductive and recursive deﬁnitions 167
## 8.3 The format of deﬁnitions 168
## 8.4 Instantiations of deﬁnitions 170
8.5 A formal format for deﬁnitions 172
## 8.6 Deﬁnitions depending on assumptions 174
## 8.7 Giving names to proofs 175
8.8 A general proof and a specialised version 178
## 8.9 Mathematical statements as formal deﬁnitions 180
## 8.10 Conclusions 182
## 8.11 Further reading 183
Exercises 185
## 9 Extension of λC with deﬁnitions 189
## 9.1 Extension of λC to the system λD0 189
## 9.2 Judgements extended with deﬁnitions 190
## 9.3 The rule for adding a deﬁnition 192
## 9.4 The rule for instantiating a deﬁnition 193
## 9.5 Deﬁnition unfolding and δ-conversion 197
## 9.6 Examples of δ-conversion 200
9.7 The conversion rule extended with
Δ
→ 202
## 9.8 The derivation rules for λD0 203
9.9 A closer look at the derivation rules of λD0 204
## 9.10 Conclusions 206
## 9.11 Further reading 207
Exercises 208x Contents
## 10 Rules and properties of λD 211
## 10.1 Descriptive versus primitive deﬁnitions 211
## 10.2 Axioms and axiomatic notions 212
## 10.3 Rules for primitive deﬁnitions 214
## 10.4 Properties of λD 215
## 10.5 Normalisation and conﬂuence in λD 219
## 10.6 Conclusions 221
## 10.7 Further reading 221
Exercises 223
## 11 Flag-style natural deduction in λD 225
## 11.1 Formal derivations in λD 225
## 11.2 Comparing formal and ﬂag-style λD 228
## 11.3 Conventions about ﬂag-style proofs in λD 229
## 11.4 Introduction and elimination rules 232
## 11.5 Rules for constructive propositional logic 234
## 11.6 Examples of logical derivations in λD 237
## 11.7 Suppressing unaltered parameter lists 239
## 11.8 Rules for classical propositional logic 240
## 11.9 Alternative natural deduction rules for ∨ 243
## 11.10 Rules for constructive predicate logic 246
## 11.11 Rules for classical predicate logic 249
## 11.12 Conclusions 252
## 11.13 Further reading 253
Exercises 254
## 12 Mathematics in λD: a ﬁrst attempt 257
## 12.1 An example to start with 257
## 12.2 Equality 259
## 12.3 The congruence property of equality 262
## 12.4 Orders 264
12.5 A proof about orders 266
## 12.6 Unique existence 268
## 12.7 The descriptor ι 271
## 12.8 Conclusions 274
## 12.9 Further reading 275
Exercises 276
## 13 Sets and subsets 279
## 13.1 Dealing with subsets in λD 279
## 13.2 Basic set-theoretic notions 282
## 13.3 Special subsets 287
13.4 Relations 288Contents xi
## 13.5 Maps 291
## 13.6 Representation of mathematical notions 295
## 13.7 Conclusions 296
## 13.8 Further reading 297
Exercises 302
## 14 Numbers and arithmetic in λD 305
## 14.1 The Peano axioms for natural numbers 305
## 14.2 Introducing integers the axiomatic way 308
## 14.3 Basic properties of the ‘new’ N 313
## 14.4 Integer addition 316
## 14.5 An example of a basic computation in λD 320
## 14.6 Arithmetical laws for addition 322
## 14.7 Closure under addition for natural and negative numbers 324
## 14.8 Integer subtraction 327
## 14.9 The opposite of an integer 330
## 14.10 Inequality relations on Z 332
## 14.11 Multiplication of integers 335
## 14.12 Divisibility 338
## 14.13 Irrelevance of proof 340
## 14.14 Conclusions 341
## 14.15 Further reading 343
Exercises 344
## 15 An elaborated example 349
## 15.1 Formalising a proof of Bézout’s Lemma 349
## 15.2 Preparatory work 352
## 15.3 Part I of the proof of Bézout’s Lemma 354
## 15.4 Part II of the proof 357
## 15.5 Part III of the proof 360
## 15.6 The holes in the proof of Bézout’s Lemma 363
## 15.7 The Minimum Theorem for Z 364
## 15.8 The Division Theorem 369
## 15.9 Conclusions 371
## 15.10 Further reading 373
Exercises 376
## 16 Further perspectives 379
## 16.1 Useful applications of λD 379
## 16.2 Proof assistants based on type theory 380
## 16.3 Future of the ﬁeld 384
## 16.4 Conclusions 386
16.5 Further reading 387xii Contents
Appendix A Logic in λD 391
A.1 Constructive propositional logic 391
A.2 Classical propositional logic 393
A.3 Constructive predicate logic 395
A.4 Classical predicate logic 396
Appendix B Arithmetical axioms, deﬁnitions and lemmas 397
Appendix C Two complete example proofs in λD 403
C.1 Closure under addition in N 403
C.2 The Minimum Theorem 405
Appendix D Derivation rules for λD 409
References 411
Index of names 419
Index of deﬁnitions 421
Index of symbols 423
Index of subjects 425Foreword
This book, Type Theory and Formal Proof: An Introduction, is a gentle, yet
profound, introduction to systems of types and their inhabiting lambda-terms.
The book appears shortly after Lambda Calculus with Types (Barendregt et al.,
2013). Although these books have a partial overlap, they have very diﬀerent
goals. The latter book studies the mathematical properties of some formalisms
of types and lambda-terms. The book in your hands is focused on the use of
types and lambda-terms for the complete formalisation of mathematics. For
this reason it also treats higher order and dependent types. The act of deﬁning
new concepts, essential for mathematical reasoning, forms an integral part of
the book. Formalising makes it possible that arbitrary mathematical concepts
and proofs be represented on a computer and enables a machine veriﬁcation
of the well-formedness of deﬁnitions and of the correctness of proofs. The re-
sulting technology elevates the subject of mathematics and its applications to
its maximally complete and reliable form.
The endeavour to reach this level of precision was started by Aristotle, by
his introduction of the axiomatic method and quest for logical rules. For clas-
sical logic Frege completed this quest (and Heyting for the intuitionistic logic
of Brouwer). Frege did not get far with his intended formalisation of math-
ematics: he used an inconsistent foundation. In 1910 Whitehead and Russell
introduced types to remedy this. These authors made proofs largely formal,
except that substitutions still had to be understood and performed by the
reader. In 1940 Church published a system with types, based on a variant of
those of Whitehead and Russell, in which the mechanism of substitution was
captured by lambda-terms and conversion. Around 1970 de Bruijn essentially
extended the formalism of types by introducing dependent types with the ex-
plicit goal to formalise and verify mathematics. By 2004 this technique was
perfected and George Gonthier established, using the mathematical assistant
Coq, a full formalisation of the Four Colour Theorem.
The learning curve to formalise remains steep, however. One still needs to bexiv Foreword
an expert in a mathematical assistant in order to apply the technique. I hope
and expect that this book will contribute to the familiarisation of formalis-
ing mathematical proofs and to improvements in the mathematical assistants,
bringing this technique within the reach of the working mathematician and
computer scientist.
Henk BarendregtPreface
Aim and scope
The aim of the book is, ﬁrstly, to give an introduction to type theory, an evolv-
ing scientiﬁc ﬁeld at the crossroads of logic, computer science and mathematics.
Secondly, the book explains how type theory can be used for the veriﬁcation
of mathematical expressions and reasonings.
Type theory enables one to provide a ‘coded’ version – i.e. a full formalisation
– of many mathematical topics. The formal system underlying type theory
forces the user to work in a very precise manner. The real power of type
theory is that well-formedness of the formalised expressions implies logical and
mathematical correctness of the original content.
An attractive property of type theory is that it becomes possible and feasible
to do the encoding in a ‘natural’ manner, such that one follows (and recognises)
the way in which these subjects were presented originally. Another important
feature of type theory is that proofs are treated as ﬁrst-class citizens, in the
sense that proofs do not remain meta-objects, but are coded as expressions
(terms) of the same form as the rest of the formalisation.
The authors intend to address a broad audience, ranging from university
students to professionals. The exposition is gentle and gradual, developing the
material at a steady pace, with ample examples and comments, cross-references
and motivations. Theoretical issues relevant for logic and computer science
alternate with practical applications in the area of fundamental mathematical
subjects.
History Important investigations in the machinery of logic were made by
F.L.G. Frege, as early as the end of the nineteenth century (Frege, 1893). For-
mal mathematics started with B. Russell in the ﬁrst decade of the twentieth
century, by the publication of the famous Principia Mathematica (The Prin-
ciples of Mathematics, see Russell, 1903). Other contributions were made by
D. Hilbert (Hilbert, 1927) in the 1920s. An important step in the description ofxvi Preface
the essential mechanisms behind the mathematical way of thought was made
by A. Church in the 1940s (Church, 1940). He invented the lambda calculus,
an abstract mechanism for dealing with functions, and he introduced ‘simple
type theory’ as the language for higher order logic.
At the end of the 1960s N.G. de Bruijn designed his ‘mathematical lan-
guage’, Automath (de Bruijn, 1970), which he and his group tested thoroughly
by translating a broad corpus of mathematical texts in it, and verifying it by
means of a computer program. In the same period, the Polish Mizar group
(Mizar, 1989) developed a language and a program to develop and store math-
ematical theories; they founded their eﬀorts, however, not so much in a type-
theoretic theory.
From approximately the 1980s there was an explosion of work in the area
of type theory based on earlier work in the 1970s by J.-Y. Girard (Girard,
1986) and P. Martin-Löf (Martin-Löf, 1980). We mention the inspiring work
of H.P. Barendregt, whose lambda-cube and the notion of Pure Type Systems
based on that are by now a standard in the world of type theory (Barendregt,
1981, 1992).
The present book has been built on both Automath and the lambda-cube,
which have been combined into a novel, concise system that enjoys the advan-
tages of both respected predecessors.
Rationale Topics such as proven correctness and complete formalisation are
essential in many areas of modern science. Type theory as an all-encompassing
formalism has become more and more a standard benchmark for what formal-
isation of logico-mathematical content really means, and the more so because
it also includes the essence of what a formal proof is. Thus, type theory is a
valuable expedient to transform ‘correctness’ into a mechanisable issue, which
is of great importance, in particular in mathematical proof development and
correct computer programming.
There are many developments that build on the inherent force of type the-
ory. We mention work on proving program correctness; on correct program
construction; on automation of reasoning; on formalisation and archiving of
mathematical subjects, including on-line consultable libraries of knowledge;
on proof checking, (assistance for) proof development and construction. More
about these subjects can be found in Chapter 16, in particular Sections 16.2
and 16.3.
For the beneﬁt of any interested person who desires to get insight into the
‘big points’ of type theory, we note the following. Notwithstanding the mo-
mentum that formalisation of mathematics has gained, especially in computer
science where it is used for the veriﬁcation of software and systems by means of
proof assistants, formalising is a considerable eﬀort. For students and also forPreface xvii
interested researchers, it is still a major investment to understand and use the
systems. We expect this situation to improve in the future and this is where
our book aims to ﬁll a gap, by being a gentle introduction to the art of for-
malising mathematics on the basis of type theory, suitable for proof assistants
and other systems. We believe that this book will be very useful for anyone
starting to use such a system.
Approach This textbook describes a concise version of type theory that is
immediately useable to represent mathematical theories and to verify them.
The representation is close to the manner in which mathematicians write and
think, and therefore easier to master and employ. It is a good means for stu-
dents of mathematics and computer science to make a personal acquaintance
with the ins and outs of the mathematical machinery, the role of logical rules
therein, the essential contribution of deﬁnitions and the decisive nature of well-
structured proofs.
For that purpose we build the material from scratch, gradually enlarging the
inﬂuence of the types in the various systems described. The text starts with the
untyped lambda calculus and then introduces several fundamental type sys-
tems, culminating in the well-known and powerful Calculus of Constructions.
We continue by extending that system with a formal deﬁnition system and con-
secutively test the newly obtained system with several mathematical subjects,
until we ﬁnally present a substantial piece of mathematics (Bézout’s theorem
and its proof) in the format described, in order to give a practical demon-
stration of how the formal system works, and how close the formal translation
remains to the usual mathematical way of expressing such an item.
The main thread that runs through all the chapters is the development of a
convincing and viable formal type system for mathematics. At the end of each
chapter, the results are summarised in a section entitled Conclusions. In the
ﬁnal section of each chapter, called Further Reading, we look around, sketching
a broader picture: we give a short historical justiﬁcation of the topics described,
an overview of the essential aspects of related research (past and present) not
dealt with in the chapter, and suggest other literature as further reading to
the interested reader.
Following each chapter there is a series of exercises, enabling the reader to
get acquainted with the presented material. The exercises concentrate on the
subjects treated in the chapter text as such (not in the Further Reading).
Since we aim at a ‘generic’ approach to type theory as the basis of logical
proofs and of mathematics in general, the exercises do not refer to, or make
use of, speciﬁc proof assistants or software tools: we regard it as sensible to
remain independent of the actual technical developments.
For answers to selected exercises, see www.win.tue.nl/∼wsinrpn/.xviii Preface
Summary of contents
Chapter 1: Untyped lambda calculus
We start with an exposition of untyped lambda calculus, a fundamental topic
originating from A. Church in the 1930s, which may be regarded as the cal-
culus underlying the behaviour of functions, including variable binding and
substitution – essential concepts in mathematics and computer science. The
standard subjects in this area are discussed in detail, including β-reduction,
normal forms, conﬂuence, ﬁxed points and the related theorems. We list the
positive and negative aspects of this calculus.
Chapters 2 to 6
The drawbacks of the untyped calculus lead to a notion of type, which plays
the main role in the rest of the book. In Chapters 2 to 6 we present the
standard hierarchy of typed lambda calculi, as elaborated by H.P. Barendregt.
In these chapters we introduce several systems, each with its own rationale,
and contrast them with previous and coming ones as to their relative ‘power’.
Moreover, the reader becomes acquainted with derivation rules and their use,
and with basic logical entities and their formal role in reasonings. The relevant
properties of these systems are reviewed, with a selection of instructive proofs
of these properties.
Chapter 2: Simply typed lambda calculus
In Chapter 2 we develop the simply typed lambda calculus in the explicit
version, due to A. Church, which is called λ→. We also mention the implicit
version of H.B. Curry. We give a derivation system for λ→ and examples of its
use. The properties of the system are given, and contrasted with the properties
of the untyped lambda calculus.
Chapter 3: Second order typed lambda calculus
We extend Church’s λ→ with terms depending on types, leading to the system
λ2, enjoying second order abstraction and application, and having Π-types.
Again, examples show its usefulness.
Chapter 4: Types dependent on types
We extend λ→ in another direction, adding types depending on types. There-
fore we develop the notions ‘type constructor’ and ‘kind’. Thus we obtain the
system λω. We also adapt the derivation rules and include a conversion rule.
Chapter 5: Types dependent on terms
A third extension of λ→ leads to λP, which enables us to formalise predicates.
The far-reaching propositions-as-types concept, implying the Curry–Howard
isomorphism, is one of the topics that pop up in a straightforward fashion. We
discuss the correspondence with basic mathematical and logical notions.Preface xix
Chapter 6: The Calculus of Constructions
Chapters 2 to 5 culminate in the powerful Calculus of Constructions (or λC),
the theory on which the well-known proof assistant Coq has been built. In this
chapter we explain the hierarchy and the structure present in the Barendregt
cube, and we add the corresponding derivation system. The relevant properties
are listed and contrasted with earlier results in the book.
Chapter 7: The encoding of logical notions in λC
We demonstrate how propositional logic and predicate logic ﬁt naturally in
the λC framework. For each of the usual logical connectives and quantiﬁers we
give a type-theoretic encoding, for which we employ several times the second
order possibilities of λC. Constructive logic is separated from classical logic,
which needs a single axiom. A number of examples show how logical proofs can
be embedded in type theory, thus deepening the reader’s insight into logical
reasonings and proofs.
Chapter 8: Deﬁnitions
In this chapter we look into the nature, the usage and the usefulness of deﬁ-
nitions in logic and mathematics. We argue why one tends to give a speciﬁc
object or notion a name of its own, often in a context of assumptions, and how
these names are used afterwards. We explain the general format underlying the
deﬁnition mechanism and discuss the various manners of instantiating these
deﬁnitions. The diﬀerences and correspondences between variables, parameters
and constants are reviewed, and we point at the possibility in type theory of
giving names to proofs.
Chapter 9: Extension of λC with deﬁnitions
Here we extend the type theory λC with formal deﬁnitions, which is essential
for making type theory practically useful. We formalise the common kind of
deﬁnitions, which name a notion that is speciﬁed by a description. We discuss
and analyse the extra derivation rules needed for the formal treatment of def-
initions: one for adding a deﬁnition, and one for instantiating a deﬁnition. We
also introduce and elaborate a reduction mechanism for enabling the ‘unfold-
ing’ of deﬁnitions, with a discussion of related notions. Finally, we obtain the
system λD0, a formal extension of λC treating deﬁnitions as ﬁrst-class citizens.
Chapter 10: Rules and properties of λD
We introduce a second kind of deﬁnition, the primitive ones, which can be
used for axioms and axiomatic notions. Their formal representation resembles
the one for descriptive deﬁnitions, which is particularly apparent in the extra
derivation rules necessary to encapsulate these primitive deﬁnitions. We thus
obtain the system λD (i.e. λC + deﬁnitions + axioms) and we list the most
important properties of the obtained formal system.xx Preface
Chapter 11: Flag-style natural deduction in λD
In order to demonstrate how λD works in practice, we start with a more
thorough investigation of formal logic in λD-style, as a sequel to Chapter 7. We
illustrate how derivations in λD can be turned into a ﬂag-style linear format,
close to the familiar representation used in mathematics books, and therefore
easy to understand. Natural deduction, the logical system that reﬂects the
reasoning patterns employed by mathematicians, can be clearly presented in
this format, as we demonstrate: the introduction and elimination rules for the
standard connectives and quantiﬁers can be straightforwardly translated into
λD. Examples show that natural deduction nicely agrees with the ideas and
constructions present in type theory.
Chapter 12: Mathematics in λD: a ﬁrst attempt
In this chapter we put λD to the test in the area of mathematics. A simple
example, consisting of a theorem and a short proof, leads to investigations
about equality, Leibniz’s law, and orders, all directly transposable in the λD
setting. Next, we discuss unique existence and the possibility to attach a name
to uniquely existing objects and notions. In order to formalise this, we axiom-
atically introduce Frege’s ι-descriptor.
Chapter 13: Sets and subsets
We discuss how to deal with sets and subsets in type theory. This is not
straightforward, since sets and types are diﬀerent concepts. For example, an
element can be a member of several sets, whereas in the standard version of
type theory that we develop in this book, each ‘object’ has a unique type (up
to conversion). A crucial property of types is that it is decidable whether ‘a has
type T’. For sets this is not the case: ‘a ∈ X’ is in general undecidable. This
means we have to make a choice as to how to deal with sets in type theory. We
make the choice to represent subsets as predicates over a type, which works
out well, as we show with a number of examples. At the end of the chapter we
compare our choice with other options.
Chapter 14: Numbers and arithmetic in λD
In order to investigate the usefulness of λD for formalising mathematics in a
systematic manner, we focus on the integer numbers. Starting with Peano’s
axioms for the natural numbers, we give similar axioms for the integers, which
turn out to be directly transposable into λD. The natural numbers then form
a subset, with the desired properties. Thereby we obtain a viable approach to
many parts of number theory. In order to demonstrate this, we develop basic
arithmetic for the integers, concerning addition, subtraction, multiplication
and the like. When formalising recursion, we make good use of the ι-descriptor
introduced in a previous chapter. Inequalities, such as ≤, and divisibility follow
relatively easy. We demonstrate the ﬂexibility of the obtained formalisationPreface xxi
by giving ample examples. In developing formal arithmetic, a long sequence of
provable lemmas passes by, which shows the strength of the proposed encodings
in type theory.
Chapter 15: An elaborated example
In order to demonstrate the reach and the power of the approach developed in
this book, we formalise a non-trivial theorem and its proof in λD. Therefore we
take a version of Bézout’s Lemma: if two positive natural numbers are relatively
prime, then there is a linear combination of the two which is equal to 1. We
split the proof into a number of parts, which are formalised one by one. In
the presentation we suppress a number of obvious details which are left to the
reader, in order to keep a clear view of the overall picture. Our development of
the proof of Bézout’s Lemma shows that the chosen road is viable and feasible.
Two auxiliary theorems (the Minimum Theorem and the Division Theorem)
are considered in detail and also transposed in a λD setting.
Chapter 16: Further perspectives
This chapter summarises the useful points of a type-theoretic formalisation
of mathematics as, for example, oﬀered by λD. It also focuses on the general
principles of type theory-based proof assistants and their power concerning
proof checking and interactive proving. Finally, we outline our view on the
future of the ﬁeld, motivated by recent developments.
Appendix A: Logic in λD
Summary of the natural deduction rules described and used in the book.
Appendix B: Arithmetical axioms, deﬁnitions and lemmas
For the reader’s convenience, we list the lemmas concerning arithmetic in Z,
as they are given in the text of Chapter 14.
Appendix C: Two complete example proofs in λD
We give complete versions of two λD proofs dealt with before, namely of the
Closure Property of Addition in N, and of the Division Theorem, in order to
show what such formal proofs look like when all relevant details have been
worked out.
Appendix D: Derivation rules for λD
This appendix summarises the derivation system as developed in the book, for
easy reference.
Indexes
We add four sets: an Index of names (which contains the names of the persons
mentioned in the main text of the book), an Index of deﬁnitions (listing the
formal deﬁnitions presented in the ﬁgures of Chapters 8 to 15), an Index of
symbols and an Index of subjects.xxii Preface
What’s new?
The book has several new aspects in its presentation of type theory:
(1) A main novelty is that we present type theory in ﬂag-derivation style. In
modern presentations of type theory, one usually sees derivations presented in
‘tree style’, which enables a concise and precise way of deﬁning the rules of type
theory, and we will also employ it for that purpose. A tree style, however, is
very impractical for giving real derivations. Derivation trees become too wide
and big and enforce all kinds of basic typings to be derived several times (in
diﬀerent branches of the derivation tree). The ﬂag style allows easy reuse of
context elements. It also allows us, in combination with deﬁnitions (see below),
to reuse derived results. Altogether it is very close to the usual ‘book style’,
which builds up the mathematics in a linear order.
(2) Also new is the inclusion of deﬁnitions, which are often regarded as in-
formal abbreviation mechanisms on the meta-level. Contrary to this, we give a
formal treatment of deﬁnitions and show how they are used in practical deriva-
tions. Primitive notions, which are treated in a similar manner to deﬁnitions in
our presentation of type theory, are used for adding elementary concepts and
axioms to type theory.
Inductive notions can be deﬁned by means of higher order logic and our
deﬁnition mechanism allows us to give them a name. One can also deﬁne
recursive functions over these inductive notions. Therefore we do not have
inductive deﬁnitions as a basic concept, since this is not needed.
(3) We continually take care to give a stepwise and gentle explanation of
the rules of type theory, illustrated with many examples of how these are used
to formalise mathematics. In particular, given that it is not very common to
devote a lot of attention to the notion of ‘deﬁnition’, our explicit description
in Chapter 8 of the use and meaning of deﬁnitions stands out as a new look at
what they are and intend to be. We contrast deﬁnitions with assumptions and
diﬀerentiate between variables, parameters and constants. Thus we discuss a
number of well-known mathematical concepts with a ‘linguistic-philosophical
ﬂavour’, which is not usual.
(4) The manner in which we represent deﬁnitions leads to a relatively small
but powerful extension of λC. The system obtained in Chapter 10, called λD,
has a simple, convincing format and is new: it has not yet been described as
such in the literature. In Chapter 12 we introduce the descriptor ι in λD, which
is straightforward, since λD permits primitive concepts such as axioms and
axiomatic notions. Use of this ι, which enables uniquely identiﬁable objects, is
not very common in dependent type theory. We note, however, that L.S. van
Benthem Jutting already did this in his Automath translation of E. Landau’sPreface xxiii
book on Analysis (van Benthem Jutting, 1977), and that it is also present in
the HOL system (see HOL system, 1988).
(5) At the end of Chapter 13 we give an overview discussion of how to
deal with subsets in type theory. The new aspect is that we take a pragmatic
viewpoint on subsets by making a conscious choice with a view to our aims.
Readership
Although the style of the book is expository, using a gradual pace of expla-
nation with a continuous care for good understanding, including many ex-
amples, the subject has intrinsic diﬃculties because of the far-reaching and
rather complex interweaving of type-related notions, which is inherent to type
theory. Therefore, we consider this to be an advanced textbook. The intended
readership may include certain undergraduate students, although the primary
readership will range from graduate students to specialists:
– Undergraduate students in mathematics and computer science (second or
third year) should be able to follow most of the text, from the beginning to
the end. The main insight they get is to learn thoroughly what a proof ‘is’,
how it should be read and how it can be obtained. Moreover, they see which
‘ﬁne structure’ is present (albeit mostly hidden) behind a mathematical text;
that extreme precision in mathematics is feasible; that logic can be framed
as a highly systematic deduction apparatus; that proofs can be considered
as mathematical objects, on a par with the usual mathematical entities; that
deﬁnitions are an indispensable asset in the formal mathematical language.
– Graduate students in mathematics and computer science may proﬁt more
deeply from this book. They will enjoy the same beneﬁts as sketched above,
but they also learn from this book what the essence of types is, in particular
of higher order and dependent types. This oﬀers a useful lead into further
investigations in type systems for programming languages. They get acquainted
with important notions connected to function evaluation, by studying (typed
and untyped) lambda calculus and their properties. They see, moreover, that
(and how) mathematics can be formalised smoothly and hence that type theory
is suitable for checking with computer assistance, for example by means of a
proof assistant such as Coq.
– Specialists and researchers in computer science and mathematics not ac-
quainted with type theory can get a good and thorough impression of what
it’s all about. They can easily browse through the text to pick up the essen-
tials that interest them, in particular with respect to the important range of
type systems combined in Barendregt’s cube; the Calculus of Constructions
and its properties; the essence and the value of (formal) deﬁnitions and howxxiv Preface
they can form part of a fully formal derivation system; the various approaches
to formalising Set Theory; the approach to integers in the Peano style; and
a worked-out example of a real formalised proof of a well-known, non-trivial
theorem. As a by-product, the reader will understand the basic features of the
system Automath (de Bruijn, 1970). A researcher may also be inspired by the
possibility of formalising mathematics as demonstrated in this book, or by the
overview of applications and perspectives at the end of the book.
Technical level
Since the book concerns a relatively new and self-contained subject, developed
from scratch, no more prerequisites are required than a good knowledge of basic
mathematical material such as (undergraduate) algebra and analysis. Some
knowledge of logical systems and some experience with logico-mathematical
reasoning and/or proofs may help, but it is not mandatory.
About the authors
Rob Nederpelt (born 1942) is a guest researcher in the faculty of Mathematics
and Computer Science at the Eindhoven University of Technology (the Nether-
lands) and was, until his retirement, a lecturer in Logic for Computer Science
at the same university. He studied mathematics at Leiden University and ob-
tained his PhD at Eindhoven University in 1973, with N.G. de Bruijn as his
thesis supervisor. The subject of his thesis was (weak and strong) normalisa-
tion in a typed lambda calculus narrowly related to the mathematical language
Automath.
He has taught many courses at Eindhoven University, ﬁrst in mathematics,
later in logic, theoretical computer science, type theory and the language of
mathematics.
His research interest is primarily logic, in particular type theory and typed
lambda calculus. See www.win.tue.nl/∼wsinrpn/publications.htm for his
list of publications. It contains many papers and three books: The Language of
Mathematics (Nederpelt, 1987), A Modern Perspective on Type Theory (Ka-
mareddine et al., 2004), Logical Reasoning (Nederpelt & Kamareddine, 2011).
He has also been one of the editors of Selected Papers on Automath (Nederpelt
et al., 1994).
Herman Geuvers (born 1964) is professor in Theoretical Informatics at the
Radboud University Nijmegen, and in Proving with Computer Assistance at
the Eindhoven University of Technology, both in the Netherlands. He has stud-
ied mathematics in Nijmegen and wrote his PhD thesis in the Foundations ofPreface xxv
Computer Science (Radboud University Nijmegen, the Netherlands; 1993) un-
der the supervision of H.P. Barendregt on the Curry–Howard formulas-as-types
interpretation that relates logic and type theory.
He has taught many courses, mainly on topics such as logic, theoretical
computer science, type theory, proof assistants and semantics of programming
languages. He has been a lecturer in type theory and proof assistants at various
international PhD summer schools.
His research is in type theory, proof assistants and formalising mathematics.
He has published over 60 papers (www.cs.ru.nl/∼herman/pubs.html), has
been a member of various programme committees and has organised various
scientiﬁc events. Moreover, he co-edited the book Selected Papers on Automath
(Nederpelt et al., 1994). He was the leader of the ‘FTA project’ at the Radboud
University Nijmegen, to formalise a constructive proof of the Fundamental The-
orem of Algebra in Coq. This led to CoRN, the Constructive Coq Repository
of formalised mathematics (http://corn.cs.ru.nl) at Nijmegen, which is a
large library of formalised algebra and analysis by means of the proof assistant
Coq.Acknowledgements
This book is dedicated to N.G. de Bruijn (1918–2012). His pioneering work
in the 1960s on the ‘mathematical language’ Automath and on formalising
mathematics in type theory has greatly inﬂuenced the development of this
book. His creative mind has been a great inspiration for us.
We thank H.P. Barendregt for sharing his deep insights in typed lambda
calculus and for his thorough and convincing description of many important
subjects in the ﬁeld.
Since one of us is a student of N.G. de Bruijn, and the other one of H.P. Baren-
dregt, the publication of this book is a way of thanking our teachers, and paying
tribute to them.
We are particularly grateful to J.R. Hindley and C. Hemerik for their com-
ments on the text. We thank F. Dechesne and H.L. de Champeaux for their
useful remarks, A. Visser and R. Iemhoﬀ for their valuable help and P. van
Tilburg for his nice and convenient tool for making ﬂag derivations in L A TEX.
We thank Eindhoven University of Technology for kindly oﬀering us space,
time and equipment to prepare the text. We are also grateful to Cambridge
University Press, in particular to D. Tranah and G. Smith.
Rob Nederpelt, Herman GeuversGreek alphabet
For convenience, we list the letters of the Greek alphabet (small and capital)
together with their names and English pronunciation.
α A alpha /"ælf@/ ν N nu /nju:/
β B beta /"bi:t@/ ξ Ξ xi /gzaI/
γ Γ gamma /"gæm@/ o O omicron /@"maIkr@n/
δ Δ delta /"delt@/ π Π pi /paI/
ε E epsilon /"epsI­l6n/ ρ P rho /r@U/
ζ Z zeta /"zi:t@/ σ Σ sigma /"sIgm@/
η H eta /"i:t@/ τ T tau /tO:/
ϑ Θ theta /"Ti:t@/ υ Υ upsilon /2p"saIl@n/
ι I iota /aI"@Ut@/ ϕ Φ phi /faI/
κ K kappa /"kæp@/ χ X chi /kaI/
λ Λ lambda /"læmd@/ ψ Ψ psi /psaI/
μ M mu /mju:/ ω Ω omega /"@UmIg@/1
Untyped lambda calculus
## 1.1 Input–output behaviour of functions
Many functions can be described by some kind of expression, e.g. x2 + 1, that
tells us how, given an input value for x, one can calculate an output value.
In the present case this proceeds as follows: ﬁrst determine the square of the
input value and consequently add 1 to this. The so-called ‘variable’ x acts as
an arbitrary (or abstract) input value. In a concrete case, for example when
using input value 3, one must replace x with 3 in the expression. Function
x2 + 1 then delivers the output value 32 + 1, which adds up to 10.
In order to emphasise the ‘abstract’ role of such a variable x in an expression
for a function, it is customary to use the special symbol λ: one adds λx in front
of the expression, followed by a dot as a separation marker. Hence, instead
of x2 + 1, one writes λx. x2 + 1, which means ‘the function mapping x to
x2 +1’. This notation expresses that x itself is not a concrete input value, but
an abstraction. As soon as a concrete input value comes in sight, e.g. 3, we
may give this as an argument to the function, thus making a start with the
calculation. Usually, one expresses this ﬁrst stage by writing the input value,
embraced in a pair of parentheses, after the function: (λx. x2+1)(3). (Compare
with the case when one wishes to apply the function sin to argument π: this is
conveniently expressed as sin(π).)
In what follows, we will concentrate on the general behaviour of functions.
We will hardly ever take into account that we know how to ‘calculate’ in the
real world, for example that we can evaluate 32 +1 to 10, and sin(π) to 0. Only
later will we consider well-known elementary functions such as addition or
multiplication of numbers, or call upon our knowledge about speciﬁc functions
such as square: our initial intention is to analyse functions from an abstract
point of view.
Our ﬁrst attempts lead to a system called λ-calculus. This system encap-
sulates a formalisation of the basic aspects of functions, in particular their2 Untyped lambda calculus
construction and their use. In the present chapter we do not yet consider
types, being an abstraction of the well-known process of ‘classifying’ entities
into greater units; for example, one may consider N as the type of all natural
numbers. So this chapter deals with the untyped λ-calculus. In all the follow-
ing chapters, however, we shall consider typed versions of λ-calculus, varying
in nature, which will end up in a system suitable for doing mathematics in a
formal manner.
## 1.2 The essence of functions
From the previous section we conclude that in dealing with functions there are
two construction principles and one evaluation rule.
The construction principles for functions are the following:
Abstraction: From an expression M and a variable x we can construct
a new expression: λx. M. We call this abstraction of x over M.
Application: From expressions M and N we can construct expression
M N. We call this application of M to N.
If necessary, some parentheses should be added during the construction pro-
cess.
Examples 1.2.1 − Abstraction of x over x2 + 1 gives λx. x2 + 1.
− Abstraction of y over λx. x − y gives λy . (λx. x − y), i.e. the function
mapping y to: λx. x − y (which is itself a function).
− Abstraction of y over 5 gives λy . 5, i.e. the function mapping y to 5 (other-
wise said: the ‘constant function’ with value 5).
− Application of λx. x2 + 1 to 3 gives (λx. x2 + 1)(3).
− Application of λx. x to λy . y gives (λx. x)(λy . y).
− Application of f to c gives fc. This can also be written, in a more familiar
way, as f(c), but this is not the style we use here.
Remarks 1.2.2 (1) A ‘free’ usage of these construction principles allows
expressions which do not have an obvious meaning, such as xx or y(λu. u). In
this chapter, we treat these kinds of constructs just like the others, not worrying
about their apparent lack of meaning.
(2) The function ‘square’ now looks as follows: λx. x2. The stand-alone
expression x2 is still available, but it is no longer a function, but an abstract
output value, viz. the square of (an unknown, but ﬁxed) x. The diﬀerence is
subtle and may become clearer as follows: let’s assume that x ranges over N,1.2 The essence of functions 3
the set of natural numbers. Then λx. x2 is a function, taking natural numbers
to natural numbers. But x2 is not: it represents a natural number.
(3) The λ is particularly suited for the description of ‘neat’ functions, which
can be described by a mathematical expression. It takes some eﬀort to use the
λ-notation to describe functions with a slightly more complicated description,
such as, for example:
− the function ‘absolute value’ with deﬁnition:
x →

x if x ≥ 0
−x if x < 0
,
− or the function on domain {0,1,2,3} with codomain {0,1,2,3} that is de-
scribed by: 0 → 2,1 → 2,2 → 1,3 → 3 .
(In Exercise 1.14 we introduce an if-then-else function, which is helpful in such
cases.)
Next to the two construction principles described above, our intuitive func-
tion notion gives rise to a rule for the ‘evaluation’ of expressions. The formalisa-
tion of the function evaluation process is called ‘β-reduction’. (An explanation
for this name, and a precise deﬁnition, will be given in Section 1.8.)
This β-reduction makes use of substitution, formally expressed by means of
square brackets ‘[’ and ‘]’: the expression M[x := N] represents ‘M in which N
has been substituted for x’. (Note, however, that substitution is more subtle
than one might expect. See Section 1.6 for a precise deﬁnition.)
β-reduction: An expression of the form (λx. M)N can be rewritten to
the expression M[x := N], i.e. the expression M in which every x has
been replaced with N. We call this process β-reduction of (λx. M)N to
M[x := N].
Examples 1.2.3 − (λx. x2+1)(3) reduces to (x2+1)[x := 3], which is 32+1.
− (λx. sin(x) − cos(x))(3 + 5) reduces to sin(3 + 5) − cos(3 + 5).
− (λy . 5)(3) reduces to 5[y := 3], which is 5.
− (λx. x)(λy . y) reduces to x[x := λy . y], which is λy . y.
Reduction is also possible on suitable parts of expressions: when an expres-
sion of the form (λx. M)N is a subexpression of a bigger one, then this subex-
pression may be rewritten to M[x := N], as described above, provided that
the rest of the expression is left unchanged. The full former expression (with
subexpression (λx. M)N) is then said to reduce to the full latter expression
(with subexpression M[x := N]).
The rules describing how reduction extends from subexpressions to bigger
ones are called the compatibility rules for reduction (see Deﬁnition 1.8.1).4 Untyped lambda calculus
Example 1.2.4 By compatibility, λz .((λx.x)(λy .y)) reduces to λz .(λy .y).
Remarks 1.2.5 We emphasise that the word ‘application’ is deceptive: ap-
plication of M to N is not the result of applying M to N, but only a ﬁrst step
in this procedure: all we can say is that ‘application’ is the construction of a
new expression, MN, which, in a later stage, may perhaps lead to the actual
execution of a function. For example, the application of function λx.
√
x to 7
gives expression (λx.
√
x)(7), in which the function has not yet been executed.
It is only after the reduction of the latter term that we obtain the result of
‘application of the function to 7’, namely the ‘answer’
√
7.
The λ-notation is for functions of one variable. A function of two or more
variables does not ﬁt in this notation. One could make the choice to extend
the notation for this purpose. For example, consider the function f of two
arguments, deﬁned as f(x,y) = x2+y. We might express f as λ(x,y). (x2+y),
with a pair as input. In this book, however, we will only consider functions
of one argument. From the following remark it follows that this is not a real
restriction.
Remark 1.2.6 The behaviour of a function of two (or more) arguments can
be simulated by converting it into a composite of functions of a single argument.
For example, instead of the two-place function λ(x,y). (x2 + y) one can write
λx. (λy . (x2 + y)). The latter function is called the Curried version of the
former one, after the λ-calculus pioneer H.B. Curry; the idea of ‘Currying’
already can be found in the work of M. Schönﬁnkel (see Schönﬁnkel, 1924).
There are subtle diﬀerences between the two versions when we provide them
with two input values, for example:
– give f = λ(x,y). (x2 +y) as argument the pair (3,5), then f(3,5) reduces to
32 + 5;
– similarly, we can give g = λx. (λy . (x2 + y)) these two arguments, but
only successively and in the ‘correct’ order, so ﬁrst 3 and then 5; the result is
(g(3))(5), which reduces again to 32 + 5 (use the reduction rule twice).
By the way: with function g we have the liberty to give only one argument and
then stop the process: g(3) has a meaning in itself, it reduces to λy . (32 + y).
This is not possible with function f, which always needs a pair of arguments.
## 1.3 Lambda-terms
The main concern of the discipline called lambda calculus is the behaviour of
functions in the simplest, most abstract view. This means that we can even
do without numbers, and consequently we neither consider, for the time being,
the usual simple operations connected with numbers, such as addition and1.3 Lambda-terms 5
multiplication, nor more complex ones: exponentiation, the sine. Hence, many
of the examples from the previous section are no longer useable.
What remains?
− To start with: variables (x, y, ...).
− Moreover: the two construction principles mentioned in the previous section:
abstraction and application.
− Finally: the ‘calculation rule’ called β-reduction.
In the rest of this chapter, we introduce the untyped λ-calculus as a for-
mal system, giving precise deﬁnitions, including the important operations, and
stating the main properties. We omit most of the proofs, for which we refer
to the overview text of J.R. Hindley and J.P. Seldin (Hindley & Seldin, 2008)
or the seminal work on untyped λ-calculus by H.P. Barendregt (Barendregt,
1981).
Remark 1.3.1 Lambda calculus or λ-calculus was invented by A. Church in
the 1930s (Church, 1933). (It is not completely clear why he used the Greek
letter λ – which represents the letter l – for expressing abstraction; see Cardone
& Hindley, 2009, Section 4.1, for more details.) Church’s aim was to use his
lambda calculus as a foundation for a formal theory of mathematics, in order
to establish which functions are ‘computable’ by means of an algorithm (and
which are not). See also Section 1.12.
Expressions in the lambda calculus are called λ-terms. The following in-
ductive deﬁnition establishes how the set Λ of all λ-terms is constructed. To
start with, we assume the existence of an inﬁnite set V of so-called variables:
V = {x,y,z,...}.
Deﬁnition 1.3.2 (The set Λ of all λ-terms)
(1) (Variable) If u ∈ V , then u ∈ Λ.
(2) (Application) If M and N ∈ Λ, then (MN) ∈ Λ.
(3) (Abstraction) If u ∈ V and M ∈ Λ, then (λu. M) ∈ Λ.
Saying that this is an inductive deﬁnition of Λ means that (1), (2) and (3)
are the only ways to construct elements of Λ.
An alternative and shorter manner to deﬁne Λ is via abstract syntax (or a
‘grammar’):
Λ = V |(ΛΛ)|(λV . Λ)
One should read this as follows: following the symbol ‘=’ one ﬁnds three pos-
sible ways of constructing elements of Λ. These three possibilities are separated
by the vertical bar ‘|’.
For example, the second one is (ΛΛ), which means the juxtaposition of an
element of Λ and an element of Λ, enclosed in parentheses, gives again an6 Untyped lambda calculus
element of Λ. (Note that the two elements taken successively from Λ may be
the same element or diﬀerent elements; both possibilities are covered by the
notation ΛΛ.) What we get in this manner is clearly the same as expressed in
Deﬁnition 1.3.2(2).
Examples 1.3.3 Examples of λ-terms are:
− (with Variable as construction principle): x, y, z,
− (with Application as ﬁnal construction step): (xx), (y x), (x(xz)),
− (with Abstraction as ﬁnal step): (λx. (xz)), (λy . (λz . x)), (λx. (λx. (xx))),
− (and again, with Application as ﬁnal step): ((λx. (xz))y), (y (λx. (xz))),
((λx. x)(λx. x)).
Notation 1.3.4 (The representation of λ-terms; syntactical identity; ≡)
(1) We use the letters x,y,z and variants with subscripts and primes to denote
variables in V .
(2) To denote elements of Λ, we use L,M,N,P,Q,R and variants thereof.
(3) Syntactical identity of two λ-terms will be denoted with the symbol ≡.
So (xz) ≡ (xz), but (xz) ≡ (xy). Note that ‘M ≡ N’ expresses that the
actual λ-terms represented by M and N are identical.
With the following recursive deﬁnition we determine what the subterms of a
given λ-term are; these form a multiset, since identical terms may occur more
than once (see examples later).
Deﬁnition 1.3.5 (Multiset of subterms; Sub)
(1) (Basis) Sub(x) = {x}, for each x ∈ V .
(2) (Application) Sub((MN)) = Sub(M) ∪ Sub(N) ∪ {(MN)}.
(3) (Abstraction) Sub((λx. M)) = Sub(M) ∪ {(λx. M)}.
We call L a subterm of M if L ∈ Sub(M).
From the above deﬁnition, the properties below follow.
Lemma 1.3.6 (1) (Reﬂexivity) For all λ-terms M, we have M ∈ Sub(M).
(2) (Transitivity) If L ∈ Sub(M) and M ∈ Sub(N), then L ∈ Sub(N).
Note that a certain λ-term can ‘occur’ several times as a subterm in a given
term. For example, with (xx) we have that x ∈ Sub((xx)) for two reasons:
the ‘ﬁrst’ x in (xx) is a subterm and also the ‘second’ x is a subterm. In such
cases, one speaks about diﬀerent occurrences of the subterm.
Examples 1.3.7 − The only subterm of y is y itself.
− The subterms of (xz) are (xz), x and z.1.3 Lambda-terms 7
− Similarly, the λ-term (λx. (xx)) has four subterms: (1) (λx. (xx)) itself;
(2) (xx); (3) the left x in (xx); and (4) the right x in (xx). Note that the
ﬁrst occurrence of x in (λx. (xx)), the one immediately following the λ,
does not count as a subterm.
− Sub((λx. (xx))(λx. (xx))) consists of ((λx. (xx))(λx. (xx))), (λx. (xx))
(twice), (xx) (twice) and x (four times).
It is easy to ﬁnd the subterms of a λ-term when this λ-term is given in tree
representation. We do not describe speciﬁcally how such a tree representation
can be constructed; an example should be enough. See Figure 1.1. The letter ‘a’
in this ﬁgure stands for ‘application’.
t
t
t
t
t
g
y
x z
x
a
a
λ
@
@
@
@
Figure 1.1 The tree of (y (λx. (xz)))
A variable in a term M that immediately follows a λ symbol is drawn inside
the corresponding node in the tree. The subterms of a λ-term M correspond
to the subtrees in the tree representation of M. (We assume that the reader
is familiar with the notion ‘subtree’.) Check this in Figure 1.1. Note that the
labels of the leaves in such a tree are always variables. And the other way
round: a subterm consisting of a single variable corresponds to a labelled leaf.
(Remember that a variable placed ‘inside’ a node is not a subterm; cf. Exam-
ples 1.3.7.)
There is also a notion of proper subterm, which excludes the Reﬂexivity in
Lemma 1.3.6:
Deﬁnition 1.3.8 (Proper subterm)
L is a proper subterm of M if L is a subterm of M, but L ≡ M.
Example 1.3.9 The proper subterms of (y(λx. (xz))) are: y, (λx. (xz)),
(xz), x and z.
Expressions constructed with Deﬁnition 1.3.2 have a lot of parentheses,
which hampers readability. In order to be able to save on parentheses, the
following conventions are followed:
Notation 1.3.10 − Parentheses in an outermost position may be omitted,
so MN stands for λ-term (MN) and λx. M for (λx. M).8 Untyped lambda calculus
− Application is left-associative, so MNL is an abbreviation for ((MN)L).
− Application takes precedence over abstraction, so we can write λx. MN in-
stead of λx. (MN).
− Successive abstractions may be combined in a right-associative way under
one λ, so we write λxy . M instead of λx. (λy . M).
These conventions are very useful, but also treacherous. As an example,
note that λy . y (xy) should not be read as (λy . y)(xy), but as λy . (y(xy)).
Especially when substitution is involved (see Section 1.6), one must be careful.
## 1.4 Free and bound variables
Variable occurrences in a λ-term can be divided into three categories: free
occurrences, bound occurrences and binding occurrences.
The last-mentioned category is the easiest to describe: these are the occur-
rences immediately after a λ. Other occurrences of variables in a λ-term are
free or bound, which can be decided as follows.
In the construction of a λ-term from its parts (see Deﬁnition 1.3.2) we always
start (see step (1)) with single variables. These are then free. In building more
complicated terms via steps (2) and (3), it is only in the latter case that free-
ness may change: an occurrence of x which is free in M becomes bound in
λx. M. Otherwise said: abstraction of x over M binds all free occurrences of x
in M; that is why the ﬁrst x in λx. M is called a binding variable occurrence.
This discussion leads to the following recursive deﬁnition, in which FV(L)
denotes the set of free variables in λ-term L.
Deﬁnition 1.4.1 (FV, the set of free variables of a λ-term)
(1) (Variable) FV(x) = {x},
(2) (Application) FV(MN) = FV(M) ∪ FV(N),
(3) (Abstraction) FV(λx. M) = FV(M) \ {x}.
Examples 1.4.2
−FV(λx. xy) = FV(xy)\{x}
= (FV(x) ∪ FV(y))\{x}
= ({x} ∪ {y})\{x}
= {x,y}\{x}
= {y}.
−FV(x(λx. xy)) = {x,y}.
The last example demonstrates that Deﬁnition 1.4.1 collects the variables
which are free somewhere in a λ-term. However, other occurrences of that
variable in the same term may be bound. In the example term x(λx. xy), both
x and y occur free, but only the ﬁrst occurrence of x is free, the occurrence of x1.5 Alpha conversion 9
just before y is bound. (The occurrence of x after the λ is a binding occurrence,
being neither free nor bound.)
When inspecting the tree representation of a λ-term, it is easy to see whether
a certain occurrence of a variable is free or bound: start with a variable oc-
currence, say x, at a leaf of the tree. Now follow the ‘root path’ upwards, that
is: follow the branch from that leaf to the root (the uppermost node). If we
pass an ‘abstraction node’ with the same x inside, then the original x is bound;
otherwise it is free. Check these things for yourself with the tree representation
of the term x(λx. xy).
Ending this section, we deﬁne an important subset of the set of all λ-terms
by giving a name to terms without free variables:
Deﬁnition 1.4.3 (Closed λ-term; combinator; Λ0)
The λ-term M is closed if FV (M) = ∅. A closed λ-term is also called a
combinator. The set of all closed λ-terms is denoted by Λ0.
Example: λxyz . xxy and λxy . xxy are closed λ-terms; λx. xxy is not.
## 1.5 Alpha conversion
Functions in the λ-notation (see Section 1.2) have the property that the name
of the binding variable is not essential. The ‘square function’, for example,
can be expressed by λx. x2 as well as by λu. u2. In both cases the expression
means ‘the function which calculates the square of an input value and gives
the obtained number as its output value’. So the variable x (or u) serves as a
temporary name for the input value, only meant to make it possible to speak
about that value: the input called x gives output x2, which describes the same
procedure as ‘input u gives output u2’.
This is the reason why in the λ-calculus one is used to identify λ-terms which
only diﬀer in the names of the binding variables (together with the variables
bound to them).
In order to describe this process formally, we deﬁne a relation called α-
conversion or α-equivalence. It is based on the possibility of renaming binding
(and bound) variables (cf. Hindley & Seldin, 2008, p.278).
Deﬁnition 1.5.1 (Renaming; Mx→y; =α)
Let Mx→y denote the result of replacing every free occurrence of x in M by y.
The relation ‘renaming’, expressed with symbol =α, is deﬁned as follows:
λx. M =α λy . Mx→y, provided that y ∈ FV(M) and y is not a binding
variable in M.
One says in this case: ‘λx. M has been renamed as λy . Mx→y’.10 Untyped lambda calculus
The intended eﬀect is that the binding variable x in λx. M, plus all the
corresponding bound x’s occurring in M, are renamed as y. Note that the
mentioned bound x’s are precisely the free x’s in M.
Now, what about the two conditions in this deﬁnition?
(1) First condition: y ∈ FV(M). If there were a free y in M, then this y
becomes bound to the binding variable y in λy . Mx→y, which is not what we
want: renaming should not inﬂuence the free/bound status of variables.
Example: Take λx. M ≡ λx. y, so y ∈ FV(M). Then λy . Mx→y ≡ λy . y.
Now the same variable occurrence y is ﬁrst free, and then bound, which con-
ﬂicts with our intentions regarding ‘renaming’. Note that λx. y is essentially
diﬀerent from λy . y: in the ﬁrst expression, every input delivers the ﬁxed out-
put y, while in the second case each input returns itself as output.
(2) Second condition: y is not a binding variable in M. If this were permitted,
then this binding y could unintentionally bind a ‘new’ y replacing an x.
Example: Take λx. M ≡ λx. λy . x; then λy . Mx→y ≡ λy . λy . y. In the
ﬁrst expression, the ﬁnal x is bound by the ﬁrst λx; in the second expression,
the ﬁnal y, replacing the x, is bound by the second λy. So again, renaming
would essentially change the situation. In terms of ‘behaviour’: originally, a ﬁrst
input followed by a second input returns the ﬁrst input; but after illegitimate
renaming, a ﬁrst input followed by a second input returns the second input.
In short: in the renaming of λx. M to λy . Mx→y, it is prevented that the
‘new’ binding variable y binds ‘old’ free y’s; and that any ‘old’ binding y binds
a ‘new’ y.
Renaming in Deﬁnition 1.5.1 applies to the full λ-term only. In order to allow
it more generally, we extend this deﬁnition to the following one:
Deﬁnition 1.5.2 (α-conversion or α-equivalence, =α)
(1) (Renaming) λx. M =α λy . Mx→y as in Deﬁnition 1.5.1, under the same
conditions,
(2) (Compatibility) If M =α N, then ML =α NL, LM =α LN and, for
arbitrary z, λz . M =α λz . N,
(3a) (Reﬂexivity) M =α M,
(3b) (Symmetry) If M =α N then N =α M,
(3c) (Transitivity) If both L =α M and M =α N, then L =α N.
So renaming, expressed in (1), is the basis of α-equivalence.
The compatibility rules (2) have the eﬀect that one may also rename binding
and corresponding bound variables in an arbitrary subterm of a given λ-term.
Reﬂexivity (3a), symmetry (3b) and transitivity (3c) make α-conversion into
an equivalence relation.1.6 Substitution 11
Examples 1.5.3
(1) (λx. x(λz . xy))z =α (λx. x(λz . xy))z,
(λx. x(λz . xy))z =α (λu. u(λz . uy))z,
(λx. x(λz . xy))z =α (λz . z (λx. z y))z,
(λx. x(λz . xy))z =α (λy . y (λz . y y))z (∗1),
(λx. x(λz . xy))z =α (λz . z (λz . z y))z (∗2),
(λx. x(λz . xy))z =α (λu. u(λz . uy))v (∗3)
(2) λxy . xz y =α λv y . v z y,
λxy . xz y =α λv u. v z u,
λxy . xz y =α λy y . y z y (∗4)
λxy . xz y =α λz y . z z y (∗5)
Note that (1) uses the ﬁrst case of the Compatibility rule: the renaming
takes place in a subterm, viz. λx. x(λz . xy).
In these examples, the most interesting cases are the ones where =α does
not hold (check the other cases yourself):
(∗1): Renaming x as y in λx. x(λz . xy) violates the ﬁrst condition of Deﬁni-
tion 1.5.1, since y ∈ FV(x(λz . xy)).
(∗2): Renaming x as z in λx. x(λz . xy) violates the second condition, since z
is a binding variable in x(λz . xy).
(∗3): Renaming only applies to binding variables and (corresponding) bound
ones, not to free variables. (Name change of a free variable does aﬀect the
‘intended meaning’ of an expression.)
(∗4): Renaming variable x as y is forbidden by the second condition of Deﬁni-
tion 1.5.1, since y is a binding variable in λy . xz y. Note that λy y . y z y =α
λxy . y z y.
(∗5): Conﬂicts with the ﬁrst condition.
So, given a λ-term, there are many terms that are related to this term by
the =α-relation.
Deﬁnition 1.5.4 (α-convertible; α-equivalent; α-variant)
If M =α N, then M and N are said to be α-convertible or α-equivalent. M is
called an α-variant of N (and vice versa).
## 1.6 Substitution
In Section 1.2 we informally made use of substitution as a stepping stone to
β-reduction. We denoted ‘M in which N has been substituted for the free vari-
able x’ as M[x := N]. We are now in the position to give a precise formulation
of this notion ‘substitution’. It is deﬁned as follows.12 Untyped lambda calculus
Deﬁnition 1.6.1 (Substitution)
(1a) x[x := N] ≡ N,
(1b) y[x := N] ≡ y if x ≡ y,
(2) (PQ)[x := N] ≡ (P[x := N])(Q[x := N]),
(3) (λy . P)[x := N] ≡ λz . (Py→z[x := N]), if λz . Py→z is an α-variant of
λy . P such that z ∈ FV(N).
Remarks 1.6.2 In Deﬁnition 1.6.1 we make a liberal use of parentheses. For
example, the two pairs of parentheses in (P[x := N])(Q[x := N]) are meant to
make clear how the expression should be interpreted. They may well be erasable
after elaboration. (See also Notation 1.3.10.)
Before discussing these substitution rules in detail (see below), we note that
terms of the form P[x := N], as such, are not λ-terms, since the suﬃx [x := N]
does not occur in the deﬁnition of λ-terms (Deﬁnition 1.3.2). So P[x := N]
is meant to be meta-notation for a ‘proper’ λ-term, which can be found by
applying the above deﬁnition until all suﬃxes [x := N] have disappeared.
Now we take a closer look at the parts of Deﬁnition 1.6.1.
(1a) This is the heart of the matter: substituting N for x in the basic λ-
term x naturally results in N.
(1b) But when y is diﬀerent from x, then the substitution for x has, of course,
no eﬀect on y.
(2) Here the substitution is simply ‘pushed inside’ both sides of an applica-
tion.
(3) This is how we push the substitution inside an abstraction. Thereby we
have to be careful that free variables y of N do not become unintentionally
bound by the binding variable y of λy.P when N is substituted for the free x’s
in P; this is the reason for taking a ‘new’ z (if necessary) such that z ∈ FV(N).
Remark 1.6.3 (1) When y ∈ FV(N), then the deﬁnition permits us to let
binding variable y stay as it is: (λy . P)[x := N] ≡ λy . (P[x := N]), since
Py→y ≡ P.
(2) This also holds when x ∈ FV(P), since then there is no x to substitute
for.
(3) Renaming can be considered as a special case of substitution, since we
can show that Mx→u =α M[x := u] if the conditions of renaming are satisﬁed.
Examples 1.6.4 (1) Consider (λy . y x)[x := xy].
When we disregard the condition in part (3) of Deﬁnition 1.6.1 and do not
rename the y in λy . y x, we obtain λy . ((y x)[x := xy]), which is λy . y(xy).
But this is clearly wrong, since the free y in xy has become bound in λy . y(xy).
Hence, one ﬁrst should rename all y’s in λy . y x, e.g. to z. Successive use of
the substitution rules then gives:1.6 Substitution 13
(λy . y x)[x := xy] ≡ λz . ((z x)[x := xy]),
≡ λz . ((z[x := xy])(x[x := xy])),
≡ λz . z(xy).
(2) (λx. y x)[x := xy] ≡ λz . ((y z)[x := xy]),
≡ λz . ((y[x := xy])(z[x := xy])),
≡ λz . y z,
Note: =α λx. y x (cf. Remark 1.6.3(2)).
(3) (λxy . z z x)[z := y] ≡ λu. ((λy . z z u)[z := y]),
≡ λu. λv . ((z z u)[z := y]),
. . .
≡ λuv . y y u,
Note: =α λxv . y y x, but
=α λxy . y y x.
We conclude this section with the discussion of sequential substitution: doing
a number of substitutions consecutively. For example, a twofold substitution
may look like M[x := N][y := L], which means: ﬁrst substitute N for x in M,
and next substitute L for y in the obtained result (so (M[x := N])[y := L]
would be a clearer notation).
An interesting point is the order of the substitutions: does M[x := N][y := L]
describe the same λ-term as M[y := L][x := N]? The answer is: in general,
no. This can already be shown by means of a very simple counterexample:
x[x := y][y := x] ≡ x, but x[y := x][x := y] ≡ y.
Therefore, we have to be careful in swapping substitutions. An educated
guess is: M[x := N][y := L] ≡ M[y := L][x := N[y := L]], in order to
compensate on the right-hand side for the fact that, on the left-hand side, free
y’s in N become subject to the substitution [y := L]. Thus, on the right-hand
side we have N[y := L] instead of N, being substituted for x.
However, this still is not enough. One should also prevent free x’s in L, which
are left untouched on the left-hand side, becoming subject to the substitution
[x := N[y := L]] on the right-hand side. It suﬃces to require that x ∈ FV (L).
So we obtain:
Lemma 1.6.5 Let x ≡ y and assume x ∈ FV (L). Then:
M[x := N][y := L] ≡ M[y := L][x := N[y := L]].
We do not give a proof for this lemma (such a proof is not hard, but rather
boring), but make some suggestive drawings instead; see Figures 1.2 and 1.3.
In Figure 1.2 we give two pictorial representations of the λ-term M, which
possibly contains the free variables x and y. On the left-hand side of the ﬁgure,
we depict that N is substituted for x. This N may contain y. (It may also14 Untyped lambda calculus
......x...............y ...... ......x...............y ...... M ≡ M ≡
...y ... N ≡ no x L ≡


A
A


A
A i 1 i 1
Figure 1.2 M[x := N] (left) and M[y := L] (right) in graphical form
contain x, but this is not relevant in the present case.) Similarly, on the right-
hand side of the ﬁgure, we depict that L is substituted for y. In this picture we
express, in accordance with one of the conditions in Lemma 1.6.5, that variable
x does not occur free in L.
So Figure 1.2 represent the ﬁrst steps on the left-hand side and the right-
hand side of the lemma: M[x := N] and M[y := L], respectively.
Next, we depict how the second substitution steps, [y := L] on the left-hand
side and [x := N[y := L]] on the right-hand side, contribute to the ﬁnal result
(see Figure 1.3). It will be intuitively clear that the results are the same. Note
the importance of the fact that L in Figure 1.2 does not contain a free x.
......x...............y ...... ......x...............y ...... M ≡ M ≡
...y ... N ≡ L ≡ ...y ... N ≡ no x L ≡
L ≡ L ≡
N [y := L]
⎧
⎪ ⎨
⎪ ⎩


A
A


A
A


A
A


A
A


A
A


A
A
i 1 i 2 i 2 i 1
i 2
Figure 1.3 M[x := N][y := L] ≡ M[y := L][x := N[y := L]]
## 1.7 Lambda-terms modulo α-equivalence
In Section 1.5 we discussed α-conversion, meant to relate λ-terms that are in
a sense ‘equal’: if M =α N, then the structures of M and N are the same
but for the names of the binding variables and the corresponding bound ones.
This implies that M and N have similar trees: a variable, λ or a in M’s tree
exactly matches with a corresponding one in N. Corresponding free variables
have identical names; all combinations of binding and bound variables in M
show exactly the same pattern as in N.1.7 Lambda-terms modulo α-equivalence 15
In a sense, such α-equivalent M and N represent the same λ-term. As to
‘behaviour’, there is no diﬀerence between them. Moreover, α-equivalence is
conserved by elementary processes of term construction, as witnessed by the
following lemma.
Lemma 1.7.1 Let M1 =α N1 and M2 =α N2. Then also:
(1) M1N1 =α M2N2,
(2) λx. M1 =α λx. M2,
(3) M1[x := N1] =α M2[x := N2].
(In (1) and (2) we repeat (a variant of) the compatibility rules of Deﬁni-
tion 1.5.2. Part (3) is stated without proof.)
As a consequence of the above, it does not really matter which one to choose
in a class of α-equivalent λ-terms: the results of manipulating such terms are
always α-equivalent again. Therefore we take the liberty to consider a full
class of α-equivalent λ-terms as one abstract λ-term. We can also express this
as follows: we abstract from the names of the bound (and binding) variables,
by treating α-equivalent terms as ‘equal’; that is to say, we consider λ-terms
modulo α-equivalence.
Convention 1.7.2 From now on, we identify α-convertible λ-terms.
Notation 1.7.3 With a slight abuse of Notation 1.3.4, we use ≡ also for
syntactical identity modulo α-equivalence.
So the relation α-equivalence gets out of sight: for example, instead of
λx. x =α λy . y we simply write λx. x ≡ λy . y .
Since Convention 1.7.2 permits us to choose the names of binding and bound
variables at will, it is convenient to agree on the following, which is called the
Barendregt convention after H.P. Barendregt, a leading expert in λ-calculus
(cf. Barendregt, 1981).
Convention 1.7.4 (Barendregt convention)
We choose the names for the binding variables in a λ-term in such a manner
that they are all diﬀerent, and such that each of them diﬀers from all free
variables occurring in the term.
Hence, we shall use a unique name after every λ occurring in a λ-term, and re-
name the bound variables accordingly. So, we do not write (λxy . xz)(λxz . z),
but e.g. (λxy . xz)(λuv . v). By adopting the Barendregt convention, one is
better able to read the λ-terms and to see how they are composed with respect
to variable binding.
In order to exploit these matters to our beneﬁt, we also stretch out the16 Untyped lambda calculus
Barendregt convention to ‘intermediate’ expressions with unexecuted substi-
tutions; so we will not write (λx. xy z)[y := λx. x], or (λx. xy z)[y := λy . y],
or (λx. xy z)[y := λz . z], but, for example, (λx. xy z)[y := λu. u], in line
with the Barendregt convention.
## 1.8 Beta reduction
Now that we have formally introduced substitution, our reduction mechanism
of Section 1.2 can be rephrased as a relation on λ-terms. It is generally called
β-reduction, following H.B. Curry. (Why the letter β, the Greek b? The simple
reason seems to be that α, the Greek a, was already occupied – see Deﬁni-
tion 1.5.2 – and β was next; see Cardone & Hindley, 2009, for the history of
λ-calculus.)
We start with a single β-reduction step:
Deﬁnition 1.8.1 (One-step β-reduction, →β)
(1) (Basis) (λx. M)N →β M[x := N],
(2) (Compatibility) If M →β N, then ML →β NL, LM →β LN and
λx. M →β λx. N.
Note that the suﬃx [x := N] in (1), which (in Section 1.2) we inaccurately
described as ‘replacement’, is now meant to be the (precisely deﬁned) substi-
tution of Section 1.6. The compatibility rules of (2) serve the same purpose as
with α-conversion: they assure that P →β Q also holds if a subterm of P of
the form (λx. M)N has been changed into M[x := N], resulting in Q.
In a picture, one-step β-reduction can be represented as in Figure 1.4.
......((λx. M)N)...... →β ......(M[x := N])......
Figure 1.4 A pictorial representation of one-step β-reduction
The subterm of the form (λx. M)N on the left-hand side of this picture is
called a redex (from ‘reducible expression’). The subterm M[x := N] on the
right-hand side is called the contractum (of the redex).
We recall from Section 1.2 that the ‘incentive’ to deﬁning the relation →β is
the presence of an application term (in the formal sense) where the ﬁrst part is
an abstraction: λx. M. Since an abstraction can be thought of as representing
a function, we can conceive of the part N as an argument for this function,
which naturally leads to an ‘outcome’: M[x := N].
The subterm M in λx. M is called the body of the abstraction. Note that
the process of reduction can be described as: ‘strip a redex down to the body1.8 Beta reduction 17
M of the abstraction and substitute argument N for all free x’s occurring in
this body’.
Relation ‘→β’ is called one-step β-reduction because precisely one redex is
replaced by its contractum (see again Figure 1.4).
We now give some examples.
Examples 1.8.2 (1) (λx. x(xy))N →β N(N y).
(2) In the term (λx. (λy . y x)z)v we ﬁnd two redexes:
redex 1: the full term itself, and
redex 2: the subterm (λy . y x)z.
Hence, there are two possible one-step β-reductions:
via redex 1:  
(λx. (λy . y x)z)v →β (λy . y v)z
or via redex 2:
(λx. (
 
λy . y x)z)v →β (λx. z x)v.
Note that the terms on the right-hand sides of the →β-symbols are not
α-equivalent, hence not syntactically identical according to Convention 1.7.2.
The fact that one term reduces to two diﬀerent terms demonstrates that
the direct result of the reduction of a λ-term depends on the choice of the
redex. Note, however, that, in the present example, both obtained terms can
be reduced further to obtain a ‘common reduct’, viz. z v:
(λy . y v)z →β z v, and (λx. z x)v →β z v .
(3) (λx. xx)(λx. xx) →β (λx. xx)(λx. xx)
This is a remarkable one. (To make this clearly visible, we temporarily ignore
the Barendregt convention.)
First note that the full term is a redex: the abstraction λx. xx (the left half
of the term) is applied to the argument λx. xx (being the right half of the
term). It happens that both abstraction and argument are identical.
Check that the ﬁrst subterm xx is the body of the abstraction (in the left
half), and that β-reduction amounts to substituting the argument for both free
x’s in this body (so the argument becomes ‘duplicated’). This results in the
same term we started with.
As shown in the second example above, we can often perform a second β-
reduction step after the ﬁrst one. Repeated one-step β-reduction leads to a
more general relation, called β-reduction (‘as such’) and denoted β.
Deﬁnition 1.8.3 (β-reduction (zero-or-more-step), β)
M β N if there is an n ≥ 0 and there are terms M0 to Mn such that M0 ≡ M,
Mn ≡ N and for all i such that 0 ≤ i < n:
Mi →β Mi+1 .18 Untyped lambda calculus
Hence, if M β N, there exists a chain of single-step β-reductions, starting
with M and ending with N:
M ≡ M0 →β M1 →β M2 →β ... →β Mn−2 →β Mn−1 →β Mn ≡ N.
For a demonstration of the relation β, we refer to Example 1.8.2(2), from
which it follows that
(λx. (λy . yx)z)v β zv .
(Example 1.8.2 even provides for two →β-chains from (λx. (λy . yx)z)v to
zv.)
The following holds for β:
Lemma 1.8.4 (1) β extends →β, i.e. if M →β N, then M β N.
(2) β is reﬂexive and transitive, i.e.:
(reﬂ): for all M: M β M,
(trans): for all L, M and N: if L β M and M β N, then L β N.
Proof (1) Take n = 1 in Deﬁnition 1.8.3.
(2) Reﬂexivity: take n = 0 in Deﬁnition 1.8.3. Transitivity: follows directly
from the same deﬁnition.
An extension of this zero-or-more-step β-reduction is called β-conversion,
denoted =β.
Deﬁnition 1.8.5 (β-conversion, β-equality; =β)
M =β N (to be read as: ‘M and N are β-convertible’ or ‘β-equal’) if there is
an n ≥ 0 and there are terms M0 to Mn such that M0 ≡ M, Mn ≡ N and for
all i such that 0 ≤ i < n:
either Mi →β Mi+1 or Mi+1 →β Mi .
Note that each pair of Mi and Mi+1 should now be related by the single-step
relation →β, but not necessarily from left to right: it may also happen that
some of these pairs are related the other way round (from right to left).
For instances of =β, we refer again to Example 1.8.2(2). Note that each pair
in the following set of four terms is related by means of =β:
{(λx. (λy . y x)z)v, (λy . y v)z, (λx. z x)v, z v}.
For example: (λy . y v)z =β (λx. z x)v since we have the following chain, where
←β is the inverse of →β:
(λy . y v)z →β z v ←β (λx. z x)v .
Another chain giving the same result is:
(λy . y v)z ←β (λx. (λy . y x)z)v →β (λx. z x)v .1.9 Normal forms and conﬂuence 19
The following holds for =β:
Lemma 1.8.6 (1) =β extends β in both directions, i.e. if M β N or
N β M, then M =β N.
(2) =β is an equivalence relation, hence reﬂexive, symmetric and transitive,
i.e.:
(reﬂ): for all M: M =β M,
(symm): for all M and N: if M =β N, then N =β M,
(trans): for all L, M and N: if L =β M and M =β N, then L =β N.
Proof (1) and (2) follow directly from Deﬁnition 1.8.5.
Check that it also holds that
− if M β L1 and M β L2, then L1 =β L2,
− if L1 β N and L2 β N, then L1 =β L2.
## 1.9 Normal forms and conﬂuence
As we have said before, β-reduction mimics, in a certain sense, a calculation.
By applying a function to an argument, and using reduction, we get a kind of
(temporary) outcome, which hopefully is closer to some ﬁnal outcome. This
process is comparable with ordinary numerical calculations, as for example in
(3 + 7) × (8 − 2) → 10 × (8 − 2) → 10 × 6 → 60, with → a symbol for a
‘calculation step’.
Moreover, we can see conversion as a calculation in which we can change
the direction at will. Hence, one may replace 10 × (8 − 2) by 10 × 6, but also
the other way round. These apparently ‘unnatural’ calculation steps are not
as uncommon as one would expect. For example, the following calculation is
very suitable for ﬁnding the extreme value of a second order polynomial:
ax2 +bx+c ← a(x2 + b
ax)+c ← a(x2 +2 b
2ax)+c ← a(x+ b
2a)2 − b2
4a +c ,
which implies that c− b2
4a is the extreme value, obtained when x = − b
2a. In this
calculation one continuously calculates ‘in the wrong direction’.
In the present section, we take a closer look at these calculational aspects,
concentrating on the notion of outcome of a term and its relation with reduction
and conversion.
Deﬁnition 1.9.1 (β-normal form; β-nf; β-normalising)
(1) M is in β-normal form (or: is in β-nf) if M does not contain any redex.
(2) M has a β-normal form (has a β-nf), or is β-normalising, if there is an N
in β-nf such that M =β N. Such an N is a β-normal form of M.20 Untyped lambda calculus
One views β-normal forms of a λ-term M as the outcome of M. When M is
in β-nf, then it is an outcome itself (it has no redex, so no further calculation
is possible). The following lemma is obvious; a zero-or-more-step reduction
starting from a β-normal form must be actually zero-step.
Lemma 1.9.2 When M is in β-nf, then M β N implies M ≡ N.
Examples 1.9.3 See Examples 1.8.2.
(1) (λx. (λy . y x)z)v has a β-nf, viz. z v, since (λx. (λy . y x)z)v β z v
and z v is in β-nf.
(2) Deﬁne Ω := (λx. xx)(λx. xx). Then Ω is not in β-nf (the term itself is
a redex) and does not reduce to a β-nf, since it β-reduces (only) to itself, and
so one never gets rid of the redex.
(3) Deﬁne Δ := λx. xxx. Then ΔΔ →β ΔΔΔ →β ΔΔΔΔ →β ....
Hence it follows that also ΔΔ does not reduce to a β-nf, since there are no
other possibilities for one-step β-reduction than the ones given in the chain
above. (Check this yourself.)
(4) Take Ω as above. Then (λu. v)Ω contains two redexes: the full term and
the subterm Ω. Reducing the ﬁrst redex gives v, which is in β-nf, so (λu. v)Ω
has a β-nf. Note that one has to be careful with choosing one’s redex: when
continuously taking Ω as the redex, one never reaches a β-nf.
Remark 1.9.4 From this example, part (2), it follows that the converse of
Lemma 1.9.2 (‘If M β N implies M ≡ N, then M is in β-nf’) is not true:
take M ≡ N ≡ Ω for a counterexample.
From the last example, part (4), it follows that the choice of the ‘reduction
path’ may be relevant. This notion is deﬁned as follows.
Deﬁnition 1.9.5 (Reduction path)
A ﬁnite reduction path from M is a ﬁnite sequence of terms N0,N1,N2,...,Nn
such that N0 ≡ M and Ni →β Ni+1 for each i with 0 ≤ i < n.
An inﬁnite reduction path from M is an inﬁnite sequence N0,N1,N2,... with
N0 ≡ M and Ni →β Ni+1 for all i ∈ N.
One also writes such paths as M (≡ N0) →β N1 →β ... →β Nn (the ﬁnite
case) or M (≡ N0) →β N1 →β ... (the inﬁnite case). (Note that such paths
are always constructed with consecutive one-step β-reductions.)
Now we can deﬁne two subcollections of terms which ‘behave nicely’: the
terms for which there exists a reduction path leading to an outcome, and the
terms for which each reduction path leads to an outcome:1.9 Normal forms and conﬂuence 21
Deﬁnition 1.9.6 (Weak normalisation, strong normalisation)
(1) M is weakly normalising if there is an N in β-normal form such that
M β N.
(2) M is strongly normalising if there are no inﬁnite reduction paths starting
from M.
It will be clear that when M is strongly normalising, then each reduction
path can be extended to one ending in a β-nf (the process of choosing a redex,
doing the matching β-reduction, and repeating this, cannot go on indeﬁnitely).
Hence, all strongly normalising terms are also weakly normalising.
Example 1.9.7 In Examples 1.9.3 we ﬁnd a weakly normalising term in (4),
viz. (λu. v)Ω, and a strongly normalising term in (1): (λx. (λy . y x)z)v. The
terms Ω and Δ in (2) and (3) are not weakly normalising, so also not strongly
normalising.
There is a very important theorem about β-reduction, which relates weak
normalisation to having a β-normal form. It is usually accompanied by a picture
such as in Figure 1.5. Its content is: if a term M reduces to both N1 and N2,
then there exists a common reduct of these two.
N3
N1
M
N2
@
@ @ R
@
@ R
@ R R
ppppp p
p p p p p p
Figure 1.5 A pictorial representation of the Church–Rosser Theorem
The theorem is most commonly called the Church–Rosser Theorem (after
the logicians A. Church and J.B. Rosser), abbreviated to CR. Another name
is Conﬂuence (the reduction paths ‘ﬂow together’ again). Its formal statement
is:
Theorem 1.9.8 (Church–Rosser; CR; Conﬂuence) Suppose that for a given
λ-term M, we have M β N1 and M β N2. Then there is a λ-term N3 such
that N1 β N3 and N2 β N3.
The proof of this theorem is much more complex than one would expect.
Many proofs have been published in the past, some of considerable length. A
complete proof can be found in H.P. Barendregt’s standard work about the un-
typed lambda calculus (see Barendregt, 1981, p.62) or in his ‘Handbook paper’22 Untyped lambda calculus
about typed lambda calculus, which has also been very inﬂuential (Barendregt,
1992, p.136–141); in the latter book the proof takes a little more than four
pages. We do not copy either of these proofs: the interested reader is referred to
Barendregt’s texts. (There also exists a short and elegant proof on an algebraic
basis; see Takahashi, 1995.)
The importance of the Church–Rosser Theorem lies in the consequence that
the outcome of a calculation (if it exists) is independent of the order in which
the calculations are executed. (This follows from Lemma 1.9.10(2) below.) This
independence is what you intuitively expect from ‘calculations’: the consecutive
choices of the redexes should not inﬂuence the ﬁnal result.
For example, when calculating the outcome of (3+5)·(7−3), it should not
matter whether one starts with redex 3 + 5 or with redex 7 − 3. And indeed,
in both cases one obtains the same outcome:
(3 + 5) · (7 − 3) → 8 · (7 − 3) → 8 · 4 → 32,
(3 + 5) · (7 − 3) → (3 + 5) · 4 → 8 · 4 → 32.
For a diagram of this calculation, see Figure 1.6.
(3 + 5) · (7 − 3)
8 · (7 − 3) (3 + 5) · 4
8 · 4
32
HH j   
   HH j
?
Figure 1.6 The various branches of a calculation
There is a corollary to the Church–Rosser Theorem, which says that any
pair of convertible terms has a ‘common reduct’; we shall also prove this:
Corollary 1.9.9 Suppose that M =β N. Then there is L such that M β L
and N β L.
Proof Because M =β N, we have by deﬁnition that, for some n ∈ N:
M ≡ M0
→β
←β
M1 ... Mn−1
→β
←β
Mn ≡ N .
(Here Mi
→β
←β
Mi+1 denotes that either Mi →β Mi+1 or Mi+1 →β Mi.)
We proceed by induction on n.1.9 Normal forms and conﬂuence 23
(1) n = 0: then M ≡ N. Take L ≡ M(≡ N), then M β L and N β L
(in both cases in zero steps).
(2) n = k > 0: then Mk−1 exists.
So we have that M ≡ M0 ... Mk−1
→β
←β
Mk ≡ N.
By induction, there is an L such that M0 β L and Mk−1 β L. This is
shown graphically in Figure 1.7.
M ≡ M0
L
......
ind:
Mk−1
-  Mk ≡ N
@
@ R
@
@ R
Figure 1.7 The induction case: k > 0
Now we distinguish between the two cases, Mk−1 →β Mk or Mk →β Mk−1.
(2a) In the ﬁrst case, the situation is as in Figure 1.8.
M ≡ M0
L
...... Mk−1
- Mk ≡ N
@
@ R
@
@ R
Figure 1.8 Subcase Mk−1 →β Mk
Then we have that Mk−1 β L and Mk−1 →β Mk. The latter reduction (in
one step) is a special case of the more-step reduction Mk−1 β Mk. Hence,
by CR, there is an L such that L β L and Mk β L. For a graphical
representation, see Figure 1.9.
M ≡ M0
L
......
CR:
Mk−1
- Mk ≡ N
@
@ R
@
@ R
L - -
Figure 1.9 Subcase Mk−1 →β Mk, extended by means of CR
Hence we found, as desired, the common reduct L, since M β L and
N β L.24 Untyped lambda calculus
(2b) In the second case, the situation is as in Figure 1.10.
M ≡ M0
L
......
ind:
Mk−1
 Mk ≡ N
@
@ R
@
@ R
Figure 1.10 Subcase Mk →β Mk−1
Now we are immediately done: take L as the L we are looking for, since
M β L and N β L.
We conclude this section with two corollaries of the above.
Lemma 1.9.10 (1) If M has N as β-normal form, then M β N.
(2) A λ-term has at most one β-normal form.
Proof (1) Assume M =β N, with N in β-normal form. Then by the previous
Corollary 1.9.9, there is an L such that M β L and N β L. Since N is in
β-nf, by Lemma 1.9.2: N ≡ L. Hence M β L ≡ N, so M β N.
(2) Assume that M has two β-normal forms, N1 and N2. Then by part (1)
of the present lemma, M β N1 and M β N2. By CR, there is L such that
N1 β L and N2 β L. But, since both N1 and N2 are β-normal forms, it
follows (again by Lemma 1.9.2) that N1 ≡ L and N2 ≡ L, so N1 ≡ N2.
Speaking informally, the consequences of this lemma are:
(1) If a λ-term has an outcome, then this outcome can be reached by ‘forward
calculation’ (i.e. β-reduction).
(2) An outcome of a calculation, if it exists, is unique. (There cannot be two
diﬀerent outcomes for one λ-term.)
## 1.10 Fixed Point Theorem
A remarkable aspect of untyped lambda calculus is that every λ-term L has a
‘ﬁxed point’, i.e. for each L there exists a λ-term M such that LM =β M.
The term ‘ﬁxed point’ (or ‘ﬁxpoint’) is borrowed from functional analysis.
There, a function f has ﬁxed point a if f(a) = a, that is: function f applied to
a returns a again, so a is ‘ﬁxed’ by f. For example, the square function f on
the natural numbers with f(n) = n2 has two ﬁxed points: 0 and 1. However,
the so-called successor function s with s(n) = n + 1 has no ﬁxed point at all
and neither has g with g(n) = 2n.
So untyped λ-calculus deviates from ‘usual’ calculus in this respect:1.10 Fixed Point Theorem 25
Theorem 1.10.1 For all L ∈ Λ there is M ∈ Λ such that LM =β M.
Proof For given L, deﬁne M := (λx. L(xx))(λx. L(xx)).
This M is a redex, so we have:
M ≡ (λx. L(xx))(λx. L(xx))
→β L( (λx. L(xx)) (λx. L(xx)) )
≡ LM.
Hence, LM =β M.
Remark 1.10.2 A λ-version of the successor function s mentioned above,
e.g. λx. (x + 1), has a ﬁxed point M according to Theorem 1.10.1. However,
M does not represent a natural number. (About natural numbers in λ-form:
see Exercise 1.10; see also Exercise 1.11.)
From the method of the above proof, it follows that there even exists a so-
called ﬁxed point combinator, i.e. a closed term which ‘constructs’ a ﬁxed point
for an arbitrary input term. Such a ﬁxed point combinator is
Y ≡ λy . (λx. y(xx))(λx. y(xx)).
Indeed, for each λ-term L, we have that Y L is a ﬁxed point of L, since
L(Y L) =β Y L, which can be shown as follows:
Y L →β (λx. L(xx))(λx. L(xx))
→β L( (λx. L(xx))(λx. L(xx)) )
=β L(Y L).
Although this universal existence of a ﬁxed point M for every λ-term L ap-
pears a bit exotic, it has a nice consequence, namely the solvability of recursive
equations of the form
M =β ......M ......
(Here we intend to express that one or more occurrences of M appear in the
λ-term to the right of the =β-symbol.)
So we claim: an M that makes such an equation true can always be found.
We show this as follows: let L be the expression on the right-hand side,
but preﬁxed with λz . , and with everywhere M replaced by the variable z. So
we have that L ≡ λz . ......z ...... . Then LM →β ......M ...... .
Hence, it suﬃces to ﬁnd an M such that M =β LM. But such an M explicitly
does exist, as shown in Theorem 1.10.1.
Examples 1.10.3 (1) Let’s solve the question: does there exist a λ-term M
such that Mx =β xMx?
First rephrase the question to: is there an M such that M =β λx. xMx,
because if so, then Mx =β xMx.26 Untyped lambda calculus
Deﬁne L := λy . (λx. xyx). Then LM →β λx. xMx. So if we ﬁnd M such
that M =β LM, we are done. Otherwise said: ﬁnd a ﬁxed point for L. But this
is easy: use the ﬁxed point combinator Y , which gives Y L as the desired ﬁxed
point M of L.
(2) We can code the natural numbers ‘nat’ in untyped lambda calculus,
including addition ‘add’ and multiplication ‘mult’ (cf. Exercise 1.10), a succes-
sor function ‘suc’ (Exercise 1.11), together with ‘true’, ‘false’ (Exercise 1.12), a
zero-test ‘iszero’ (Exercise 1.13) and a conditional ‘if–then–else’ (Exercise 1.14).
We can also code a predecessor function ‘pred’ in this setting, which is a bit
harder to realise (see e.g. Hindley & Seldin, 2008).
The factorial ‘fac’ can now be deﬁned by the recursive equation:
fac x =β if (iszero x) then 1 else mult x (fac(pred x)).
Again, the desired ‘fac’ can be solved from this equation by means of a ﬁxed
point combinator.
## 1.11 Conclusions
We list some results about untyped lambda calculus:
(1) on the positive side:
− We have formally described the input–output behaviour of functions, includ-
ing the essential construction principles (abstraction and application), and
the evaluation rule (β-reduction).
− The λ-calculus is a clean and simple formalism for these purposes, which
also deals neatly with variable binding.
− Substitution appears to be a fundamental mechanism for function evaluation.
Its consequences are more subtle than expected. However, substitution can
be treated rigorously in untyped lambda calculus.
− Conversion is an important extension of reduction, which can straightfor-
wardly be introduced. It covers the notion ‘being equivalent by means of
calculations’.
− We have included the useful notion ‘possible outcome of a calculation’ by
deﬁning β-normal forms.
− Conﬂuence, a property naturally desired for calculations, is guaranteed in
lambda calculus.
− A nice consequence is the uniqueness of β-normal forms, if existing; so there
cannot be more than one ‘outcome’ of a calculation.
− A number of recursive equations can be solved by means of ﬁxed points.
− Finally, we mention the fact (which we discuss in the following section) that
the untyped lambda calculus is Turing-complete.1.12 Further reading 27
(2) on the negative side:
− Self-applications (such as xx or MM) are allowed in lambda calculus, al-
though they are counter-intuitive.
− Existence of normal forms for λ-terms is not guaranteed, so we have the real
possibility of undesired ‘inﬁnite calculations’.
− Each λ-term has a ﬁxed point, which is not in accordance with what we
know to be the usual behaviour of functions.
In the following chapters we will suppress the negative properties while main-
taining the positive properties. The negative properties are removed by adding
types to lambda calculus, which provide for natural restrictions on the terms
allowed. In successive rounds, we will build up several ‘classes’ of types, each
with their own special features and advantages.
## 1.12 Further reading
As we have already pointed out, the untyped lambda calculus was invented
by A. Church to capture the notion of computability (Church, 1936b). He
succeeded in giving a formal deﬁnition, on the basis of his lambda calculus:
‘λ-deﬁnability’. In Exercises 1.10 to 1.14 we give an impression of how this
Church-computability works, on the basis of the so-called Church numerals.
It turned out later that Church-computability is equivalent to a great num-
ber of other formulations of computability, deﬁned in completely diﬀerent set-
tings. One such formalisation is Turing-computability, based on the notion of
the Turing machine (Turing, 1936). (A Turing machine is an abstract kind
of computer; cf. A.M. Turing’s paper in Davis, 1965). Since ‘computable’ in
the lambda calculus is equivalent to ‘computable’ using Turing machines, the
lambda calculus is called Turing-complete.
Other formulations of eﬀective computability are ‘Herbrand–Gödel-comput-
ability’ and ‘general recursive function’. The ﬁrst is based on specifying com-
putable functions via a set of equations and the second inductively deﬁnes
the collection of ‘recursive functions’ (see Mendelson, 2009). In Lewis & Pa-
padimitriou (1981) you can ﬁnd a nice exposition and proofs of the fact that
the various approaches lead to the same results. This enhances the conﬁdence
that, indeed, a good formalisation of ‘eﬀective computability’ has been found.
This conviction is known under the name ‘Church’s thesis’ or ‘Church–Turing
thesis’. This thesis states that any function that can be computed by using a
mechanical device can be computed by a Turing machine (or equivalently by
a λ-term).
Already before the lambda calculus, M. Schönﬁnkel (see Schönﬁnkel, 1924)
had invented combinatory logic, which is even simpler and also Turing-complete.28 Untyped lambda calculus
Combinatory logic can be seen as the lambda calculus restricted to the terms
K := λxy . x and S := λxy z . xz(y z) with the associated equality rules,
KP Q = P and SP QR = P R(QR) (Curry, 1930; see also Exercise 1.9).
Combinatory logic is a simpler system than lambda calculus, but the basic
operations of variable binding and abstraction are not primitive, and therefore
it is a slightly more diﬃcult system to work with.
In lambda calculus, the issue of variable binding and substitution has raised
a lot of attention, because these operations – though maybe intuitively clear
– are quite subtle, involving renaming of bound variables. N.G. de Bruijn (see
de Bruijn, 1972) invented a way of representing λ-terms without using named
variables. This is now known as a representation using de Bruijn indices. The
advantage is that all terms have a unique representation and one doesn’t have
to work ‘modulo α-conversion’. A substitution now involves updating the in-
dices, but that can rather easily be programmed. There has been quite a lot of
work on how to do all this precisely and how to combine a de Bruijn nameless
approach with a named calculus that one uses to communicate with the user.
Implementations of the untyped lambda calculus as a functional program-
ming language have existed since 1958, when Lisp (McCarthy et al., 1985) was
invented by J. McCarthy. Lisp or variants of it are still used a lot, but the more
recently developed functional languages are typed. One of the issues that comes
up when actually implementing a (typed) lambda calculus as a programming
language is the choice of an evaluation strategy, also known as reduction strat-
egy. In a λ-term there will be many redexes that one can choose to contract.
As we have seen, this choice doesn’t matter for the ‘end result’ (the normal
form that we obtain, if it exists), but it may matter for the amount of time it
takes to compute the normal form. And if we always choose the ‘wrong’ redex,
we may not ﬁnd the normal form at all. For example, in the term (λu. v)Ω
we saw in Example 1.9.3(4), there is an inﬁnite reduction (contracting Ω) and
a one-step reduction to normal form. In the lambda calculus one therefore
studies reduction strategies: procedures that prescribe which redex to contract
next. For example, it is known that the ‘left-most reduction strategy’ (always
contract the left-most redex of the term) ﬁnds a normal form, if it exists.
In the early 1980s, H.P. Barendregt published a seminal book (Barendregt,
1981) on the untyped lambda calculus, more or less collecting all results that
were known about its syntax and semantics at the time. This book serves as the
standard reference on lambda calculus and has also been a starting point for a
lot of new research into the ﬁeld. It contains a proof of the Turing-completeness
of the lambda calculus and also studies various reduction strategies and their
properties.
A more introductory text about untyped (and typed) lambda calculus is the
book Lambda-Calculus and Combinators (Hindley & Seldin, 2008), which alsoExercises 29
pays attention to the theory of combinatory logic. Another subject discussed
in this book is how to construct models of the untyped lambda calculus and of
combinatory logic; models are interpretations (mathematical structures) that
reﬂect the ‘behaviour’ of the original calculi.
Exercises
## 1.1 Apply Notation 1.3.10 on the following λ-terms. So, remove parentheses
and combine λ-abstractions:
(a) (λx. (((xz)y)(xx))),
(b) ((λx. (λy . (λz . (z((xy)z)))))(λu. u)).
## 1.2 Find out for each of the following λ-terms whether it is α-equivalent, or
not, to λx. x(λx. x):
(a) λy . y (λx. x),
(b) λy . y (λx. y),
(c) λy . y (λy . x).
1.3 Use the deﬁnition of =α to prove that λx. x(λz . y) =α λz . z(λz . y), in
spite of the fact that z occurs as a binding variable in x(λz . y).
## 1.4 Consider the following λ-term:
U := (λz . z xz)((λy . xy)x).
(a) Give a list of all subterms of U.
(b) Draw the tree representation of U.
(c) Find the set of all free variables of U by a calculation, as in Exam-
ples 1.4.2.
(d) Find out which of the following λ-terms are α-equivalent to U and give
a motivation why; also check which of them satisﬁes the Barendregt
convention:
(λy . y xy)((λz . xz)x),
(λx. xy x)((λz . y z)y),
(λy . y xy)((λy . xy)x),
(λv . (v x)v)((λu. uv)x).
## 1.5 Give the results of the following substitutions:
(a) (λx. y(λy . xy))[y := λz . z x],
(b) ((xy z)[x := y])[y := z],
(c) ((λx. xy z)[x := y])[y := z],
(d) (λy . y y x)[x := y z].30 Untyped lambda calculus
## 1.6 Show that the following proposition is not always true:
M[x := N,y := L] ≡ M[x := N][y := L]
where the expression on the left-hand side means a simultaneous substitu-
tion; so, M[x := N,y := L] is the result of replacing all free x’s and y’s in
M at the same time (‘together’) by N and L, respectively. (The expression
on the right-hand side is concerned with sequential substitution.)
## 1.7 Consider the λ-term U of Exercise 1.4, again.
(a) Mark all redexes in U.
(b) Find all reduction paths from U and the β-normal form of U (if it
exists).
1.8 Show that the terms (λx. xx)y and (λxy . y x)xx are not β-convertible.
## 1.9 Consider the following λ-terms (cf. Section 1.12):
K := λxy . x,
S := λxyz . xz(y z).
(a) Check that KP Q β P and SP QR β P R(QR), for arbitrary
λ-terms P, Q and R.
(b) Let I := λx. x. Prove that SKK β I.
(c) Let B := S(KS)K. Prove that BU V W β U(V W).
(d) Prove that SSSKK =β SKKK.
## 1.10 We deﬁne the λ-terms zero, one, two (the ﬁrst three so-called Church
numerals), and the λ-terms add and mult (which mimic addition and
multiplication of Church numerals) by:
zero := λfx. x,
one := λfx. f x,
two := λfx. f(f x),
add := λmnfx. mf(nf x),
mult := λmnfx. m(nf)x.
(a) Show that add one one β two.
(b) Prove that add one one =β mult one zero.
## 1.11 The successor is the function mapping natural number n to n + 1. It is
represented in λ-calculus by suc := λmf x. f(mf x). Check the following
for the Church numerals deﬁned in the previous exercise:
(a) suc zero =β one,
(b) suc one =β two.
## 1.12 We deﬁne the λ-terms true and false (the booleans) and not (resembling
the logical ¬-operator) by:
true := λxy . x (so it happens that true ≡ K),
false := λxy . y (and false ≡ zero),Exercises 31
not := λz . z false true.
Show that not(not p) =β p for all λ-terms p, in each of the following
two cases: (a) p β true or (b) p β false.
## 1.13 Consider the λ-terms zero, true and false from Exercises 1.10 and 1.12.
Let iszero := λz . z(λx. false)true.
(a) Prove that iszero zero reduces to true.
(b) A natural number n > 0 may be represented by the following Church
numeral: λfx. f(f(...(x))), with n copies of the variable f. (Cf. the
deﬁnitions of one and two in Exercise 1.10.)
Prove that iszero n reduces to false for any Church numeral n ex-
cept 0. (Consequently, iszero represents a test-for-zero.)
1.14 The term ‘If x then u else v’ is represented by λx. xuv. Check this by
calculating the β-normal forms of (λx. xuv)true and (λx. xuv)false,
respectively. (The booleans true and false are deﬁned in Exercise 1.12.)
## 1.15 In Examples 1.9.3 we have seen that neither Ω nor Δ reduces to a β-nf.
Prove that both λ-terms do not have a β-nf, as well.
## 1.16 Let M be a λ-term with the following properties:
(1) M has a β-normal form.
(2) There exists a reduction path M ≡ M0 →β M1 →β M2 →β ... of
inﬁnite length.
(a) Prove that every Mi has a β-normal form.
(b) Give an example of a λ-term with the mentioned two properties and
show that it satisﬁes these properties.
1.17 Prove the following: if MN is strongly normalising, then both M and N
are strongly normalising.
1.18 Let L, M and N be λ-terms such that L =β M and L β N. Moreover,
let N be in β-normal form. Prove that also M β N.
1.19 We deﬁne U := λzx. x(zzx) and Z := U U. Prove that Z is a ﬁxed point
combinator, i.e. ZM is a ﬁxed point for every λ-term M, so M(ZM) =β
ZM. Show that even holds: ZM β M(ZM).
(This Z is called the Turing ﬁxed point combinator after the famous
British mathematician A. Turing (1912–1954). The λ-term Y introduced
in Section 1.10 is usually called the Curry ﬁxed point combinator, af-
ter its inventor H.B. Curry (1900–1982); cf. Cardone & Hindley, 2009,
Section 4.1. These two combinators are the most well-known among an
inﬁnite number of diﬀerent ﬁxed point combinators.)
1.20 (a) Construct a λ-term M such that M =β λxy . xM y.
(b) Construct a λ-term M such that M xy z =β xy z M.2
Simply typed lambda calculus
## 2.1 Adding types
In the previous chapter we saw that the abstract behaviour of functions can
be expressed very well by means of λ-calculus. The system introduced in that
chapter is highly concise and elegant. However, we also have seen that λ-
calculus is sometimes ‘too liberal’ to conform to our intuitive demands con-
cerning functions and how they should act as input–output devices. In the ﬁnal
section of Chapter 1 we listed a number of important drawbacks.
In order to get a ﬁrmer hold on the desired behaviour of functions, we will
introduce types in the present chapter. This is a natural thing to do: functions
are usually thought of as acting on objects belonging to a certain collection,
e.g. the collection of the natural numbers or the collection of points on a line.
Therefore, it is quite customary to talk about a function on a domain, for
example the function ‘square’ on the natural numbers.
Hence, the addition of types gives certain restrictions on the input values
permitted: a function deﬁned on domain N may only take natural numbers as
input values, even when it would be quite clear what the output value would be
for some ‘illegal’ input value. For example, ‘square’ on N permits us to calculate
three-squared, but excludes by deﬁnition the squaring of three-and-a-half. We
could, however, deﬁne ‘another’ squaring function on a larger domain, e.g. Q or
R, in order to make it applicable to three-and-a-half. On the other hand, such
an extension of the domain is often impossible: the function ‘square root’ on the
naturals may not be extended to a function ‘square root’ on the integers, since
the square root of a negative number is non-existent in the normal conception
of what it means to be a root (even when complex numbers are permitted as
an answer, the square root of −1 does not exist, since both i and −i could
serve as an answer).
Our hope is that the addition of types prevents the anomalies indicated in
the previous chapter. And indeed, this turns out to be the case. The simple34 Simply typed lambda calculus
types that we introduce in the present chapter form a ﬁrst important step,
although they are in several senses too restrictive: we cannot represent a suf-
ﬁcient amount of functions by means of simple types, in particular when we
want to express mathematics in a formal shape. In the subsequent chapters we
will add more types to enlarge the expressivity of the system.
## 2.2 Simple types
A straightforward manner to add (abstract) types is to start with an inﬁnite
set of type variables and then add one production rule to build more complex
types – so-called function types. This is done as follows, based on a famous
paper of A. Church (Church, 1940).
We start with an inﬁnite set of type variables: V = {α,β,γ,...}.
Deﬁnition 2.2.1 (The set T of all simple types)
The set of simple types T is deﬁned by:
(1) (Type variable) If α ∈ V, then α ∈ T,
(2) (Arrow type) If σ,τ ∈ T, then (σ → τ) ∈ T.
In abstract syntax this is as follows: T = V | T → T.
Examples of simple types are: γ, (β → γ), ((γ → α) → (α → (β → γ))).
Notation 2.2.2 (1) The Greek letters α, β, ...and variants thereof are used
for type variables belonging to V. (Do not confuse this α and β with the symbols
used for α-conversion and β-reduction.)
(2) We use σ, τ, ...(occasionally A, B, ...) to denote arbitrary simple types.
(3) Outermost parentheses may be omitted.
(4) The parentheses in arrow types are right-associative.
Note the right-associativity of the arrow, in contrast with the left-associa-
tivity of application (cf. Notation 1.3.10). So α1 → α2 → α3 → α4 is shorthand
for the simple type (α1 → (α2 → (α3 → α4))), whereas x1 x2 x3 x4 abbreviates
(((x1x2)x3)x4).
Remarks 2.2.3 Apart from the type variables α, β, ..., we also still have
(ordinary) variables x, y, ... . When we speak simply about variables, from
now on we only mean the latter species.
Now that we know what simple types are, we also want to know how to use
them.
First of all, we discuss the intended meaning of the types. This is simple:
− type variables are abstract representations of basic types such as nat for
natural numbers, list for lists, etcetera.2.2 Simple types 35
− arrow types represent function types, such as nat → real (the set of all
functions from naturals to reals) or (nat → integer) → (integer → nat)
(the set of all functions with input a function from naturals to integers and
output a function from integers to naturals).
Remark 2.2.4 We distinguish between the sets N or L and the types nat or
list, because sets like N belong to mathematics and types like nat to computer
science. Otherwise said: N is a collection of things in the ‘real world’ of math-
ematical entities, whereas nat is some coding of these entities in the ‘virtual
world’ of computer programming. This distinction between sets and types will
repeatedly play a role in the rest of this book.
In order to express things like ‘term M has type σ’, we add so-called state-
ments (or typing statements) to our formal language, of the form M : σ.
First of all, we assume that we have an inﬁnitude of variables available for
each type σ. If variable x has type σ, we denote this as x : σ. We thereby
assume that each variable x has a unique type: if x : σ and x : τ, then σ ≡ τ.
Now we investigate what the natural requirements are for the typing of
applications and abstractions; these being the basic construction principles of
λ-calculus.
(1) (Application): for the type of the application MN, we clearly have to
know the types of M and N. The intention of MN is that (‘function’) M
must be applied to (‘input term’) N. First, M should have a function type,
say σ → τ. Second, N should be a ‘proper’ input for this function type, so the
type of N must be the input type σ. Finally, the resulting type of MN should
clearly be the output type τ.
Summarising: if M : σ → τ and N : σ, then MN : τ.
(2) (Abstraction): if M : τ, what is the type of the abstraction λx. M? The
latter term is a function mapping x to M, so in order to know its type, it
suﬃces to know the type of x (the type of M being known). Clearly, if x has
type σ, then λx. M should have (function) type σ → τ.
Summarising: if x : σ and M : τ, then λx. M : σ → τ.
The result of the above discussion is that it suﬃces to give the types of
variables. The extension of the types to more complicated terms (if possible!)
is then a question of calculation (see also Examples 2.2.6 below).
Remark 2.2.5 Obviously, there are two side conditions which have to be
satisﬁed in the typing of an application M N: the left-hand side M of the ap-
plication must have a function type ‘...1 → ...2’, and the right-hand side N
of the application must match with the input type ‘...1’. Only when both con-
ditions are met, can we derive the type of M N, being the output type ‘...2’.36 Simply typed lambda calculus
For the typing of an abstraction λx. M, we just need the types of x and M.
Examples 2.2.6 (1) When x has type σ, then the identity function λx. x
has type σ → σ.
(2) By the side conditions mentioned above, the application y x can only be
typed if y has a function type (of the form σ → τ) and the type of x matches
with the domain σ of this function type; the resulting type for y x then is τ.
Compare this with the ‘real world’ of mathematics: one may only speak of
f(x) (i.e. f applied to x) if f is a function, say from input type A to output
type B, and x is of the input type A; the result f(x) then has type B.
(3) This suggests that xx cannot have a type: if it had, then x should
have type σ → τ (for the ﬁrst x) and also σ (for the second x). Since we
presuppose that each variable has a unique type, σ → τ ≡ σ, which is
obviously impossible.
Consequently, the following deﬁnition makes sense, since the conditions for
the typing of applications really prevent the typing of a number of terms.
Deﬁnition 2.2.7 (Typable term) A term M is called typable if there is a
type σ such that M : σ.
Remark 2.2.8 The diﬀerence between the right-associativity of the arrow
and the left-associativity of application (which we noticed after Notation 2.2.2)
has a natural cause: assume that function f has type ρ → (σ → τ), and that
x : ρ and y : σ, then f x : σ → τ, so (f x)y : τ. So, using both associativity
conventions, we have that f : ρ → σ → τ (without parentheses) and f xy : τ
(without parentheses). So, in a sense, both notation conventions correspond to
each other.
## 2.3 Church-typing and Curry-typing
Typing of a λ-term starts with typing its variables. There are two ways to give
types to variables:
(1) Prescribe a (unique) type for each variable upon its introduction. This is
called typing à la Church or explicit typing, since the types of variables are
explicitly written down (as in Church’s original paper: Church, 1940). The
types of more complex terms now follow in an obvious manner, if one takes
the restriction on typability of applications into account.
(2) Another way is not to give the types of variables, but to leave them open
(‘implicit’) to some extent; this is called typing à la Curry or implicit typing. In
this case, the typable terms are found by a search process, which may contain
‘guesses’ for the types of the variables. See the second example below.2.3 Church-typing and Curry-typing 37
Examples 2.3.1 (1) (Typing à la Church) Assume x has type α → α and y
has type (α → α) → β, then yx has type β.
If, moreover, z has type β and u has type γ, then λzu. z has type β → γ → β.
(We recall that β → γ → β stands for β → (γ → β); cf. Notation 2.2.2(4).)
Hence, the application (λzu. z)(y x) is permitted, since the type β of y x
matches with the ‘input type’ β of λzu. z. So (λzu. z)(y x) is typable, with
type γ → β.
(2) (Typing à la Curry) Look again at the λ-term M ≡ (λzu. z)(y x), but
now assume that the types of the variables x, y, z and u have not been given
beforehand. Can we make an educated guess about the ‘possible’ types of these
variables, provided that we require that the full term must obtain a type?
First of all, we note that the term M is an application of λzu. z to y x.
So λzu. z should have a function type, say A → B, and then y x must have
type A. Consequently, M has type B.
The fact that λzu. z : A → B, implies that z : A and λu. z : B. In the
latter typing statement, B is the type of a term starting with λ, hence B is a
function type, so B ≡ (C → D) for some C and D, and it follows that u : C
and z : D.
In the second place, y x itself is an application, so there must be E and F
such that y : E → F and x : E. Then y x : F.
It follows that:
− x : E,
− y : E → F,
− z : A and z : D, so A ≡ D,
− u : C,
− B ≡ (C → D),
− y x : A and y x : F, so A ≡ F.
Hence, we have that A ≡ D ≡ F, so, omitting the superﬂuous D and F
(and B), we obtain:
(∗) x : E, y : E → A, z : A, u : C .
Since M has type B and D ≡ A, we can also say that M : C → A. Thus we
obtained a general scheme (∗) for the types of x, y, z and u, inducing a type
for M.
We may ﬁll the scheme (∗) with ‘real’ types, e.g.:
− x : β, y : β → α, z : α, u : δ, with M : δ → α; or
− x : α → α, y : (α → α) → β, z : β, u : γ, with M : γ → β (compare this
with the typing-à-la-Church example above); or
− x : α, y : α → α → β, z : α → β, u : α → α, with M : (α → α) → α → β.38 Simply typed lambda calculus
Apparently, each mentioned ‘instance’ of the general scheme shows that the
λ-term M ≡ (λzu. z)(yx) is a typable term. Hence, as long as the restrictions
imposed by the general scheme are respected, there is a rich choice of types for
the four variables.
Typing à la Curry has interesting features, some of which have been hinted
at above. We will discuss Curry-typing in some detail in Section 2.14. In the
major part of this textbook, however, we only consider typing à la Church
(explicit typing), because in ‘real life’ situations from mathematics and logic,
types are usually ﬁxed and given beforehand.
For a clear presentation, we denote the types of bound variables immediately
after their introduction following a λ. The types of the free variables are given
in a so-called context (sometimes called basis), in an order that may be chosen
at will.
Example 2.3.2 Consider the term (λzu. z)(y x) again of Examples 2.3.1(1),
where z and u are bound and x and y are free. Assuming that z has type β
and u has type γ, we write this term as follows: (λz : β . λu : γ . z)(y x), with
explicit typing of the bound variables z and u.
The context registering the types of the free variables x and y, as given in
Examples 2.3.1(1), becomes: x : α → α, y : (α → α) → β.
Altogether, we write the content of this example in the following explicit
format:
x : α → α, y : (α → α) → β  (λz : β . λu : γ . z)(y x) : γ → β .
This judgement can be read as follows:
‘In context x : α → α, y : (α → α) → β, the term (λz : β . λu : γ . z)(y x)
has type γ → β.’
The separation marker ‘’ between context (left) and typable term (right)
in the example judgement above, points at a technical connotation of ‘deriv-
ability’, which will be explained in the next section.
Remark 2.3.3 We do not have β-reduction yet for ‘typed terms’ (for this,
see Section 2.11), but an educated guess is that
(λz : β . λu : γ . z)(y x) →β λu : γ . y x.
Note that the latter term has the same type γ → β as the former one, since it
can be shown that
x : α → α, y : (α → α) → β  λu : γ . y x : γ → β .
(Check this; see also Lemma 2.11.5.)2.4 Derivation rules for Church’s λ→ 39
## 2.4 Derivation rules for Church’s λ→
Since we have decorated our terms with type information for the bound vari-
ables, we have to revise our deﬁnition of λ-terms, Λ. We call our new set of
terms ΛT, described by the following abstract syntax:
Deﬁnition 2.4.1 (Pre-typed λ-terms, ΛT)
The set of pre-typed λ-terms is deﬁned by:
ΛT = V |(ΛTΛT)|(λV : T. ΛT).
As already said in Section 2.2, we want to express things like ‘λ-term M has
type σ’, relative to a context Γ, which we do by means of a judgement.
Deﬁnition 2.4.2 (Statement, declaration, context, judgement)
(1) A statement is of the form M : σ, where M ∈ ΛT and σ ∈ T.
In such a statement, M is called the subject and σ the type.
(2) A declaration is a statement with a variable as subject.
(3) A context is a list of declarations with diﬀerent subjects.
(4) A judgement has the form Γ  M : σ, with Γ a context and M : σ a
statement.
So x : α → β is a declaration, and x1 : α, x2 : α → β, x3 : (β → α) → β
is an example of a context, where x1, x2 and x3 must be diﬀerent variables. A
context may also consist of a single declaration, or even of none (a so-called
empty context).
Notation 2.4.3 We use similar notation conventions as in Notation 1.3.4
and Notation 1.3.10. So we write λx : α. λy : β . z for (λx : α. (λy : β . z)).
We import the notions ‘free variable’ and ‘bound variable’ in a straightforward
manner from untyped λ-calculus.
In a judgement Γ  M : σ, we count the subject variables in the declarations
of Γ as binding variables; they bind the corresponding free variables in M. We
maintain the Barendregt convention 1.7.4 also for these ‘new’ binding variables.
For example, in the judgement below Example 2.3.2, we take x, y, z and u as
all diﬀerent.
Since we are primarily interested in typable terms, it is proﬁtable to have a
kind of method to establish whether a term t ∈ ΛT is indeed typable and, if
so, to compute a type for t. How this method works (in principle) has already
been exempliﬁed in the previous section. Now we give a set of formal rules
which enable us to see whether a judgement Γ  M : σ is derivable, that is,
whether M has type σ in context Γ.
The rules given below form a so-called derivation system: each rule explains40 Simply typed lambda calculus
how certain judgements can be formally established. Each of the three deriva-
tion rules is in the so-called premiss–conclusion format, where a number of
premisses appear above a horizontal line, and the conclusion below.
In general, a derivation rule has the following format:
premiss 1 premiss 2 ... premiss n
conclusion
The meaning of this derivation scheme is: if we ‘know’ that premiss 1 up
to premiss n hold, then the corresponding conclusion may be drawn.
The number of premisses may be zero, in which case one only writes the
conclusion (without the horizontal line).
Remark 2.4.4 We use a diﬀerent font for these notions premiss and con-
clusion, because we wish to distinguish the technical use of these words (as
pointing at expressions in a formal derivation) from their colloquial meanings
(‘presupposition’ and ‘ﬁnal result’).
Below we give the three derivation rules for Church’s λ→, being the counter-
parts of our discussion in Section 2.2. Together, these rules form a derivation
system for Church’s λ→:
Deﬁnition 2.4.5 (Derivation rules for λ→)
(var) Γ  x : σ if x : σ ∈ Γ
(appl)
Γ  M : σ → τ Γ  N : σ
Γ  MN : τ
(abst)
Γ, x : σ  M : τ
Γ  λx : σ . M : σ → τ
The intention of these rules is universal, in the sense that they hold for
‘arbitrary’ Γ, σ, τ, x, M and N. In using these rules, we have to produce
instances of all of these, so we must provide actual specimens of Γ etcetera.
We discuss these derivation rules brieﬂy:
The (var)-rule. This rule formally expresses that each declaration which oc-
curs in the context is derivable with respect to that context. It thereby records
behind the -symbol what the type is of a variable, the simplest expression
in λ-calculus. This only applies to a variable that is already a subject in the
context; its type is copied from that context.
The rule has no premisses, but only contains a conclusion, so it can be
used as the start of a derivation.
The (appl)-rule. This rule concerns the typing of an application. It has two
premisses and one conclusion.2.4 Derivation rules for Church’s λ→ 41
The rule establishes what we have seen before: if M has function type σ → τ
with respect to a certain context Γ, and N has type σ with respect to the
same context Γ, then the application MN has type τ (with respect to the
same Γ). Note that this means that the conditions on application, mentioned
in Remark 2.2.5, have been satisﬁed.
The (abst)-rule. This rule enables us to type an abstraction. It has one
premiss and one conclusion.
In the premiss, we have the context Γ, x : σ. This is a notation for the list Γ
concatenated with x : σ, so for context Γ extended with one more declaration.
The rule now establishes that, if M has type τ with respect to the extended
context, then λx : σ . M has type σ → τ with respect to Γ only.
The contents of this rule have already been explained in the previous sec-
tions. The only diﬃculty lies in the context, which becomes smaller from
premiss to conclusion. What is the motivation for this? First note that in
the term λx : σ . M, variable x may occur free in M, since the term expresses
a function ‘mapping x to M’. So, if we look at a stand-alone M, as we do in
the premiss, then we need type information concerning such an x. Therefore,
we register its type (viz. σ) in the context.
On the other hand, this typing of x is no longer necessary in the conclusion:
x has become a bound variable in λx : σ . M, and gets its type within that
term.
We give an example of a so-called derivation, built with the aid of Deﬁni-
tion 2.4.5.
Example 2.4.6
(i) y : α → β, z : α  y : α → β (ii) y : α → β, z : α  z : α
(iii) y : α → β, z : α  y z : β
(iv) y : α → β  λz : α. y z : α → β
(v) ∅  λy : α → β . λz : α. y z : (α → β) → α → β
This derivation has been constructed as follows:
− First, a double use of the (var)-rule gives us (i) and (ii),
− then (iii) is obtained from (i) and (ii) by the (appl)-rule,
− and (iv) results from (iii) by the (abst)-rule;
− ﬁnally, we get (v) from (iv), again by the (abst)-rule.
The ﬁnal result of the derivation in the above example can be found in the
bottom line: (v). It says that in the empty context, λy : α → β . λz : α. y z has42 Simply typed lambda calculus
type (α → β) → α → β. The derivation, exactly following the rules, thereby
not only serves to construct judgement (v), but also to justify it.
Note that we may stop a certain derivation at an earlier point, or extend
it to a later stage. For example, when restricting the example derivation to
judgements (i) to (iv), we obtain a justifying construction of (iv).
Remark 2.4.7 Derivation rules like the ones given in Deﬁnition 2.4.5 can
be read in two directions: either from top to bottom or from bottom to top.
From top to bottom: when we are in a situation covered by the premisses, then
we may derive the conclusion as a result. This makes it possible to extend
our knowledge step by step, as demonstrated in Example 2.4.6. This reading
also emphasises that the derivation rules give an inductive deﬁnition of the set
of derivable judgements.
From bottom to top: the rules can also be used as a guide to obtain some goal.
For example, the (appl)-rule gives a guideline on how to ﬁnd a type for an
application MN, namely: try to ﬁnd types for M and N, and see whether they
match. The (abst)-rule tells us how to type an abstraction λx : σ . M, namely
by trying to type M, with respect to the same context extended with x : σ.
There exists a strong parallel between Deﬁnition 2.4.1 of pre-typed λ-terms
and Deﬁnition 2.4.5 of the derivation system: there are three kinds of terms
(variables, applications and abstractions), and for each of these kinds of terms
there is a corresponding derivation rule (one for deriving the type of a variable,
one for the type of an application and one for the type of an abstraction).
It is worthwhile to compare the (appl)- and (abst)-rules in the derivation
system of Deﬁnition 2.4.5 with well-known situations in mathematics and logic,
as we do in the following two examples.
Example 2.4.8 Mathematics:
Read A → B as the set of all functions from A to B. Then we have:
(func-appl):
If f is a member of A → B and c ∈ A,
then f(c) ∈ B
and
(func-abst):
If for arbitrary x ∈ A it holds that f(x) ∈ B,
then f is a member of A → B.
Note the similarities between these rules and the (appl)- and (abst)-rules
of Church’s λ→. The correspondence becomes even more striking if we recall
that the function f in the conclusion of (func-abst) can also be written as
λx ∈ A. f(x).
The context Γ of Deﬁnition 2.4.5 is empty here, but for the premiss of
(func-abst): the ‘arbitrary’ x ∈ A mentioned there stands for Γ ≡ x : A.2.4 Derivation rules for Church’s λ→ 43
Example 2.4.9 Logic:
Now read A → B as the implication A ⇒ B, which is ‘A implies B’. So we
‘identify’ the function arrow → with the implication connective ⇒, a basic
symbol in logic.
In order to get a clear view on the logic behind the implication symbol, we
refer to a formal system very appropriate for our purposes, namely that of
natural deduction. In this system the ‘natural’ treatment of logical symbols,
e.g. in mathematics, has been condensed. In the present book we often come
back to natural deduction.
(For readers not acquainted with natural deduction as a logical system, we
refer to van Dalen, 1994, or Pelletier, 1999.)
There are two standard rules for ⇒ in natural deduction. The ﬁrst rule is
called the elimination rule for ⇒, the second one the introduction rule for ⇒:
(⇒-elim)
A ⇒ B A
B
Assume : A
. . .
B
(⇒-intro)
A ⇒ B
The (⇒-elim)-rule is also known under the name Modus Ponens. It is the
rule to ‘eliminate’ an ⇒. It expresses how to use an implication: if A ⇒ B
holds and A holds as well, then B is a legitimate conclusion.
The (⇒-intro)-rule gives a scheme suitable to ‘introduce’ an ⇒, so to obtain
an implication. This scheme formalises the following intuitive proof procedure:
start with the assumption that A holds and then try to show that B holds. If
we succeed (by ﬁlling the vertical dots with an appropriate argument), then
we have shown that A implies B altogether – so we can conclude A ⇒ B.
Again, note the similarities with Deﬁnition 2.4.5 (in particular when iden-
tifying ⇒ and →). The context extension with x : σ in the premiss of the
(abst)-rule corresponds to the addition of a so-called ‘ﬂag’ in the premiss of
(⇒-intro). Such a ﬂag marks an assumption, in this case of the proposition A.
The ‘ﬂag pole’ delimits the scope of the assumption.
Terms which are typable by the aid of a derivation system are called legal.
Deﬁnition 2.4.10 (Legal λ→-terms)
A pre-typed term M in λ→ is called legal if there exist context Γ and type ρ
such that Γ  M : ρ.
For example, entry (v) in the λ→-derivation given in Example 2.4.6, shows44 Simply typed lambda calculus
that the following term is legal: λy : α → β . λz : α. y z, since there exist a
context Γ and a type ρ such that
Γ  λy : α → β . λz : α. y z : ρ.
## 2.5 Diﬀerent formats for a derivation in λ→
A derivation that naturally follows the derivation rules has a tree format. See
again the derivation given in Example 2.4.6. Its structure corresponds to the
tree depicted in Figure 2.1.
(i) (var) (ii) (var)
(iii) (appl)
(iv) (abst)
(v) (abst)
s s
s
s
s
@
@
@
Figure 2.1 The tree structure of the derivation in Example 2.4.6
Such a tree format gives a good picture of the buildup of a derivation, but in
more complicated cases a tree tends to spread out over the page, especially with
longer judgements, and thereby this format loses its attraction. Another thing
is that a more complex tree has many ramiﬁcations, and it may be diﬃcult
for a reader to get a good picture of how the separate construction steps have
contributed to the ﬁnal result.
This kind of inconvenience can be partly solved by imposing a linear order
on the derivation steps, thus presenting the judgements one by one, as the lines
in a book. Note that we already suggested an order in Example 2.4.6, since we
numbered the judgements as (i) to (v).
The same derivation in linear format may look as the following list of judge-
ments:
(i) y : α → β, z : α  y : α → β (var)
(ii) y : α → β, z : α  z : α (var)
(iii) y : α → β, z : α  y z : β (appl) on (i) and (ii)
(iv) y : α → β  λz : α. y z : α → β (abst) on (iii)
(v) ∅  λy : α → β . λz : α. y z : (α → β) → α → β (abst) on (iv)
The original tree structure being lost, we add an extra column with infor-
mation about the construction process, giving the names of the rules and the2.5 Diﬀerent formats for a derivation in λ→ 45
numbers of the judgements involved. Note that the order in this list of judge-
ments is not completely ﬁxed. Taking it that a judgement J should follow
all judgements used for its derivation, we see that (v) must follow (iv), which
must follow (iii), which must follow both (i) and (ii). But the order of (i) and
(ii) may be interchanged, without eﬀect on the full derivation.
These dependencies between judgements in a derivation can be characterised
as being a strict partial order. That is to say: it is irreﬂexive (no judgement J
precedes itself), asymmetric (if one precedes another, then not the other way
round) and transitive (if Jk precedes Jl and Jl precedes Jm, then Jk precedes
Jm). This can easily be seen.
For a visualisation of such an order one often appeals to a kind of diagram,
as has been drawn for example in Figure 2.1.
In the derivation above, either in tree format (Example 2.4.6) or in linear
format, we observe many duplications of the declarations in the contexts, to
the left of the -separators. Such duplications become annoying in more com-
plex derivations. In order to prevent this, we present an alternative format for
linear derivations, called the ﬂag notation. In this notation, one displays each
declaration in a ‘ﬂag’ (a rectangular box) and presumes that this declaration
is part of the context for all statements behind the attached ﬂag pole.
We illustrate this ﬂag format of a derivation by rewriting the same example
as above in ﬂag notation:
(a) y : α → β
(b) z : α
(1) y : α → β (var) on (a)
(2) z : α (var) on (b)
(3) y z : β (appl) on (1) and (2)
(4) λz : α. y z : α → β (abst) on (3)
(5) λy : α → β . λz : α. y z : (α → β) → α → β (abst) on (4)
The correspondence between the linear and the ﬂag-style display of the
derivation will be obvious:
(i) ↔ (a), (b)  (1)
(ii) ↔ (a), (b)  (2)
(iii) ↔ (a), (b)  (3)
(iv) ↔ (a)  (4)
(v) ↔ ∅  (5)
In what follows, we will allow a further shortening of a derivation by permit-46 Simply typed lambda calculus
ting that the (var)-rule may be silently executed. With this convention, the
above ﬂag derivation changes into the following shorter form:
(a) y : α → β
(b) z : α
(1) y z : β (appl) on (a) and (b)
(2) λz : α. y z : α → β (abst) on (1)
(3) λy : α → β . λz : α. y : (α → β) → α → β (abst) on (2)
As the above examples suggest, the linear format, and particularly the ﬂag
format, are convenient manners of depicting derivations. This will become still
more apparent when we add deﬁnitions to typed lambda calculus, as we do from
Chapter 9 onwards. The ﬂag format enables a writer to develop a derivation
step by step, and a reader to follow it in the speciﬁc order in which it has been
presented. Such a linear format corresponds to the natural way of knowledge
representation, as one ﬁnds, for example, in mathematics books: the accepted
style is to unfold the contents stepwise, line by line.
Since the ﬂags make a linear derivation considerably more perspicuous, we
shall mostly use the ﬂag format in the text to come for the representation of
derivations.
## 2.6 Kinds of problems to be solved in type theory
In general, there are three kinds of problems connected with judgements in
type theory:
(1) Well-typedness (also called Typability).
This problem will be posed in Section 2.7, which starts with a question of
the following form:
?  term : ?,
namely: ﬁnd out whether a term is legal. To be precise, the task is to ﬁnd an
appropriate context and type if the term is indeed legal, and if not so, to show
where it goes wrong.
(1a) A variant of this is Type Assignment, where the context is given as well,
so that only the type has to be found:
context  term : ?.2.7 Well-typedness in λ→ 47
(2) Type Checking.
In Section 2.8 we give an example of how to check whether
context
?
 term : type,
where ‘context’, ‘term’ and ‘type’ are given. The task is hence merely to check
that a certain term has a certain type (relative to a certain context).
(3) Term Finding (also called Term Construction or Inhabitation).
There exists another important problem in this ﬁeld, namely:
context  ? : type.
Thus, given a context and a type, ﬁnd out whether a term exists with that
type, corresponding to that speciﬁc context. A problem of this kind can be
found in Section 2.9.
A particular case of Term Finding occurs when context ≡ ∅, so the problem
boils down to:
∅  ? : type.
An example of this problem can be found in the logic of natural deduction
that we have mentioned in Example 2.4.9: the existence of a term of type σ in
the empty context turns out to be equivalent to the provability of σ. We shall
discuss this in Section 2.9.
We note that all of these problems are decidable in λ→, i.e. for each of these
questions there is an algorithm that produces the answer, for given input in
the form of ‘context’, ‘term’ and/or ‘type’.
In more complicated systems, however, such as the ones we develop in the
chapters to come, Term Finding is the real problem. It is undecidable in many
cases. That is to say, there is no general method (or algorithm) to ﬁnd out
whether a term of the desired type exists, and if so, what this term is. We
come back to this later.
## 2.7 Well-typedness in λ→
We have seen in Sections 2.4 and 2.5 that, given a derivation, it is a simple
task to check its correctness.
If, however, the derivation has not been given, how should we try to ﬁnd one?
In this case, the derivation rules show the way, to some extent. We demonstrate
this with the same example of Section 2.5, using the ﬂag notation for displaying
the context. At the same time, this is a good example of the Well-typedness
problem.48 Simply typed lambda calculus
So, let’s start all over again. We want to show that the following λ-term M
is legal: M ≡ λy : α → β . λz : α. y z. Hence, our task is to ﬁnd a context Γ
and a type ρ such that Γ  M : ρ.
First about the context Γ. It is a reasonable conjecture that Γ ≡ ∅ suﬃces,
since a context is intended to give the types of the free variables in a λ-term,
and there are no free variables in M. So all that’s left is to ﬁnd ρ. We can
display this task as follows:
(n) λy : α → β . λz : α. y z : ?
Now we browse through the three derivation rules of λ→ in order to ﬁnd
a match. Obviously, only the (abst)-rule may be of help, since it is the only
one to deliver an abstraction term in the conclusion. Looking at the premiss
of (abst), we see that we can ﬁnd a type for M if we can ﬁnd a type for
λz : α. y z, in a context extended with the declaration y : α → β. Hence, our
new task is:
(a) y : α → β
. . .
(m) λz : α. y z : ?
(n) λy : α → β . λz : α. y z : ... (abst) on (m)
Our new goal is the type ? in line (m). If that goal is solved, then this also
solves the ‘old’ goal in line (n), by a simple use of the (abst)-rule.
So we have to ﬁnd a type for λz : α. y z. Again, the main symbol is a λ, so
we repeat the above procedure and we get:
(a) y : α → β
(b) z : α
. . .
(l) y z : ?
(m) λz : α. y z : ... (abst) on (l)
(n) λy : α → β . λz : α. y z : ... (abst) on (m)
The new term to be typed is y z. This is an application term, so only
(appl) can help us further: it is the only rule with an application term in
the conclusion.
Since (appl) has two premisses, we now obtain two new goals:2.7 Well-typedness in λ→ 49
(a) y : α → β
(b) z : α
. . .
(k1) y : ?1
. . .
(k2) z : ?2
(l) y z : ... (appl) on (k1) and (k2)
(m) λz : α. y z : ... (abst) on (l)
(n) λy : α → β . λz : α. y z : ... (abst) on (m)
Now we are at the heart of our expedition: the terms corresponding to the
new goals are y and z, respectively. They are simple variables, and in that case
the (var)-rule is the only candidate for a match. And indeed, both ?1 and ?2
can easily be solved by means of the (var)-rule, as we have demonstrated in
the ﬁrst ﬂag derivation of Section 2.5.
The rest is routine: we ﬁnd β for the type of term y z in line (l), since the
side conditions of (appl) are satisﬁed, and we easily deduce the other types.
Also here, an alternative is to skip lines k1 and k2, and to use (appl) directly
on ﬂags (a) and (b), as in the shortened ﬂag derivation at the end of Section 2.5.
Remark 2.7.1 The type α of z matches with the left-hand side of the type of
y. If this were not the case, then our attempt at ﬁnding a type for y z in line (l)
would have failed. For example, if the type of z had been β instead of α, then
there was no match.
Hence, if we had started with the term λy : α → β . λz : β . y z , then at
this point we would have come to the conclusion that a derivation of a type is
impossible: the conclusion of the Well-typedness problem is that the term has
no type.
Our ﬁnal conclusion is that we have succeeded in ﬁnding a derivation which
shows that λy : α → β . λz : α. y z is legal. Note that – but for the renumbering
of the line-labels (k1) up to (n) – we have obtained exactly the same derivation
as the one in Section 2.5.
Remark 2.7.2 In general, diﬀerent derivations exist for showing that a par-
ticular term is legal. For example, we can take any Γ as a start of the above
derivation, instead of Γ ≡ ∅. Moreover, lines (k1) and (k2) may be inter-
changed, as can easily be seen. There are many other reasons why derivations
for the legality of a given term may vary, such as repetitions and detours, but
also more essential diﬀerences may occur between derivations of the same term.50 Simply typed lambda calculus
## 2.8 Type Checking in λ→
We continue with an example concerning the second kind of problem sketched
in Section 2.6: Type Checking, i.e. checking the validity of a full judgement.
In order to illustrate this matter, we construct a derivation for the judgement
we gave at the end of Section 2.3:
x : α → α, y : (α → α) → β  (λz : β . λu : γ . z)(y x) : γ → β .
So our goal is now to ﬁll the dots in:
(a) x : α → α
(b) y : (α → α) → β
. . .
(n) (λz : β . λu : γ . z)(y x) : γ → β
Since the term (λz : β . λu : γ . z)(y x) is an application term, we use the
(appl)-rule:
(a) x : α → α
(b) y : (α → α) → β
. . .
(m1) λz : β . λu : γ . z : ?1
. . .
(m2) y x : ?2
(n) (λz : β . λu : γ . z)(y x) : γ → β (appl) on (m1) and (m2), (?)
Since use of the (appl)-rule is only allowed when the corresponding types
match, we add a reminder (?) in the last line: at this moment we cannot yet
check the match, since ?1 and ?2 are still unknown.
Now the ﬁnal goal ?2 is easily solvable by using (var) twice, followed by
(appl). Note that the types of y and x match as required. What remains is:
(a) x : α → α
(b) y : (α → α) → β
. . .
(m1) λz : β . λu : γ . z : ?2.9 Term Finding in λ→ 51
The goal in line (m1) is easily solved by twice using the (abst)-rule, each for
one of the λs in the term. This leads to the following complete derivation in
the shortened version:
(a) x : α → α
(b) y : (α → α) → β
(c) z : β
(d) u : γ
(1) z : β (var) on (c)
(2) λu : γ . z : γ → β (abst) on (1)
(m1) λz : β . λu : γ . z : β → γ → β (abst) on (2)
(m2) y x : β (appl) on (b) and (a)
(n) (λz : β . λu : γ . z)(y x) : γ → β (appl) on (m1) and (m2) (?)
We have suppressed the non-essential uses of the (var)-rule (see line (m2)),
but we cannot suppress the mentioning of (var) in line (1), since we need that
line for obtaining line (2).
So all that’s left is our ‘hanging’ task to check the conditions on (appl) in
line (n), but these are clearly satisﬁed.
Hence we have succeeded in giving a proper derivation of the judgement of
Section 2.3.
Remark 2.8.1 In Remark 2.3.3 we noticed that
(λz : β . λu : γ . z)(y x) →β λu : γ . y x.
It is easy to establish that the latter term also has the type γ → β, in the
same context for x and y as above.
## 2.9 Term Finding in λ→
A ﬁnal example in the present chapter concerns the third of the general prob-
lems in type theory mentioned in Section 2.6, namely Term Finding: ﬁnd an
appropriate term of a certain type, in a certain context.
A term which belongs to a certain type, is called an inhabitant of that
type: one sees the type as a ‘house’ (or a city) which may (or may not) give
accommodation to terms/residents.
Hence, the problem here is to ﬁnd an inhabitant of a given type. We start
with an empty context and explore the situation in which the type is an ex-
pression from logic: a proposition. Surprisingly, every inhabitant then codes a52 Simply typed lambda calculus
proof of this proposition, hence declaring it to be a ‘true’ one. We demonstrate
this below.
As logical expression, we take A → B → A, where → should be read as
‘implication’. This proposition is a tautology, which is to say that it holds as
a general fact in logic. In this simple case our intuition immediately delivers a
‘proof’ of this, viz: assume that A holds and assume then that also B holds,
then A of course still holds; hence we conclude: if A, then (if B then A).
Let’s formalise this proof in λ→. So we take A → B → A as a type and try
to ﬁnd an inhabitant in the empty context:
(n) ? : A → B → A
Our goal is to ﬁnd a term of an →-type, so the (abst)-rule of our derivation
system (Deﬁnition 2.4.5) is obviously a ﬁrst try. This gives (check it yourself):
(a) x : A
. . .
(m) ? : B → A
(n) ... : A → B → A (abst) on (m)
The variable x in line (a) is a consequence of using the (abst)-rule.
Again, our goal concerns an →-type, so we repeat the procedure. (Note that
we take a new variable (y) here, as Deﬁnition 2.4.2(3) requires.)
(a) x : A
(b) y : B
. . .
(l) ? : A
(m) ... : B → A (abst) on (l)
(n) ... : A → B → A (abst) on (m)
Clearly, the goal ? can be solved by the x in line (a) and we obtain:
(a) x : A
(b) y : B
(1) x : A (var) on (a)
(2) λy : B . x : B → A (abst) on (1)
(3) λx : A. λy : B . x : A → B → A (abst) on (2)2.10 General properties of λ→ 53
Thus we have ﬁnished the job.
Finally, we express this derivation in words, considering propositions as types
and inhabitants of propositions as proofs, as mentioned above:
(a) Assume that x is a proof of proposition A.
(b) Also assume that y is a proof of proposition B.
(1) Then x is (still) a proof of A.
(2) So the function mapping y to x sends a proof of B to a proof of A,
i.e. λy : B . x proves the implication B → A.
(3) Consequently, λx : A. λy : B . x proves A → B → A.
So we deal with an interpretation of proofs and logical expressions that
works. It is generally called the PAT-interpretation, where ‘PAT’ means both
‘propositions-as-types’ and ‘proofs-as-terms’. We will come back at length on
this important idea in Section 5.4; see also Remark 5.1.1.
Remark 2.9.1 When wishing to capture the derivation above, it suﬃces to
store the ﬁnal term λx : A. λy : B . x only, because the full derivation can
easily be reconstructed from this term. It is a complete ‘coding’ of the proof,
and even more than that: the term implicitly includes the proposition it proves,
since this is its type, being computable by the decidability of Well-typedness.
Remark 2.9.2 In Well-typedness and Type Checking, the development of the
complete derivation roughly follows a pattern as illustrated in the left part of
Figure 2.2: starting with a term (positioned on the lower left-hand side of the
picture), one successively replaces it by simpler terms (upwards) until it can be
typed (at the top of the picture); then the other types are calculated (downwards)
until ﬁnally the type of the original term has been derived (on the place of the
arrow head). See the examples in Sections 2.7 and 2.8 for derivations following
this construction scheme.
In Term Finding, on the other hand, the pattern is as in the right part of
Figure 2.2. Here one starts with a type, replaces it by simpler types until one
ﬁnds a term inhabiting such a type, and then terms are constructed correspond-
ing to the types, until one obtains a term which inhabits the original type. See
the example in the present section for a derivation construction that follows
this scheme.
## 2.10 General properties of λ→
In this section we list a number of properties of Church’s λ→ and explain their
contents and importance. We do not give all the proofs of the lemmas; for the
missing ones, we refer to Barendregt (1992).
First, we give a number of deﬁnitions about contexts, followed by examples.54 Simply typed lambda calculus
?
' $
:
:
:
?
' $
:
:
:
Figure 2.2 Construction schemes for typing problems
Deﬁnition 2.10.1 (Domain,dom, subcontext,⊆, permutation, projection, )
(1) If Γ ≡ x1 : σ1,...,xn : σn, then the domain of Γ or dom(Γ) is the list
(x1,...,xn).
(2) Context Γ is a subcontext of context Γ, or Γ ⊆ Γ, if all declarations
occurring in Γ also occur in Γ, in the same order.
(3) Context Γ is a permutation of context Γ, if all declarations in Γ also occur
in Γ, and vice versa.
(4) If Γ is a context and Φ a set of variables, then the projection of Γ on Φ, or
Γ  Φ, is the subcontext Γ of Γ with dom(Γ) = dom(Γ) ∩ Φ.
Examples 2.10.2 Let Γ ≡ y : σ, x1 : ρ1, x2 : ρ2, z : τ, x3 : ρ3.
(1) dom(∅) = (), the empty list; dom(Γ) = (y,x1,x2,z,x3).
(2) ∅ ⊆ (x1 : ρ1, z : τ) ⊆ Γ.
(3) x2 : ρ2, x1 : ρ1, z : τ, x3 : ρ3, y : σ is a permutation of Γ.
(4) Γ  {z,u,x1} = x1 : ρ1, z : τ.
An important property of λ→ is the following, concerning the free variables
occurring in a judgement:
Lemma 2.10.3 (Free Variables Lemma)
If Γ  L : σ, then FV (L) ⊆ dom(Γ).
As a consequence of the lemma, each free variable x that occurs in L has
a type, which is recorded in a declaration x : σ occurring in the context Γ.
Therefore, in a judgement, there can be no confusion about the type of any
variable whatsoever, since also bound variables get their type, namely upon
introduction, behind the binding λ.
We now try to prove this lemma. The question is, of course, how to do this,
so ﬁrst we concentrate on the proof method. We have to show something for
an arbitrary judgement Γ  L : σ (namely that all free variables of L occur
in dom(Γ)). What can we say about this judgement? Not very much, since it
is ‘arbitrary’. However, if it is a proper judgement, then by deﬁnition it must
be derivable, so there must exist a derivation with this judgement as the ﬁnal2.10 General properties of λ→ 55
conclusion. Derivations (as many notions in this ﬁeld) are inductively deﬁned,
so our conjecture is that the proof of the lemma also needs induction.
The kind of induction that we use here is called structural induction. The
principle is as follows. An inductive deﬁnition describes how to construct the
expressions. So, to prove a general property P for an arbitrary expression E
we can proceed by:
− assuming that P holds for all expressions E used to construct E (this is
called the induction hypothesis),
− and then proving that P also holds for E itself.
We apply this proof method to the lemma:
Proof of Lemma 2.10.3 The proof is by induction on the derivation of the
judgement J ≡ Γ  L : σ, so we suppose that J is the ﬁnal conclusion of a
derivation and we assume that the content of the lemma already holds for the
premisses that have been used to derive the conclusion.
By Deﬁnition 2.4.5, there are three possible cases: the ﬁnal step to establish
that J holds has been (1) the (var)-rule, or (2) the (appl)-rule, or (3) the
(abst)-rule.
− Case (1): J is the conclusion of the (var)-rule.
Then J has the form Γ  x : σ and this follows from x : σ ∈ Γ. Now the L
mentioned in the lemma is x and we have to prove that FV (x) ⊆ dom(Γ).
But this is an immediate consequence of x : σ ∈ Γ.
(Note: the (var)-rule has no premisses, so there is no induction hypothesis
about ‘previously constructed’ judgements.)
− Case (2): J is the conclusion of the (appl)-rule.
Then J must have the form Γ  MN : τ and we have to prove that
FV (MN) ∈ dom(Γ).
By induction, the lemma already holds for the premisses of the (appl)-
rule, which are: Γ  M : σ → τ and Γ  N : σ. Hence we may as-
sume FV (M) ⊆ dom(Γ) and FV (N) ⊆ dom(Γ). Since by Deﬁnition 1.4.1,
FV (MN) = FV (M) ∪ FV (N), it follows that FV (MN) ⊆ dom(Γ).
− Case (3): J is the conclusion of the (abst)-rule.
Then J must have the form Γ  λx : σ . M : σ → τ and we have to prove
that FV (λx : σ . M) ⊆ dom(Γ).
By induction, the lemma already holds for the premiss Γ, x : σ  M : τ,
so FV (M) ⊆ dom(Γ) ∪ {x} (∗). Now FV (λx : σ . M) = FV (M)\{x} (again
by Deﬁnition 1.4.1), and by (∗) we have: FV (M)\{x} ⊆ dom(Γ).
Remark 2.10.4 A proof by induction apparently works backwards: in order
to show a property of some expression, we appeal to previously constructed
expressions. However, convince yourself that induction ultimately amounts to56 Simply typed lambda calculus
a forward process: imagine yourself an arbitrary derivation, then the property
P can be thought of as being passed on from top to bottom, in parallel with
the usage of the derivation rules. In every step, property P is ‘handed over’
from premiss(es) to conclusion. (If there is no premiss at all, then induction
amounts to showing that the property holds ‘immediately’; cf. the above proof,
case (1).)
We continue with three other properties of λ→.
Lemma 2.10.5 (Thinning, Condensing, Permutation)
(1) (Thinning) Let Γ and Γ be contexts such that Γ ⊆ Γ. If Γ  M : σ,
then also Γ  M : σ.
(2) (Condensing) If Γ  M : σ, then also Γ  FV (M)  M : σ.
(3) (Permutation) If Γ  M : σ, and Γ is a permutation of Γ, then Γ is
also a context and moreover, Γ  M : σ.
We shall discuss these properties ﬁrst, and then consider their proofs.
− The ‘thinning’ of a context is an extension of it obtained by adding extra
declarations with ‘new’ subject variables. (So ‘being thinner’ is the con-
verse of ‘being a subcontext’ – see Deﬁnition 2.10(2).) Now the Thinning
Lemma 2.10.5(1) says: if M has type σ in some context Γ, then M also has
type σ in a ‘thinner’ context Γ.
This is intuitively acceptable: Γ already contains all the necessary type
information for the free variables in M (otherwise Γ  M : σ could not
have been derived; see also Theorem 2.10.3). But all this type information
is of course unaﬀected by thinning of the context, since then one merely
adds some declarations of new, and hence ‘non-essential’, variables, but no
declaration is removed or changed.
− On the other hand, the Condensing Lemma 2.10.5(2) tells us that we may
remove declarations x : ρ from Γ for those x’s which do not occur free in M,
thus keeping only those declarations which are relevant for M.
− One could rephrase these two properties in a popular style as follows: ‘One
may either add or remove junk to/from a context, without aﬀecting deriv-
ability’, where ‘junk’ consists of declarations of variables which do not occur
free in the term M. (Such variables play no role in the typing process.)
− Finally, the Permutation Lemma tells us that it is not important how the
context is ordered. This is intuitively clear. Firstly, declarations are only
used to store information about types of free variables; the order of these
declarations is therefore irrelevant. Secondly, declarations in a context are
mutually independent, so there is also no technical reason why they cannot
be permuted.2.10 General properties of λ→ 57
Remark 2.10.6 One can also deﬁne a context as a set – not a list: this is the
usual approach in λ→. Such set-contexts are called bases (see e.g. Barendregt,
1992). We prefer (ordered) contexts over (unordered) bases, because richer sys-
tems – to be discussed in later sections – have dependent declarations, so there
the order is important.
We give an idea of the proofs of Lemma 2.10.5(1) and (2) by consider-
ing some interesting cases. (For more complete proofs, see Barendregt, 1992,
Proposition 3.2.7 or 3.1.7.) For Lemma 2.10.5(3), we only give a hint.
Proof of Lemma 2.10.5
(1) We use induction on the derivation of the judgement J ≡ Γ  M : σ,
assuming that Γ ⊆ Γ, with Γ another context. Again, there are three cases
to consider: J has been constructed with the (var)-, (appl)- or (abst)-rule. We
only treat the last case:
− Case (3): J is the conclusion of the (abst)-rule.
Then J must have the form Γ  λx : ρ. L : ρ → τ. We have to prove that
Γ  λx : ρ. L : ρ → τ. (We assume that x ∈ dom(Γ); otherwise, rename x
in λx : ρ. L.)
Now Γ, x : ρ  L : τ must have been the premiss in the construction of
J, so by induction we have:
(∗): Thinning already holds for Γ, x : ρ  L : τ.
Since x ∈ dom(Γ), it follows that Γ, x : ρ is a correct context and also
Γ, x : ρ ⊆ Γ, x : ρ. From the induction hypothesis (∗) it follows that
Γ, x : ρ  L : τ. From this, the (abst)-rule gives as conclusion that also
Γ  λx : ρ. L : ρ → τ.
(2) Again, we use induction, this time on the construction of J ≡ Γ  M : σ.
We only treat the (appl)-case:
− Case (2): J is the conclusion of the (appl)-rule.
Then J has the form Γ  LN : τ. To prove: Γ  FV (LN)  LN : τ.
By induction, the lemma already holds for the premisses Γ  L : ρ → τ
and Γ  N : ρ, so we know that Γ  FV (L)  L : ρ → τ (∗) and
Γ  FV (N)  N : ρ (∗∗). Note that Γ  FV (LN) is indeed a context.
So by part (1) (the Thinning Lemma), since both FV (L) ⊆ FV (LN) and
FV (N) ⊆ FV (LN), we obtain Γ  FV (LN)  L : ρ → τ from (∗) and
Γ  FV (LN)  N : ρ from (∗∗). Using the (appl)-rule, we get from this
Γ  FV (LN)  LN : τ.
(3) By induction on the derivation of Γ  M : σ. (Try this yourself.)
In the following lemma, we establish that every derivation can be ‘traced
back’ to the previous stage. That is to say, the legality of a variable, an appli-
cation or an abstraction, can only follow from the (var)-rule, the (appl)-rule58 Simply typed lambda calculus
or the (abst)-rule, respectively. (One also says that derivations are syntax-
directed: for each judgement there is only one rule possible for establishing
that judgement as a conclusion, so the syntax of the term is a distinguishing
factor in the construction of judgements.)
The lemma is called the Generation Lemma, since it says precisely how a
certain judgement can be ‘generated’.
Lemma 2.10.7 (Generation Lemma)
(1) If Γ  x : σ, then x : σ ∈ Γ.
(2) If Γ  MN : τ, then there is a type σ such that Γ  M : σ → τ and
Γ  N : σ.
(3) If Γ  λx : σ . M : ρ, then there is τ such that Γ, x : σ  M : τ and
ρ ≡ σ → τ.
Proof Inspection of the derivation rules for Church’s λ→ as given in Deﬁni-
tion 2.4.5, shows that there are no other possibilities than the ones stated in
this lemma.
Legal terms were deﬁned as the typable ones (see Deﬁnition 2.4.10). So legal
terms are the well-behaving constructs in λ→-land. The following lemma ex-
presses that all subterms of a well-behaving term are well-behaving as well.
Here the notion ‘subterm’ is deﬁned as in the untyped λ-calculus (Deﬁni-
tion 1.3.5), reading λx : σ . M instead of λx. M.
Lemma 2.10.8 (Subterm Lemma) If M is legal, then every subterm of M
is legal.
(Given as Proposition 3.2.9 (see also 3.1.9) in Barendregt, 1992.)
Proof Exercise 2.16.
So if there are Γ1 and σ1 such that Γ1  M : σ1, and if L is a subterm of M,
then there are Γ2 and σ2 such that Γ2  L : σ2.
As an example, take the following judgement, derived in Section 2.8:
x : α → α, y : (α → α) → β  (λz : β . λu : γ . z)(y x) : γ → β .
Hence, M ≡ (λz : β . λu : γ . z)(y x) is legal.
(1) A subterm of M is λu : γ . z. According to the Subterm Lemma, this
term should be legal, as well. And indeed, as we showed in Section 2.8 (see
line (2) in the last diagram of that section):
x : α → α, y : (α → α) → β, z : β  λu : γ . z : γ → β .
A simpler answer is, for arbitrary type δ:
z : δ  λu : γ . z : γ → δ .2.11 Reduction and λ→ 59
(2) Another subterm of M is y x. This term is legal, as shown in Section 2.8:
x : α → α, y : (α → α) → β  y x : β ,
or, shorter yet:
x : α, y : α → β  y x : β .
To conclude this section, we mention the following important property of
Church’s λ→ which expresses that, given a context, a term may have at most
one type. Therefore, the type, if existing, is ‘unique’. (This property does not
hold for systems with typing à la Curry, as we noticed in Examples 2.3.1(2).
See also Barendregt, 1992, p.159.)
Lemma 2.10.9 (Uniqueness of Types) Assume Γ  M : σ and Γ  M : τ.
Then σ ≡ τ.
Proof By induction on the construction of M (Exercise 2.17).
Finally, we repeat what we already noted in Section 2.6:
Theorem 2.10.10 (Decidability of Well-typedness, Type Assignment, Type
Checking and Term Finding) In λ→, the following problems are decidable:
(1) Well-typedness: ?  term : ? .
(1a) Type Assignment: context  term : ? .
(2) Type Checking: context
?
 term : type .
(3) Term Finding: context  ? : type .
Proofs can be found in Barendregt, 1992, Propositions 4.4.11 and 4.4.12.
## 2.11 Reduction and λ→
In this section we examine the behaviour of λ→ with regards to β-reduction.
First we look at substitution, an operation at the heart of β-reduction.
In order to be able to treat substitution in λ →, we have to adjust the
related deﬁnition, viz. Deﬁnition 1.6.1; the only change concerns part (3), the
abstraction case, because we have to add a type to the bound variable:
(3) (λy : σ . P)[x := N] ≡ λz : σ . (Py→z[x := N]), if λz : σ . Py→z is an
α-variant of λy : σ . P such that z ∈ FV(N).
Now we have the following:
Lemma 2.11.1 (Substitution Lemma) Assume Γ, x : σ, Γ  M : τ and
Γ  N : σ. Then Γ, Γ  M[x := N] : τ.
This lemma says that if we substitute, in a legal term M, all occurrences
of context variable x by a term N of the same type as x, then the result60 Simply typed lambda calculus
M[x := N] keeps the same type as M had. This is intuitively understandable:
in order to calculate the type of M, it does not matter whether we deal with x’s,
or with N’s at the same place(s) in the expression, given that the types of x
and N are the same.
Note that the validity of the premiss Γ  N : σ, without the declaration
x : σ in the context, implies that x does not occur free in N (cf. the Free
Variable Lemma 2.10.3). That’s why the declaration x : σ has been omitted in
the ﬁnal judgement since x consequently also does not occur free in M[x := N].
Note also that x : σ is a declaration occurring somewhere in the full context
of the ﬁrst judgement: the declaration x : σ is preceded by context part Γ and
followed by context part Γ (either of these may be empty, of course). This
is not essential: due to the Permutation Lemma 2.10.5(3), we may shift x : σ
back and forth through the full context. However, if we omit the Γ, the proof
of the lemma would be more complicated, in particular the (abst)-case (see
below).
We now discuss a proof of this Substitution Lemma. We spell out some
important details, and ask the reader to complete the proof in the same vein.
Proof of Lemma 2.11.1 We use induction on the derivation of the judgement
J ≡ Γ, x : σ, Γ  M : τ. For the ﬁnal step in the derivation of J, there are
three possibilities, depending on the ‘shape’ of M: whether it is a variable, an
application or an abstraction.
We only look at the most complicated case, namely when M is an abstrac-
tion; say M ≡ λu : ρ. L. Consequently, τ must be ρ → ζ for some type ζ,
so
J ≡ Γ, x : σ, Γ  λu : ρ. L : ρ → ζ.
Then the derivation step by means of which this J has been obtained, must
have been an instance of (abst), leading
− from J ≡ Γ, x : σ, Γ, u : ρ  L : ζ
− to the J given just now.
The well-formedness of the context in J implies that u cannot be a subject
variable in Γ. Hence, since Γ  N : σ and by the Free Variables Lemma 2.10.3,
we have that u ∈ FV(N).
Induction tells us that the lemma already holds for J. (This J has an
‘extended’ Γ, compared to J, namely Γ, u : ρ.) Putting the lemma into
eﬀect on J and the supposition Γ  N : σ, we obtain:
Γ, Γ, u : ρ  L[x := N] : ζ.
Now we may employ the (abst)-rule for this judgement, yielding:
Γ, Γ  λu : ρ. (L[x := N]) : ρ → ζ,2.11 Reduction and λ→ 61
which (by what we noticed about substitution in the beginning of the present
section and since u ∈ FV(N)) is the same as
Γ, Γ  (λu : ρ. L)[x := N]) : ρ → ζ,
hence
Γ, Γ  M[x := N] : τ.
Another important lemma is concerned with β-reduction. We have deﬁned
β-reduction in an untyped setting (see Chapter 1), so we have to adjust it to the
(pre-typed) terms of ΛT. This is straightforward: all we have to do is reconsider
the Basis of one-step β-reduction (see Deﬁnition 1.8.1), since this contains a
λ-abstraction over variable x, which now gets a type. All other things remain
the same:
Deﬁnition 2.11.2 (One-step β-reduction, →β, for ΛT)
(1) (Basis) (λx : σ . M)N →β M[x := N].
(2) (Compatibility) As in Deﬁnition 1.8.1.
(Of course, in the third compatibility rule of Deﬁnition 1.8.1, we now have
to read λx : τ . M →β λx : τ . N instead of λx. M →β λx. N.)
We copy Deﬁnition 1.8.3 for zero-or-more-step reduction, β, in ΛT and
Deﬁnition 1.8.5 for conversion, =β.
Since types clearly play no role in the β-reduction process (see the (Basis)-
rule above, where σ is neglected and, moreover, it is not required that x and
N have the same type), the Church–Rosser Theorem (1.9.8) for untyped λ-
calculus is also valid in the typed version λ→:
Theorem 2.11.3 (Church–Rosser Theorem; CR; Conﬂuence) The Church–
Rosser property also holds for λ→.
It is not hard to see that Corollary 1.9.9 also still holds in λ→:
Corollary 2.11.4 Suppose that M =β N. Then there is L such that M β L
and N β L.
An important lemma about β-reduction in λ→ is the following:
Lemma 2.11.5 (Subject Reduction) If Γ  L : ρ and if L β L, then
Γ  L : ρ.
We shall discuss this lemma ﬁrst, and then prove it.
The lemma states that β-reduction does not aﬀect typability. And even more:
β-reduction of a term does not change the type of that term (and the same
context will do).
This is of course a very welcome property: β-reduction is a formalisation of62 Simply typed lambda calculus
‘calculation’, as we saw in Chapter 1. And we would not like calculations with
a term to aﬀect either the typability or the type of that term: 3+5 is a natural
number, and it remains so after evaluation to 8.
Take again the example of Section 2.8 and consider Remark 2.8.1. With
Subject Reduction, we can now immediately conclude that:
x : α → α, y : (α → α) → β  λu : γ . y x : γ → β .
(This judgement can also be established on its own, of course, by means of
a derivation, but an appeal to Subject Reduction is easier now.)
Proof of Lemma 2.11.5 We prove the case L →β L, which is L β L in
one step; the lemma then follows by induction on the number of one-step β-
reductions of L β L.
The case L →β L is proved by induction on the generation of L →β L, that
is to say: one distinguishes between the various possibilities for establishing that
L →β L, assuming that the lemma already holds for the assumptions leading
to L →β L (cf. Deﬁnition 2.11.2):
(1) Basis: L ≡ (λx : σ . M)N and L ≡ M[x := N],
(2.1) Compatibility, case 1: L ≡ MK and L ≡ MK,
(2.2) Compatibility, case 2: L ≡ KM and L ≡ KM,
(2.3) Compatibility, case 3: L ≡ λx : τ . M and L ≡ λx : τ . M.
The Basis case has no assumptions, so induction does not apply. In all three
Compatibility cases the assumption is M →β M.
We only treat the Basis case, because it is the most interesting case: we
assume that Γ  (λx : σ . M)N : ρ and prove that Γ  M[x := N] : ρ.
By the Generation Lemma 2.10.7(2), there must be a type τ such that
Γ  λx : σ . M : τ → ρ and Γ  N : τ. The ﬁrst of these two judgements
implies, by the Generation Lemma 2.10.7(3), the existence of a ϕ such that
Γ, x : σ  M : ϕ and τ → ρ ≡ σ → ϕ. Hence, τ ≡ σ and ρ ≡ ϕ. We obtain
Γ, x : σ  M : ρ and Γ  N : σ. Then by the Substitution Lemma 2.11.1:
Γ  M[x := N] : ρ.
(Do the Compatibility cases yourself: Exercise 2.18.)
Finally, one can prove that there are no inﬁnite reduction sequences in λ→,
or ‘every calculation is ﬁnite’. (See Deﬁnition 1.9.6 for the notion ‘strong nor-
malisation’.)
Theorem 2.11.6 (Strong Normalisation Theorem or Termination Theorem)
Every legal M is strongly normalising.
The proof uses a kind of measure on legal terms which is always positive,
and becomes smaller in each β-reduction step. These two facts clearly imply2.12 Consequences 63
strong normalisation. We do not give the details of the proof here (see e.g.
Geuvers & Nederpelt, 1994; see also Barendregt, 1992, Theorem 5.3.33).
Remark 2.11.7 As already mentioned in Chapter 1, strong normalisation
(or ‘termination’) always guarantees an outcome, whatever reduction path we
choose. This of course is relevant for calculations, but also for programming:
programs which do not end are undesirable. Algol 60 was one of the ﬁrst well-
structured, so-called ‘high-level’ programming languages in the history of com-
puter science, but unfortunately, termination was not guaranteed. This is un-
avoidable: every programming language of suﬃcient power has non-terminating
programs.
On the other hand, one should not overestimate strong normalisability. In-
deed, it guarantees termination within a ﬁnite amount of time, but this may
nevertheless require waiting a long time. And since there is no upper bound on
‘ﬁniteness’, one doesn’t know beforehand how long this waiting will take.
## 2.12 Consequences
In the previous two sections we listed and proved a number of important prop-
erties of λ→. These imply that all the negative aspects of untyped λ-calculus
(see Section 1.11) disappear.
We show this one by one.
(1) There is no self-application in λ→. (See also Example 2.2.6(3).)
Proof Assume that MM is a legal term in λ→. Then there are Γ and τ such
that Γ  MM : τ. From the Generation Lemma 2.10.7(2), it then follows that
there is a type σ such that (for the ﬁrst M:) Γ  M : σ → τ and (for the
second M:) Γ  M : σ. Hence, by the Uniqueness of Types Lemma 2.10.9,
σ → τ ≡ σ. But this is clearly impossible: no function type can be equal to
its own left-hand side.
(2) Existence of β-normal forms is guaranteed.
This follows directly from the Strong Normalisation Theorem 2.11.6.
(3) Not every legal λ-term has a ﬁxed point.
First note that the proof of Theorem 1.10.1 no longer works in λ→: the term
M ≡ (λx. L(xx))(λx. L(xx)) which is introduced in that proof makes heavy
use of self-application (the term itself is of the form NN, and there are also
two subterms xx).
But this is not enough to conclude that there are legal terms in ΛT without
a ﬁxed point. So, let’s give an example to show this.64 Simply typed lambda calculus
Take two diﬀerent types, σ and τ, and consider some legal function F of
type σ → τ, in some context Γ, so Γ  F : σ → τ. Now this F cannot have a
ﬁxed point within the system λ→, which we show now.
Assume that FM =β M where FM and M are legal. Then M must have
type σ (by legality of FM, Uniqueness of Types and Generation Lemma(2)).
Hence, by the (appl)-rule, FM has type τ. Now by Corollary 2.11.4, there
must be N such that FM β N and M β N, and by Subject Reduction
(twice) we obtain both Γ  N : τ and Γ  N : σ. This contradicts Uniqueness
of Types.
## 2.13 Conclusions
In this chapter we have added simple types to lambda calculus. These types
do not have much structure: starting from type variables, the only way to
construct other types is by repeatedly writing the binary →-symbol between
types. By their simplicity, they do not contain much ‘information’ about the
terms. We preferred explicit typing (à la Church) over implicit typing (à la
Curry).
The derivation system for Church’s λ→ reﬂects the structure of λ-terms in
that it has one rule for variables, one for applications and one for abstractions.
Thus it is very concise and to the point. It also conforms neatly to intuition.
We gave examples of derivations, which demonstrated the smooth behaviour
of the system-in-action.
The system λ→ satisﬁes many nice and desirable properties, in particular
concerning β-reduction. These properties also cause the drawbacks encountered
in untyped lambda calculus to be eliminated. In other words, there is no more
self-application, there are no inﬁnite reduction sequences and we no longer have
ﬁxed points for every function. And there is more: the positive points of un-
typed lambda calculus extend to the simply typed version of lambda calculus.
There is only one important drawback, which we mention here without a proof:
the system λ→ is much too weak to encapsulate all computable functions and
is hence not useable for the formalisation of mathematics.
Therefore, we have to extend λ→ to more powerful systems of typed lambda
calculus, which we shall do in the following chapters: we gradually introduce
more complex types, which are suitable for more ‘realistic’ situations, in par-
ticular for general use in logic and mathematics, as we shall show with various
examples.
Important to note is that these extensions will be without harm: the unde-
sired aspects of untyped lambda calculus will stay away.2.14 Further reading 65
## 2.14 Further reading
Historically, the British mathematician and philosopher B. Russell was the ﬁrst
to formulate a type theory. He developed this type theory (called the Ramiﬁed
Theory of Types, or RTT; see also Section 13.8) for his thorough investigations
into the foundations of mathematics. Russell did not yet employ the λ-notation.
A few decades later, A. Church presented the simply typed lambda calculus
– the subject of the present chapter – which is a simpliﬁcation of RTT, as it
removes the ramiﬁcation. Church’s goal was to deﬁne higher order logic; simple
type theory deﬁnes the language of higher order logic. Church’s paper (Church,
1940) is still very accessible.
In this chapter we have mainly discussed the explicit typing variant of simple
type theory, or typing à la Church. With explicit typing, the decidability of
typing is almost immediate: the free variables have a type in the context and
the bound variables have a type in the lambda abstraction (we write λx : σ . M
instead of just λx. M). From that information one straightforwardly computes
the (unique) type of the whole term, if it exists.
For functional programming languages, the system à la Curry, with implicit
types, is relevant. That is because, when programming, one wants to avoid
writing the types, and instead let the compiler compute a type (if the term is
typable; and return ‘fail’ if the term is not typable). For the Curry system, the
type of a term is not unique. J.R. Hindley (see Hindley, 1969, 1997), H.B. Curry
(Curry, 1969) and R. Milner (Milner, 1978) have independently developed the
principal type algorithm, that, given a closed untyped term M, computes a
type σ of M (if M is typable) and ‘fail’ if M is not typable in simple type
theory à la Curry. Moreover, the computed type σ is ‘minimal’ in the sense
that all possible types for M are substitution instances of σ. (Such a type is
called a principal type.) A more modern exposition of this algorithm is given
by M. Wand (Wand, 1987), where a type checking problem is reduced to a
uniﬁcation problem over type expressions, and then the most general uniﬁer
of J.A. Robinson’s uniﬁcation algorithm (Robinson, 1965) yields the principal
type.
Readers particularly interested in the value of types for computer science are
referred to the books of B.C. Pierce (Pierce, 2002, 2004). A good introductory
text on simple type theory for logic is Hindley (1997); another one, focusing
on computation, is Simmons (2000).
Untyped lambda calculus is Turing-complete, but the expressivity of simple
type theory is limited. It can be shown that one can encode natural numbers
as the closed terms of type (α → α) → α → α. The encoding represents
the number n as the expression λf : α → α. λx : α. f(...(f x)...) with n
times an f. These are called the (typed) Church numerals (Church, 1940).66 Simply typed lambda calculus
(See Exercise 2.2; compare this with Exercise 1.10.) On these numerals, one
can then deﬁne addition and multiplication, but that’s about it: the class of
functions deﬁnable on the Church numerals in simple type theory is the class
of generalised polynomials (Schwichtenberg, 1976).
The limited expressivity of simple type theory can be overcome by extending
the system with a ﬁxed point combinator. This has been done in the system
PCF (Plotkin, 1977), where for every type σ, a constant Yσ : (σ → σ) → σ is
added, satisfying the reduction rule Yσ f → f (Yσ f). This renders the system
Turing-complete and therefore it has been studied as the theoretical basis of
functional programming languages. It is also a good basis to study various
evaluation strategies that are known from functional programming, for example
‘call-by-value’ (to reduce (λx : σ . M)N, ﬁrst reduce N to a value) and ‘call-by-
name’ (to reduce (λx : σ . M)N, ﬁrst contract the redex itself to M[x := N]).
A non-trivial property of simple type theory is normalisation. For simple type
theory, Weak Normalisation (cf. Deﬁnition 1.9.6) was ﬁrst proved by A.M. Tur-
ing in the 1940s, but only written up by his student R.O. Gandy much later
(see Gandy, 1980). Strong Normalisation was ﬁrst proved by L.E. Sanchis in
1965 and published in Sanchis (1967). Probably the most well-known proof of
Strong Normalisation is due to W.W.Tait, using an ingenious semantic inter-
pretation. In Tait (1967) he only proves Weak Normalisation, but the proof can
immediately be extended to Strong Normalisation. See Section 8.2 of Cardone
& Hindley (2009) for a more detailed historic overview.
Exercises
## 2.1 Investigate for each of the following λ-terms whether they can be typed
with a simple type. If so, give a type for the term and the corresponding
types for x and y. If not, explain why.
(a) xxy,
(b) xy y,
(c) xy x,
(d) x(xy),
(e) x(y x).
## 2.2 Find types for zero, one and two (see Exercise 1.10).
## 2.3 Find types for K and S (see Exercise 1.9).
## 2.4 Add types to the bound variables in the following λ-terms such that they
become pre-typed λ-terms which are legal, and give their types:
(a) λxyz . x(y z),
(b) λxyz . y(xz)x.Exercises 67
## 2.5 For each of the following terms, try to ﬁnd a pre-typed variant which is
typable. If this is not possible, show why.
(a) λxy . x(λz . y)y,
(b) λxy . x(λz . x)y.
2.6 (a) Prove that the following pre-typed λ-term is legal, using the tree for-
mat:
λx : ((α → β) → α). x(λz : α. y).
(b) Transform the derivation into ﬂag format.
2.7 (a) Prove the following by giving a kind of derivation, with the rules
(func-appl) and (func-abst) described in Example 2.4.8:
If f : A → B and g : B → C, then g ◦ f : A → C.
(Note: g◦f is the composition of f and g, being the function mapping
x to g(f x).)
(b) Give a derivation in natural deduction of the following expression,
using the rules ⇒-elim and ⇒-intro described in Example 2.4.9:
(A ⇒ B) ⇒ ((B ⇒ C) ⇒ (A ⇒ C)).
(c) Prove that the following pre-typed λ-term is legal, using the ﬂag for-
mat:
λz : α. y(xz).
(d) Indicate the similarities between the derivations in (a), (b) and (c).
2.8 (a) Add types to the bound variables in the λ-term λxy . y(λz . y x) such
that the type of this term becomes
(γ → β) → ((γ → β) → β) → β.
(b) Give a derivation in tree format, proving this.
(c) Sketch a diagram of the tree structure, as in Section 2.5.
(d) Transform the derivation into ﬂag format.
## 2.9 Give derivations by means of which the following judgements become
type-checked. You may use the ﬂag notation. In part (b), you may use
ﬂag notation in its ‘shortened’ form, i.e. suppress steps involving the (var)-
rule.
(a) x : δ→δ→α, y : γ→α, z : α→β 
λu : δ . λv : γ . z(y v) : δ → γ → β,
(b) x : δ→δ→α, y : γ→α, z : α→β 
λu : δ . λv : γ . z(xuu) : δ → γ → β.
## 2.10 Prove that the following pre-typed λ-terms are legal, by giving derivations
in (shortened) ﬂag notation.
(a) xz (y z),
(b) λx : (α → β) → β . x(y z),
(c) λy : α. λz : β → γ . z(xy y),
(d) λx : α → β . y(xz)z.68 Simply typed lambda calculus
## 2.11 Find inhabitants of the following types in the empty context, by giving
appropriate derivations.
(a) (α → α → γ) → α → β → γ,
(b) ((α → γ) → α) → (α → γ) → β → γ.
2.12 (a) Construct a term of type ((α → β) → α) → (α → α → β) → α.
(b) Construct a term of type ((α → β) → α) → (α → α → β) → β.
(Hint: use (a).)
## 2.13 Find a term of type τ in context Γ, with:
(a) τ ≡ (α → β) → α → γ, Γ ≡ x : α → β → γ,
(b) τ ≡ α → (α → β) → γ, Γ ≡ x : α → β → α → γ,
(c) τ ≡ (α → γ) → (β → α) → γ, Γ ≡ x : (β → γ) → γ.
Give appropriate derivations.
## 2.14 Find an inhabitant of the type α → β → γ in the following context:
Γ ≡ x : (γ → β) → α → γ.
Give an appropriate derivation.
(Hint: if τ is inhabited, then also σ → τ is inhabited.)
2.15 Give the (var)- and (appl)-cases of the proof of Lemma 2.10.5(1) (the
‘Thinning Lemma’).
## 2.16 Prove Lemma 2.10.8 (the ‘Subterm Lemma’).
## 2.17 Prove Lemma 2.10.9 (the ‘Uniqueness of Types Lemma’).
(Hint: use Lemma 2.10.7 (the ‘Generation Lemma’).)
2.18 Prove the Compatibility cases in the proof of Lemma 2.11.5.3
Second order typed lambda calculus
## 3.1 Type-abstraction and type-application
In Church’s λ→, we only encounter abstraction and application on the term
level:
− Look at the abstraction process. We start with term M, in which x may occur
as a free variable. Assuming that x has type σ, we then may abstract M from
x by means of a λ, in order to obtain λx : σ . M. As a side eﬀect, every free
occurrence of x in M becomes bound in λx : σ . M.
The variable x is itself a term. Consequently, by abstracting the term M
from the term x, we obtain a new term: λx : σ . M. One describes this
situation by saying:
the term λx : σ . M depends on the term x .
Hence, in λ→ we can construct terms depending on terms.
− The counterpart of abstraction is application. And when we can ‘abstract a
term from a term’, then it is natural that we also can ‘apply a term to a
term’. And indeed, we can: for the construction of MN we apply the term
M to the term N. Also now, the result is a term, namely MN.
Here one speaks of ﬁrst order abstraction, or ﬁrst order dependency, since
the abstraction is over terms. Its companion, application, is ﬁrst order as well.
In the present chapter, we also introduce terms depending on types. In
this case one speaks of second order operations (or second order dependency).
The system that we obtain is called the second order typed lambda calculus,
or λ2 for short. Its precise deﬁnition and derivation rules follow later in this
chapter.
We start with motivating examples.
Examples 3.1.1 (1) First, we consider the identity function, i.e. the function
which, after taking an input, returns it unchanged:70 Second order typed lambda calculus
− On the natural numbers, nat, this identity function is λx : nat . x.
− On the booleans, bool, this is λx : bool . x.
− On nat → bool (the set of functions from nat to bool), we have the identity
function λx : (nat →bool). x.
So there are many identity functions, one per type. But what about ‘the’
identity function? It apparently does not exist in λ→. The best we can do is
to consider an ‘arbitrary’ type α and construct the function f ≡ λx : α. x.
But now, given an M of type nat, we cannot write fM, because this term
is not legal: the types do not match. (Since α ≡ nat, the (appl)-rule of Deﬁ-
nition 2.4.5 fails.) Similar considerations hold for a B of type bool: also fB is
not legal.
Concluding, we want to have the possibility of ‘tuning’ this general function
λx : α. x in such a manner that it can deal with all kinds of types. The trick
for this is to add another abstraction at the front:
λα : ∗. λx : α. x .
The novelty in this new kind of abstraction is the type variable α occurring
behind the ﬁrst λ. The symbol ∗ denotes the type of all types, so in particular
α : ∗.
Note that λα : ∗. λx : α. x acts by itself as a term again, but this time it is
a term depending on a type. The type it depends on is α.
The obtained (second order) term is called the polymorphic identity function.
Note that it is not an identity function itself, but only a potential one (an
‘identity-function-to-be’). We have to do (second order) application and β-
reduction to obtain a ‘genuine’ identity function. For example:
− (λα : ∗. λx : α. x)nat →β λx : nat . x, which is the identity on nat,
− (λα : ∗. λx : α. x)(nat → bool) →β λx : (nat → bool). x, which is the
identity on nat → bool.
So when extending λ→ in this manner, we have to add second order abstrac-
tion and application. Moreover, we need β-reduction for second order terms.
(2) Our second example is about iteration, i.e. the repeated application of
the same function.
Take a type σ and a function F of type σ → σ. We deﬁne Dσ,F as the
function mapping x in σ to F(F(x)). So Dσ,F is the second iteration of F, also
denoted as F ◦ F (the composition of F with itself).
This Dσ,F can easily be expressed in λ→ already, viz. as λx : σ . F(F x).
Now we want to consider such a D for arbitrary σ and arbitrary F : σ → σ,
so instead of the ﬁxed type σ we take type variable α, and instead of the ﬁxed3.2 Π-types 71
function F we take term variable f, where f : α → α. By means of abstraction
from f and α we obtain:
D ≡ λα : ∗. λf : α → α. λx : α. f(fx).
D is called a polymorphic function, since it generalises over types: the ﬁrst
abstraction is second order. We can apply D, for example, to the type nat,
using second order application. Reduction gives:
Dnat →β λf : nat → nat . λx : nat . f(fx),
so Dnat is the function that maps f to its second iteration f ◦ f.
Assume that s is the successor function on the naturals, that is the function
mapping n to n + 1, having type nat → nat. Then:
Dnat s β λx : nat . s(sx).
This is the function mapping n to n + 2.
(3) Iteration as in the previous example is a special case of general function
composition, i.e. the application of one function after another.
We immediately give the function composition operator, ◦, in λ2:
◦ ≡ λα : ∗. λβ : ∗. λγ : ∗. λf : α → β . λg : β → γ . λx : α. g(fx).
So for given types A, B and C, and functions F : A → B and G : B → C,
we have that ◦AB C F G ‘is’ (i.e. is β-convertible to) the composition G ◦ F,
being the function λx : A. G(F(x)).
3.2 Π-types
In the previous section we introduced second order λ-abstraction or type-
abstraction; see for example the ﬁrst λ of the polymorphic identity:
λα : ∗. λx : α. x.
Since we work in typed lambda calculus, it is natural to ask what the type is of
this second order term. Now we know already from λ→ that λx : α. x : α → α,
so an educated guess is:
λα : ∗. λx : α. x : ∗ → (α → α).
But now we have a problem. We saw earlier (Section 1.5) that we iden-
tify terms which only diﬀer in the names of their binding (and corresponding
bound) variables. In our second order expression above, the type α has become
a binding variable, since it appears behind a λ (it is no longer a free variable,
as in Chapter 2).72 Second order typed lambda calculus
It is natural to identify λα : ∗. λx : α. x with e.g. λβ : ∗. λx : β . x.
However, then we have:
λα : ∗. λx : α. x : ∗ → (α → α)
||| |||
λβ : ∗. λx : β . x : ∗ → (β → β),
implying that two ‘identical’ terms (left) have diﬀerent types (right). This is
clearly not what we intended.
It is easy to pinpoint the trouble: in both left-hand sides, we treat α and β
as bound variables, but in the right-hand sides, α and β act as free variables,
which is not what we want. Therefore we introduce a new binder, the type-
binder or Π-binder, denoted by the Greek capital Π (pronounced ‘pi’). We
write Πα : ∗. α → α for the type of functions sending an arbitrary type α to
a term of type α → α.
By an obvious extension of the notion of α-conversion (see Section 1.5), we
obtain Πα : ∗. α → α ≡α Πβ : ∗. β → β , so now we have:
λα : ∗. λx : α. x : Πα : ∗. α → α
||| |||
λβ : ∗. λx : β . x : Πβ : ∗. β → β ,
and our problem has been solved.
Looking at the second order terms in (2) and (3) from Examples 3.1.1, it is
not hard to guess what their Π-types will be (see also Section 3.5):
λα : ∗. λf : α → α. λx : α. f(fx) : Πα : ∗. (α → α) → α → α ,
λα : ∗. λβ : ∗. λγ : ∗. λf : α → β . λg : β → γ . λx : α. g(fx) :
Πα : ∗. Πβ : ∗. Πγ : ∗. (α → β) → (β → γ) → α → γ .
Remark 3.2.1 In mathematics, the letter Π (the Greek P) is usually reserved
for a product, just as Σ (the Greek S) is reserved for sums. Π-types are also
called product types; cf. Remark 5.2.2.
## 3.3 Second order abstraction and application rules
Since we allow second order abstraction, second order application and Π-types,
our derivation system for λ→ has to be extended.
To begin with, we need an extra abstraction rule, in order to make the
connection between second order terms and Π-types. This rule is:
Deﬁnition 3.3.1 (Second order abstraction rule)
(abst2)
Γ, α : ∗  M : A
Γ  λα : ∗. M : Πα : ∗. A3.4 The system λ2 73
So when M has type A in a context where α has type ∗, then λα : ∗. M has
type Πα : ∗. A. This rule corresponds to our expectations after the examples in
the previous section. There is one novelty: we allow second order declarations
in the context, such as α : ∗.
How about applications in the presence of Π-types? Let’s observe an exam-
ple, again. We know that λα : ∗. λx : α. x : Πα : ∗. α → α.
Now we apply the left-hand side to, say, nat. This is a type, so it does ‘ﬁt’
in the second order term. We obtain the term:
(λα : ∗. λx : α. x)nat ,
which β-reduces to λx : nat . x. (It is easy to see how reduction must be
extended to second order terms.) The latter term has type nat → nat, so a
good guess is:
(λα : ∗. λx : α. x)nat : nat → nat .
This is indeed also a natural thing to do: we start with a function belonging
to the speciﬁc Π-type Πα : ∗. α → α, which is the type of all functions sending
an arbitrary type α to a term of type α → α. So, when applying such a function
to nat, we obtain a term of type nat → nat, and that’s exactly what we have
above.
Recapitulating the above in a more general setting:
If M : Πα : ∗. α → α, then:
MB : B → B ,
and even more generally:
If M : Πα : ∗. A, then:
MB : A[α := B].
Of course, we have to be certain that B matches with the domain of M
in the last two cases, so B should be a type, i.e. B : ∗. This leads us to the
following second order application rule:
Deﬁnition 3.3.2 (Second order application rule)
(appl2)
Γ  M : Πα : ∗. A Γ  B : ∗
Γ  MB : A[α := B]
## 3.4 The system λ2
In this section we describe the complete system λ2.
Firstly, we have to extend our deﬁnition of types (cf. Deﬁnition 2.2.1). This
is the abstract syntax for λ2-types:
T2 = V | (T2 → T2) | (ΠV : ∗. T2),74 Second order typed lambda calculus
with V the set of type variables. For these we take α,β,γ,....
Secondly, we extend our set of pre-typed λ-terms (ΛT, cf. Deﬁnition 2.4.1)
to terms where also second order abstraction and application are allowed:
Deﬁnition 3.4.1 (Second order pre-typed λ-terms, λ2-terms, ΛT2)
The set of second order pre-typed λ-terms, or λ2-terms, is deﬁned by:
ΛT2 = V |(ΛT2ΛT2)|(ΛT2T2)|(λV : T2. ΛT2)|(λV : ∗. ΛT2).
Note that we now have two classes of variables at our disposal: object vari-
ables V (such as x, y, ...) and type variables V (such as α, β, ...). As a
consequence, we have ﬁrst order abstraction (λV : T2. ΛT2) from object vari-
ables, and second order abstraction (λV : ∗. ΛT2) from type variables.
Correspondingly, we have ﬁrst order application (ΛT2ΛT2) and second order
application (ΛT2T2).
In λ2, we save on parentheses and λs in a similar manner as we have done
for untyped lambda calculus and for simply typed lambda calculus (see Nota-
tions 1.3.10 and 2.2.2). This convention extends to arrows (→) and Πs:
Notation 3.4.2 − Outermost parentheses may be omitted.
− Application is left-associative.
− Application and → take precedence over both λ- and Π-abstraction.
− Successive λ- or Π-abstractions concerning the same types may be combined
in a right-associative way.
− Arrow types are denoted in a right-associative way.
For example: we write Πα,β : ∗ . α → β → α as an abbreviating notation
for (Πα : ∗. (Πβ : ∗. (α → (β → α)))).
Next, we extend our notion of ‘declaration’ (see Deﬁnition 2.4.2) by allowing
second order declarations:
Deﬁnition 3.4.3 (Statement, declaration)
(1) A statement is either of the form M : σ, where M ∈ ΛT2 and σ ∈ T2, or of
the form σ : ∗, where σ ∈ T2.
(2) A declaration is a statement with a term variable or a type variable as
subject.
In λ→, a context was just a list of term declarations. In λ2, however, we are
a bit more strict. Since the type constants of λ→ have become type variables
in λ2, we treat these type variables on a par with term variables, in the sense
that all variables must be declared before they can be used. This guarantees
that we ‘know’ the types of all variables before we use them.
That is to say, a declaration such as x : α → α must be preceded by the3.4 The system λ2 75
declaration of type variable α (having type ∗). Furthermore, the declaration
x : α → β presupposes the declarations of both α and β.
This is the motivation for the following recursive deﬁnition of λ2-context,
which we combine with a new deﬁnition of the domain of a context. In this def-
inition, part (3), we speak about free type variables. We leave it as an exercise
to the reader to say what freeness for type variables comprises (Exercise 3.21).
Deﬁnition 3.4.4 (λ2-context; domain; dom)
(1) ∅ is a λ2-context;
dom(∅) = (), the empty list.
(2) If Γ is a λ2-context, α ∈ V and α ∈ dom(Γ), then Γ, α : ∗ is a λ2-context;
dom(Γ,α : ∗) = (dom(Γ), α), i.e. dom(Γ) concatenated with α.
(3) If Γ is a λ2-context, if ρ ∈ T2 such that α ∈ dom(Γ) for all free type variables
α occurring in ρ and if x ∈ dom(Γ), then Γ, x : ρ is a λ2-context;
dom(Γ,x : ρ) = (dom(Γ), x).
Note that this deﬁnition entails that all term variables and type variables in
a λ2-context are mutually distinct.
Example 3.4.5
− ∅ is a λ2-context by (1).
− So α : ∗ is a λ2-context by (2).
− Hence, α : ∗, x : α → α is a λ2-context by (3). (Note that type variable α
in type α → α has already been declared in the context.)
− Also, α : ∗, x : α → α, β : ∗ is a λ2-context by (2).
− Hence, Γ ≡ α : ∗, x : α → α, β : ∗, y : (α → α) → β is a λ2-context by (3),
with dom(Γ) = (α,x,β,y).
Conforming with our new notion of context, we adapt the (var)-rule of λ→
(cf. Deﬁnition 2.4.5) in order to start the derivation of the type of a variable
relative to a ‘proper’ λ2-context:
Deﬁnition 3.4.6 (Var-rule for λ2)
(var) Γ  x : σ if Γ is a λ2-context and x : σ ∈ Γ.
Note that this (var)-rule for λ2 is, again, a rule without a premiss.
Now we have most of the rules for derivations in λ2: we reuse (appl) and
(abst) from λ→ (see Deﬁnition 2.4.5), we take the new (var)-rule as above and
we add the rules (appl2) and (abst2) from the previous section.
There is one complication, however: when employing these ﬁve rules, we will
never be able to use the (appl2)-rule. The reason is that the second premiss
of this rule is Γ  B : ∗, and there is no rule to establish that something has
type ∗ (verify this: no conclusion is of the form ...  ... : ∗).76 Second order typed lambda calculus
It is not hard to repair this. Our intuition is that B : ∗ holds as soon as B
is a type and all type variables in B are ‘known’. So we add:
Deﬁnition 3.4.7 (Formation rule)
(form)
Γ  B : ∗ if Γ is a λ2-context, B ∈ T2 and
all free type variables in B are declared in Γ.
This rule is called the formation-rule, since it tells us what the type is
(namely, ∗) of a B which is itself a properly formed λ2-type.
Note that the (form)-rule has three side conditions, but no premisses. So,
just like the (var)-rule, it can only occur in the leaves of a derivation tree.
For convenience, we display all derivation rules of λ2 in Figure 3.1:
(var) Γ  x : σ if Γ is a λ2-context and x : σ ∈ Γ
(appl)
Γ  M : σ → τ Γ  N : σ
Γ  MN : τ
(abst)
Γ, x : σ  M : τ
Γ  λx : σ . M : σ → τ
(form)
Γ  B : ∗ if Γ is a λ2-context, B ∈ T2 and
all free type variables in B are declared in Γ
(appl2)
Γ  M : (Πα : ∗. A) Γ  B : ∗
Γ  MB : A[α := B]
(abst2)
Γ, α : ∗  M : A
Γ  λα : ∗. M : Πα : ∗. A
Figure 3.1 Derivation rules for λ2
We translate the notion ‘legality’ from Deﬁnition 2.4.10 to λ2:
Deﬁnition 3.4.8 (Legal λ2-terms) A term M in ΛT2 is called legal if there
exists a λ2-context Γ and a type ρ in T2 such that Γ  M : ρ.
## 3.5 Example of a derivation in λ2
In Section 3.2 we ‘guessed’ the type of M ≡ λα : ∗. λf : α → α. λx : α. f(fx).
Now we show how this type can be derived by the aid of the rules. So, our
task is to ﬁnd a context Γ and a type ρ such that Γ  M : ρ. Since M has no
free term or type variables, we take Γ ≡ ∅. Thus, we start with the goal:3.5 Example of a derivation in λ2 77
(n) λα : ∗. λf : α → α. λx : α. f(fx) : ?
Since the term-to-be-typed starts with a ‘second order λ’, we use the rule
(abst2), in reverse order:
(a) α : ∗
. . .
(m) λf : α → α. λx : α. f(fx) : ?
(n) λα : ∗. λf : α → α. λx : α. f(fx) : ... (abst2) on (m)
The new goal starts with λf : α → α. ..., which is an ‘ordinary’ ﬁrst
order abstraction, so (abst) is the suitable rule to use – again, in reverse order.
Obviously, we may use this rule twice:
(a) α : ∗
(b) f : α → α
(c) x : α
. . .
(k) f(fx) : ?
(l) λx : α. f(fx) : ... (abst) on (k)
(m) λf : α → α. λx : α. f(fx) : ... (abst) on (l)
(n) λα : ∗. λf : α → α. λx : α. f(fx) : ... (abst2) on (m)
The remainder is just a typing problem in λ→, which we know how to solve
(we give a shortened derivation, as in the previous chapter):
(a) α : ∗
(b) f : α → α
(c) x : α
(1) fx : α (appl) on (b) and (c)
(2) f(fx) : α (appl) on (b) and (1)
(3) λx : α. f(fx) : type1 (abst) on (2)
(4) λf : α → α. λx : α. f(fx) : type2 (abst) on (3)
(5) λα : ∗. λf : α → α. λx : α. f(fx) : type3 (abst2) on (4)
Now all that’s left is to ﬁll in type1, type2 and type3, which immediately
follows from the (abst)- and (abst2)-rules:
type1 ≡ α → α,
type2 ≡ (α → α) → α → α, and
type3 ≡ Πα : ∗. (α → α) → α → α.78 Second order typed lambda calculus
So our conclusion, the completion of line (5), is:
(5) ∅  λα : ∗. λf : α → α. λx : α. f(fx) : Πα : ∗. (α → α) → α → α .
From this we can conclude by the Thinning Lemma (see Lemma 3.6.4), that
for every λ2-context Γ:
(6) Γ  λα : ∗. λf : α → α. λx : α. f(fx) : Πα : ∗. (α → α) → α → α .
Suppose we have a type nat that we can form in Γ, that is we have:
(7) Γ  nat : ∗ .
From (6) and (7) follows by (appl2):
(8) Γ  (λα : ∗. λf : α → α. λx : α. f(fx)) nat :
(nat → nat) → nat → nat .
Suppose we also have:
(9) Γ  suc : nat → nat ,
then with (appl) on (8) and (9) we get:
(10) Γ  (λα : ∗. λf : α → α. λx : α. f(fx)) nat suc : nat → nat ,
and so, if we also have Γ  two : nat, we obtain:
(11) Γ  (λα : ∗. λf : α → α. λx : α. f(fx)) nat suc two : nat .
## 3.6 Properties of λ2
We have to adapt our Deﬁnition 1.5.2 of α-conversion, in order to accommodate
Π-types:
Deﬁnition 3.6.1 (α-conversion or α-equivalence, extended)
(1a) (Renaming of term variable)
λx : σ . M =α λy : σ . Mx→y if y ∈ FV (M) and y does not occur as a binding
variable in M.
(1b) (Renaming of type variable)
λα : ∗. M =α λβ : ∗. M[α := β] if β does not occur in M,
Πα : ∗. M =α Πβ : ∗. M[α := β] if β does not occur in M.
(2), (3a), (3b), (3c) (Compatibility, Reﬂexivity, Symmetry, Transitivity)
As in Deﬁnition 1.5.2.
We also extend β-reduction to λ2 in the obvious way (cf. Deﬁnitions 1.8.1
and 2.11.2):3.6 Properties of λ2 79
Deﬁnition 3.6.2 (One-step β-reduction, →β for Λ2-terms)
(1a) (Basis, ﬁrst order) (λx : σ . M)N →β M[x := N]
(1b) (Basis, second order) (λα : ∗. M)T →β M[α := T]
(2) (Compatibility) As in Deﬁnition 1.8.1.
Example 3.6.3 We can start a β-reduction on the term in judgement (11)
of the previous section:
(λα : ∗. λf : α → α. λx : α. f(fx)) nat suc two →β
(λf : nat → nat. λx : nat. f(fx)) suc two →β
(λx : nat. suc(suc x)) two →β
suc(suc two).
Each of the four terms in this β-reduction chain has the same type, viz. nat.
This can be established in two ways:
(1) By giving type derivations for each of them, as we did in Section 3.5 for
the ﬁrst one (this is the laborious way);
(2) But also: by using Subject Reduction (see Lemma 3.6.4 below) – this is
apparently the easy way here, because we have already derived judgement (11).
In Chapter 2 we established a number of properties for λ→. Most of these
may be transferred to λ2.
Lemma 3.6.4 The following lemmas and theorems also hold for λ2:
− Free Variables Lemma (cf. Lemma 2.10.3),
− Thinning Lemma (cf. Lemma 2.10.5(1)),
− Condensing Lemma (cf. Lemma 2.10.5(3)),
− Generation Lemma (cf. Lemma 2.10.7),
− Subterm Lemma (cf. Lemma 2.10.8),
− Uniqueness of Types (cf. Lemma 2.10.9),
− Substitution Lemma (cf. Lemma 2.11.1),
− Church–Rosser Theorem (cf. Theorem 2.11.3),
− Subject Reduction (cf. Lemma 2.11.5),
− Strong Normalisation Theorem (cf. Theorem 2.11.6).
We omit proofs of these properties.
Note that the only lemma from Chapter 2 that we have to adapt is the
Permutation Lemma (cf. Lemma 2.10.5): it is no longer allowed to arbitrarily
permute the declarations in a context Γ occurring in a judgement Γ  M : T,
since a declaration occurring later in that context may depend on an earlier one,
as we have explained in Section 3.4. If we require, however, that the permuted
context is a λ2-context, again, then it holds.80 Second order typed lambda calculus
## 3.7 Conclusions
In this chapter we have extended Church’s λ→ with terms depending on types.
The motivation is that a natural desire exists to ‘abstract away’ from a certain
type in order to get a more general notion, such as the (polymorphic) identity
function or generic function composition.
The extension has led to terms incorporating second order abstraction and
application. As a consequence of the extension, Π-types have been introduced,
being types of functions which send a type to a term.
The system obtained is λ2, having ﬁrst order and second order abstraction
and application rules. Most of the nice properties of λ→ still hold for the new
system λ2.
## 3.8 Further reading
The second order typed lambda calculus was ﬁrst deﬁned by J.-Y. Girard in
his PhD thesis (Girard, 1972), where it was called ‘system F’. Girard deﬁned
system F for proof-theoretic reasons: to capture the functions that one can
prove to be total in second order arithmetic. We have not taken that angle
here, but there is a vast literature on second order lambda calculus that builds
on it (see Girard, 1986, and Girard et al., 1989, for a comprehensible overview).
A powerful aspect of second order types is that one can deﬁne various
data types, such as natural numbers, lists and trees, as closed second or-
der types. One can also deﬁne functions over these data types such as ad-
dition and multiplication. For example, the data type of the natural num-
bers is Πα : ∗. (α → α) → α → α and the natural numbers are repre-
sented as the polymorphic Church numerals: natural number n is represented
as λα : ∗. λf : α → α. λx : α. f(...(f x)...) with n times an f (cf. what
we said about this in Section 2.14). C. Böhm and A. Berarducci have given
a general method of representing algebraic data types in λ2 (Böhm & Berar-
ducci, 1985). They also show how a large class of functions can be deﬁned on
those data types in λ2.
Polymorphic types are also called ‘impredicative’ types. One speaks of im-
predicativity if an element of a set X is identiﬁed by referring to the set X
itself. A famous example of impredicativity occurs in the so-called Naive Set
Theory, where we have the notion powerset of a set X. (The powerset P(X) of
a set X is the set of all subsets of X.) Now it is tempting to introduce the set
of all sets, say Set. Then we must also allow the powerset of Set, and we have
P(Set) ∈ Set. In this case we identify the element P(Set) by referring to the
set Set to which it belongs. Impredicativity was seen as a source of inconsis-
tency by B. Russell and A.N. Whitehead in the book Principia Mathematica3.8 Further reading 81
(Whitehead & Russell, 1910; cf. Section 2.14) and therefore banned from their
type theory (see also Section 13.8).
In the deﬁnition of a polymorphic type like σ := Πα : ∗. α → α, itself being
of type ∗, we also refer to (i.e. quantify over) the whole collection of types (the
type ∗ of the αs). Therefore, σ is called an impredicative type. Fortunately, it
has been shown by J.-Y. Girard that polymorphic types are consistent, so the
seemingly ‘vicious circle’ in the deﬁnition of polymorphic types is harmless. To
be precise, we mean here that the type theory is (logically) consistent if we
view the types as propositional formulas under the so-called propositions-as-
types isomorphism (‘PAT’; see the end of Section 2.9 or Section 5.4) and we
can prove that there are ‘empty types’, i.e. types σ for which there is no closed
term M : σ.
Independent of Girard, J.C. Reynolds (see Reynolds, 1974) invented a simi-
lar typed lambda calculus that he called the polymorphic lambda calculus. He
constructed this system in order to capture the notion of parametricity. Para-
metricity is the aspect that we have been focusing on in this chapter: a function
f of type Πα : ∗. α → α treats the input type as a parameter. Such an f, ap-
plied to an arbitrary type τ, maps an object of τ to an object of that same
type τ without the possibility to look deeper into the structure of τ. Therefore,
an ‘overloaded’ function F that maps a natural number n to n+1, and a real
number x to |x|, and a list l to the empty list, is not parametric, because F
has to distinguish cases according to the type of its argument. In order to com-
pute the value of F t, one has to inspect the type of t, and depending on that,
apply a certain algorithm. Actually, it can be shown that the only function
f : α → α that is parametric is the identity. This ﬁts precisely with the fact
that the polymorphic identity λα : ∗. λx : α. x is the only closed term of type
Πα : ∗. α → α.
The polymorphic lambda calculus of Reynolds has inspired researchers in
functional programming languages to extend their languages with more pow-
erful typing disciplines. However, in a programming language, one wants to
write as few types as possible and let the compiler do type inference: i.e. do
the check whether the term we have is typable, and if so, to compute a ‘most
general type’ for us. This amounts to the implicit (à la Curry) typing that we
have alluded to in Chapter 2.
For second order typed lambda calculus, some of the basic questions are
much more diﬃcult than for simple type theory.
For example, self-application is possible in λ2: we can add type information
to the term λx. xx that makes it typable. This can be observed by looking
at the term λx : (Πα : ∗. α → α). x(σ → σ)(xσ), which is a proper way
of adding type information to λx. xx. For (λx. xx)(λx. xx), however, this is
not possible, but that is far from obvious. A type inference algorithm should be82 Second order typed lambda calculus
able to see that λx. xx is typable while the other term is not. It was an open
question for a long time whether type inference in polymorphic lambda calculus
is decidable, until this question was answered in the negative by J.B. Wells (see
Wells, 1994).
In modern functional languages, various ‘weak’ versions of polymorphism
are used that allow parametricity while preserving the decidability of type
inference. These type inference algorithms build on the work of R. Milner
(Milner, 1978), who was the ﬁrst to develop typing algorithms for polymorphic
languages (see also Damas & Milner, 1982).
As for the meta-theory of polymorphic λ-calculus, Girard extended the orig-
inal strong normalisation proof of the simple type theory by W.W. Tait (Tait,
1967) in an ingenious way to λ2 (Girard, 1971; Girard et al., 1989). Another
interesting aspect to mention of the polymorphic λ-calculus is that it has no
‘set-theoretic’ models, as was proved by J.C. Reynolds (1984). This means that
in a semantics of λ2, the type σ → τ cannot be interpreted as the full set of
functions from the interpretation of σ to the interpretation of τ.
Exercises
## 3.1 How many λ2-contexts are there consisting of the four declarations α : ∗,
β : ∗, f : α → β, x : α?
## 3.2 Give a full (i.e. not-shortened) derivation in λ2 to show that the following
term is legal; use the ﬂag format. (Cf. Example 3.1.1 (3).)
M ≡ λα,β,γ : ∗. λf : α → β . λg : β → γ . λx : α. g(f x).
## 3.3 Take M as in Exercise 3.2. Assume nat : ∗, bool : ∗, suc : nat → nat and
even : nat → bool.
(a) Prove that M nat nat bool suc even is legal.
(b) Prove that λx : nat . even(suc x) is legal, in two ways:
(1) using Exercise 3.3(a) and Subject Reduction; (2) directly.
## 3.4 Give a shortened derivation in λ2 to show that the following term is legal
in the context Γ ≡ nat : ∗, bool : ∗:
(λα,β : ∗. λf : α → α. λg : α → β . λx : α. g(f(f x))) nat bool.
3.5 Let ⊥ ≡ Πα : ∗. α and Γ ≡ β : ∗, x : ⊥.
(a) Prove that ⊥ is legal.
(b) Find an inhabitant of β in context Γ.
(c) Give three not β-convertible inhabitants of β → β in context Γ, each
in β-normal form.
(d) Prove that the following terms inhabit the same type in context Γ:
λf : β → β → β . f(xβ)(xβ), x((β → β → β) → β).Exercises 83
## 3.6 Find terms in ΛT2 that are inhabitants of the following λ2-types, each in
the given context Γ:
(a) Πα,β : ∗. (nat → α) → (α → nat → β) → nat → β,
where Γ ≡ nat : ∗.
(b) Πδ : ∗. ((α → γ) → δ) → (α → β) → (β → γ) → δ,
where Γ ≡ α : ∗, β : ∗, γ : ∗.
(c) Πα,β,γ : ∗. (α → (β → α) → γ) → α → γ, in the empty context.
## 3.7 Take ⊥ as in Exercise 3.5.
Let context Γ be α : ∗, β : ∗, x : α → ⊥, f : (α → α) → α.
Give a derivation to successively calculate an inhabitant of α and an
inhabitant of β, both in context Γ.
## 3.8 Recall that K ≡ λxy . x in untyped lambda calculus.
Consider the following types:
T1 ≡ Πα,β : ∗ . α → β → α and T2 ≡ Πα : ∗ . α → (Πβ : ∗. β → α).
Find inhabitants t1 and t2 of T1 and T2, which may be considered as
diﬀerent closed λ2-versions of K.
3.9 Find a closed λ2-version of S ≡ λxyz . xz(y z), and establish its type.
3.10 Let M ≡ λx : (Πα : ∗ . α → α) . x(σ → σ)(xσ). (Cf. Section 3.8.)
(a) Prove that M is legal in λ2.
(b) Find a term N such that M N is legal in λ2 and may be considered
to be a proper way of adding type information to (λx. xx)(λy . y).
## 3.11 Take ⊥ as in Exercise 3.5. Prove that the following term is legal in the
empty context:
λx : ⊥. x(⊥ → ⊥ → ⊥)(x(⊥ → ⊥)x)(x(⊥ → ⊥ → ⊥)xx) .
What is its type?
## 3.12 As mentioned in Section 3.8, we have in λ2 the polymorphic Church
numerals. They resemble the untyped Church numerals, as described in
Exercises 1.10 and 1.13(b). For example:
Nat ≡ Πα : ∗. (α → α) → α → α,
Zero ≡ λα : ∗. λf : α → α. λx : α. x, having type Nat,
One ≡ λα : ∗. λf : α → α. λx : α. f x, with type Nat, as well,
Two ≡ λα : ∗. λf : α → α. λx : α. f(f x).
We deﬁne Suc as follows as a λ2-term:
Suc ≡ λn : Nat . λβ : ∗. λf : β → β . λx : β . f(nβ f x).
Check that Suc acts as a successor function for the polymorphic Church
numerals, by proving that Suc Zero =β One and Suc One =β Two.
## 3.13 See the previous exercise.
(a) We deﬁne Add in λ2 as follows:
Add ≡ λm,n : Nat . λα : ∗. λf : α → α. λx : Nat . mαf(nαf x).
Show that Add simulates addition, by evaluating Add One One.84 Second order typed lambda calculus
(b) Find a λ2-term Mult that simulates multiplication on Nat. (Hint: see
Exercise 1.10.)
## 3.14 We may also introduce the polymorphic booleans in λ2:
Bool ≡ Πα : ∗. α → α → α,
True ≡ λα : ∗. λx,y : α. x,
False ≡ λα : ∗. λx,y : α. y.
Construct a λ2-term Neg : Bool → Bool such that Neg True =β False
and Neg False =β True. Prove the correctness of your answer.
## 3.15 See Exercise 3.14. Deﬁne M by
M ≡ λu,v : Bool . λβ : ∗. λx,y : β . uβ(v β xy)(v β y y).
(a) Reduce the following terms to β-normal form:
M True True, M True False, M False True, M False False.
(b) Which logical operator is represented by M?
## 3.16 See the previous exercises. Find λ2-terms that represent the logical oper-
ators ‘inclusive or’, ‘exclusive or’ and ‘implication’.
## 3.17 See the previous exercises. Find a λ2-term Iszero that represents the
test-for-zero. That is, deﬁne a λ2-term such that Iszero Zero =β True
and Iszero n =β False for all polymorphic Church numerals n except
Zero. (Hint: see Exercise 1.14.)
## 3.18 See Exercise 3.14. We deﬁne the type Tree, representing the set of binary
trees with boolean-labelled nodes and leaves, by
Tree ≡ Πα : ∗. (Bool → α) → (Bool → α → α → α) → α.
Then λα : ∗. λu : Bool → α. λv : Bool → α → α → α. M has type Tree,
for every λ2-term M of type α.
(a) Sketch the three trees that are represented if we take for M, respec-
tively:
u False,
v True(u False)(u True),
v True(u True)(v False(u True)(u False)).
(b) Give a λ2-term which, on input a polymorphic boolean p and two
trees s and t, delivers the combined tree with p on top, left subtree s
and right subtree t.
## 3.19 Prove: if Γ  L : σ, then Γ is a λ2-context.
## 3.20 Prove the Free Variables Lemma for λ2 (cf. Lemma 3.6.4): if Γ  L : σ,
then FV(L) ⊆ dom(Γ).
3.21 Give a recursive deﬁnition for FTV(A), the set of free type variables in A,
for an expression A in T2 or in ΛT2.4
Types dependent on types
## 4.1 Type constructors
In the previous chapter we introduced the possibility of constructing generalised
terms, by abstracting a term from a type variable. For example, the term
λx : σ . x (which is the identity on the ﬁxed type σ) can be generalised to the
term λα : ∗. λx : α. x (the ‘polymorphic’ identity, i.e. the identity on variable
type α, abstracted from this α).
In a similar manner, there is a natural wish to construct generalised types.
For example, types like β → β, γ → γ, (γ → β) → (γ → β), ..., all have
the general structure ♦ → ♦, with the same type both left and right of the
arrow. Abstracting over ♦ makes it possible to describe the whole family of
types with this structure.
In order to handle this, we introduce a generalised expression that embodies
the essence of this structure: λα : ∗. α → α. This is itself not a type, but a
function with a type as a value. It is therefore called a type constructor. Only
when we ‘feed’ it with e.g. β, γ or (γ → β), we obtain types:
(λα : ∗. α → α)β →β β → β ,
(λα : ∗. α → α)γ →β γ → γ ,
(λα : ∗. α → α)(γ → β) →β (γ → β) → (γ → β) .
We obtain the type constructor λα : ∗. α → α by abstracting the type
α → α from the type α. In a similar manner, we can make more complex type
constructors, such as λα : ∗. λβ : ∗. α → β.
An obvious question is: what are the types of these type constructors? We
already know that α → α is a type. Hence, one may consider λα : ∗. α → α as
a function mapping the type α to the type α → α. Since α : ∗ and α → α : ∗,
we obtain:
λα : ∗. α → α : ∗ → ∗ .
Therefore, we need, next to ∗, a new ‘super-type’, viz. ∗ → ∗.86 Types dependent on types
Similarly, we may conclude:
λα : ∗. λβ : ∗. α → β : ∗ → (∗ → ∗) .
When adding things like ∗ → ∗ and ∗ → (∗ → ∗) as new super-types, it is
natural to also allow variables belonging to these super-types.
Examples 4.1.1
(1) Suppose we have a variable α : ∗ → ∗, then for γ : ∗, we have:
αγ : ∗.
It is then also natural to abstract from this variable α, obtaining:
λα : ∗ → ∗. αγ : (∗ → ∗) → ∗.
And we can apply this type constructor to the identity on types λβ : ∗. β,
since λβ : ∗. β has type ∗ → ∗:
(λα : ∗ → ∗. αγ)(λβ : ∗. β) : ∗.
(2) We also may abstract from an α of type ∗ → ∗ and infer:
λα : ∗ → ∗. α : (∗ → ∗) → (∗ → ∗) .
The extensions described above can be summarised as the addition of types
depending on types, which will lead to the system λω to be described in
the present chapter.
Remark 4.1.2 When using this kind of general explanatory expression, such
as ‘terms depending on types’ or ‘types depending on types’, we now have to
extend the meaning of the word ‘type’, since we deal with both ordinary types
and type constructors. Similar things hold for expressions such as ‘abstracting
a term from a type’.
Above we have met the following examples of types (better: type construc-
tors) depending on a type, which here is, in all cases, α:
− λα : ∗. α → α,
− λα : ∗. λβ : ∗. α → β,
− λα : ∗ → ∗. α,
− λα : ∗ → ∗. αγ.
The ‘super-types’ which we have met above, consisting of ∗ alone and of
∗-symbols with arrows in between, are called kinds. Abstract syntax for the
set K of all kinds is:
K = ∗|(K → K) .
Notation 4.1.3 We use similar conventions for the omission of parentheses,
as for simple types. So outermost parentheses may be omitted, and the kinds
are denoted right-associatively. (Cf. Notation 2.2.2.)4.1 Type constructors 87
Examples of kinds are:
∗, ∗ → ∗, ∗ → ∗ → ∗, (∗ → ∗) → ∗, (∗ → ∗) → ∗ → ∗, ∗ → (∗ → ∗) → ∗.
We introduce a new symbol for the type of all kinds, namely , which is so
to speak the one and only ‘super-super-type’. We have now e.g. that ∗ : , but
also ∗ → ∗ : , etcetera. If κ is a kind, then often each M ‘of type’ κ (this is
colloquial for M : κ) is called a type constructor, or simply constructor. Then
all ‘old’ types – like α or α → α – are also called constructors, although there
is ‘nothing to construct’ in these cases. So λα : ∗. α → α is a constructor of
kind ∗ → ∗ and the ‘old’ type α → α itself is a constructor of kind ∗.
We use the term proper constructor for constructors which are not types. So
the set of constructors splits apart into (‘old’) types and proper constructors.
Finally, the word sort is used for either ∗ or , so:
Deﬁnition 4.1.4 (Constructor, proper constructor, sort)
(1) If κ :  and M : κ, then M is a constructor. If κ ≡ ∗, then M is a proper
constructor.
(2) The set of sorts is {∗,}.
Notation 4.1.5 From now on, we reserve symbol s as meta-variable for a
sort (so s represents either ∗ or ).
With the addition of , we now have four levels in our syntax:
Deﬁnition 4.1.6 (Levels)
Level 1: here we ﬁnd the terms;
level 2: where the constructors are (so the types plus the proper constructors);
level 3: that of the kinds;
level 4: consists solely of .
By gluing things together, we informally write judgement chains such as
t : σ : ∗ → ∗, or even t : σ : ∗ → ∗ : , expressing t : σ and σ : ∗ → ∗
and ∗ → ∗ : . In the last example we have levels 1 to 4 combined into one
judgement chain.
When σ is a proper constructor, then it cannot be inhabited, so we have
to omit the t from the chain. We then obtain the shorter judgement chain
σ : κ : , with, for example, κ ≡ ∗ → ∗. But again, we observe several levels
in this chain, viz. levels 2 to 4.
Remark 4.1.7 It is worthwhile noticing that also statements A : B are
inﬂuenced by the richer choice in levels. Since the level of B must be one
higher than that of A, we have:
If A has level 1, then A must be a term and B a type.
In λ2, A may also have level 2. Then A is a type and B ≡ ∗. In λω, A may88 Types dependent on types
also be a type constructor and consequently B can be a more complicated kind,
such as ∗ → ∗.
In λω, it is possible that A has level 3; then A is a kind and B ≡ .
Consequently, the roles of subject and type in a statement also range over
several levels. These roles (and therefore their constructions) become increas-
ingly interwoven, which will be an essential feature of the type systems to be
discussed in the present chapter and thereafter.
4.2 Sort-rule and var-rule in λω
The system we consider in the present chapter is called λω. It is another
extension of λ→:
− λ2 = λ→ plus terms-depending-on-types,
− λω = λ→ plus types-depending-on-types.
We now continue with describing the speciﬁc derivation rules of λω. First,
we formalise the fact that the super-type ∗ is of type . (That also all other
kinds are of type , follows in Section 4.4.) This rule is called the sort-rule:
Deﬁnition 4.2.1 (Sort-rule)
(sort) ∅  ∗ : 
Our next desire is a rule to establish that all declarations occurring in a
context are derivable in that context. In λ→ and λ2, we used the (var)-rule
for this purpose (see Deﬁnition 2.4.5 and Figure 3.1, respectively). In λω, we
use a slightly diﬀerent approach: we neatly combine derivability of context
declarations with the construction of the context proper.
The reason for this is that types are more complex in λω, so we have to
make sure that the types are well-formed. In λ→, where the set of permissible
types was given beforehand, there was no problem at all. In λ2, things were a
bit more complicated, so we had to establish what a (proper) λ2-context was
(see Deﬁnition 3.4.4), which led in particular to requirements on the types used
in such contexts. Hence, the permissibility of types occurring in a judgement
could no longer be decided by referring to an outside set, but should depend
on an inspection of the judgement itself, including its context.
In the present system, the requirements imposed on the types are still more
severe: the permissibility of a type occurring in a judgement now only follows
if we can formally derive it.
Our new approach is the following: we only extend a context with a declara-
tion x : A if the type A itself is already ‘permissible’. And ‘permissible types’
of a statement occur in either level 2 or 3, and therefore are a type or a kind.
These things can be expressed in a rule, as follows:4.2 Sort-rule and var-rule in λω 89
Deﬁnition 4.2.2 (Var-rule)
(var)
Γ  A : s
Γ, x : A  x : A
if x ∈ Γ.
Recall that s ranges over sorts (cf. Notation 4.1.5). So, the premiss of this
(var)-rule, Γ  A : s, requires that A itself is a type (if s ≡ ∗) or a kind (if
s ≡ ). Notice that the letter ‘x’ may hence stand for either a term variable or a
type variable. The (var)-rule allows us to extend context Γ with a declaration
x : A, and to derive the same declaration as a statement in the extended
context.
The restriction x ∈ Γ guarantees that variable x is ‘fresh’, i.e. x does not oc-
cur in Γ. From this follows that all variables declared in a context are diﬀerent,
which is a natural requirement, again: a context serves for typing possibly free
variables in a statement and it is obviously unnecessary to declare a variable
more than once in a context (and even confusing if the corresponding types
happen to be diﬀerent).
We emphasise the fact that this (var)-rule plays a double role, due to the
two possibilities for s. Since s may be either ∗ (of level 3) or  (of level 4),
the rule-as-a-whole covers two levels. We show this in the following example,
by giving several realisations of the statements A : s and x : A occurring in
Deﬁnition 4.2.2:
Example 4.2.3
s ≡  s ≡ ∗
A : s ∗ :  ∗ → ∗ :  α : ∗ α → β : ∗
x : A α : ∗ β : ∗ → ∗ x : α y : α → β
Now we can start a derivation with the (sort)- and (var)-rules as given
above. We give an example in tree format, which clearly demonstrates how
these rules work.
(1) ∅  ∗ : 
(var)
(2) α : ∗  α : ∗
(var)
(3) α : ∗, x : α  x : α
The (sort)-rule gives line (1). The (var)-rule has been used in its two roles,
with s ≡  in line (2), and with s ≡ ∗ in line (3).
Of course, a similar derivation can be made for a type β.
In Section 2.5 we have mentioned that we prefer a ﬂag format over a tree
format in this book. Therefore we repeat the above derivation in ﬂag format:90 Types dependent on types
(1) ∗ :  (sort)
α : ∗
(2) α : ∗ (var) on (1)
x : α
(3) x : α (var) on (2)
It becomes also clear from this example that the (var)-rule introduced in
the present chapter is less general than the one in e.g. the system λ→ (see
Deﬁnition 2.4.5), since the present (var)-rule only allows the derivation of the
newly added, ﬁnal declaration x : A of the context. See lines (2) and (3) in the
derivation. In λ→, however, any declaration x : σ occurring in Γ, is derivable
with respect to this Γ.
It is a natural desire that we can do as much in our present system λω as in
λ→. So, for example, we want to be able to derive not only α : ∗, x : α  x : α,
but also:
(?1) α : ∗, x : α  α : ∗,
which is impossible with the present rules. Another judgement that we cannot
make yet, is:
(?2) α : ∗, β : ∗  α : ∗.
When we come to think about it, even the derivation of
(?3) α : ∗, β : ∗  β : ∗
is not possible, although β : ∗ is the ﬁnal declaration of the context α : ∗, β : ∗.
The reason is that we cannot yet obtain the premiss:
(?4) α : ∗  ∗ : ,
which is necessary for deriving (?3) with the (var)-rule.
All this will be repaired in the following section by the addition of the so-
called ‘weakening rule’.
4.3 The weakening rule in λω
The solution to the previously explained problem is the addition of a new rule.
This rule, called Weakening, allows us to ‘weaken’ the context of a judgement
by adding new declarations, provided that the ‘types’ of the new declarations
are ‘well-formed’. We ﬁrst state the rule and discuss it afterwards:
Deﬁnition 4.3.1 (Weakening rule)
(weak)
Γ  A : B Γ  C : s
Γ, x : C  A : B
if x ∈ Γ.4.3 The weakening rule in λω 91
The main eﬀect of this rule can be described as follows. Assuming that we
have derived the judgement Γ  A : B (ﬁrst premiss), then we may ‘weaken’
the context Γ by adding an arbitrary declaration at the end. So, the resulting
conclusion is Γ, x : C  A : B, i.e. A : B is also derivable in the extended
context.
There is one proviso: the type C of the added declaration should be well-
formed itself. This is expressed in the requirement given in the second premiss:
it should hold that Γ  C : s, i.e. C itself is derivable in the same context Γ
as something at level 2 when s ≡ ∗, or level 3 when s ≡ .
The fact that the context extension in the (weak)-rule is only allowed at the
end is easy to express and turns out to be suﬃcient. It is provable that any
extension of the context with a well-formed declaration is permissible, which is
a result of the Thinning Lemma which also holds for λω (cf. Lemmas 2.10.5(1)
and 3.6.4).
Remark 4.3.2 In type theory, one prefers the word ‘thinning’ for the general
process of inserting a new declaration in a given list of declarations, at an
arbitrary place. ‘Weakening’, however, is preferably used for extending such a
list at the end only. In both situations one adds more assumptions, and this
has indeed a ‘weakening’ (or ‘thinning’) eﬀect on what we express.
Now we are able to derive the missing judgements (?1) to (?4), mentioned at
the end of the previous section. We ﬁrst give the tree versions of the derivations,
in order to maintain a close correspondence to the format of the rules.
(?1) This is the resulting judgement (4) in the following derivation, in which
the (weak)-rule plays an important role.
(1) ∅  ∗ :  (1) ∅  ∗ : 
(var) (var)
(2) α : ∗  α : ∗ (2) α : ∗  α : ∗
(weak)
(4) α : ∗, x : α  α : ∗
It is interesting to see how two copies of line (2) have been used here as the
ﬁrst and the second premiss of the (weak)-rule, in order to obtain line (4) as
a conclusion. We take s ≡ ∗. Please check carefully what is happening here.
(?2) and (?4) In the following derivation, the ﬁnal conclusion (line (6))
solves question (?2). As a subresult, we also obtain an answer to question (?4):
see line (5), for which, again, two copies of the same judgement have been used
as left and right premisses.92 Types dependent on types
(1) ∅  ∗ :  (1) ∅  ∗ :  (1) ∅  ∗ : 
(var) (weak)
(2) α : ∗  α : ∗ (5) α : ∗  ∗ : 
(weak)
(6) α : ∗, β : ∗  α : ∗
Both cases of (weak) here are based on s ≡ .
(?3) The remaining question is solved in line (7) below.
(1) ∅  ∗ :  (1) ∅  ∗ : 
(weak)
(5) α : ∗  ∗ : 
(var)
(7) α : ∗, β : ∗  β : ∗
Finally, we condense all tree derivations as given in this and the previous
section into one ﬂag derivation:
(1) ∗ :  (sort)
α : ∗
(2) α : ∗ (var) on (1)
x : α
(3) x : α (var) on (2)
(4) α : ∗ (weak) on (2) and (2)
(5) ∗ :  (weak) on (1) and (1)
β : ∗
(6) α : ∗ (weak) on (2) and (5)
(7) β : ∗ (var) on (5)
Remark 4.3.3 Albeit that tree derivations reﬂect the derivation rules faith-
fully, they are not always easy to read, as we mentioned already in Section 2.5.
Firstly, tree derivations soon become inconveniently large and complex. Sec-
ondly, tree derivations tend to contain many repetitions of judgements, and
also of subtrees. See the trees above, for example, where line (1) has been writ-
ten seven times. The tree consisting of lines (1) and (2) has been repeated three
times.
A linear representation such as the ﬂag format is more distant from the
derivation rules as presented. It gives, however, a step-by-step impression of
the development of a derivation. Moreover, ﬂag derivations are considerably
more compact, as the above example demonstrates. In particular, the repetitions4.4 The formation rule in λω 93
that are inherent to a tree derivation are no longer necessary, since each line
in a ﬂag derivation can be used arbitrarily often. See, for example, the ﬂag
derivation above, where line (2) has been given only once, but has been appealed
to four times.
4.4 The formation rule in λω
In λ2 we had a formation rule called (form) for the construction of typing
statements in a context. The rule was based on a set T2 of λ2-types (see the
beginning of Section 3.4). As already noted in Section 4.2, types in λω are more
complex. Therefore, we introduce a ‘real’ derivation rule, with premisses and
conclusion, for the construction of types.
Moreover, we have also kinds in λω. But, thanks to the possibility of ‘double
roles’ in λω, things become easier than expected. The new (form)-rule, enabling
to form types and kinds, looks as follows:
Deﬁnition 4.4.1 (Formation rule)
(form)
Γ  A : s Γ  B : s
Γ  A → B : s
This covers all the types and kinds that we want. (Note that there are no
terms depending on types in λω, which has as a consequence that there are no
Π-types in λω.)
We give two examples of this rule, the ﬁrst one with s ≡ ∗. The omitted
subtrees above lines (6) and (7) can be found in the previous section.
...... ......
(6) α : ∗, β : ∗  α : ∗ (7) α : ∗, β : ∗  β : ∗
(form)
(8) α : ∗, β : ∗  α → β : ∗
Our second example has s ≡ :
...... ......
(5) α : ∗  ∗ :  (5) α : ∗  ∗ : 
(form)
(9) α : ∗  ∗ → ∗ : 
We can also give these results in ﬂag format, by extending the ﬂag derivation
of the previous section with two more lines:94 Types dependent on types
. . .
(8) α → β : ∗ (form) on (6) and (7)
(9) ∗ → ∗ :  (form) on (5) and (5)
4.5 Application and abstraction rules in λω
What remains are the (appl)- and (abst)-rules. We give them below.
The rules slightly diﬀer from the rules in Chapter 3 (see Figure 3.1). Firstly,
the names of the meta-variables for the types are diﬀerent (A instead of σ,
etcetera), because types in λω are more general. And secondly, in the (abst)-
rule we must be sure that A → B is a well-formed type. (Recall that we have
no Π-types in λω.) This is expressed as a second premiss of that rule in a
manner similar to what we did earlier in the present chapter.
(appl)
Γ  M : A → B Γ  N : A
Γ  MN : B
(abst)
Γ, x : A  M : B Γ  A → B : s
Γ  λx : A. M : A → B
Note that both have a double role again, since s ∈ {∗,}. Hence, the type
A → B, occurring in both (appl) and in (abst), may be a second level type
such as (α → β) → γ, when s ≡ ∗. But A → B can also be a third level type,
or kind, such as (∗ → ∗) → ∗, when s ≡ .
We still have not explained exactly how to extend β-reduction and β-con-
version to λω. This is a natural thing to do. We postpone the real deﬁnition
until later, and refer to the beginning of Section 4.1 for examples to show how
it works.
One of these examples was:
(λα : ∗. α → α)β →β β → β .
As a little exercise, let’s calculate the types of the two expressions. We start
with the left-hand side (λα : ∗. α → α)β, and derive its type in ﬂag format,
again as a continuation of the previous ﬂag derivation, but with an empty
context to start with.
Both (abst) and (appl) are used in the derivation: see lines (14) and (16). In
order to demonstrate graphically how these rules have been implemented, we
also give the corresponding part of the tree-formatted derivation.4.6 Shortened derivations 95
. . .
β : ∗
(10) ∗ :  (weak) on (1) and (1)
α : ∗
(11) α : ∗ (var) on (10)
(12) α → α : ∗ (form) on (11) and (11)
(13) ∗ → ∗ :  (form) on (10) and (10)
(14) λα : ∗. α → α : ∗ → ∗ (abst) on (12) and (13)
(15) β : ∗ (var) on (1)
(16) (λα : ∗. α → α) β : ∗ (appl) on (14) and (15)
(12) β : ∗, α : ∗  α → α : ∗ (13) β : ∗  ∗ → ∗ : 
(abst)
(14) β : ∗  λα : ∗. α → α : ∗ → ∗
(15) β : ∗  β : ∗
(appl)
(16) β : ∗  (λα : ∗. α → α) β : ∗
The derivation corresponding to the right-hand side, β → β , is simple; we
only need line (15) for this:
. . .
(17) β → β : ∗ (form) on (15) and (15)
Judgements (16) and (17) demonstrate that left-hand side and right-hand
side of the example β-reduction have the same types, corresponding to the
same contexts. This is as expected: cf. the Subject Reduction Lemma 2.11.5.
## 4.6 Shortened derivations
Derivations like the ones given in the previous sections, leading to a judgement
in λω, have both interesting and uninteresting components. For example, the
judgement
(8) α : ∗, β : ∗  α → β : ∗
has been constructed from judgements (6) and (7) by means of the (form)-rule.
These judgements, in turn, depend on (1), (2) and (5), as can be established
by inspecting either the trees or the ﬂag derivations.96 Types dependent on types
We list these judgements below:
(1) ∅  ∗ :  (sort),
(2) α : ∗  α : ∗ (var),
(5) α : ∗  ∗ :  (weak),
(6) α : ∗, β : ∗  α : ∗ (weak),
(7) α : ∗, β : ∗  β : ∗ (var).
No less than ﬁve judgements are needed to establish (8). However, all the
judgements mentioned, including (8), look very obvious.
These kinds of not-so-interesting steps occur in particular in three cases:
(i) when using the rules (sort), (var) and (weak),
(ii) when using (form), and
(iii) when establishing the validity of the second premiss of the (abst)-rule.
Note that case (i) applies to all ﬁve judgements used in the derivation of (8).
All these are ‘obviously’ well-formed judgements. Case (ii) applies to (8). Cases
(ii) and (iii) are precisely the cases when we want to make sure that something
is a well-formed type.
We like to focus our attention on the really interesting steps, as in Chapters 2
and 3 (see, for example, the shortened derivation in Section 2.5). Therefore we
will allow skipping all judgements which are obvious as such, or only intended
to establish that something is a well-formed type.
Remark 4.6.1 This is of course a debatable decision, since we are no longer
as precise as we actually should be. But humans tend to make errors when they
lose their concentration, and this easily happens when one does uninteresting
steps. Moreover, our system being completely formal enables us to leave the
ﬁnal check to a computer program, which has no problems in ﬁlling in the
omitted judgements. Therefore, we feel it is permissible to skip ‘uninteresting’
steps in the rest of this book.
A consequence is that the (form)-rule will be rarely appealed to from now
on, and the use of (sort), (var) and (weak) will be minimal.
To demonstrate what we win when employing this convention, we give the
shortened version of the ﬂag derivation of (16), as given in the previous section:
(a) β : ∗
(b) α : ∗
(12) α → α : ∗ (form) on (b) and (b)
(14) λα : ∗. α → α : ∗ → ∗ (abst) on (12)
(16) (λα : ∗. α → α)β : ∗ (appl) on (14) and (a)4.7 The conversion rule 97
Comparing these two derivations, the following may be noticed:
− The second derivation is compact and directly understandable, in particular
when read in the goal-directed (bottom-to-top) direction.
− We may immediately refer to what is in the ﬂags: compare the two versions
of (12), and of (16).
− The rule (form) has been skipped in the shortened version, but judge-
ment (12) must remain since it is necessary for (14).
− We allow (abst) to be used with a reference to the ﬁrst premiss only, ne-
glecting the second one: see the new (14).
## 4.7 The conversion rule
In this section we come back to β-reduction and β-conversion in λω, and their
consequences for typing. We recall the following λω example of β-reduction,
discussed in Sections 4.1 and 4.5:
(λα : ∗. α → α)β →β β → β .
We derived type ∗ for the left-hand side in the previous section, in context
β : ∗ (see line (16)). By the (var)-rule then follows:
β : ∗, x : (λα : ∗. α → α)β  x : (λα : ∗. α → α)β.
What we naturally want is that also:
β : ∗, x : (λα : ∗. α → α)β  x : β → β,
since β-convertible types are intentionally ‘the same’ types.
However (and this may come as a surprise), the latter judgement cannot be
derived, because our derivation system is too weak to draw that conclusion.
The transition from the type (λα : ∗. α → α)β to the type β → β is a case of
the more general β-conversion. Obviously, the following is what we want:
If M has type B and B =β B, then M also has type B
(provided that both B and B are well-formed types or kinds).
Since we cannot yet derive this in our system λω, we need an extra derivation
rule. This rule, called the conversion rule, is expressed as follows:
Deﬁnition 4.7.1 (Conversion rule)
(conv)
Γ  A : B Γ  B : s
Γ  A : B if B =β B.
Note that, in the above rule, B is already well-formed since it appears as a
type in the judgement Γ  A : B. In order to guarantee that B is well-formed
as well, we add the second premiss: Γ  B : s. (So when s ≡ ∗, we have that
B is a well-formed type, and when s ≡ , we have that B is a well-formed
kind.)98 Types dependent on types
Remark 4.7.2 One could wonder whether the second premiss in the conver-
sion rule is really necessary: the ﬁrst premiss implies that B is well-formed;
isn’t B then automatically well-formed, as well, since B =β B?
The answer is: no. It holds, for example, that β → γ =β (λα : ∗. β → γ)M,
for any term M. Now the left-hand side β → γ is a well-formed type, but the
right-hand side (λα : ∗. β → γ)M may easily be ‘wrong’, e.g. when M has not
the type ∗.
As an example, we picture the key part of the tree derivation corresponding
to the judgements above. Let Γ ≡ β : ∗, x : (λα : ∗. α → α)β.
(18) Γ  x : (λα : ∗. α → α)β (19) Γ  β → β : ∗
(conv)
(20) Γ  x : β → β
Notwithstanding what has been said in Remark 4.7.2, we allow that the
second premiss in the conversion rule is suppressed in a shortened derivation,
as soon as it is immediately clear that the B under consideration is a well-
formed type. This is in line with our convention in the previous section.
As an example, we express the part of the tree given above as a ﬂag-
formatted, shortened derivation; hence, we omit the second premiss of (conv),
viz. line (19).
. . .
x : (λα : ∗. α → α)β
(18) x : (λα : ∗. α → α)β (var) on (16)
(20) x : β → β (conv) on (18)
In order to make perfectly clear what the diﬀerence is between subject re-
duction and the conversion rule, we give the following scheme:
Γ  A : B
↓ β
A
Γ  A : B
Subject Reduction
(a theorem)
Γ  A : B
↓ β
B
Γ  A : B
if Γ  B : s
Type Reduction
(subcase of (conv))
Γ  A : B
=β
B
Γ  A : B
if Γ  B : s
Conversion
(the rule (conv))
Subject Reduction states that if we reduce the subject of a judgement, keep-4.8 Properties of λω 99
ing the type as it is, we obtain a judgement that is derivable again. It can be
proved in λω without the Conversion rule.
Type Reduction states that if we reduce the type of a judgement, we ob-
tain a derivable judgement again. But this is not provable in λω without the
Conversion rule. Note that Type Reduction is a special case of the Conversion
rule.
For convenience, we end this section with a list of all λω-rules (see Fig-
ure 4.1).
(sort) ∅  ∗ : 
(var)
Γ  A : s
Γ, x : A  x : A
if x ∈ Γ
(weak)
Γ  A : B Γ  C : s
Γ, x : C  A : B
if x ∈ Γ
(form)
Γ  A : s Γ  B : s
Γ  A → B : s
(appl)
Γ  M : A → B Γ  N : A
Γ  MN : B
(abst)
Γ, x : A  M : B Γ  A → B : s
Γ  λx : A. M : A → B
(conv)
Γ  A : B Γ  B
: s
Γ  A : B if B =β B
Figure 4.1 Derivation rules for λω
4.8 Properties of λω
The system λω satisﬁes the majority of the nice properties of previous systems
(see Sections 2.10, 2.11 and 3.6).
However, the conversion rule requires a slight modiﬁcation of the Uniqueness
of Types Lemma: types need no longer be literarily unique, but they are unique
up to conversion:
Lemma 4.8.1 (Uniqueness of Types up to Conversion)
If Γ  A : B1 and Γ  A : B2, then B1 =β B2.
We do not give a proof of this lemma.100 Types dependent on types
## 4.9 Conclusions
We have studied generalised types, which themselves also depend on types.
Some of the constructs obtained are (proper) type constructors, i.e. functions
that are not types, but that deliver types when applied to the right arguments.
In extending our set of types, we also needed to extend our singleton set of
super-types: ∗ alone is not enough, we obtain kinds built from ∗ and →. We
also extended the already obtained three levels by a fourth: that of the super-
super-type . The system resulting from these extensions is λω.
As to the derivation rules for λω, we have a (sort)-rule stating that ∗ is of
type . Moreover, we need a new (var)-rule for variables, and a weakening
rule (weak) for contexts of judgements. In order to construct types inside the
derivation system, we have introduced the formation rule (form).
The application rule (appl) and abstraction rule (abst) in λω are more or less
as expected. They are single, straightforward rules, which need not be doubled
as in λ2. One reason for this is that there are no Π-types in λω. Another reason
is the important double role of most of the rules in λω, in particular of (appl)
and (abst).
When making actual derivations in λω, it turns out that many steps are not
very interesting. To cope with this, we have allowed shortened derivations, in
which some of the necessary checks are deliberately left out. Although this is a
debatable decision, it makes the derivations shorter and more manageable for
humans.
Finally, we have added the conversion rule (conv), which allows us to replace
a type by a (‘well-formed’) convertible type.
The system λω satisﬁes many of the nice properties of previous systems
(λ→, λ2). But, in order to deal with convertible types originating from the
conversion rule, the Uniqueness of Types Lemma has to be adapted.
## 4.10 Further reading
J.-Y. Girard was the ﬁrst one to study the phenomenon of ‘types depending
on types’ in his PhD thesis (Girard, 1972), as an extension of his system F
(see Section 3.8) to system Fω. His goal was to study the class of functions
that one can prove to be total in higher order arithmetic. It turns out that this
class coincides exactly with the functions that can be deﬁned in Fω.
The ‘types depending on types’ feature is usually not studied in isolation,
but combined with polymorphism as introduced in Chapter 3 (see Exam-
ples 3.1.1(2)). The system λω is basically only deﬁned as a transition to Fω
or the Calculus of Constructions (see Chapter 6).
In modern functional languages, e.g. in Haskell (Peyton Jones et al., 1998),Exercises 101
we see ‘types depending on types’ in the form of type constructors: if Listσ
is the type of lists over the carrier type σ (so l : Listσ is a list consisting
of terms of type σ), then one would like to abstract from the carrier. Then
we view List : ∗ → ∗ as a ‘type constructor’, taking a type σ to the type of
lists over σ. The ‘length’ function then can be given the polymorphic type
Πα : ∗. Listα → nat, which is ‘borrowed’ from λ2.
Exercises
## 4.1 Give a diagram of the tree corresponding to the complete tree derivation
of line (16) of Section 4.5.
## 4.2 Give complete λω-derivations, ﬁrst in tree format and then in ﬂag format
(not shortened), of the following judgements:
(a) ∅  (∗ → ∗) → ∗ : ,
(b) α : ∗, β : ∗  (α → β) → α : ∗.
4.3 (a) Give a complete (i.e. not shortened) λω-derivation in ﬂag format of
α,β : ∗, x : α, y : α → β  y x : β.
(b) Give a shortened λω-derivation in ﬂag format of
α,β : ∗, x : α, y : α → β, z : β → α  z(y x) : α.
## 4.4 Give shortened λω-derivations in ﬂag format of the following judgements:
(a) α : ∗, β : ∗ → ∗  β(β α) : ∗,
(b) α : ∗, β : ∗ → ∗, x : β(β α)  λy : α. x : α → β(β α),
(c) ∅  λα : ∗. λβ : ∗ → ∗. β(β α) : ∗ → (∗ → ∗) → ∗,
(d) ∅  (λα : ∗. λβ : ∗ → ∗. β(β α)) nat (λγ : ∗. γ) : ∗, assuming that
nat is a constant of type ∗.
## 4.5 Give a shortened λω-derivation in ﬂag format of the following judgement:
α : ∗, x : α  λy : α. x : (λβ : ∗. β → β)α.
4.6 (a) Prove that there are no Γ and N in λω such that Γ   : N is
derivable.
(b) Prove that there are no Γ, M and N in λω such that Γ  M→  : N
is derivable.
4.7 (a) Give λω-deﬁnitions of the notions legal term, statement, λω-context
and domain.
(b) Formulate the following theorems for λω: Free Variables Lemma,
Thinning Lemma, Substitution Lemma.5
Types dependent on terms
## 5.1 The missing extension
In the previous three chapters, we have met the following dependencies:
− Chapter 2: terms depending on terms, in the basic system λ→.
− Chapter 3: terms depending on terms + terms depending on types, in the
system λ2, extending λ→.
− Chapter 4: terms depending on terms + types depending on types, in the
system λω, also extending λ→.
Clearly, there is one extension missing, and that’s the one we deal with now:
− Chapter 5: terms depending on terms + types depending on terms. This
gives us the system λP, another extension of λ→.
A type depending on a term has the general format:
λx : A. M ,
where M is a type, and x a term-variable (then A must be a type). The
abstraction λx : A. M then depends on the term x.
In correspondence with Remark 4.1.2, we note that ‘a type depending on a
term’, such as λx : A. M, is actually a type-valued function or type constructor.
We start with motivating examples, showing some of the useful features of
the novel extension, particularly when using type theory for logic and mathe-
matics.
In order to get an idea of the usefulness of types-depending-on-terms, we
specialise the type M in the general expression λx : A. M to either sets or
propositions:
(1) Let Sn be a set for each n : nat. Informally speaking, each of those sets
can be considered as a type. Then λn : nat . Sn is also a type (to be precise:
a type constructor), depending on the term n. One can also say: λn : nat . Sn
is the function mapping term n to the set Sn, a so-called set-valued function.104 Types dependent on terms
Other terminology that is used for λn : nat . Sn is that it is a family of types
(one type for every n : nat) or an indexed type (indexed by n : nat).
For example, let Sn = {0,n,2n,3n,...}, the set of all non-negative multiples
of n. Then λn : nat . Sn maps:
− natural number 0 to the set {0},
− natural number 1 to the set nat (the set of all natural numbers),
− natural number 2 to the set {0,2,4,6,...} (the set of the even naturals),
etcetera.
What is the type of λn : nat . Sn? Since n : nat and Sn : ∗, this type clearly
should be nat → ∗.
A more common example is the following, presupposing that we have the
notion ‘ﬁnite sequence of naturals’ at our disposal: assume that v1,...,vn
represents a sequence of n natural numbers.
Now let Vn = {v1,...,vn|vi ∈ N}, the set of all natural number sequences
(‘vectors’) of length n. Then λn : nat . Vn maps n to the set of all vectors of
length n.
The type of λn : nat . Vn is again nat → ∗.
(2) Now take Pn to be a proposition for each n : nat. Let’s consider propo-
sitions as types, again. Then λn : nat . Pn is also a type (to be precise: a type
constructor), depending on the term n. One can also say: λn : nat . Pn is the
function mapping term n to the proposition Pn, so it is a proposition-valued
function.
Such a function represents what in logic is called a predicate. For example,
take Pn to be the proposition ‘n is a prime number’. Then λn : nat . Pn is the
logical predicate ‘to be a prime number’ (for naturals).
The logical predicate λn : nat . Pn, applied to a given n, may hold (be true
for that n) or not (be false for that n).
With Pn as above, the predicate λn : nat . Pn maps for example:
− natural number 3 to the proposition ‘3 is a prime number’ (which is true),
− natural number 4 to the proposition ‘4 is a prime number’ (which is false).
Again, the type of λn : nat . Pn is nat → ∗.
In mathematics there are many set-valued functions, and both in logic and
mathematics the notion ‘predicate’ is of paramount importance. So the exten-
sion of λ→ with types-depending-on-terms has useful applications.
Remark 5.1.1 In part (2) above, we consider propositions as types. This
is the so-called PAT-interpretation, which we have already mentioned in Sec-
tion 2.9. It is the ﬁrst step to a very fruitful treatment of proofs in formal logic5.2 Derivation rules of λP 105
and mathematics. See the forthcoming Section 5.4 for examples that provide a
convincing introduction to this powerful and fundamental pillar of type theory.
As we have mentioned before, the system obtained from λ→ by extending
it with types-dependent-on-terms, is called λP. It will not come as a surprise
now, that the letter ‘P’ in λP comes from predicate.
By applying the above-mentioned type constructors to a term we obtain:
− (λn : nat . Sn)3,
− (λn : nat . Pn)3.
Both expressions represent types, depending on a term (viz. 3). In the ﬁrst
case, β-reduction gives S3 (which is the set of all non-negative multiples of 3);
in the second case we obtain P3 (the proposition ‘3 is a prime number’).
## 5.2 Derivation rules of λP
The derivation rules of λP have a great resemblance to the rules of λω (see
Figure 4.1 on page 99). The rules (sort), (var) and (weak) in λP are even
identical to the ones in λω. The same holds for (conv), the Conversion rule.
In Figure 5.1 we give a list of all λP-rules.
(sort) ∅  ∗ : 
(var)
Γ  A : s
Γ, x : A  x : A
if x ∈ Γ
(weak)
Γ  A : B Γ  C : s
Γ, x : C  A : B
if x ∈ Γ
(form)
Γ  A : ∗ Γ, x : A  B : s
Γ  Πx : A. B : s
(appl)
Γ  M : Πx : A. B Γ  N : A
Γ  MN : B[x := N]
(abst)
Γ, x : A  M : B Γ  Πx : A. B : s
Γ  λx : A. M : Πx : A. B
(conv)
Γ  A : B Γ  B
: s
Γ  A : B if B =β B
Figure 5.1 Derivation rules for λP106 Types dependent on terms
The main diﬀerences with respect to λω are:
(i) An upgrading of the →-types. The main novelty is the reappearance of
Π-types. In the rules (form), (appl) and (abst) of λP, we do not ﬁnd →-types
A → B, but Π-types Πx : A. B instead. Of course, this is more than a simple
change in notation: it is a real generalisation, since variable x may occur as a
free variable in B. As a consequence, we no longer have the simple situation of
a function type, consisting of all functions from input type A to a ﬁxed output
type B. Instead, we have a dependent product in which the output type depends
on the value x chosen in the input type A.
(ii) A downgrading of the input types. In λP, we have types dependent on
terms, but no types dependent on types, such as Πα : ∗. α → α in λω. Hence,
a type Πx : A. B in λP has the property that x is a term, so A can only have
type ∗, not . See the (form)-rules of λP and λω.
Apart from the mentioned diﬀerences between λω and λP, we note the fol-
lowing consequences of the fact that B in Πx : A. B may depend on x:
As to (form): We have to extend the context of the second premiss, by
changing Γ into Γ, x : A.
As to (appl): We have to choose the ‘proper’ output type B[x := N], corre-
sponding to the input value N taken for x.
Note again the double role of many of the rules, so that they are useable at
diﬀerent levels.
For example, for the (form)-rule we have the following possibilities:
(1) s = ∗. Then A : ∗, B : ∗ and Πx : A. B : ∗,
(2) s = . Then A : ∗, B :  and Πx : A. B : .
Consider the following concrete examples of the above Π-types:
(1) Πn : nat . nat : ∗,
(2) Πn : nat. ∗ : .
We have already met inhabitants of these Π-types:
(1) λn : nat . f(fn) : Πn : nat . nat (cf. Examples 3.1.1(2)),
(2a) λn : nat . Sn : Πn : nat. ∗ (Section 5.1(1)),
(2b) λn : nat . Pn : Πn : nat. ∗ (Section 5.1(2)).
Notation 5.2.1 In λP, we write A → B for Π-type Πx : A. B if we are sure
that x does not occur free in B. However, ‘oﬃcially’ we have only Π-types in
λP, and no →-types.
System λP has the same nice properties as λ2 and λω, albeit in a slightly
diﬀerent format because our terms and types are a bit diﬀerent. We do not
give a list of these properties now, but postpone this to the following chapter,
where all relevant properties are given and described in a general format.5.3 An example derivation in λP 107
Remark 5.2.2 The Formation rule, (form), is also called the Product rule,
since it enables the construction and typing of a Π-type (see Section 3.2).
Martin-Löf (1980) calls a Π-type the Cartesian product of a family of types.
If one considers A to be a ﬁnite type, say with two elements a1 and a2, then
Πx : A. B is indeed the same as B[x := a1]×B[x := a2], the Cartesian product.
So, Π-types can both be seen as a generalisation of the Cartesian product and
as a generalisation of the function space (if x / ∈ FV(B), then Πx : A. B is
just A → B).
## 5.3 An example derivation in λP
We give an example of a derivation in λP, starting from scratch. We use the
ﬂag format and leave it as an exercise to the reader to verify that the λP-rules
are properly used.
We ﬁrst derive the following simple judgements in λP:
(1) ∗ :  (sort)
A : ∗
(2) A : ∗ (var) on (1)
(3) ∗ :  (weak) on (1) and (1)
x : A
(4) ∗ :  (weak) on (3) and (2)
(5) A → ∗ :  (form) on (2) and (4)
All of these are also derivable in λω, as shown in the previous chapter, except
the last one. In line (5) we derive the super-type A → ∗, i.e. Πx : A. ∗. Here
we have types of diﬀerent level left and right of the →. This was not possible
in λω. Note that A → ∗ is a kind depending on a term, and a P : A → ∗ is a
type depending on a term, although this is not immediately visible: the term
they depend on is the x in the unabbreviated form of A → ∗, viz. Πx : A. ∗.
The new type A → ∗ may have inhabitants. For example, we may assume
that P is an inhabitant and continue the derivation with this assumption:
. . .
P : A → ∗
(6) P : A → ∗ (var) on (5)
(7) A : ∗ (weak) on (2) and (5)
(8) ∗ :  (weak) on (3) and (5)108 Types dependent on terms
Adding a variable x of type A, again, gives more possibilities; for example,
we can apply P to x to obtain the type P x:
. . .
x : A
(9) x : A (var) on (7)
(10) P : A → ∗ (weak) on (6) and (7)
(11) P x : ∗ (appl) on (10) and (9)
Line (11) enables us to construct a ‘real’ dependent type, Πx : A. P x, with
variable x occurring in ‘body’ P x:
. . .
(12) Πx : A. P x : ∗ (form) on (7) and (11)
After raising a new ﬂag x : A (with a ‘new’ variable, called x again by abuse
of notation), we can derive other consequences of line (11): ﬁrst, we show that
also the type P x → P x is derivable, and next we construct another Π-type,
viz. Πx : A. P x → P x. It is mere technique to show the validity of these
judgements and we leave it to the reader to see what’s happening:
. . .
x : A
y : P x
(13) P x : ∗ (weak) on (11) and (11)
(14) P x → P x : ∗ (form) on (11) and (13)
(15) Πx : A. P x → P x : ∗ (form) on (7) and (14)
Finally, we show that this Πx : A. P x → P x is inhabited, i.e. there is a
term of this type. This requires new ﬂags x : A and y : P x, and the use of
the (abst)-rule, twice:
. . .
x : A
y : P x
(16) y : P x (var)on(11)
(17) λy : P x. y : P x → P x (abst)on(16)and(14)
(18) λx : A. λy : P x. y : Πx : A. P x → P x (abst)on(17)and(15)5.4 Minimal predicate logic in λP 109
Remark 5.3.1 Also in λP, many rules have a double role, since the s may
be either ∗ or . Check yourself that s ≡  has been used in lines (2), (3), and
(5) to (8) of the above derivation, whereas s ≡ ∗ holds for the justiﬁcations of
lines (4), (9), (10), and (12) to (18).
So altogether, we have obtained a derivation which can be seen as a solution
to several questions (cf. Section 2.6), all condensed in line (18):
(Q1) Well-typedness: ﬁnd out whether λx : A. λy : P x. y is well-typed.
(Q2) Type Checking: check that
A : ∗, P : A → ∗  λx : A. λy : P x. y : Πx : A. P x → P x.
(Q3) Term Finding: ﬁnd a term of type Πx : A. P x → P x in the context
A : ∗, P : A → ∗.
We solved these questions ‘linearly’, starting from ∅  ∗ :  and building
our derivation step by step. Almost accidentally this culminated in judge-
ment (18). If one of the three questions above had been our starting point,
then a linear (‘forward’) build-up of the derivation is not the best approach:
see Remark 2.9.2.
As we did with λω-derivations (see Section 4.6), we may restrict ourselves to
shortened derivations in λP by omitting the majority of lines based on (sort),
(var), (weak) and (form), and by suppressing references to the second premiss
of the (abst)-rule.
When we apply this convention to the derivation above, we obtain the fol-
lowing, considerably shorter derivation:
(a) A : ∗
(b) P : A → ∗
(c) x : A
(11) P x : ∗ (appl) on (b) and (c)
(e) y : P x
(16) y : P x (var) on (11)
(17) λy : P x. y : P x → P x (abst) on (16)
(18) λx : A. λy : P x. y :
Πx : A. P x → P x (abst) on (17)
## 5.4 Minimal predicate logic in λP
In λP it is possible to code a very simple form of logic, called minimal pred-
icate logic, which only has implication and universal quantiﬁcation as logical110 Types dependent on terms
operations. The basic entities of this predicate logic are propositions, sets and
predicates over sets.
We already mentioned in Section 2.9 that the propositions-as-types inter-
pretation of logic (cf. Remark 5.1.1) also implies another nice and useful in-
terpretation: proofs-as-terms. Both notions are abbreviated by PAT and one
speaks about the PAT-interpretation of logic, covering both aspects.
We summarise the meaning of PAT as follows:
− If a term b inhabits type B (i.e. b : B), where B is interpreted as a propo-
sition, then we interpret b as a proof of B. Such a term b in type theory is
called a proof object.
− On the other hand, when no inhabitant of the proposition B exists (there is
no b with b : B), then there exists no proof of B, so B must be false.
Of course, the existence of an inhabitant of type B should be checked in a
type system such as λP, so one has to deliver a context Γ and a term b such
that Γ  b : B.
So the PAT-interpretation implies:
Proposition B is inhabited iﬀ B is true;
proposition B is not inhabited iﬀ B is false.
We now investigate the coding of the basic entities of minimal predicate logic
and apply the full PAT-interpretation in the appropriate cases.
I. Sets
We code a set S as a type, so S : ∗. Elements of sets are terms. So if a is an
element of set S, then a : S. (Of course, if S is the empty set, then there should
be no derivable term a with a : S.)
Examples: nat : ∗, nat → nat : ∗; 3 : nat, λn : nat . n : nat → nat.
II. Propositions
We also code propositions as types. So if A is a proposition, then A : ∗. Ac-
cording to the PAT-interpretation, a term p inhabiting such A codes a proof
of A. So if A is a true proposition, p being a proof of A, then p : A. (If there
is no proof of A, i.e. if A is false, then there is no such p inhabiting A.)
III. Predicates
As we saw in Section 5.1, a predicate P is a function from a set S to the set
of all propositions. So P : S → ∗.
We investigate this situation a bit further. If P is an arbitrary predicate
on S, i.e. P : S → ∗, then for each a : S we have that P a : ∗. All these P a5.4 Minimal predicate logic in λP 111
are propositions, which are types (level 2), so each P a may be inhabited. To
be precise:
(1) If P a is inhabited, so t : P a for some t, then the predicate holds for a.
(2) If P b is not inhabited, then the predicate does not hold for b.
Let’s now have a closer look at the logical operations of minimal predicate
logic, viz. implication and universal quantiﬁcation:
IV. Implication
In Section 2.4 (Example 2.4.9) we identiﬁed the logical implication A ⇒ B
with the type A → B. Using the PAT-interpretation, we can easily justify this
coding of ⇒ as →, by considering the following string of equivalences:
A ⇒ B is true;
if A is true, then also B is true;
if A is inhabited, then also B is inhabited;
there is a function mapping inhabitants of A to inhabitants of B;
there is an f with f : A → B;
A → B is inhabited.
So the truth of A ⇒ B is equivalent to the inhabitation of A → B. And
since in PAT, ‘truth’ is the interpretation of being inhabited, the following is
intuitively permitted:
We code the implication A ⇒ B in type theory as the function type A → B.
Remark 5.4.1 The propositions A and B are ‘independent’, hence we may
write A → B in case of an implication, instead of Πx : A. B, because x cannot
occur free in B.
A remarkable thing is now that we get the elimination rule and introduction
rule of the implication for free. We discussed this already for λ→ in Exam-
ple 2.4.9: there are narrow correspondences between the ⇒-elimination rule
from natural deduction and the (appl)-rule, and between the ⇒-introduction
rule and the (abst)-rule.
This is still the case for implications in λP. Writing A → B for Πx : A. B,
we obtain the following version of the (appl)-rule (familiar from λω):
(appl)
Γ  M : A → B Γ  N : A
Γ  MN : B
Similarly, we obtain the following version of the (abst)-rule:
(abst)
Γ, x : A  M : B Γ  A → B : s
Γ  λx : A. M : A → B112 Types dependent on terms
We invite the reader to compare these rules with the (⇒-elim)-rule and the
(⇒-intro)-rule given in Example 2.4.9.
V. Universal quantiﬁcation
Now consider the universal quantiﬁcation ∀x∈S(P(x)) of some predicate P de-
pending on x, over a set S. What is ∀x∈S(P(x)) under the PAT-interpretation?
Again, we can make a string of equivalences:
∀x∈S(P(x)) is true;
for each x in the set S, the proposition P(x) is true;
for each x in S, the type P x is inhabited;
there is a function mapping each x in S to an inhabitant of P x
(such a function has type Πx : S . P x);
there is an f with f : Πx : S . P x;
Πx : S . P x is inhabited.
So, similarly to the case of implication, we have found a way to code universal
quantiﬁcation in type theory: we code the universal quantiﬁcation ∀x∈S(P(x))
as the Π-type Πx : S . P x.
Remarks 5.4.2 (1) The ‘logico-mathematical’ proposition P(x), i.e. predi-
cate P for value x, has been coded as the type-theoretic term P x.
(2) Πx : S . P x is a type (constructor) depending on a term, x, which actu-
ally occurs in the body P x.
Just as in the case of implication, the elimination and introduction rules
for ∀ turn out to be a special case of the (appl)- and (abst)-rules of λP.
Va. (∀-elim) versus (appl)
First we recapitulate the (∀-elim)-rule:
(∀-elim)
∀x∈S(P(x)) N ∈ S
P(N)
The content of this rule is: ‘If we know that for all x in set S, proposition P
holds for x, then we may conclude that P holds for N, for given N in S.’
Next, we repeat (appl):
(appl)
Γ  M : Πx : A. B Γ  N : A
Γ  MN : B[x := N]
The correspondences are clear, when we consider the following:
(1) The ∀ in (∀-elim) is coded as Π in (appl).
(2) The S corresponds to A.5.4 Minimal predicate logic in λP 113
(3) The P(x) in (∀-elim) is B in (appl), hence P(N) becomes B[x := N].
(4) In (appl), every judgement has a context. In (∀-elim) the context is tradi-
tionally left implicit.
(5) In (appl) there are proof objects added for the proposition Πx : A. B
(viz. M) and for the proposition B[x := N] (viz. MN). This is possible by
the PAT-interpretation, and necessary because we need ‘full’ judgements
in λP.
The corresponding reading of (appl) in the Π=∀-case is: ‘If we know that (in
a certain context) M is a proof of ∀x : A. B, and if (in the same context) N
is of type A, then MN is (in that context) a proof of B[x := N].’
This matches the earlier given reading of (∀-elim).
Vb. (∀-intro) versus (abst)
The correspondence between (∀-intro) and (abst) is similar, as we show below.
First, we give the (∀-intro)-rule in ﬂag style:
Let x ∈ S
. . .
P(x)
(∀-intro)
∀x∈S(P(x))
The rule says the following: ‘If we can show, for arbitrary x ∈ S, that
predicate P holds for x, then we may conclude that P holds for all x ∈ S.’ The
‘arbitrariness’ of x is expressed by putting x in a ﬂag.
The type-theoretic counterpart of this rule is (abst), which we repeat below:
(abst)
Γ, x : A  M : B Γ  Πx : A. B : s
Γ  λx : A. M : Πx : A. B
The correspondences (and diﬀerences) are obvious:
(1) The second premiss in (abst) does not occur in (∀-intro), so we should
dismiss it in our comparison. This second premiss only serves to ensure
that Πx : A. B is well-formed, whereas in (∀-intro) it was taken for granted
that ∀x∈A(P(x)) is an ‘acceptable’ expression.
(2) Again, ∀ is coded as Π.
(3) In (∀-intro), the context Γ is implicit. Only the context extension with
x : S (in the ﬂag) is given explicitly.
(4) Again, the S has been changed into A, and the P(x) has become a B.
(5) Finally, proof objects have been added in (abst) with respect to (∀-intro),
namely: M as a proof of B, and λx : A. M as a proof of Πx : A. B.114 Types dependent on terms
Remark 5.4.3 In retrospect, we now have some interesting interpretations
for judgements in Section 5.3. Let Γ ≡ A : ∗, P : A → ∗.
(12) Γ  Πx : A. P x : ∗ , can be read as:
‘If A is a set and P a predicate over A, then ∀x∈A(P(x)) is a proposition.’
(15) Γ  Πx : A. P x → P x : ∗ , expresses:
‘In the same setting, ∀x∈A(P(x) ⇒ P(x)) is a proposition.’
(18) Γ  λx : A. λy : P x. y : Πx : A. P x → P x , says:
‘And moreover, there is an inhabitant λx : A. λy : P x. y of the proposition
∀x∈A(P(x) ⇒ P(x)).’ Hence, by the PAT-interpretation, ∀x∈A(P(x) ⇒ P(x))
is a logical tautology, and λx : A. λy : P x. y a coded version of its proof.
Note that ∀x∈A(P(x)) is not a tautology, and indeed, no inhabitant can be
found for Πx : A. P x.
So we now have a coding of minimal predicate logic by means of the deriva-
tion rules of λP.
In Figure 5.2 we summarise what we have found. Note that we have neither
negation in minimal predicate logic (or λP), nor do we have conjunction, dis-
junction or the existential quantiﬁer. These things are not available in λP: we
need more, as we explain in the following chapter, where we combine several
systems. (In Chapter 7 we come back to the coding of logic in type theory.
General remarks about natural deduction can be found in Section 11.4.)
Minimal predicate logic The type theory of λP
S is a set S : ∗
A is a proposition A : ∗
a ∈ S a : S
p proves A p : A
P is a predicate on S P : S → ∗
A ⇒ B A → B (= Πx : A. B)
∀x∈S(P(x)) Πx : S . Px
(⇒-elim) (appl)
(⇒-intro) (abst)
(∀-elim) (appl)
(∀-intro) (abst)
Figure 5.2 Coding minimal predicate logic in λP5.5 Example of a logical derivation in λP 115
## 5.5 Example of a logical derivation in λP
In Section 5.3, when practising with the derivation rules of λP, we ﬁnally ob-
tained a judgement allowing a logical interpretation: line (18) can be seen as a
proof of the proposition ∀x∈A(P(x) ⇒ P(x)), as we mentioned in Remark 5.4.3.
In the present section, we demonstrate how such a result can be obtained
in a systematic manner, starting from the proposition-to-prove. We give an
example in minimal predicate logic, coded in λP.
Let S be a set and Q a binary predicate over S. Then the following propo-
sition is provable in minimal predicate logic:
∀x∈S∀y∈S(Q(x,y)) ⇒ ∀u∈S(Q(u,u)) .
We ﬁrst give its natural deduction proof, which is straightforward:
(a) Assume : ∀x∈S∀y∈S(Q(x,y))
(b) Let u ∈ S
(1) ∀y∈S(Q(u,y)) (∀-elim) on (a) and (b)
(2) Q(u,u) (∀-elim) on (1) and (b)
(3) ∀u∈S(Q(u,u)) (∀-intro) on (2)
(4) ∀x∈S∀y∈S(Q(x,y)) ⇒ ∀u∈S(Q(u,u)) (⇒-intro) on (3)
Remark 5.5.1 Line number (1) is a result of the (∀-elim)-rule:
− Flag (a) matches the ﬁrst premiss ∀x∈S(P(x)) in the (∀-elim)-rule, if we
take P such that P(x) ≡ ∀y∈SQ(x,y).
− For the second premiss N ∈ S, we take ﬂag (b), i.e. u ∈ S.
− Then the conclusion P(N) of the (∀-elim)-rule becomes P(u), which is in
the present case: ∀y∈S(Q(u,y)). (Note the u in the place of the x.)
Now we code the expression and its proof in λP.
First, we have to decide how to code the binary predicate Q over S × S. At
ﬁrst sight, this is an inhabitant of the type (S × S) → ∗, so we have to ﬁnd a
coding for the Cartesian product S × S.
However, we may also get round this by using Currying (see Remark 1.2.6):
we consider Q to be a composite unary predicate of type S → S → ∗, which
is S → (S → ∗). Hence, instead of ‘feeding’ Q immediately with a pair (a,b),
denoted Q(a,b), we give it a ﬁrst and b afterwards. This leads to Qab, which
is (Qa)b, hence Q applied to a where the result has been applied to b. Our
coding of the original proposition from minimal predicate logic now becomes:
Πx : S . Πy : S . Qxy → Πu : S . Quu.
We have to ﬁnd an inhabitant of this, so our task is:116 Types dependent on terms
(n) ? : Πx : S . Πy : S . Qxy → Πu : S . Quu.
In the above expression, both S and Q are untyped (or free) variables. Since
this is undesirable in a derivation system, we add a context of two ﬂags:
(a) S : ∗
(b) Q : S → S → ∗
. . .
(n) ? : Πx : S . Πy : S . Qxy → Πu : S . Quu
The type in (n) is an →-type, which reﬂects that the original logical propo-
sition is an implication. So it is natural to try the λP-variant of the (⇒-intro)-
rule. In part IV of Section 5.4 we formulated a simpliﬁed (abst)-rule for this
purpose. We can use this simpliﬁed (abst)-rule bottom-up; thereby we forget
about the second premiss (we make shortened derivations, as described in
Section 4.5):
(a) S : ∗
(b) Q : S → S → ∗
(c) z : (Πx : S . Πy : S . Qxy)
. . .
(m) ? : Πu : S . Quu
(n) ... : Πx : S . Πy : S . Qxy → Πu : S . Quu (abst)
Line (m) asks for (abst), again. Note that this time we cannot appeal to
the →-version of the (abst)-rule, described in Section 5.4, IV, since we have a
‘real’ Π-type. This is also visible in the natural deduction proof, where we use
(∀-intro), and not (⇒-intro), in the corresponding step. We obtain:
(a) S : ∗
(b) Q : S → S → ∗
(c) z : (Πx : S . Πy : S . Qxy)
(d) u : S
. . .
(l) ? : Quu
(m) ... : Πu : S . Quu (abst)
(n) ... : Πx : S . Πy : S . Qxy → Πu : S . Quu (abst)5.5 Example of a logical derivation in λP 117
The rest is not hard. Combining lines (c) and (d) with the (appl)-rule, twice,
gives exactly the desired result, since:
z u : Πy : S . Quy (note the u instead of the x), hence
z uu : Quu.
So ﬁnally, we can ﬁll in everything that is left open; as usual, we include the
arguments:
(a) S : ∗
(b) Q : S → S → ∗
(c) z : (Πx : S . Πy : S . Qxy)
(d) u : S
(1) z u : Πy : S . Quy (appl) on (c), (d)
(2) z uu : Quu (appl) on (1), (d)
(3) λu : S . z uu : Πu : S . Quu (abst) on (2)
(4) λz : (Πx : S . Πy : S . Qxy). λu : S . z uu :
Πx : S . Πy : S . Qxy → Πu : S . Quu (abst) on (3)
Compare this derivation with the logical one in the beginning of this section.
The derivation is a bit longer than the natural deduction proof, but it captures
the same content. Note that the derivation includes all the proof objects and
hence tells us exactly how the proof has been constructed. So the derivation
contains more information.
The ﬁnal conclusion in this derivation is the judgement (a), (b)  (4), i.e.:
S : ∗, Q : S → S → ∗  λz : (Πx : S . Πy : S . Qxy). λu : S . z uu :
Πx : S . Πy : S . Qxy → Πu : S . Quu.
So we have indeed found an inhabitant of the original goal type, namely
λz : (Πx : S . Πy : S . Qxy). λu : S . z uu.
This is the proof object proving the proposition. The proof object codes the full
proof of the theorem it proves. That is to say: from the proof object alone one
can already reconstruct the full derivation. So the above derivation contains, in
a sense, too much information. Of course, for a human reader the above version
is preferable, since it concisely shows how the proof has been constructed.
Remark 5.5.2 By calculating the type of a proof object, one obtains a coding
of the proposition it proves. There is a slight complication due to the (conv)-
rule. Assume that M is a proof object, and that a direct calculation of its type
gives expression N. Then it may be the case that the direct representation of the118 Types dependent on terms
proposition-to-prove is a diﬀerent expression N. However, if N =β N there
is no problem, since proof object M then also proves N by the (conv)-rule.
The context Γ of judgement (4), consisting of the declarations (a) and (b),
gives type information about S and Q. Note that in the above shortened
derivation, we do not call upon this information. However, when giving the
full derivation, we do need (a) and (b), as follows from Exercise 5.3.
## 5.6 Conclusions
In the present section we have extended the basic system λ→ with types de-
pending on terms. The system obtained, λP, diﬀers from λω in several aspects.
For example, the (form)-rule is less general; on the other hand: Π-types are
back as ﬁrst-class citizens.
System λP is particularly suited for coding set-valued functions and propo-
sition-valued functions. The latter functions are generally known as ‘predi-
cates’.
In λP we have the opportunity to investigate and use an extremely important
interpretation, being a foundational idea behind type theory as a whole: the
so-called propositions-as-types notion, or PAT. In this conception, propositions
are coded as types, and inhabitants of these types represent the proofs of these
propositions (‘proofs-as-terms’, which is a second reading of ‘PAT’). By means
of this PAT-interpretation, propositions are treated on a par (at least, to a large
extent) with sets, since propositions and sets are coded as types. Similarly,
there is a correspondence between proofs of propositions and elements of sets:
both are coded as terms of the types concerned.
This ‘double’ PAT-approach has already widely demonstrated its power and
fruitfulness. It enables type theory to be employed as a foundation of logic and
mathematics. In the present chapter we have given a hunch about how this
can be started.
Interesting features of λP are its possibilities of encoding
(1) basic mathematical notions, in particular: sets, propositions and predicates;
(2) basic logical notions: implication and universal quantiﬁcation.
These are the ingredients of minimal predicate logic.
There is a striking correspondence between the traditional way of reason-
ing in minimal predicate logic and the corresponding derivational approach in
λP. System λP can be seen as a more complete variant of minimal predicate
logic, including proof objects that encode the reasoning. The type-theoretic
translation of logical formulas is rather straightforward: ⇒ becomes →, and
∀ is represented by Π. The derivation rules of natural deduction in minimal5.7 Further reading 119
predicate logic on the one hand, and the derivation rules of λP on the other,
are comparable to a high degree.
## 5.7 Further reading
Ideas about dependent types were already present in the work of H.B. Curry on
‘illative logic’ (see e.g. Curry & Feys, 1958, Appendix A). The idea was to add
a constant to untyped λ-calculus (or combinatory logic) to single out the terms
representing well-formed propositions, and a constant to denote derivability. A
formal system based on these ideas was developed by J.P. Seldin in 1975, but
only published in Seldin (1979). See also the historic overview in Cardone &
Hindley (2009).
The ﬁrst system to actually use type theory to formalise mathematics was the
Automath system, developed by N.G. de Bruijn and his research team in the
early 1970s (de Bruijn, 1980; Nederpelt et al., 1994). See also the Automath
Archive (2004), a database containing copies of many original papers about
Automath. There are various Automath type theories and several of them
have been implemented as proof checkers. For two of the Automath languages,
AUT-68 and AUT-QE, F. Wiedijk has made new computer implementations,
written in C (see Wiedijk, 1999).
An interesting aspect of Automath is that it also used type theory and the
propositions-as-types interpretation in a diﬀerent way than as described in
this chapter. The ﬁrst Automath systems used what can be called the ‘Logi-
cal Framework’ interpretation of propositions-as-types (see below), which was
invented by de Bruijn in the late 1960s.
The propositions-as-types interpretation of minimal predicate logic into λP
we have described in the present chapter can be called the ‘Curry–Howard’
interpretation (or isomorphism), which was ﬁrst formally described in a paper
by W. Howard of 1968, which only appeared in print 12 years later (Howard,
1980). Later Automath systems, such as AUT-QE (1970; cf. Nederpelt et al.,
1994), also used the Curry–Howard interpretation, or combined the two. There-
fore, the ‘propositions-as-types’ interpretation is now often referred to as the
‘Curry–Howard–de Bruijn’ embedding.
The idea of the ‘Logical Framework’ interpretation is that we use λP as a
‘meta-calculus’ for doing logic: one can deﬁne a logic L in λP by choosing an
appropriate context ΓL. In ΓL, the language and the logical rules are declared.
Then one can employ the logic L by working in the context ΓL within the
type theory λP. The strength of this approach lies in the fact that λP deals
with the ‘meta-operations’ of binding and substitution that are present in any
formal system of logic. Important aspects that are usually left implicit in a120 Types dependent on terms
paper description of the logic, like avoiding the capture of free variables when
performing a substitution, are taken care of by the system λP.
The logical framework approach has been revived in the Edinburgh LF sys-
tem (Harper et al., 1987). There also the presentation with contexts was used.
(Automath uses a system with so-called ‘books’ and ‘lines’; see also Chapters 9
and 11, where we follow similar ideas.) The system Twelf (see Twelf Project,
1999) is a direct successor of Edinburgh LF; it is widely used in the United
States of America for formalisation and veriﬁcation in computer science.
In the period when de Bruijn introduced Automath, P. Martin-Löf intro-
duced his Intuitionistic Type Theory (Martin-Löf, 1980; Nordström et al.,
1990), which can be seen as an extension of λP with speciﬁc features to be
a foundation of intuitionistic mathematics. Martin-Löf’s primary aim was not
to lay the basis for a system for formalising mathematics, but to develop a
foundational system to capture the Brouwer–Heyting–Kolmogorov interpreta-
tion (Troelstra & van Dalen, 1988) of proofs. There are various versions of
intuitionistic type theory, some being intensional like λP and some being ex-
tensional. In extensional type theory, two types have the same inhabitants if
they are provably equal (not only if they are β-convertible). This conforms
with a set-theoretic view of mathematics, but it renders the type checking
undecidable, so therefore it has been abandoned by Martin-Löf.
Martin-Löf’s systems have been very inﬂuential in type theory. He extended
type theory with Σ-types to represent dependent products, and with inductive
types to make proofs by induction (and also functions deﬁned by well-founded
recursion) a primitive in the system. A Σ-type Σx : A. B represents the type
of the pairs a,b, such that a : A and b : B[x := a]; so the type B may
depend on the x of type A. These Σ-types (or a variant thereof) are very useful
for representing abstract mathematical structures, like ‘symmetric relations’,
consisting of tuples A,R where A is a type and R is a binary relation on
A that is symmetric. See also Sections 6.5 and 13.8 for more information on
Σ-types. Inductive types as primitives allow proofs by induction, but are also
very useful for representing data types and functional programs over them.
This enables one to specify functional programs and prove them correct.
These ideas have been followed by other systems, for example in the type
theory of the proof assistant Coq (see Coquand & Huet, 1988; Coq Devel-
opment Team, 2012), called the Calculus of Inductive Constructions (Bertot
& Castéran, 2004). Martin-Löf’s type theory itself has been implemented as a
proof assistant in the systems Nuprl (Constable et al., 1986), ALF (Magnusson
& Nordström, 1994) and Agda (Bove et al., 2009).
A recent text with special emphasis on the Curry–Howard isomorphism is
M.H. Sørensen and P. Urzyczyn’s Lectures on the Curry–Howard Isomorphism
(2006), which also treats other topics related to this book, such as simplyExercises 121
typed λ-calculus (cf. our Chapter 2), dependent types, the λ-cube (Chapter 6),
sequent calculus (Section 11.13) and arithmetic (Chapter 14). Another text
that explains ‘Curry–Howard’ is Simmons (2000), but its types are only simple
and its emphasis is more on computation than derivation.
Exercises
## 5.1 Give a diagram of the tree corresponding to the complete tree derivation
of line (18) of Section 5.3.
## 5.2 Give a complete (i.e. unshortened) λP-derivation of
S : ∗  S → S → ∗ : ,
(a) in tree format,
(b) in ﬂag format.
5.3 Extend the ﬂag derivation of Exercise 5.2(b) to a complete derivation of
S : ∗, Q : S → S → ∗  Πx : S . Πy : S . Qxy : ∗.
## 5.4 Prove that ∗ is the only legal kind in λP.
## 5.5 Prove that A ⇒ ((A ⇒ B) ⇒ B) is a tautology by giving a shortened
λP-derivation.
## 5.6 Prove that (A ⇒ (A ⇒ B)) ⇒ (A ⇒ B) is a tautology, (ﬁrst) in natural
deduction and (second) by means of a shortened λP-derivation.
## 5.7 Prove that the following propositions are tautologies by giving shortened
λP-derivations:
(a) (A ⇒ B) ⇒ ((B ⇒ C) ⇒ (A ⇒ C)),
(b) ((A ⇒ B) ⇒ A) ⇒ ((A ⇒ B) ⇒ B),
(c) (A ⇒ (B ⇒ C)) ⇒ ((A ⇒ B) ⇒ (A ⇒ C)).
5.8 (a) Let Γ ≡ S : ∗, P : S → ∗, Q : S → ∗. Find an inhabitant of
Πx : S . P x → Qx → P x with respect to Γ, and give a corresponding
(shortened) derivation.
(b) Give a natural deduction proof of the corresponding logical expres-
sion.
## 5.9 Give proofs that the following propositions are tautologies, (ﬁrst) in nat-
ural deduction and (second) by means of a shortened λP-derivation.
(a) ∀x∈S (Q(x)) ⇒ ∀y∈S(P(y) ⇒ Q(y)),
(b) ∀x∈S(P(x) ⇒ Q(x)) ⇒ (∀y∈S (P(y)) ⇒ ∀z∈S (Q(z))).
## 5.10 Consider the following context:
Γ ≡ S : ∗, P : S → ∗, f : S → S, g : S → S,
u : Πx : S . (P(f x) → P(g x)), v : Πx,y : S . ((P x → P y) → P(f x))
(cf. Notation 3.4.2).
Let M ≡ λx : S . v(f x)(g x)(ux).122 Types dependent on terms
(a) Make a guess at which type N may satisfy Γ  M : N.
(b) Demonstrate that the proof object M does indeed code a proof of the
proposition N you have guessed, by elaborating the λP-derivation
corresponding to M.
## 5.11 Let S be a set, with Q and R relations on S × S, and let f and g be
functions from S to S. Assume that ∀x,y∈S(Q(x,f(y)) ⇒ Q(g(x),y)),
∀x,y∈S(Q(x,f(y)) ⇒ R(x,y)), and ∀x∈S(Q(x,f(f(x)))).
Prove that ∀x∈S(R(g(g(x)),g(x))) by giving a context Γ and ﬁnding a
term M such that:
Γ  M : Πx : S . R (g(g x)) (g x).
Give the corresponding (shortened) λP-derivation.
## 5.12 In λP, consider the context
Γ ≡ S : ∗, R : S → S → ∗, u : Πx,y : S . Rxy → Ry x,
v : Πx,y,z : S . Rxy → Rxz → Ry z.
(a) Show that R is ‘reﬂexive on its domain’, by constructing an inhabitant
of the type Πx,y : S . Rxy → Rxx in context Γ; give a corresponding
(shortened) derivation.
(b) Show that R is transitive by constructing an inhabitant of the type
Πx,y,z : S . Rxy → Ry z → Rxz in context Γ; give a corresponding
(shortened) derivation.6
The Calculus of Constructions
## 6.1 The system λC
In this section we combine the systems of Chapters 2 to 5, so we obtain a system
with all four possible choices of ‘terms/types depending on terms/types’ (see
the beginning of Section 5.1).
The system thus obtained is known as λC, but also as Calculus of Construc-
tions or λ-Coquand, after one of its founders, Th. Coquand (see Coquand,
1985, and Coquand & Huet, 1988). So the letter ‘C’ in the name λC has many
references, and there’s still one more to come: the ‘c’ in the word λ-cube (see
below).
Technically, there is only one diﬀerence between λP and λC, but this is
enough to extend λP to λC = λ2 + λω + λP. The diﬀerence concerns the rule
(form), the formation rule. In λP this rule looks as follows:
(formλP)
Γ  A : ∗ Γ, x : A  B : s
Γ  Πx : A. B : s
As we noted in Section 5.2, the crucial point for λP in this rule is that A
must have type ∗, in order to guarantee that the inhabitants of Πx : A. B are
terms or types dependent on terms only (since x is a term, of level 1). But
when we lift this restriction, we get the generalisation we want: terms or types
depending on terms or types.
Hence, it appears to be suﬃcient to replace A : ∗ in the rule by A : s, with s
in {∗,}. However, we already have an s in the rule, since also B : s, and we
want to be able to choose the two s’s independently of each other.
Compare this with the (form)-rule of λω, where there is only one s involved,
so that we only have terms-dependent-on-terms and types-dependent-on-types,
but not the ‘cross-overs’:
(formλω)
Γ  A : s Γ  B : s
Γ  A → B : s124 The Calculus of Constructions
A neat way out is to use two s’s: an s1 and an s2. And this is exactly what
we do in the (form)-rule of system λC:
(formλC)
Γ  A : s1 Γ, x : A  B : s2
Γ  Πx : A. B : s2
So in the ﬁrst premiss we have s1 and in the second premiss we have s2,
which may be chosen independently of each other from {∗,} (four possible
choices). In the conclusion of the rule, s2 appears, again. So the type of
Πx : A. B is inherited from its body, viz. B. This is acceptable because:
(1) intuitively: if B is a type, then the generalised (‘dependent’) type Πx : A. B
should be a type as well; and if B is a kind, then Πx : A. B should be one,
too. This may not be a very convincing argument, since there are more general
systems of type theory where the type of Πx : A. B may be diﬀerent from
s1 and s2. (Such systems, developed by S. Berardi and J. Terlouw, are called
‘pure type systems’ or PTSs. In a PTS, the type of Πx : A. B becomes s3; this
leads to eight possible choices for (s1,s2,s3).)
(2) technically: in the (form)-rule of λC we just copy the features of the rules
(formλP) and (formλω), in which the types of B and Πx : A. B (or A → B)
are the same.
So what can we obtain with this rule (formλC)? Assume we have a function
λx : A. b of type Πx : A. B, that is constructed with the (abst)-rule (which is
identical to the one in λP, so b must be of type B). Then A is of type s1 and
B is of type s2 by the (form)-rule. This leads to the following possibilities:
x : A : s1 b : B : s2 (s1,s2) λx : A. b from
∗ ∗ (∗,∗) term-depending-on-term λ→
 ∗ (,∗) term-depending-on-type λ2
  (,) type-depending-on-type λω
∗  (∗,) type-depending-on-term λP
Clearly, all four possibilities from Chapters 2 to 5 can be realised. For exam-
ple, when (s1,s2) = (,∗), then we have terms dependent on types as in λ2;
from the table it follows that x then has level 2, that A has level 3 and that b
has level 1.
In order to be able to quickly recognise the nature of the dependencies in λ-
and Π-abstractions, we give the following diagrams:6.2 The λ-cube 125
λx : A. b
.. ..
s1 B
..
s2
Πx : A. B
.. ..
s1 s2
For example, in order to know in which subsystem of λC a certain λ-
expression λx : A. b can be formed, we calculate the type of A (say s1) and the
type of the type of b (say s2). Then the pair (s1,s2) tells us which combination
we need to have.
For a Π-expression Πx : A. B we calculate the types of A and B.
## 6.2 The λ-cube
We have encountered three extensions of the simplest system, λ→:
− with terms depending on types: λ2,
− with types depending on types: λω,
− with types depending on terms: λP.
These three possibilities are mutually independent. They may be visualised
as three perpendicular directions of extending λ→, giving a three-dimensional
system of coordinate axes (see Figure 6.1).
-
6
  1
λ→ to λP
to λω
to λ2
Figure 6.1 Directions of extending λ→
All three extensions together give λC, as we have seen in the previous section.
There are, of course, other possibilities of extension, by combining λ→ with
two of the three possibilities. The obtained systems are called λω, λP2 and
λPω, respectively. The decisive choice is what combinations of s1 and s2 are
allowed in the (form)-rule. These combinations are listed in Figure 6.2.
All eight systems can be positioned in a cube, the so-called λ-cube or Ba-
rendregt cube (see Figure 6.3).
Remark 6.2.1 The unifying framework for the eight systems was discov-
ered and described by H.P. Barendregt (see Barendregt, 1992). He investigated
the common properties and diﬀerences of existing type-theoretic systems and126 The Calculus of Constructions
system: combinations (s1,s2) allowed:
λ→ (∗,∗)
λ2 (∗,∗) (,∗)
λω (∗,∗) (,)
λP (∗,∗) (∗,)
λω (∗,∗) (,∗) (,)
λP2 (∗,∗) (,∗) (∗,)
λPω (∗,∗) (,) (∗,)
λPω = λC (∗,∗) (,∗) (,) (∗,)
Figure 6.2 The eight systems of the λ-cube
 
 
 
 
λ→ λP
λ2 λP2
λω λPω
λC λω
t r
r r
r r
t r
Figure 6.3 The λ-cube or Barendregt cube
investigated their relation. Thus he could identify some of these systems as
(essentially) λ2, λω, λP, and others as λP2, λω or λC.
The most striking result of Barendregt’s investigations is that the eight dif-
ferent systems can be described with only one set of derivation rules (see Fig-
ure 6.4). This set of rules is relatively simple: apart from three initialisation
rules (viz. (sort), (var) and (weak)), all that we need are a formation rule
(form) for Π-types, a conversion rule (conv) and the two fundamental rules for
every lambda calculus system, concerning application and abstraction.
Remark 6.2.2 N.G. de Bruijn’s Automath, the ﬁrst operative formal sys-
tem for formalising and checking mathematics, enjoys all relevant features of
λP, but is richer, as has been demonstrated by Kamareddine et al. (2004); also
some aspects of λ2 and λω are incorporated in it. In fact, one could position
Automath in the centre of the lateral face on the right-hand side of the depicted
λ-cube. Moreover, deﬁnitions are a core notion in Automath (their indispens-6.2 The λ-cube 127
ability will be argued in Chapter 8 and further). In other words, Automath ∼
λP + 1
2λ2 + 1
2λω + deﬁnitions.
In Figure 6.4 we give the complete list of rules for the eight systems of the
λ-cube. In which system we are depends on the combinations of (s1,s2) we
allow in the (form)-rule, according to the table in Figure 6.2.
(sort) ∅  ∗ : 
(var)
Γ  A : s
Γ, x : A  x : A
if x ∈ Γ
(weak)
Γ  A : B Γ  C : s
Γ, x : C  A : B
if x ∈ Γ
(form)
Γ  A : s1 Γ, x : A  B : s2
Γ  Πx : A. B : s2
(appl)
Γ  M : Πx : A. B Γ  N : A
Γ  MN : B[x := N]
(abst)
Γ, x : A  M : B Γ  Πx : A. B : s
Γ  λx : A. M : Πx : A. B
(conv)
Γ  A : B Γ  B
: s
Γ  A : B if B =β B
Figure 6.4 Derivation rules for the systems of the λ-cube
Remark 6.2.3 It will immediately be clear how the systems λω and λP,
as respectively described in Chapters 4 and 5, ﬁt in the general framework of
Figure 6.4:
− For λω, just see A → B as an abbreviation of Πx : A. B, and the rules given
in Figures 4.1 and 6.4 coincide. (Since (s1,s2) ∈ {(∗,∗),(,)} in λω, we
may take s1 = s2 = s.)
− For λP, restrict s1 of Figure 6.4 to s1 = ∗, and we obtain the rules in
Figure 5.1.
For λ→ and λ2 we have to do a little more work to see that their original
deﬁnitions in Chapters 2 and 3 ﬁt in Figure 6.4. In the original versions of
λ→ and λ2, the types are given beforehand as a ﬁxed set, while in the λ-cube
deﬁnition, they need to be constructed during a derivation by means of (sort),
(weak) and (form). Moreover, the (conv)-rule is superﬂuous in these systems,
since there B =β B implies that B ≡ B. It is not too hard to show, however,128 The Calculus of Constructions
that the original λ→ and λ2 are precisely covered by the rules in the λ-cube, of
course when restricting the admissible (s1,s2)-combinations to the sets {(∗,∗)}
and {(∗,∗),(,∗)}, respectively.
## 6.3 Properties of λC
Most of the properties of the previously described systems also hold for the
‘combined’ system λC. Of course, the phrasing of the lemmas should sometimes
be a little bit diﬀerent, because we are in a more general environment (no ﬁxed
types, more than two or three levels, etcetera).
Below we give the lemmas for λC in their general shape. For comments on
their content, in particular regarding their intuition and relevance, we refer to
Sections 2.10 and 2.11, and to Section 4.8 for the necessary extension of the
Uniqueness of Types Lemma.
Some notions have to be redeﬁned in the more general environment of λC.
For example, the description of the domain (dom) of a λ→-context, given in
Deﬁnition 2.10, should be slightly adapted for the case of a λC-context. Many
of these changes in deﬁnition are straightforward and therefore we do not spell
them out.
We do not give proofs of the lemmas below, since they are rather laborious for
the λC case. In particular, the proof of Strong Normalisation (Theorem 6.3.14)
is very complicated. The proof in Geuvers (1995) is four pages long and that
in Barendregt (1992) is even longer, almost 19 pages.
First we summarise what the expressions are in λC:
Deﬁnition 6.3.1 (Expressions of λC, E)
The set E of λC-expressions is deﬁned by:
E = V || ∗ |(EE)|(λV : E . E)|(ΠV : E . E).
Notation 6.3.2 In λC, we employ the same notation conventions as before,
in particular about variables (see Notation 1.3.4), parentheses, successive ab-
stractions (Notations 1.3.10, 3.4.2), sorts (Notation 4.1.5) and the abbreviation
A → B for Πx : A. B, in case x ∈ FV(B) (Notation 5.2.1).
Now we give a list of important lemmas and theorems, provided with a short
comment.
Lemma 6.3.3 (Free Variables Lemma)
If Γ  A : B, then FV (A), FV (B) ⊆ dom(Γ).
Comment: Cf. Lemma 2.10.3. See also Barendregt (1992), Lemma 5.2.8, 2.
We say that a context is well-formed if it forms part of a derivable judgement:6.3 Properties of λC 129
Deﬁnition 6.3.4 (Well-formed context)
A context Γ is well-formed if there are A and B such that Γ  A : B.
Lemma 6.3.5 (Thinning Lemma, Permutation Lemma, Condensing Lemma)
(1) (Thinning) Let Γ and Γ be contexts such that Γ ⊆ Γ. If Γ  A : B
and Γ is well-formed, then also Γ  A : B.
(2) (Permutation) Let Γ and Γ be contexts such that Γ is a permutation
of Γ. If Γ  A : B and Γ is well-formed, then also Γ  A : B.
(3) (Condensing) If Γ, x : A, Γ  B : C and x does not occur in Γ, B or
C, then also Γ, Γ  B : C.
Comment: Cf. Lemma 2.10.5; we do not give the general notion of context-
inclusion (Γ ⊆ Γ) – it is similar to the one in Deﬁnition 2.10(2).
As to the Condensing Lemma: we recall that Γ, x : A, Γ is a context in
which the declaration x : A occurs somewhere. Note that the present Con-
densing Lemma is slightly diﬀerent from the one in Lemma 2.10.5: here we
state that it is allowed to take out an arbitrary ‘superﬂuous’ declaration x : A
from the context, while in the λ→-version we projected out all the superﬂuous
context declarations ‘in one sweep’.
For proofs of the three parts of Lemma 6.3.5, see Barendregt, 1992 (Lem-
mas 5.2.12 and 5.2.17).
Lemma 6.3.6 (Generation Lemma)
(1) If Γ  x : C, then there exist a sort s and an expression B such that
B =β C, Γ  B : s and x : B ∈ Γ.
(2) If Γ  MN : C, then M has a Π-type, i.e. there exist expressions A and
B such that Γ  M : Πx : A. B; moreover, N ﬁts in this Π-type: Γ  N : A,
and ﬁnally, C =β B[x := N].
(3) If Γ  λx : A. b : C, then there are a sort s and an expression B such
that C =β Πx : A. B, where Γ  Πx : A. B : s and moreover: Γ, x : A  b : B.
(4) If Γ  Πx : A. B : C, then there are s1 and s2 such that C ≡ s2, and
moreover: Γ  A : s1 and Γ, x : A  B : s2.
Comment: Cf. Lemma 2.10.7. See Barendregt, 1992 (Lemma 5.2.13) for a
proof.
Note that we distinguish four cases here: except (1) for variable x, (2) for
application MN and (3) for λ-abstraction λx : A. b, as in Lemma 2.10.7,
we need the extra case (4) for Π-abstraction Πx : A. B here. All four cases
are more complicated because of the (conv)-rule, which allows a type to be
replaced by a β-convertible one. If we forget about this complication, then the
four cases reﬂect rather directly the corresponding rules: (var), (appl), (abst)
and (form).130 The Calculus of Constructions
One employs a more general notion of legality (cf. Deﬁnition 2.4.10) in λC.
This is deﬁned as follows:
Deﬁnition 6.3.7 An expression M in λC is legal if there exist Γ and N such
that Γ  M : N or Γ  N : M (so when M is either typable or inhabited).
Then we have:
Lemma 6.3.8 (Subexpression Lemma)
If M is legal, then every subexpression of M is legal.
Comment: Cf. Lemma 2.10.8 and Barendregt, 1992 (Corollary 5.2.14, 4).
Lemma 6.3.9 (Uniqueness of Types up to Conversion)
If Γ  A : B1 and Γ  A : B2, then B1 =β B2.
Comment: Cf. Lemmas 2.10.9 and 4.8.1. A proof can be found in Barendregt,
1992 (Lemma 5.2.21).
Lemma 6.3.10 (Substitution Lemma)
Let Γ, x : A, Γ  B : C and Γ  D : A.
Then Γ, Γ[x := D]  B[x := D] : C[x := D].
Comment: Cf. Lemma 2.11.1 and the explanation following that lemma. Here
we substitute D for x in the judgement Γ, x : A, Γ  B : C, where D and
x have the same type, viz. A. The lemma says that the resulting judgement
is still derivable (we may even leave out the declaration x : A, for obvious
reasons). The substitutions should take place everywhere, so not only in B
and C, but also in the part of the context in which x’s may occur (viz. Γ).
The latter substitution, Γ[x := D], has not yet been deﬁned. However, it will
be obvious how this should be done.
For a proof of Lemma 6.3.10, see Barendregt, 1992 (Lemma 5.2.11).
Theorem 6.3.11 (Church–Rosser Theorem; CR; Conﬂuence)
The Church–Rosser property holds for λC, i.e. if M in E, M β N1 and
M β N2, then there is N3 such that N1 β N3 and N2 β N3.
Comment: Cf. Theorems 1.9.8 and 2.11.3. The notions of β-reduction and β-
conversion have to be adapted to the expressions of λC. This is straightforward
(see also Deﬁnitions 1.8.1, 1.8.3, 1.8.5, 2.11.2 and 3.6.2).
Corollary 6.3.12 Suppose that M, N in E and M =β N. Then there is L
such that M β L and N β L.
Comment: Cf. Corollaries 1.9.9 and 2.11.4.
Lemma 6.3.13 (Subject Reduction)
If Γ  A : B and A β A, then Γ  A : B.6.3 Properties of λC 131
Comment: Cf. Lemma 2.11.5. For a proof, see Barendregt, 1992 (Theo-
rem 5.2.15).
Theorem 6.3.14 (Strong Normalisation Theorem or Termination Theorem)
Every legal M is strongly normalising.
Comment: Cf. Theorem 2.11.6. The proof is complicated. See e.g. Baren-
dregt, 1992 (Theorem 5.3.33), or Geuvers, 1995.
Finally, we concentrate on the three main questions in type theory, namely:
Well-typedness, Type Checking and Term Finding (cf. Section 2.6). The ﬁrst
two of these are decidable; for a proof, see van Benthem Jutting (1993).
Theorem 6.3.15 (Decidability of Well-typedness and Type Checking)
In λC and its subsystems, the questions of Well-typedness and Type Checking
are decidable.
So it is possible to conceive of a computer program which solves these prob-
lems automatically: on input of either a sole ‘term’ or a combination ‘term +
type’ (with or without context), the program ﬁnds out whether a corresponding
derivation exists and, if so, gives this derivation.
The question of Term Finding, however, is decidable in λ→ and λω, but
undecidable in all other systems. This is understandable if we recall that there
is no general method to prove or disprove an arbitrary theorem in mathematics.
This famous result, called the Church–Turing Undecidability Theorem, comes
from A. Church and, independently, A.M. Turing (see Church, 1935, 1936a,b;
Turing, 1936). As we saw, the assignment to prove or disprove a proposition M
can be translated into ﬁnding a term of type M in type theory, or to show that
no such inhabitant exists. Hence, decidability of Term Finding would imply
that there was an algorithm which could prove or disprove every mathematical
proposition.
As a consequence, logic and mathematics cannot be fully handed over to
a machine that solves all problems that you pose. That may be a pity for
science in general, but not for the scientists, who are still necessary not only to
invent the problems, but also to solve them. Hence, in a type-theoretic setting:
humans formulate the types and human intervention is also required to ﬁnd
the inhabitants.
Nevertheless, computers can be of substantial aid in solving these problems.
They can administer the problem and the derivation as it develops, be of help
in listing the open goals that have not (yet) been solved and check whether
the development of the derivation occurs exactly according to the rules.
Such computer programs, called ‘proof assistants’, become more and more
useful in helping a human solving logical or mathematical problems. They132 The Calculus of Constructions
are also employed for proving correctness of computer programs in general, i.e.
giving a formal proof that a given computer program satisﬁes its speciﬁcations.
Last but not least, proof assistants may be of help in the development of
provably correct computer programs.
## 6.4 Conclusions
Diﬀerent combinations of the systems encountered in the previous chapters
are possible. All systems (λ→, λ2, λω and λP), and therefore all combina-
tions thereof, include the simply typed lambda calculus (λ→), this being the
foundation on which the enlargements are built.
Diﬀerent dependencies of terms and/or types on terms and/or types are
realised in these combinations; these combinations can be positioned in a cube:
the λ-cube or Barendregt cube.
All these systems – eight of them, altogether – can be described concisely and
very elegantly by means of one single set of derivation rules (see Figure 6.4), in
which the tuning of one parameter (the choice of the permitted combinations
(s1,s2) in the (form)-rule) determines which system we have at hand. Among
these rules there are many that are already familiar from the four basic systems.
They are presented here in a uniform format, in which they get their deﬁnite
description.
One recognises, for instance, the application and abstraction rules, funda-
mental to every system of lambda calculus. The sort-rule is the start of every
derivation. Moreover, we have a variable rule and a weakening rule to manipu-
late contexts and a formation rule to construct dependent types. Finally, there
is a conversion rule, which allows us to replace a type in a derivation by a legal
β-convertible one.
The most extensive combination, combining all the mentioned systems, is
λC, the Calculus of Constructions. Every combination of s1 and s2 is allowed
in this ‘jewel of type theory’. Moreover, it satisﬁes all the nice properties al-
ready formulated for the underlying systems, albeit sometimes in a slightly
more general phrasing. Among these are the Uniqueness of Types Lemma (up
to conversion), the Church–Rosser Theorem, the Subject Reduction Lemma,
the Termination Theorem and the Decidability of Well-typedness and Type
Checking.
These remarkable results establish the power of these systems and their
suitability to be used as a foundation for proof assistants. Their proofs ensure
the reliability and useability of λC and its subsystems.6.5 Further reading 133
## 6.5 Further reading
The Calculus of Constructions (Coquand & Huet, 1988), also called CC, was
implemented as a proof checker in the 1980s. It combines all features of λP and
λω (where λω = λ2 + λω, see Section 6.2). It has been introduced to do exactly
that: it was conceived as a type theory that unites ideas of A. Church, N.G. de
Bruijn, P. Martin-Löf and J.-Y. Girard. Thus it includes higher order predicate
logic and polymorphic data types. The λ-cube was constructed to make this
explicit, deﬁning the Calculus of Constructions as the union of λP and λω (cf.
Figure 6.2). Thus it became explicit how the typing rules correspond to the
term/type dependencies (see Barendregt, 1992, or Sørensen & Urzyczyn, 2006,
for further reading).
CC was used a lot for proving functional programs correct. The data types
used were the deﬁnable polymorphic data types, because there were no prim-
itive inductive types. These were added later, because the polymorphic data
types are a bit less expressive and don’t yield an induction proof principle
(which has to be added axiomatically). The extension with inductive types
(mentioned already in Section 5.7) was called the ‘Calculus of Inductive Con-
structions’ or CIC (see Bertot & Castéran, 2004, for further reading).
Another variant of the Calculus of Constructions is where ‘universes’ are
added. This means we add ‘super-kinds’ i (for i ∈ N; we identify 0 with our
old sort ), where i : i+1 and as (form)-rule we have:
Γ  A : i Γ,x : A  B : j
Γ  Πx : A. B : max(i,j)
The reason for not taking j in the conclusion is that if j < i, we can get an
inconsistency: one can construct a term of type ⊥. This system was ﬁrst deﬁned
and analysed by Z. Luo (see Luo, 1994) and called the ‘Extended Calculus of
Constructions’, ECC. In ECC, the universes are also subsets of each other:
i ⊆ i+1. This is usually phrased as ‘cumulativity’ of the universe hierarchy
and it amounts to the following typing rules:
Γ  A : ∗
Γ  A : 0
Γ  A : i
Γ  A : i+1
Furthermore, ECC also has Σ-types (see Section 5.7, again), with the for-
mation rules:
Γ  A : ∗ Γ, x : A  B : ∗
Γ  Σx : A. B : ∗
Γ  A : i Γ, x : A  B : j
Γ  Σx : A. B : max(i,j)
The reason for not allowing ‘impredicative Σ-types’, like Σα : ∗. α → α : ∗,
is that we lose consistency.
In Section 5.7 we already mentioned a number of proof assistants, such as134 The Calculus of Constructions
Coq. Many of these are based on the Calculus of Constructions, so not only on
λP. For a general paper on proof assistants, see Barendregt & Geuvers (2001).
Exercises
6.1 (a) Give a complete derivation in tree format showing that ⊥ ≡ Πα : ∗. α
is legal in λC (cf. Exercise 3.5).
(b) The same for ⊥ → ⊥.
(c) To which systems of the λ-cube does ⊥ belong? And ⊥ → ⊥?
6.2 Let Γ ≡ S : ∗, P : S → ∗, A : ∗.
Prove by means of a ﬂag derivation that the following expression is
inhabited in λC with respect to Γ:
(Πx : S . (A → P x)) → A → Πy : S . P y .
(You may shorten the derivation, as explained in Section 4.5.)
## 6.3 Let J be the judgement:
S : ∗, P : S → ∗  λx : S . (P x → ⊥) : S → ∗.
(a) Give a shortened λC-derivation of J.
(b) Determine the (s1,s2)-combinations corresponding to all Πs (or ar-
rows) occurring in J. (For ⊥, see Exercise 6.1.)
(c) Which is the ‘smallest’ system in the λ-cube to which J belongs?
## 6.4 Let Γ ≡ S : ∗, Q : S → S → ∗ and let M be the following expression:
M ≡ (Πx,y : S . (Qxy → Qy x → ⊥)) → Πz : S . (Qz z → ⊥).
(a) Give a shortened derivation of Γ  M : ∗ and determine the smallest
subsystem to which this judgement belongs.
(b) Prove in λC that M is inhabited in context Γ. You may use a short-
ened derivation.
(c) We may consider Q to be a relation on set S. Moreover, it is reasonable
to see A → ⊥ as the negation ¬A of proposition A. (We shall explain
this in Section 7.1.) How can M then be interpreted, if we also take
Figure 5.2 into account? And what is a plausible interpretation of the
inhabiting term you found in (b)?
## 6.5 Let J be the following judgement:
S : ∗  λQ : S → S → ∗. λx : S . Qxx : (S → S → ∗) → S → ∗.
(a) Give a shortened derivation of J and determine the smallest subsys-
tem to which J belongs.
(b) We may consider the variable Q in J as expressing a relation on
set S. How could you describe the subexpression λx : S . Qxx in this
setting? And what is then the interpretation of the judgement J?Exercises 135
6.6 Let M ≡ λS : ∗. λP : S → ∗. λx : S . (P x → ⊥).
(a) Which is the smallest system in the λ-cube in which M may occur?
(b) Prove that M is legal and determine its type.
(c) How could you interpret the constructor M, if A → ⊥ encodes ¬A?
## 6.7 Given Γ ≡ S : ∗, Q : S → S → ∗, we deﬁne in λC the expressions:
M1 ≡ λx,y : S . ΠR : S → S → ∗. ((Πz : S . Rz z) → Rxy),
M2 ≡ λx,y : S . ΠR : S → S → ∗.
((Πu,v : S . (Quv → Ruv)) → Rxy).
(a) Give an inhabitant of Πa : S . M1 aa and a shortened derivation
proving your answer.
(b) Give an inhabitant of Πa,b : S . (Qab → M2 ab) and a shortened
derivation proving your answer.
6.8 (a) Let Γ ≡ S : ∗, P : S → ∗. Find an inhabitant of the following
type N in context Γ, and prove your answer by means of a shortened
derivation:
N ≡ [Πα : ∗. ((Πx : S . (P x → α)) → α)] →
[Πx : S . (P x → ⊥)] → ⊥.
(b) Which is the smallest system in the λ-cube in which your derivation
may be executed?
(c) The expression Πα : ∗. ((Πx : S . (P x → α)) → α may be considered
as an encoding of ∃x∈S(P(x)). (We shall show this in Section 7.5.) In
Section 7.1 we make plausible that A → ⊥ may be considered as an
encoding of the negation ¬A. With these things in mind, how can we
interpret the content of the expression N? (See also Figure 5.2.)
## 6.9 Given S : ∗, P : S → ∗ and f : S → S, we deﬁne in λC the expression:
M ≡ λx : S . ΠQ : S → ∗. (Πz : S . (Qz → Q(f z))) → Qx.
Give a term of type Πa : S . (M a → M(f a)) and a (shortened) deriva-
tion proving this.
6.10 Given S : ∗ and P1,P2 : S → ∗, we deﬁne in λC the expression:
R ≡ λx : S . ΠQ : S → ∗. (Πy : S . (P1 y → P2 y → Qy)) → Qx.
We claim that R codes ‘the intersection of P1 and P2’, i.e. the predicate
that holds if and only if both P1 and P2 hold. In order to show this, give
inhabitants of the following types, plus (shortened) derivations proving
this:
(a) Πx : S . (P1 x → P2 x → Rx),
(b) Πx : S . (Rx → P1 x),
(c) Πx : S . (Rx → P2 x).
Why do (a), (b) and (c) entail that R is this intersection?
(Hint for (b): see Exercise 5.8(a).)136 The Calculus of Constructions
6.11 Let Γ  M : N in λC and Γ ≡ x1 : A1,...,xn : An.
(a) Prove that the x1, ..., xn are distinct.
(b) Prove the Free Variables Lemma (Lemma 6.3.3) for λC.
(c) Prove that FV(Ai) ⊆ {x1,...,xi−1}, for 1 ≤ i ≤ n.7
The encoding of logical notions in λC
## 7.1 Absurdity and negation in type theory
In Section 5.4, IV, we saw how implication can be coded in type theory (in
particular, in λP). We recall: by coding the implication A ⇒ B as the function
type A → B, we mimic the behaviour of ‘implication’, including its introduc-
tion and elimination rule, in type theory. So we also have minimal propositional
logic in λC, since λP is part of λC.
In order to get more than minimal propositional logic, we have to be able
to handle more connectives, such as negation (‘¬’), conjunction (‘∧’) and dis-
junction (‘∨’). This cannot be done in λP, but in λC there exist very elegant
ways to code the respective notions, as we presently show.
We start with negation. It is natural to consider the negation ¬A as the
implication A ⇒ ⊥, where ⊥ is the ‘absurdity’, also called contradiction. So
we interpret ¬A as ‘A implies absurdity’. But for this we ﬁrst need a coding of
the absurdity itself. (In Exercises 3.5 and 6.1(a) we already mentioned codings
of ⊥ in λ2 and λC, which we shall justify below.)
I. Absurdity
A characteristic property of the proposition ‘absurdity’, or ⊥, is the following:
If ⊥ is true, then every proposition is true.
In natural deduction this property is known under the name ⊥-elimination.
It is traditionally called: ‘ex falso’ or Ex falso sequitur quodlibet, meaning: from
an absurdity follows whatever you like. It can also be expressed as follows, in
a type-theoretic setting:
‘If ⊥ is inhabited, then all propositions A are inhabited.’
We can make this more constructive, by invoking a function:
‘If we have an inhabitant M of ⊥, then there exists a function mapping an
arbitrary proposition α to an inhabitant of this same α.’
Such a function apparently has type Πα : ∗. α. And indeed, if f has type138 The encoding of logical notions in λC
Πα : ∗. α, then by the (appl)-rule: fA : α[α := A] ≡ A. So if f is such a
function, then fA inhabits A (or: makes A true). This holds for a general
proposition A, since also fB inhabits B, etcetera.
So we can rephrase again:
‘Let M be an inhabitant of ⊥. Then there is a function f which inhabits
Πα : ∗. α.’
And the other way round: if there is such an f, then we can make all (!)
propositions (A, B, ...) true; this is apparently absurd, so we have an absur-
dity.
Summarising: ⊥ is inhabited if and only if Πα : ∗. α is inhabited.
Our problem was to ﬁnd a practical coding for ⊥. By the above, the solution
is now at hand: deﬁne ⊥ in type theory as Πα : ∗. α.
Remark 7.1.1 By deﬁning ⊥ as Πα : ∗. α, we get ⊥-elimination for free.
To demonstrate this, we picture ⊥-elimination and its type-theoretic equivalent
next to each other, where A is an arbitrary inhabitant of ∗.
(⊥-elim)
⊥
A
(a) f : Πα : ∗. α
(i) fA : A (appl) on (a) and A : ∗
We discuss the counterpart of ⊥-elimination, viz. ⊥-introduction, after hav-
ing introduced ‘negation’: see Remark 7.1.2 below.
To end our discussion of absurdity (⊥), we investigate in which system ⊥
lives. Since ⊥ ≡ Πα : ∗. α, we see that s1 =  and s2 = ∗ (cf. the diagram
in Section 6.1). So we are in λ2. Moreover, we can show using the derivation
rules of λ2, that ⊥ : ∗ (cf. Exercise 3.5).
II. Negation
Now that we have ‘absurdity’, we also have ‘negation’. We deﬁne:
¬A ≡ A → ⊥.
Note that A → ⊥ is an abbreviation for Πx : A. ⊥. Since A : ∗ and ⊥ : ∗,
we have here that (s1,s2) = (∗,∗). However, by the involvement of ⊥ we need
at least λ2 to code negation.
Remark 7.1.2 The ⊥-introduction rule employs negation:
(⊥-intro)
A ¬A
⊥
However, this rule has become superﬂuous by the identiﬁcation of ¬A and
A → ⊥ (or A ⇒ ⊥), since the ⊥-introduction rule is now just:
(⊥-intro)
A A ⇒ ⊥
⊥7.2 Conjunction and disjunction in type theory 139
and this is a particular instance of the (⇒-elim)-rule (cf. Example 2.4.9).
Similarly, we don’t need the natural deduction rule (¬-intro), nor (¬-elim),
since they can be replaced by (⇒-intro) and (⇒-elim), respectively (see Ex-
ample 2.4.9, again). Comparing the following rules, keeping in mind that ¬A
stands for A ⇒ ⊥, we easily see that the left-hand versions are special cases of
the right-hand ones:
Assume : A
. . .
⊥
(¬-intro)
¬A
Assume : A
. . .
B
(⇒-intro)
A ⇒ B
(¬-elim)
¬A A
⊥
(⇒-elim)
A ⇒ B A
B
Note: (⊥-intro) and (¬-elim) are identical special cases of the ⇒-elim-rule.
However, they serve diﬀerent purposes:
(1) (⊥-intro) is meant as a rule explaining how to obtain ⊥: in order to
get ⊥, ﬁnd a proposition A such that A itself holds, and also its negation ¬A.
So, as all intro-rules, it is used as a backward rule.
(2) (¬-elim) tells us how we can use a negation ¬A: ﬁnd out whether the
un-negated A holds as well, because then we have an absurdity (⊥). This is a
forward rule (as all elim-rules are).
## 7.2 Conjunction and disjunction in type theory
I. Conjunction
The conjunction A ∧ B is true if and only if both A and B are true. There
exists a nice encoding of the conjunction in λ2:
A ∧ B ≡ ΠC : ∗ . (A → B → C) → C .
This is a so-called ‘second order’ encoding of the conjunction, which is more
general than a ﬁrst order encoding such as A∧B ≡ ¬(A → ¬B). It is more gen-
eral because the latter encoding only works in classical logic (see Section 7.4).
Why does the expression on the right-hand side, behind the ‘≡’, encapsulate
the same meaning (and has the same force) as ‘A ∧ B’?
Let’s read the Π as ‘for all’ and the → as ‘implies’ (cf. Section 5.4). Then
the expression ΠC : ∗. (A → B → C) → C can be read as:
(i) For all C, (A implies (B implies C)) implies C.140 The encoding of logical notions in λC
Since we are dealing with logic, it is natural to conceive of A, B and C as
propositions. Then a free interpretation of (i) is that for all propositions C:
‘if A and B together imply C, then C holds on its own’.
This expresses that the ‘condition’ in the expression before the comma,
namely that both A and B hold, is redundant. Such a thing can only be the
case if that condition is fulﬁlled, so A must hold and B must hold. And the
other way round: it is not hard to see that the truth of both A and B brings
along that also (i) holds, since ‘true implies C’ is logically equivalent to C.
Hence, it seems to be permitted to use ΠC : ∗. (A → B → C) → C as an
encoding for A∧B. One calls this the second order encoding of A∧B, because
it generalises over propositions (‘For all propositions C...’). And propositions
(encoded as types) are second order objects.
The informal reasoning given above motivates the proposed encoding of the
conjunction in λ2. There is also a formal justiﬁcation that this second order
encoding is a proper way of treating conjunction in type theory: we shall show
that the encoding satisﬁes the same introduction and elimination rules as ∧
does in natural deduction. We recall these rules for ∧, juxtaposing the type-
theoretic second order encodings:
(∧-intro)
A B
A ∧ B
(∧-intro-sec)
A B
ΠC : ∗. (A → B → C) → C
(∧-elim-left)
A ∧ B
A
(∧-elim-left-sec)
ΠC : ∗. (A → B → C) → C
A
(∧-elim-right)
A ∧ B
B
(∧-elim-right-sec)
ΠC : ∗. (A → B → C) → C
B
In order to see that the second order rules are derivable rules in type theory, it
suﬃces to give corresponding derivations in λC. Under the PAT-interpretation,
this boils down to ﬁnding solutions to questions ?1, ?2 and ?3 in the following
schemes, assuming that Γ ≡ A : ∗,B : ∗:
(∧-intro-sec-tt)
Γ  a : A Γ  b : B
Γ  ?1 : ΠC : ∗. (A → B → C) → C
(∧-elim-left-sec-tt)
Γ  c : ΠC : ∗. (A → B → C) → C
Γ  ?2 : A
(∧-elim-right-sec-tt)
Γ  d : ΠC : ∗. (A → B → C) → C
Γ  ?3 : B
As an example, we give a derivation corresponding to the (∧-intro-sec)-rule.
So we assume that a is a term of type A and b is a term of type B, both in7.2 Conjunction and disjunction in type theory 141
context Γ. Then we have to ﬁnd, in the same context, a term ?1 having as type
the second order conjunction of A and B, viz. ΠC : ∗. (A → B → C) → C.
In order to comply with the λC-format, we take variables x and y instead
of the ‘expressions’ a and b, and add x : A and y : B to the context. So our
start situation is:
(a) A : ∗
(b) B : ∗
(c) x : A
(d) y : B
. . .
(n) ?1 : ΠC : ∗. (A → B → C) → C
Filling the gap in this derivation is standard. We take the rules of the most
powerful system, λC (although λ2 would suﬃce). As in Chapters 4 and 5, we
give a shortened derivation; in particular: we ignore the second premiss of the
(abst)-rule.
(a) A : ∗
(b) B : ∗
(c) x : A
(d) y : B
(e) C : ∗
(f) z : A → B → C
(1) z x : B → C (appl) on (f) and (c)
(2) z xy : C (appl) on (1) and (d)
(3) λz : A → B → C . z xy :
(A → B → C) → C (abst) on (2)
(4) λC : ∗. λz : A → B → C . z xy :
ΠC : ∗. (A → B → C) → C (abst) on (3)
Find yourself derivations that correspond to the two second order ∧-elim
rules (Exercise 7.4). Our ﬁnal conclusion is that all these rules are already
derivable in λC, and don’t need to be added.142 The encoding of logical notions in λC
II. Disjunction
There is a similar second order encoding of the disjunction A ∨ B:
A ∨ B ≡ ΠC : ∗. (A → C) → (B → C) → C .
(The usual ﬁrst order encoding of disjunction is A ∨ B ≡ ¬A → B. But, as
with the conjunction, this only works in classical logic.)
Similarly arguing as with conjunction, above, we may rephrase the right-
hand expression ΠC : ∗. (A → C) → (B → C) → C as:
(ii) For all C, (A → C implies that (B → C implies C)).
We have to convince ourselves that (ii) encapsulates the same meaning as
A ∨ B. We ﬁrst do this by giving an intuitive argument, as with conjunction.
Think of A, B and C as propositions, again. An interpretation of (ii) is that
for all propositions C:
‘if A implies C and also B implies C, then C holds on its own’.
Logically, this means the same as
‘if (A or B) implies C, then C holds’.
Clearly, the ‘condition’ in the expression before the comma is redundant,
again. So A or B must hold.
The reasoning the other way round is more complicated. Assume that A or B
holds. We may see this as the fact that there are two cases, one expressed as
A, and the other as B. If we know now that for an arbitrary C, in case A we
have C (i.e. A ⇒ C) and also in case B we have C (i.e. B ⇒ C), then we may
conclude that C holds altogether. This is essentially what (ii) says.
Another justiﬁcation is the formal proof that the encoding corresponds to
the natural deduction rules for disjunction, which are:
(∨-intro-left)
A
A ∨ B
(∨-intro-right)
B
A ∨ B
(∨-elim)
A ∨ B A ⇒ C B ⇒ C
C
We shortly comment on these natural deduction rules.
The intro-rules speak for themselves: if A alone holds already, then also A∨B
holds; and similarly for B.
For the elim-rule for ∨, we refer to our discussion above, in particular the
part about ‘case distinction’.
The type-theoretic second order versions of the ∨-rules look as follows.7.2 Conjunction and disjunction in type theory 143
(∨-intro-left-sec)
A
ΠC : ∗. (A → C) → (B → C) → C
(∨-intro-right-sec)
B
ΠC : ∗. (A → C) → (B → C) → C
(∨-elim-sec)
ΠD : ∗. (A → D) → (B → D) → D A → C B → C
C
(We use the bound variable D in the last-mentioned Π-expression in order
to avoid confusion with the free C’s occurring in the rest of the rule.)
Formal derivations in λC showing that the two second order ∨-intro-rules
are covered by the encoding are left to the reader (Exercise 7.7).
Here follows a formal derivation in λC corresponding to the second order
∨-elim-rule:
(a) A : ∗
(b) B : ∗
(c) C : ∗
(d) x : (ΠD : ∗. (A → D) → (B → D) → D)
(e) y : A → C
(f) z : B → C
(1) xC : (A → C) → (B → C) → C (appl) on (d), (c)
(2) xC y : (B → C) → C (appl) on (1), (e)
(3) xC y z : C (appl) on (2), (f)
Remark 7.2.1 In the previous section and the present one, we have deﬁned
type-theoretic variants of negation, conjunction and disjunction by
¬A ≡ A → ⊥ ,
A ∧ B ≡ ΠC : ∗. (A → B → C) → C ,
A ∨ B ≡ ΠC : ∗. (A → C) → (B → C) → C .
However, there are free variables (A and B) in these expressions. In order
to be sure that these variables have the proper type (∗), we could also have
chosen to introduce the sole connectives as abbreviations for more ‘abstract’
expressions:
¬ ≡ λα : ∗. (α → ⊥) ,
∧ ≡ λα : ∗. λβ : ∗. Πγ : ∗. (α → β → γ) → γ ,
∨ ≡ λα : ∗. λβ : ∗. Πγ : ∗. (α → γ) → (β → γ) → γ .144 The encoding of logical notions in λC
Starting from these alternative encodings, we can easily get the contents of
the original ones by the (appl)-rule, for example:
¬A ≡ (λα : ∗. (α → ⊥))A →β A → ⊥ .
(Note that ¬A means here ¬ applied to A.)
So, these alternatives have the same expressivity, although we need more
than λ2. In fact, we need λω (cf. Figure 6.2). Check this yourself.
## 7.3 An example of propositional logic in λC
We are now able to ‘do’ propositional logic in type theory, since we have en-
codings for absurdity (⊥) and for the connectives ⇒, ¬, ∧ and ∨.
Remark 7.3.1 Only the ⇔ is missing, but this can be easily remedied by
expressing it by means of the other connectives, in the usual way:
A ⇔ B ≡ (A ⇒ B) ∧ (B ⇒ A).
In order to show how propositional logic ‘works’ in type theory, we give a
type-theoretic proof of the following tautology:
(A ∨ B) ⇒ (¬A ⇒ B) .
In Figure 7.1 we give the full proof as a derivation in λC. Since we use
the type-theoretic encodings of ∨, ⇒ and ¬, the goal (see line (10) in the
derivation) becomes to ﬁnd an inhabitant of:
(∗) (ΠC : ∗. ((A → C) → (B → C) → C))
 
A∨B
→ (A → ⊥)
 
¬A
→ B .
About this derivation, we note the following:
− In the above expression, we treat A and B as free variables, representing
‘arbitrary’ propositions. Hence, we must start our derivation in Figure 7.1
with the assumptions given in lines (a) and (b).
− So the set-up of the derivation is: in context (a) and (b), ﬁnd an inhabitant
of the expression above. Line (10) shows that we succeed in ﬁnding such an
inhabitant.
− How has this been accomplished? Well, we assume to have an inhabitant of
the left-hand side of the expression (see line (c)) and derive an inhabitant
of the right-hand side (namely (A → ⊥) → B), in the extended context (a),
(b) and (c). Line (9) displays the desired (new) inhabitant.
− That inhabitant, in its turn, has been found by adding the left-hand side of
the type (A → ⊥) → B as an assumption to the context (see line (d)) and
deriving an inhabitant of the right-hand side, which is B. The last-mentioned
inhabitant is given in line (8).7.3 An example of propositional logic in λC 145
(a) A : ∗
(b) B : ∗
(c) x : (ΠC : ∗. ((A → C) → (B → C) → C))
(d) y : A → ⊥
(1) xB : (A → B) → (B → B) → B (appl) on (c) and (b)
(e) u : A
(2) y u : ⊥ (appl) on (d) and (e)
(3) y uB : B (appl) on (2) and (b)
(4) λu : A. y uB : A → B (abst) on (3)
(5) xB (λu : A. y uB) : (B → B) → B (appl) on (1) and (4)
(f) v : B
(6) v : B (var) on (f)
(7) λv : B . v : B → B (abst) on (6)
(8) xB (λu : A. y uB)(λv : B . v) : B (appl) on (5) and (7)
(9) λy : A → ⊥. xB (λu : A. y uB)(λv : B . v) :
(A → ⊥) → B (abst) on (8)
(10) λx : (ΠC : ∗. ((A → C) → (B → C) → C)).
λy : A → ⊥. xB (λu : A. y uB)(λv : B . v) :
(ΠC : ∗. ((A → C) → (B → C) → C)) →
(A → ⊥) → B (abst) on (9)
Figure 7.1 A derivation of the logical tautology (A ∨ B) ⇒ (¬A ⇒ B)
− So the situation is now to explain why xB (λu : A. y uB)(λv : B . v) is an
inhabitant of B, in the context (a)–(d); and in particular how we found it.
The ﬂash of inspiration is to apply x to the proposition B, as has been done
in line (1), which gives an inhabitant of (A → B) → (B → B) → B. (This
ends in B, which is promising, since we look for an inhabitant of B.)
− So as soon as we have something of type A → B and something of type
B → B, we can use ⇒-elimination twice, in order to obtain the desired
inhabitant of B. This is exactly what we do: see lines (4) and (7) for these
inhabitants.
− The rest will be obvious. Note that in line (3) we use the type-theoretic
version of (⊥-elim) on line (2): recall that ⊥ is an abbreviation of Πα : ∗. α.146 The encoding of logical notions in λC
Hence, if y u : ⊥, then y uB : B (cf. Section 7.1). This is exactly what we
put into practice.
We invite and encourage the reader to study the further details of Figure 7.1.
Note that this is, again, a shortened derivation, in which the second premiss
of the (abst)-rule has consistently been neglected.
Remark 7.3.2 The derivation in Figure 7.1 uses the earlier described codings
for expressions with ∨ and ¬. When starting from the higher order encodings
described in Remark 7.2.1, we have to do a little bit more work. The translation
of A ∨ B then is (λα : ∗. λβ : ∗. Πγ : ∗. (α → γ) → (β → γ) → γ)AB, with
the consequence that lines (c) and (d) in the derivation look like:
(c) x : (λα : ∗. λβ : ∗. Πγ : ∗. ((α → γ) → (β → γ) → γ))AB
(d) y : (λα : ∗. (α → ⊥))A
In order to continue this derivation, it is wise to execute β-reduction in each
of the two types in lines (c) and (d).
By the conversion rule – note that this is a good occasion to use it – we
obtain the intermediate lines (i) and (ii) below:
(c) x : (λα : ∗. λβ : ∗. Πγ : ∗. ((α → γ) → (β → γ) → γ))AB
(d) y : (λα : ∗. (α → ⊥))A
(i) x : (Πγ : ∗. ((A → γ) → (B → γ) → γ)) (conv) on (c)
(ii) y : A → ⊥ (conv) on (d)
Hence we may continue the derivation just as in lines (1) to (10) of Fig-
ure 7.1, with the only change that references to (c) and (d) should be replaced
by references to (i) and (ii), respectively.
## 7.4 Classical logic in λC
It is worth noting that the logic we have seen until now is constructive logic
(sometimes also referred to as intuitionistic logic; see van Dalen, 1994, Chap-
ter 5). It is slightly less powerful than the usual classical logic. In classical logic
one has the ‘law of the excluded third’ (ET), stating that A ∨ ¬A holds for
any A. Also, one has the ‘double negation law’ (DN), stating that ¬¬A ⇒ A
holds for any A. Both ET and DN are not derivable from the rules that we
have seen until now (constructive logic). For a proof of this fact, see Troelstra
& van Dalen (1988), Vol. 1, p. 79.
Classical logic is what one generally wants, since this is the most commonly7.4 Classical logic in λC 147
used kind of logic in mathematics. In order to obtain this, one has to extend
constructive logic.
It turns out to be suﬃcient to add either ET, or DN. The reason is that in
constructive logic plus ET we can derive DN. And vice versa: in constructive
logic plus DN we can derive ET.
How can we add either ET or DN to λC? It should become a proposition
which always ‘holds’, so it must be formalised as something which can be called
upon in every derivation. The easiest way to manage this is to add it as an
assumption in front of the context. Such an assumption can be represented in
λC by means of a declaration. Let’s do this, for example, for ET:
iET : Πα : ∗. α ∨ ¬α
We call this the addition of an axiom: we suppose that we have an inhabi-
tant, iET , of the excluded-third-axiom in the right-hand side of the expression
(reading: for all propositions α we have that α ∨ ¬α.)
As an example, we now give the derivation corresponding to one of the two
things which we claimed above: that (the type-theoretic version of) construc-
tive logic + ET enables one to derive DN.
So we start our context with the axiom ET and obtain the following goal:
(a) iET : Πα : ∗. α ∨ ¬α
. . .
(n) ? : Πβ : ∗. ¬¬β → β
The goal naturally brings along the following two steps:
(a) iET : Πα : ∗. α ∨ ¬α
(b) β : ∗
(c) x : ¬¬β
. . .
(l) ? : β
(m) ... : ¬¬β → β
(n) ... : Πβ : ∗. ¬¬β → β
Now we try to use (a), (b) and (c) in order to ﬁnd an inhabitant of β.
Line (a) appears to be a good candidate: its type is a Π-type which generalises
over α of type ∗. It appears to be a good choice to apply iET to β, obtaining an148 The encoding of logical notions in λC
inhabitant of β ∨ ¬β. The latter expression is, in the type-theoretic encoding,
an abbreviation for Πγ : ∗. ((β → γ) → (¬β → γ) → γ). So, for convenience
omitting lines (m) and (n), we obtain:
(a) iET : Πα : ∗. α ∨ ¬α
(b) β : ∗
(c) x : ¬¬β
(1) iET β : β ∨ ¬β
(2) iET β : Πγ : ∗. (β → γ) → (¬β → γ) → γ
. . .
(l) ? : β
. . .
Since the type in line (2) is a Π-type, again, it appears to be a good option
to apply it (again) to β. This leads to the addition of line (3):
(a) iET : Πα : ∗. α ∨ ¬α
(b) β : ∗
(c) x : ¬¬β
(1) iET β : β ∨ ¬β
(2) iET β : Πγ : ∗. (β → γ) → (¬β → γ) → γ
(3) iET β β : (β → β) → (¬β → β) → β
. . .
(l) ? : β
. . .
What’s next? Our goal is to obtain an inhabitant of β. Now β is also the
rightmost subexpression in the type of line (3). So if we succeed in ﬁnding
inhabitants of successively β → β and ¬β → β, then a double use of the
application rule leads from line (3) to goal (l).
The ﬁrst task is easy: β → β is obviously a tautology, with an easy proof,
given in line (4). (See also Figure 7.1, ﬂag (f), and lines (6) and (7).) We ﬁll
this in, together with the (appl)-consequence of lines (3) and (4), stated in
line (5):7.4 Classical logic in λC 149
(a) iET : Πα : ∗. α ∨ ¬α
(b) β : ∗
(c) x : ¬¬β
(1) iET β : β ∨ ¬β
(2) iET β : Πγ : ∗. (β → γ) → (¬β → γ) → γ
(3) iET β β : (β → β) → (¬β → β) → β
(4) λy : β . y : β → β
(5) iET β β (λy : β . y) : (¬β → β) → β
. . .
(l) ? : β
. . .
What’s left is the task to ﬁnd an inhabitant of ¬β → β. For convenience, we
isolate this part of the proof and add line (k) for the purpose mentioned. This
naturally leads to assumption (d) and the new goal (j):
. . .
. . .
(c) x : ¬¬β
. . .
. . .
(5) iET β β (λy : β . y) : (¬β → β) → β
(d) z : ¬β
. . .
(j) ? : β
(k) ... : ¬β → β
(l) ... : β
. . .
Combining assumptions (c) and (d) we obtain ⊥, since ¬¬β is identical to
¬β → ⊥. And having an inhabitant of ⊥, we have inhabitants for ‘everything’.
(Recall the type-theoretic version of the (⊥-elim)-rule, see Section 7.1, I.) So
we have also solved the goal in line (j) and we are done (but for the ﬁlling in
of a number of terms and argumentations).150 The encoding of logical notions in λC
This part of the proof then looks as given below. Lines (7), (8) and (9)
replace goals (j), (k) and (l).
Finish the derivation yourself, including the arguments.
. . .
. . .
(c) x : ¬¬β
. . .
. . .
(5) iET β β (λy : β . y) : (¬β → β) → β
(d) z : ¬β
(6) xz : ⊥
(7) xz β : β
(8) λz : ¬β . xz β : ¬β → β
(9) iET β β (λy : β . y)(λz : ¬β . xz β) : β
. . .
## 7.5 Predicate logic in λC
Now that we have coded propositional logic (both the constructive and the
classical versions), it is time to look at predicate logic. For this, we have to ﬁnd
encodings for the quantiﬁers ∀ and ∃. As far as ∀ is concerned, this has already
been done in Section 5.4, part V. There we have shown that the encoding of
∀x∈S(P(x)) as Πx : S . Px is satisfactory, since it satisﬁes the elimination and
introduction rules for ∀.
All that’s left is the existential quantiﬁer ∃. The ﬁrst order deﬁnition of ∃,
namely ∃x∈S(P(x)) ≡ ¬∀x∈S(¬P(x)), only works in classical logic. There exists
a more general second order encoding of ∃ which conforms nicely with the
(constructive) elimination and introduction rules for ∃, namely, encode
∃x∈S(P(x)) as Πα : ∗. ((Πx : S . (P x → α)) → α).
Let’s try to translate the latter expression in words, reading Π as ∀, and →
as ⇒:
‘For all α:
if we know that for all x in S it holds that P x implies α,
then α holds.’
It is not immediately clear why this statement covers the same content as the
statement ‘There exists an x in S with P(x)’. However, it is straightforward to7.5 Predicate logic in λC 151
compare the above encoding with the usual (∃-elim)- and (∃-intro)-rules from
constructive logic, as we do next (see also van Dalen, 1994, Section 2.9).
Let’s start with the elimination rule for ∃ as it is commonly expressed in
natural deduction for ﬁrst order logic. Let P be a predicate over set S, and
x ∈ FV(A):
(∃-elim)
∃x∈SP(x) ∀x∈S(P(x) ⇒ A)
A
So this rule says:
‘(first premiss) If there exists an x in the set S for which the predicate
P holds,
(second premiss) and if for all x in S: if P holds for this x, then the propo-
sition A holds,
(conclusion) then A holds altogether.’
We ﬁrst give an intuitive explanation of this rule. The situation to start with
is:
(1) There is an x with P(x), and
(2) for all x we know: as soon as P(x) then also A.
Then a natural reasoning is:
− we may apply (2) to ‘the’ x which is claimed to exist in (1);
− for this x we indeed have P(x) by (1);
− hence (2) leads us to the conclusion that A holds. And this is exactly the
conclusion in the (∃-elim)-rule.
So this rule is intuitively acceptable.
Remark 7.5.1 It is a general habit to apply ∃-elimination in a loose manner:
if one knows that ∃x∈SP(x), one simply takes ‘such an’ x for which P holds,
and works with ‘that’ x as if it has been given.
Therefore, a mathematician tends to use the following scheme:
(1) ∃x∈SP(x)
(2) Let x ∈ S be such that P x holds
(3)
. . .
(4) A
In mathematical texts, it is customary to simplify this scheme even more, by
omitting sentence (2).
However, either of these presentations is questionable. The silent assumption
about the scope of the x introduced in line (2) is that it may be used in (3), but
not in (4). And when (2) is omitted, each free x in (3) can only refer to the
binding variable x in (1); which clearly violates the scope of the ∃-symbol.152 The encoding of logical notions in λC
That is the reason why we consider the above (∃-elim)-rule to be the only
acceptable one for a formal proof, in spite of the extra work that it requires.
Now we have to show that the type-theoretic (second order) counterpart of
the (∃-elim)-rule is correct. So we must convince ourselves that the following
rule is acceptable, for all S : ∗, P : S → ∗ and A : ∗ with x ∈ FV(A):
(∃-elim-sec)
Πα : ∗. ((Πx : S . (P x → α)) → α) Πx : S . (P x → A)
A
A derivation to show that this rule is derivable in λC is easy and can be
given right away. For the record, we spell it out:
(a) S : ∗
(b) P : S → ∗
(c) A : ∗
(d) y : Πα : ∗. ((Πx : S . (P x → α)) → α)
(e) z : Πx : S . (P x → A)
(1) y A : (Πx : S . (P x → A)) → A (appl) on (d), (c)
(2) y Az : A (appl) on (1), (e)
Note how simple this is. This does not come as a surprise, if we look again
at the (∃-elim-sec)-rule. Let’s abbreviate Πx : S . (P x → α) as ϕ(α). Then
the rule expresses the following, in logical terms:
‘If (i) for all α we have that ϕ(α) ⇒ α and (ii) ϕ(A), then (iii) A.’
We obtain this simply by ﬁrst applying (i) to A by means of (∀-elim), which
gives ϕ(A) ⇒ A (see also line (1)), and next combining this with (ii), applying
(⇒-elim). The result is (iii) (see line (2)).
Remark 7.5.2 In the derivation it is essential that x ∈ FV(A), because
otherwise the application in line (2) would be illegal (see Exercise 7.11).
On closer inspection, we see that the second order encoding of ∃ is exactly
what the (∃-elim)-rule expresses, namely that the existence of an x ∈ S with
P(x) brings along that ‘if ∀x∈S(P(x) ⇒ A), then A’, or in type-theoretic
terms: (Πx : S . (P x → A)) → A. This should hold for all A, hence we obtain
Πα : ∗. ((Πx : S . (P x → α)) → α) as the desired encoding.
Clearly, in all cases where we appeal to (∃-elim) in logic, we are permitted to
use the second order encoding of ∃ in type theory. This brings our discussion
of (∃-elim) to a conclusion.7.5 Predicate logic in λC 153
How about the introduction rule for ∃? Its usual version in ﬁrst order nat-
ural deduction is the following, where, as before, P is a predicate over set S;
moreover, a is some ﬁxed element (see again van Dalen, 1994, Section 2.9):
(∃-intro)
a ∈ S P(a)
∃x∈S(P(x))
In words:
‘(first premiss) If a certain object a is element of the set S,
(second premiss) and the predicate P holds for this a,
(conclusion) then ∃x∈S(P(x)) holds.’
This reasoning scheme is obvious and thus also intuitively acceptable: if
we already know (first and second premisses) that a certain a in S has
‘property’ P, then (conclusion) there exists some x in S with property P
(namely x = a).
In order to show that the type-theoretic counterpart of this (∃-intro)-rule is
correct as well, we have to convince ourselves that the following second order
rule is derivable, for all S : ∗ and P : S → ∗:
(∃-intro-sec)
a : S P a
Πα : ∗. ((Πx : S . (P x → α)) → α)
A derivation of this can start as follows, where we code the arbitrary a as a
variable in ﬂag (c):
(a) S : ∗
(b) P : S → ∗
(c) a : S
(d) u : P a
. . .
(n) ? : Πα : ∗. ((Πx : S . (P x → α)) → α)
Completion of this derivation is straightforward and easy. We leave it as an
exercise to the reader to derive that the following proof object is correct:
? ≡ λα : ∗. λv : (Πx : S . (P x → α)). v au.
Remark 7.5.3 We have deﬁned a type-theoretic equivalent of the logical ∃-
expression by taking:
∃x∈S(P(x)) ≡ Πα : ∗. ((Πx : S . (P x → α)) → α).154 The encoding of logical notions in λC
As in Remark 7.2.1, we note that there are free variables in this expression,
viz. S and P. Again, we could also abstract from these variables, in order to
incorporate their types. Then we get the alternative representation
∃ ≡ λS : ∗. λP : S → ∗. Πα : ∗. ((Πx : S . (P x → α)) → α).
When using this alternative, we obtain, for given S and P of the proper
types:
∃S P →β Πα : ∗. ((Πx : S . (P x → α)) → α),
so ∃S P ‘is’ the type-theoretic encoding of ∃x∈S(P(x)).
Check yourself that for Πα : ∗. ((Πx : S . (P x → α)) → α), having type ∗,
we need (at least) λP2 (see Figure 6.3). For the alternative ∃ described here,
however, we need λC, since its type is ΠS : ∗. (S → ∗) → ∗.
## 7.6 An example of predicate logic in λC
In order to demonstrate how the codings of ∀ and ∃ in λC work, we give a
type-theoretic derivation of the following proposition:
¬∃x∈S(P(x)) ⇒ ∀y∈S(¬P(y)).
In second order λC-encoding this becomes:
((Πα : ∗. (Πx : S . (P x → α)) → α) → ⊥) → Πy : S . (P y → ⊥).
In order to keep close to the formulation in logic, we write ¬A for A → ⊥
and A ⇒ B for A → B (see Section 7.1).
In accordance with the previous section, we also employ the ∀- and ∃-
symbols, which are more familiar: we write, if appropriate,
∀x : S . P x for Πx : S . P x, and
∃x : S . P x for Πα : ∗. ((Πx : S . (P x → α)) → α).
With all this notational ‘sugaring’, our encoding in λC becomes very similar
to the usual representation in logic, namely: ¬(∃x : S . P x) ⇒ ∀y : S . ¬(P y).
In order to give a proof of this λC-proposition, we try to ﬁnd an inhabitant.
Raising ﬂags for the free variables S and P, we obtain the following start
situation:
(a) S : ∗
(b) P : S → ∗
. . .
(n) ? : ¬(∃x : S . P x) ⇒ ∀y : S . ¬(P y)7.6 An example of predicate logic in λC 155
The goal type is in fact an →-expression, i.e. an abbreviated Π-type. Its
right-hand side ∀y : S . ¬(P y) is a Π-expression in disguise, with an ‘embedded’
→-expression, namely P y → ⊥. Hence, we can try to obtain line (n) by three
applications of the (abst)-rule. See ﬂags (c), (d) and (e) below, and the new
goals (m), (l) and (k).
(a) S : ∗
(b) P : S → ∗
(c) u : ¬(∃x : S . P x)
(d) y : S
(e) v : P y
. . .
(k) ? : ⊥
(l) ... : ¬(P y) (abst) on (k)
(m) ... : ∀y : S . ¬(P y) (abst) on (l)
(n) ... : ¬(∃x : S . P x) ⇒ ∀y : S . ¬(P y) (abst) on (m)
How can we obtain an inhabitant of ⊥ in line (k)? A promising idea is to
get it via ﬂag (c), by ﬁnding an inhabitant of ∃x : S . P x. If we succeed, then
we can apply u to this in order to get an expression of type ⊥.
See step (j) in the incomplete derivation below.
(a) S : ∗
(b) P : S → ∗
(c) u : ¬(∃x : S . P x)
(d) y : S
(e) v : P y
. . .
(j) ? : ∃x : S . P x
(k) ... : ⊥ (appl) on (c) and (j)
(l) ... : ¬(P y) (abst) on (k)
(m) ... : ∀y : S . ¬(P y) (abst) on (l)
(n) ... : ¬(∃x : S . P x) ⇒ ∀y : S . ¬(P y) (abst) on (m)156 The encoding of logical notions in λC
It is not hard to ﬁnd a solution to ? in line (j), since the second order ∃-
introduction rule tells us that it suﬃces to ﬁnd an a in S such that P a holds.
And such an a is obviously at hand, namely y: see ﬂags (d) and (e).
So the derivation going with (∃-intro-sec) – see Section 7.5 – gives the answer
what to take for ? in line (j).
The rest of the derivation is no more than accurate administration:
(a) S : ∗
(b) P : S → ∗
(c) u : ¬(∃x : S . P x)
(d) y : S
(e) v : P y
(1) λα : ∗. λw : (Πx : S . (P x → α)). wy v : ∃x : S . P x
(see Section 7.5)
(2) u(λα : ∗. λw : (Πx : S . (P x → α)). wy v) : ⊥
(appl) on (c) and (1)
(3) ... : ¬(P y) (abst) on (2)
(4) ... : ∀y : S . ¬(P y) (abst) on (3)
(5) ... : ¬(∃x : S . P x) ⇒ ∀y : S . ¬(P y) (abst) on (4)
We omitted the proof terms in lines (3) to (5), since they become longer and
longer. For the record, we spell out the proof term for line (5):
λu : ¬(∃x : S . P x). λy : S . λv : P y .
u(λα : ∗. λw : (Πx : S . (P x → α)). wy v).
Without the λC-deﬁnitions of ∃ and ¬, this expression would be even longer.
Since an expression of this length already occurs in the ﬁve-line example above,
we can easily imagine that we soon get unintelligible long expressions in a
derivation of some weight (see for example Exercise 7.14). Moreover, many
(sub-)expressions become repeated in the proof terms, as one can see already
in the proof objects of lines (1) and (2). These repetitions, together with
the length of the expressions, hinder the understanding of what’s happening.
Clearly, we have to do something about this, in order to keep our derivations
readable.
Another observation is that the natural deduction rules of logic are not
visible in derivations represented as above, as we see for example in line (1),
which is based on a ‘hidden’ ∃-introduction.7.7 Conclusions 157
Hence, in spite of the transparency we achieved by using the ﬂag format, we
need more means to maintain the overview in complex derivations, both in logic
and mathematics. In the following chapters it will turn out that a structured
deﬁnition system will help us considerably in getting a grip on derivations.
Note that our investigations in the present chapter already hinted at such an
expedient: on several occasions we used abbreviations for type-theoretic terms,
such as ⊥ for Πα : ∗. α and A∧B for ΠC : ∗. (A → B → C) → C. The usage
of the ∀- and ∃-quantiﬁers in the example above also helped a lot.
## 7.7 Conclusions
In this chapter we have investigated the possibilities for encoding basic logical
notions in type theory. When dealing with mathematical matters, for example
when inventing, writing or reading proofs, one often uses a standard logical
framework, which in more abstract form has become known as natural deduc-
tion. Most mathematicians apply this logical framework intuitively, since they
have been acquainted with it since their ﬁrst steps in mathematics.
We have succeeded in ﬁnding type-theoretic equivalents for the notions ab-
surdity and negation and their relation with natural deduction. Next, we have
introduced (second order) encodings of conjunction and disjunction. Since im-
plication has already been covered in type theory, we have obtained a type-
theoretic version of propositional logic (biimplication can be treated easily by
the usual deﬁnition).
This immediately delivers an encoding of constructive propositional logic. In
order to get classical logic, one has to add either ET (excluded third) or DN
(double negation). This can be done with an extra assumption at the front end
of the context, acting as an axiom.
We have also introduced the (second order) ‘constructive’ encoding of ∃ (the
encoding of ∀ was given in an earlier chapter). So also predicate logic (either
constructive or classical) is covered by type theory.
Moreover, all encodings appear to be intuitively acceptable on the one hand,
and precisely correspond to the usual logical introduction and elimination rules,
on the other hand. With a number of examples it has become clear how logical
derivations in type theory ‘work’.
We also experienced that proof terms in more complex derivations may grow
to an undesirable length, making it hard to keep the derivations within rea-
sonable bounds. This interferes with understanding and ease of survey. In fol-
lowing chapters, however, we shall solve these problems by an adequate usage
of deﬁnitions.
We have showed several times how we can mimic the logical proof that a158 The encoding of logical notions in λC
certain expression is a tautology, by giving a term of the corresponding type
and a derivation that this term is of the right type. Of course, proofs in logic
resemble their type-theoretic counterparts (the proof terms) to a great extent.
In both cases there is an underlying derivation system which gives justiﬁcations
for all the steps in the proof. This means that both a logical proof system and
the here-developed type-theoretic proof system can be fully automatised, which
means that the verifying check for such a proof can be left to a machine (e.g.
a computer).
Advantages of the type-theoretic encodings over the usual manner, based on
natural deduction, to formalise logical reasoning, are:
− Since type theory uses inhabitants of propositions as ‘witnesses’ of their
validity, we are forced to give a complete justiﬁcation of the logical facts
which we are proving. In ordinary logic, the precise justiﬁcations are often
not expressed at all, or only on the meta-level, e.g. by adding a phrase such
as: ‘by ⇒-elimination’. In type theory – due to the derivation rules which
use statements of the form M : A instead of solely the proposition A – such
justiﬁcations (the M’s) are on the object level: one is obliged to provide
such M’s as inhabitants, which are type-theoretic terms (having the proper
type A).
− This makes it also easy to build a computer program for checking logical
proofs: all ingredients of reasonings are well-described and precisely formu-
lated in type theory. Leaving gaps and ‘hand waving’ are not permitted when
conforming to the type-theoretic rules of λC.
− One sometimes expresses this powerful property of type theory as: proof
checking = type checking.
− By the use of type theory, it becomes feasible to extend logic in a uniform
manner to ‘full’ mathematics: the same principles holding for expressing
logic can be used to express mathematics in a formal way. Type theory
is much more general than logic alone: one can not only represent logical
notions, but also all kinds of mathematical notions. We give an idea of how
this works in the following chapters, in particular Chapters 12 to 15.
Hence, also for wider applications in the ﬁeld of mathematics, the use of
type theory can be advantageous, when we think of the following features:
− Checking of mathematical theorems and proofs, or even complete theories,
e.g. by the aid of a computer program.
− Helping mathematicians in ﬁlling in details in their mathematical inventions,
or in developing new mathematics. This is called proof assistance. Computer
programs designed for these purposes are called proof assistants. They are
particularly useful in very complicated proving situations, or in the case7.8 Further reading 159
where a proof consists of a great amount of diﬀerent simple cases (when a
human easily loses concentration, contrary to a computer).
Of course, there are also disadvantages of using type theory for logic: things
become more complicated; every detail has to be spelled out in order to comply
with the type-theoretic rules. This makes derivations harder to read. Reason-
ings in logic are usually easier to understand than their type-theoretic coun-
terparts. So for humans desiring only to understand what’s happening – in
particular students – it may be disputable whether logic in type theory is
preferable over ‘old-time’ logical systems. But type theory may certainly help
to deepen understanding.
## 7.8 Further reading
The deﬁnition of the connectives ∨, ∧ and ∃ in terms of ⇒ and ∀ in second
order logic is well-known from the literature and can be found e.g. in Troelstra
& van Dalen, 1988, or in van Dalen, 1994 (Theorem 4.5). In Sections 1.4, 1.6,
2.8 and 2.9 of the latter book one can also ﬁnd the ﬁrst order natural deduction
rules for the logical connectives, as we use them in this chapter. The book is a
rich and useful text on mathematical logic in general.
The interesting aspect of the second order deﬁnitions is that they work in a
constructive logic, so where we don’t have the double negation law (or excluded
middle). In the presence of the double negation axiom, one can also deﬁne ∨,
∧ and ∃ in terms of ⇒, ¬ and ∀ in the usual classical way: A∨B := ¬A ⇒ B,
A ∧ B := ¬(¬A ∨ ¬B) and ∃x. P(x) := ¬∀x. ¬P(x).
Several systems for formal logic were devised in the beginning of the twen-
tieth century. The various systems can be categorised as:
(1) natural deduction systems,
(2) sequent calculi,
(3) axiomatic systems (also called Hilbert style systems).
− The natural deduction systems were developed by G. Gentzen, and inde-
pendently by S. Jaśkowski, to capture the natural way that mathematicians
and logicians reason and to give this a formal foundation (Gentzen, 1934/5;
Jaśkowski, 1934). (More about the various systems of natural deduction,
their history and their use in textbooks, can be found in Pelletier, 1999.)
− In order to study his system of natural deduction, Gentzen introduced se-
quent calculus, which is much more explicit and in which one has more
control over the forms of the derivations.
− Hilbert style systems usually have a diﬀerent aim, namely to enable theoret-
ical investigations without being bothered by an abundance of rules.160 The encoding of logical notions in λC
In natural deduction, a judgement is of the shape:
A1,...,An  B,
where the Ai are seen as hypotheses and B as the conclusion. One may read
this as: from A1 to An we can derive B. The derivation rules say for each
connective how to introduce it and how to eliminate it. This can clearly be
observed from the rules for the various connectives that we have introduced in
the present chapter.
In sequent calculus, a judgement is of the shape:
A1,...,An  B1,...,Bk,
which can intuitively be read as A1 ∧ ... ∧ An  B1 ∨ ... ∨ Bk, or otherwise
said: (at least) one of the Bj follows from the conjunction of the Ai. The
derivation rules say for each connective how to introduce it on the left and
how to introduce it on the right. This gives the rules of sequent calculus a nice
symmetry.
For example, here are the classical rules for conjunction and disjunction,
where we abbreviate A1,...,An to A and B1,...,Bk to B. Note the crosswise
duality between the ∧- and ∨-rules.
A  C, B A  D, B
A  C ∧ D, B
A, C, D  B
A, C ∧ D  B
A  C, D, B
A  C ∨ D, B
A, C  B A, D  B
A, C ∨ D  B
The rules for implication are as follows:
A, C  D, B
A  C ⇒ D, B
A, D  B A  C, B
A, C ⇒ D  B
The derivation rules of sequent calculus are not devised for being ‘natural’,
but for being able to prove properties about the system. Gentzen did this
successfully, for example by proving various consistency results for logic using
sequent calculus. It can be shown that the derivable judgements of sequent
calculus and natural deduction are the same.
Another way to formalise the notion of logical derivation is via Hilbert sys-
tems, where one trades derivation rules for axioms. The idea is to introduce a
number of axiom schemes and have only few derivation rules. The simplest
instance is minimal proposition logic, which has no more than two axiom
schemes:
A ⇒ (B ⇒ A) and (A ⇒ (B ⇒ C)) ⇒ ((A ⇒ B) ⇒ (A ⇒ C)),7.8 Further reading 161
where A, B and C can be instantiated with any formula; and one derivation
rule, modus ponens:
A ⇒ B A
B
However, the axiomatic method is quite unnatural to make formal deriva-
tions in. Natural deduction is the system that corresponds closest to the ‘usual
way of reasoning’ in mathematics, so therefore we have adopted this to for-
malise reasoning. In fact, type theory can be seen as a more formal treatment
of natural deduction, because now the derivations themselves (the proofs) are
given a term representation.
The ﬂag-style format for natural deduction was introduced by Jaśkowski
(1934). Later it was further studied and popularised by F. Fitch (see Fitch,
1952) and it is therefore also often referred to as ‘Fitch style natural deduction’.
A practical introduction, especially for beginning students of mathematics or
computer science that want to learn to use the rules, is by Nederpelt & Ka-
mareddine (2011).
In ﬂag-style natural deduction, a derivation is not a tree but a linear con-
struction, where the scope of variables and hypotheses is explicitly delimited
by ﬂags. Flag-style natural deduction is not fundamentally diﬀerent from tree
style – also called Gentzen style. Geuvers & Nederpelt (2004) show how to
translate them to each other and how to translate a proof term to a tree-style
derivation or a ﬂag-style derivation.
Natural deduction has been studied extensively by D. Prawitz (Prawitz,
1965), especially in terms of the structure of the proofs. This is the ﬁeld of proof
theory, which was originally devoted to studying the structure and properties
of ‘derivation trees’, but due to the formulas-as-types/proof-as-terms analogy,
this is now also very much a study of the structure and properties of (proof)
terms in type theory. The β-reduction rule on terms has an interesting analogy
in derivations as ‘cut elimination’, which makes the study of normalisation
and conﬂuence of reduction also relevant for proof theory. Similar reductions
(either on the derivation level or on the term level) can be introduced for the
other connectives ∧, ∨ and the quantiﬁer ∃. We refer to Girard et al. (1989)
or Prawitz (1965) for details.
The already mentioned system Coq (Bertot & Castéran, 2004; Coq Develop-
ment Team, 2012) is a proof assistant based on type theory. Originally it was
based on the system λC and then the way to do logic in Coq was exactly what
we describe in the present chapter. Nowadays, however, Coq also has inductive
types, and the connectives are deﬁned inductively. In a computer system like
Coq, a user does not write the complete proof terms, but constructs them inter-
actively with the system via so-called ‘tactics’. This relieves the user from some162 The encoding of logical notions in λC
of the problems that we have encountered in this chapter, where proof terms
easily become very large: the Coq system doesn’t show the proof terms to the
user (but of course they are there!). We note, however, that the introduction
of formal deﬁnitions, as we employ later in the present book, overcomes most
of the mentioned inconveniences.
Exercises
## 7.1 Verify that each of the following expressions is a tautology in constructive
logic, (1) by giving a proof in natural deduction, and (2) by giving a
corresponding derivation in λC.
(For the natural deduction rules concerning ⇒, ⊥ and ¬, see Sec-
tion 7.1.)
You may employ the ﬂag style for the derivations, as in the examples
given in the present chapter.
(a) B ⇒ (A ⇒ B),
(b) ¬A ⇒ (A ⇒ B),
(c) (A ⇒ ¬B) ⇒ ((A ⇒ B) ⇒ ¬A),
(d) ¬(A ⇒ B) ⇒ ¬B (hint: use part (a)).
7.2 (a) Formulate the double negation law (DN) as an axiom in λC.
(b) Verify that the following expression is a tautology in classical logic,
by giving a corresponding ﬂag-style derivation in λC (use DN):
(¬A ⇒ A) ⇒ A.
## 7.3 Give λC-derivations proving that the following expressions are tautologies
in classical logic (so you may use DN or ET):
(a) (A ⇒ B) ⇒ (¬B ⇒ ¬A),
(b) (¬B ⇒ ¬A) ⇒ (A ⇒ B).
## 7.4 Give λC-derivations to show that the following natural deduction rules
are derivable in λC (cf. Section 7.2,I):
(a) (∧-elim-left-sec),
(b) (∧-elim-right-sec).
7.5 As Exercise 7.2(b):
(a) ¬(A ⇒ B) ⇒ A (hint: use Exercise 7.1(b)),
(b) ¬(A ⇒ B) ⇒ (A ∧ ¬B) (hint: use Exercise 7.1(d)).
## 7.6 Verify that each of the following expressions is a tautology in construc-
tive logic, by giving a (‘second order’) ﬂag-style derivation in λC. Use
Exercise 7.4 and Section 7.2, I.
(a) ¬A ⇒ ¬(A ∧ B),
(b) ¬(A ∧ ¬A),Exercises 163
(c) ¬(A ∧ B) ⇒ (A ⇒ ¬B).
## 7.7 Give λC-derivations to show that the following natural deduction rules
are derivable in λC:
(a) (∨-intro-left-sec),
(b) (∨-intro-right-sec).
## 7.8 Give λC-derivations verifying the following tautologies of constructive
logic (hint: use Exercise 7.7 and Section 7.2):
(a) (A ∨ B) ⇒ (B ∨ A),
(b) ¬(A ∨ B) ⇒ (¬A ∧ ¬B),
(c) (¬A ∧ ¬B) ⇒ ¬(A ∨ B).
## 7.9 Verify that each of the following expressions is a tautology in constructive
logic, (1) by giving a proof in ﬁrst order natural deduction, and (2) by
giving a ﬂag-style derivation in λC:
(a) ∀x∈S(¬P(x) ⇒ (P(x) ⇒ (Q(x) ∧ R(x)))),
(b) ∀x∈S(P(x)) ⇒ ∀y∈S(P(y) ∨ Q(y)).
## 7.10 As Exercise 7.9:
∀x∈S(P(x) ⇒ Q(x)) ⇒
∀y∈S(P(y) ⇒ R(y)) ⇒ ∀z∈S(P(z) ⇒ (Q(z) ∧ R(z))).
7.11 Let S : ∗ and P,Q : S → ∗. Let y : Πα : ∗. ((Πx : S . (P x → α)) → α),
z : Πx : S . (P x → Qx) and x : S.
(a) Find a correct type for y(Qx).
(b) Why is the application y(Qx)z incorrect?
(c) Check that this results corresponds with Remark 7.5.2.
7.12 (a) Complete the derivation given in Section 7.5 that shows that the
natural deduction rule (∃-intro-sec) is derivable in λC.
(b) Give a ﬂag-style λC-derivation verifying the following tautology of
classical logic:
¬∃x∈S(¬P(x)) ⇒ ∀y∈S(P(y)).
(Hint: use part (a) and DN.)
## 7.13 Verify that the following expression is a tautology in constructive logic,
by giving a ﬂag-style derivation in λC:
∃x∈S(P(x)) ⇒ (∀y∈S(P(y) ⇒ Q(y)) ⇒ ∃z∈S(Q(z))).
## 7.14 Let Γ ≡ S : ∗, P : S → ∗, Q : S → ∗.
Consider the following λC-expression:
M ≡ λu : (∃x : S . (P x ∧ Qx)). λα : ∗. λv : (Πx : S . (P x → α)).
uα(λy : S . λw : (P y∧Qy). v y (w(P y)(λs : P y . λt : Qy . s))).
(a) Find a type N such that Γ  M : N.164 The encoding of logical notions in λC
(b) Which logical tautology is expressed by N and proved by M?
(c) Give a derivation of Γ  M : N.8
Deﬁnitions
## 8.1 The nature of deﬁnitions
In the ‘real world’ of logical and mathematical texts, deﬁnitions are indispens-
able. This is particularly the case when the amount of ‘knowledge’ begins to
grow.
Therefore we aim at an extension of λC with deﬁnitions. In the present chap-
ter we start with an overview of what deﬁnitions are and how they are used.
Gradually, we shall transform the deﬁnitions to a more formal format, in order
to be able to incorporate them in λC. The derivation system that we eventu-
ally obtain when extending λC with deﬁnitions, we call λD, to be described
in Chapter 10. A simpler precursor shall be named λD0; see Chapter 9. In the
following sections we describe and discuss the essential features of deﬁnitions,
and how they can be formalised.
We ﬁrst ask ourselves: what is the use of a deﬁnition? The main reason for
introducing a deﬁnition is to denote and highlight a useful concept. Both logic
and mathematics are based on certain notions, most of which are composed
from other ones. It is very convenient to single out the noteworthy notions by
giving them names.
We start with a number of examples of deﬁnitions as they occur in mathe-
matics books.
Examples 8.1.1 (1) ‘A rectangle is a quadrilateral with four right angles.’
Here the notion that we want to single out is ‘a quadrilateral with four right
angles’. We give it the name ‘rectangle’. Note that the deﬁnition makes use of
other, ‘older’ names of notions, such as ‘quadrilateral’ and ‘right angle’. Each
of these names has been established in earlier deﬁnitions.
(2) ‘A function f from R to R is called increasing if, for all x,y ∈ R, x < y
implies f(x) < f(y).’166 Deﬁnitions
This deﬁnition says that the name ‘increasing’ may be used for a function
f : R → R, when it has the property described.
(3) ‘We say that a relation R on a set S is total, if for every two elements x
and y of S, either x is related to y, or y to x, or both.’
This is a deﬁnition of the notion ‘totality’. Obviously, we need to have some
set S and some relation R on S, before we can decide whether R is total on S.
Note that S comes ﬁrst: we need it for R (a relation on S).
The (new) names introduced in these deﬁnitions are words from natural
language: rectangle, increasing, total. However, it is also possible to use newly
invented ‘words’, or symbols, such as c or Dn; see the following examples.
Examples 8.1.2 (4) ‘Deﬁne c as 1+
√
5
2 ’.
In this deﬁnition, we use the short name c as a handy abbreviation of a more
complex expression – thus saving space, and making it easier to speak about
the object: after this deﬁnition, one may use the name c instead of the longer
expression 1+
√
5
2 .
Hence it is now appropriate to say: ‘It is easy to verify that c2 − c = 1.’
(5) ‘Let n be a natural number > 0. Then Dn is deﬁned as the set of all
positive integer divisors of n.’
Note that D depends on n: we need an n > 0 in order to determine what Dn
is. So we have that D1 = {1}, D2 = {1,2}, D3 = {1,3}, D4 = {1,2,4}, ....
We may use this deﬁnition afterwards, e.g. by saying that: ‘D4 ∪ D6 =
{1,2,3,4,6}’, or: ‘if k is a divisor of l, then Dk ⊆ Dl’.
Names such as c and Dn are probably for temporary use, but not essentially
diﬀerent from more permanent names such as ‘total’, described earlier. An
important feature of all kinds of newly deﬁned names is that they enable the
user to repeatedly refer to the related object or notion in a concise manner. In
principle, all kinds of names are useable, from ‘prime’ or ‘continuous’ to ‘F
3’
or ‘K
(0)
i ’.
Apart from the reasons mentioned above, there is also a practical reason for
introducing deﬁnitions: without deﬁnitions, logical or mathematical texts grow
rapidly beyond reasonable bounds. This is an experimental fact, which can be
veriﬁed by making a calculation for the ‘worst case scenario’; it has been shown
that deﬁnition-less mathematics may obtain a complexity that is considerably
worse than exponential growth.
Hence, in order to do logic and mathematics in a feasible way, we need
deﬁnitions.
We conclude that it is very convenient, and almost inevitable, to introduce
and use deﬁnitions.8.2 Inductive and recursive deﬁnitions 167
There is another case in which new names are presented, namely when in-
troducing a variable, as in the sentences ‘Let x be a real number’ or ‘Let f be a
function from R to R’. There is, however, an essential diﬀerence between such
variables and deﬁned names: variables (such as x, f) serve as names for ‘ar-
bitrary’ entities of a certain collection (real numbers, functions from R to R),
whereas deﬁned names stand for one speciﬁc thing or notion, being described
in the corresponding deﬁnition.
Remark 8.1.3 One preferably chooses names which are easy to remember
in connection with the notion concerned: a name often acts as a mnemonic
(‘something to remember the notion by, short and clear’). For example, the
word ‘rectangle’ combines the Latin word ‘rectus’, which means ‘right’ (cf. ‘rec-
tify’: make right), with the word ‘angle’. This may help to recall the notion.
Another example is the word ‘increasing’, which clearly has mnemonic power:
the graph of an increasing function, viewed from left to right, reminds of a path
with increasing height. The deﬁned name ‘total’ originates from the observation
that such a relation holds for the ‘totality’ of all pairs in S × S: each pair is
related in at least one of the two directions.
This preference for names which are easy to remember also applies to the
names used as a temporary aid. It is not a coincidence that the often used letter
‘c’ is also the ﬁrst letter of the word ‘constant’, and a similar thing holds for
the name ‘D’ as used above for a set of divisors.
When more constants need to be deﬁned (or more functions), then one usu-
ally varies a little bit on this habit: one uses primes or subscripts (not only c,
but also c, c1, ...) or letters in the same ‘range’ of the alphabet (a, b, d, ...).
## 8.2 Inductive and recursive deﬁnitions
In our type theory, we don’t have inductive deﬁnitions or inductive types (see
also Sections 5.7 and 6.5) as primitive constructions. In some very powerful type
theories such as the Calculus of Inductive Constructions (CIC; see e.g. Bertot
& Castéran, 2004) one can, for example, deﬁne the type of natural numbers as
the type inductively built up from the constant 0 and the successor function
(see Section 1.10). This automatically generates the induction proof principle
and the possibility of deﬁning functions by well-founded recursion.
We don’t have inductive deﬁnitions, because they can be deﬁned as predi-
cates in higher order logic. Alternatively, they can be assumed axiomatically,
as we will do for the integers in Section 14.2.
As for recursive deﬁnitions, the intention is to describe a certain object by
means of an algorithm. For example, the factorial n! of a natural number n
can be described by means of the recursion scheme:168 Deﬁnitions
fac(0) = 1,
fac(n + 1) = fac(n) · (n + 1).
Then we can, for example, calculate what the value of fac(3) is:
fac(3) = fac(2) · 3 = (fac(1) · 2) · 3 = ((fac(0) · 1) · 2) · 3 = 1 · 1 · 2 · 3 = 6.
Later in this book we will show that we can do without recursive deﬁnitions
by making use of the descriptor ι, which gives a name to a uniquely existing
entity (see Section 12.7). By not incorporating recursive deﬁnitions, we attain
two goals:
− we keep our system relatively simple;
− we avoid the complications accompanying such recursive deﬁnitions, such as
the necessity to show that each recursive deﬁnition represents a terminating
algorithm with a unique answer for each input.
An obvious drawback is that, in our case, a function like fac is not a program,
so it cannot be executed. As a consequence, fac(3) = 6 requires a proof .
For more examples of recursive deﬁnitions and of the way in which we embed
these in our type-theoretic system, see Section 14.4 (about integer addition)
and Section 14.11 (about integer multiplication).
## 8.3 The format of deﬁnitions
We borrow the following standard format for deﬁnitions from mathematics:
a := E .
This expresses that a is deﬁned as E. So a is the name given to E, which in its
turn is an expression describing some notion which is worth being named or
remembered.
Deﬁnition 8.3.1 (Deﬁniendum, deﬁned name, deﬁned constant, deﬁniens)
− In a := E, the name a is called the deﬁniendum (i.e. ‘the thing to be
deﬁned’), also called the deﬁned name or the deﬁned constant.
− The expression E is the deﬁniens: ‘the thing that deﬁnes’, or ‘the expression
that establishes what the meaning is’.
In this format we may rewrite two of the deﬁnitions given in Examples 8.1.1
and 8.1.2 as:
rectangle := quadrilateral with four right angles,
c := 1+
√
5
2 .
The situation is more complicated for the other examples, where we need
some kind of ‘setting’ for the deﬁnitions:8.3 The format of deﬁnitions 169
− For a proper deﬁnition of ‘increasing’, we must have the disposal of some
function f from R to R.
− For the deﬁnition of ‘total’, we need a set and a relation on this set.
− For the deﬁnition of Dn, we need a positive natural number n.
It will be clear that such a ‘setting’, as in the previous chapters, can be
formalised as a context for the deﬁnition in question. This can be expressed as
in Figure 8.1. (We there code a relation on S as a predicate on S × S.)
f : R → R
increasing(f) := ∀x,y∈R (x < y ⇒ f(x) < f(y))
S : ∗
R : (S × S) → ∗
total(S,R) := ∀x,y∈S(R(x,y) ∨ R(y,x))
n : N+
D(n) := the set of all positive integer divisors of n
Figure 8.1 Examples: deﬁnitions in a context
As these examples show, each deﬁned constant has been provided with a so-
called parameter list: (f), (S,R) and (n), respectively. In these lists we collect
the context variables (the subjects of the declarations) as appearing in the
ﬂags, in the original order. We say that the constant ‘increasing’ depends on
the parameter f, that ‘total’ depends on the parameters S and R, and D on n.
Remark 8.3.2 Parameter lists in deﬁnitions could as well be omitted: a
parameter list can always be reconstructed by inspecting the context.
We nevertheless choose to consistently append such a list to a deﬁned con-
stant, since addition of a parameter list to a deﬁnition makes it look more
‘natural’.
Compare for example the following two versions of the same deﬁnition, ex-
pressing the function ‘sum of two squares’ in the context x : R, y : R:
(1) (without parameter list) f := x2 + y2;
(2) (with parameter list) f(x,y) := x2 + y2.
We suppose that many readers prefer the latter deﬁnition over the former.
In order to employ a consistent format in these matters, we also should add
an empty parameter list to deﬁned constants such as ‘c’ above, and ‘rectangle’,170 Deﬁnitions
which do not need a context for their deﬁnition; or rather, which are deﬁned
in the empty context. Formally, we should write the following:
a rectangle() := ...,
c() := 1+
√
5
2 .
We will, however, often evade this obligation; see the following convention.
Notation 8.3.3 A constant that has been deﬁned in an empty context has an
empty parameter list. It may be written without such an empty list, not only
upon introduction (in its deﬁnition), but also when used later on.
## 8.4 Instantiations of deﬁnitions
Obviously, deﬁnitions are not made for their own sake, but in order to be used.
For example, we have already mentioned that the deﬁnition c := 1+
√
5
2 may
be used to state that c2 − c = 1, which is easier to read than
(1+
√
5
2 )2 − 1+
√
5
2 = 1.
Moreover, the same c may be used over and over again, for example in the
following calculation:
‘Since c2 = c + 1, we have that c3 = c2 + c = c + 1 + c = 2c + 1’,
or in establishing that
‘The n-th Fibonacci number fn satisﬁes the equation fn = cn−(1−c)n
√
5
.’
(Note that we repeatedly apply Notation 8.3.3 here, writing c for c().)
Matters become a bit more complex for deﬁnitions in a non-empty con-
text. For example, consider the deﬁnition of ‘increasing’ as expressed in Ex-
amples 8.1.1 and formalised with context f : R → R in Figure 8.1. When one
desires to employ that deﬁnition of ‘increasing’, one obviously must have a
function from R to R at hand. For example, consider the following sentence:
‘The function sending a real number to its third power, is increasing.’
In our format, this becomes: increasing(λx : R. x3).
What we see is that parameter f, occurring in increasing(f ), has been substi-
tuted by the function λx : R. x3. Such a substitution is called an instantiation
(of the parameter). One says: ‘f has been instantiated with λx : R. x3 ’.
Remark 8.4.1 Note that a parameter necessarily is a variable (namely a
subject variable of the context), whereas an instantiation may be a variable or
any other well-formed expression.
Of course, an instantiation should respect typing requirements as given in8.4 Instantiations of deﬁnitions 171
the context: since f has been introduced in its context ﬂag as having type
R → R, it must hold that also λx : R. x3 : R → R. This is clearly the case.
Another thing to note is that the context ﬂag f : R → R is only needed
in the deﬁnition itself; the ﬂag contains the parameter on which the deﬁned
notion (‘increasing’) depends, plus information about the type of that notion.
But as soon as we use the deﬁnition, by instantiating the parameter f, the ﬂag
itself has become superﬂuous (though its typing information is necessary for
establishing the ‘correctness’ of the instantiation).
So we may use the expression ‘increasing(λx : R. x3)’ wherever we like,
without the f-ﬂag. But, of course, only after the deﬁnition has been given.
In the majority of the cases, we meet a more complex situation in which
we have deﬁnitions with two or more parameters. Let’s look at example (3)
of Examples 8.1.1, in which the deﬁnition of total(S,R) has been given, with
the parameter list (S,R). In any ‘instance’ of the deﬁnition – that is, in any
situation in which we ‘use’ this deﬁnition – we need:
(i) a set as instantiation of S, and
(ii) a relation as an instantiation of R; this relation obviously should concern
the instantiated set, since S itself is no longer available.
For example, let’s take for S the set R of the reals, and for R the relation ‘≤’
on that set R. Then we obtain the correct instantiation
total(R,≤).
This is a proposition, which does indeed hold in mathematics.
Instantiating S with N+, the positive naturals, and R with ‘|’, the divisibility
relation on N+, we obtain
total(N+, |).
As an instantiation, this is correct, again. (Which has got nothing to do with
the fact that, as a proposition, it is false: for example, neither 3|5, nor 5|3.)
Note that in all cases, the type conditions as given in the context of the
deﬁnition should be respected in the instantiations of the parameter list, as
pictured in the diagram below.
ﬁrst ﬂag second ﬂag
S : ∗ R : (S × S) → ∗
instantiation instantiation
R : ∗ ≤ : (R × R) → ∗
N+ : ∗ | : (N+ × N+) → ∗
In deﬁnitions with more than two ﬂags, these type conditions clearly have a
cumulative eﬀect. The precise eﬀects will be described in Chapter 9.172 Deﬁnitions
Summarising: the use of a deﬁnition brings along that parameters become
instantiated. A convenient manner is to record the instantiations as a list as
well, in the same order as in the original parameter list.
The two diﬀerent aspects of constants (their introduction and their use)
imply that a constant has two diﬀerent life stages:
(1) its ‘birth’, when introduced in a deﬁnition, e.g. total(S,R);
(2) its ‘path of life’, when used in diﬀerent circumstances, with varying instan-
tiations for the parameters, e.g. total(R,≤) or total(N+, | ).
8.5 A formal format for deﬁnitions
Now that we know what deﬁnitions are and how they work, it is time to include
them in our formal system. Look again at the three deﬁnitions in Figure 8.1.
Each of these has the following general format:
Γ  a(x1,...,xn) := E,
with Γ a context and a a constant with suﬃxed parameter list (together the
deﬁniendum), having been deﬁned as E (the deﬁniens). We introduce the sym-
bol ‘’ here as a separator between the context and the rest.
The meaning of this expression clearly is:
In context Γ, we deﬁne a(x1,...,xn) as E.
Since we work in a typed environment, it appears to be appropriate to add a
type to the deﬁniens, which is also a type for the deﬁniendum. Therefore, our
general format for a deﬁnition becomes:
Γ  a(x1,...,xn) := M : N,
with M the deﬁniens and N its type, acting as type of a(x1,...,xn), as well.
The parameter list (x1,...,xn) consists of the subject variables of the context
(in the same order), so a deﬁnition looks like:
x1 : A1,...,xn : An  a(x1,...,xn) := M : N.
Here n is a natural number, so it may be 0 (if Γ is the empty context). The
parameter list (x1,...,xn) can directly be reconstructed from Γ. Nevertheless,
as we discussed before (see Remark 8.3.2), our general attitude is to add a
parameter list to every deﬁned constant.
Below, we will often use an abbreviating notation for the general format,
namely:
x : A  a(x) := M : N.
We employ the following abbreviations in the meta-language:8.5 A formal format for deﬁnitions 173
Notation 8.5.1 (1) We write x for the list x1,...,xn of variables.
(2) We write A for the list A1,...,An of expressions.
(3) We write x : A for the context x1 : A1,...,xn : An.
As we are used to doing, we employ the ﬂag format for the representation of
this kind of formal deﬁnition. This not only gives a better overview, but also
avoids annoying repetitions of context declarations.
As an example, we have listed a series of deﬁnitions regarding a set S and
a relation R on S in Figure 8.2. The notions ‘reﬂexive’, ‘antisymmetric’ and
‘transitive’ have been formally expressed here by means of deﬁned constants,
and so is their conjunction: ‘partially-ordered’. All four deﬁnitions depend on
the same context, and therefore we suﬃce with one initial pair of context ﬂags.
Since each of the four deﬁned notions is a proposition, they all have type ∗.
(a) S : ∗
(b) R : (S × S) → ∗
(1) reﬂexive(S,R) := ∀x∈S(R(x,x)) : ∗
(2) antisymmetric(S,R) := ∀x,y∈S((R(x,y) ∧ R(y,x)) ⇒ x = y) : ∗
(3) transitive(S,R) := ∀x,y,z∈S((R(x,y) ∧ R(y,z)) ⇒ R(x,z)) : ∗
(4) partially-ordered(S,R) :=
reﬂexive(S,R) ∧ (antisymmetric(S,R) ∧ transitive(S,R)) : ∗
Figure 8.2 A series of deﬁnitions
At the end of this book, we append an Index of deﬁnitions.
There are many instances of the list (S,R) in this ﬁgure. Four of these lists,
namely the ones left of the ‘:=’ signs in lines (1) to (4), are parameter lists, as
we discussed in Section 8.3. In these lists we collect the subjects S from ﬂag
(a) and R from ﬂag (b).
The lists (S,R) behind reﬂexive, antisymmetric and transitive in line (4),
however, are instantiations. To be precise: they are identity instantiations; that
is: in all cases, S has been instantiated with S and R with R. Obviously, the
present example contains only identity instantiations; although identity instan-
tiations are very common, as we shall experience later, the really interesting
instantiations occur when we instantiate with expressions that diﬀer from the
variables in the parameter list.
All variables S and R in (1) to (4), in particular the ones in the parameter
lists and in the instantiations in line (4), are bound variables, being bound to174 Deﬁnitions
the binding variables S and R in the ﬂags (a) and (b). These binding variables
are still within reach, as witnessed by the ﬂag poles.
An important observation is that the ﬂag notation involves an inherent ‘over-
loading’ of the binding variables S and R. In order to make this clear, we give
the deﬁnitions of Figure 8.2 in the formal style as introduced just now, split-
ting up the context over the deﬁnition lines. But we do more: in order to be as
exact as possible, we apply a strict renaming, avoiding the usage of diﬀerent
binding variables with the same name. Thereby, we avoid overloading.
We use diﬀerent subscripts for all binding occurrences of the ‘ﬂag variables’
S and R. To be ultimately clear, we also distinguish the diﬀerent occurrences
of the binding variables x, y and z accompanying the ∀-quantiﬁers.
This leads to the following four deﬁnitions-in-a-context in which all ‘over-
loading’ has been eliminated:
(i) S1 : ∗, R1 : (S1 × S1) → ∗ 
reﬂexive(S1,R1) :=
∀x1∈S1
(R1(x1,x1)) : ∗
(ii) S2 : ∗, R2 : (S2 × S2) → ∗ 
antisymmetric(S2,R2) :=
∀x2,y2∈S2
((R2(x2,y2) ∧ R2(y2,x2)) ⇒ x2 = y2) : ∗
(iii) S3 : ∗, R3 : (S3 × S3) → ∗ 
transitive(S3,R3) :=
∀x3,y3,z3∈S3
((R3(x3,y3) ∧ R3(y3,z3)) ⇒ R3(x3,z3)) : ∗
(iv) S4 : ∗, R4 : (S4 × S4) → ∗ 
partially-ordered(S4,R4) :=
reﬂexive(S4,R4) ∧ (antisymmetric(S4,R4) ∧ transitive(S4,R4)) : ∗
An important thing that we can learn from this example is that deﬁnitions
often depend on other deﬁnitions. Clearly, (iv) depends on (i) to (iii), since
the constants reﬂexive, antisymmetric and transitive are used in the deﬁniens
of (iv). So there is an order between deﬁnitions, which must be respected. For
example, we may list (i), (ii) and (iii) in an arbitrary order, but (iv) must
always follow all of these.
## 8.6 Deﬁnitions depending on assumptions
In the previous sections, we have encountered deﬁnitions depending on a con-
text. The variables we met in those contexts represented sets (such as S),
objects (f, n) or relations (R).
Another frequently occurring case is that such a context contains one or more
assumptions. Such assumptions are often expressed as conditions imposed on
context elements. For example, when deﬁning what a minimal element is in a8.7 Giving names to proofs 175
set with respect to a relation, one often already assumes that the set has been
partially ordered by this relation:
‘Let S be a set, partially ordered by a relation R. An element m of S is
called a minimal element with respect to R, if R(x,m) implies that x = m.’
(So the only element related to a minimal element m, is m itself.)
This deﬁnition of ‘minimal element’ presupposes that we have a relation
R that is partially ordered. We have formalised this notion in the previous
section (see Figure 8.2). We can extend this ﬁgure with a new deﬁnition: see
Figure 8.3, line (5). We need two more ﬂags, one of them (ﬂag (c)) expressing
the assumption mentioned above.
. . .
(c) u : partially-ordered(S,R)
(d) m : S
(5) minimal-element(S,R,u,m) := ∀x∈S(R(x,m) ⇒ x = m) : ∗
Figure 8.3 Deﬁnition of ‘minimal element’, depending on an assumption
This new deﬁnition is a ﬂag version of the deﬁnition:
(v) S : ∗, R : (S × S) → ∗, u : partially-ordered(S,R), m : S 
minimal-element(S,R,u,m) := ∀x∈S(R(x,m) ⇒ x = m) : ∗.
## 8.7 Giving names to proofs
With the formal machinery described up to here, we can already express a
wide range of deﬁnitions in formal form. For example, we have met deﬁnitions
of constants for:
− sets, having ∗ as type;
− objects, having a set as type; and
− propositions, having ∗ as type.
Notation 8.7.1 The kind ∗ is used as representing both the type of sets and
of propositions. For a better understanding, it is sometimes convenient to add
a subscript to ∗ in order to distinguish between these two interpretations: we
then write ∗s for the type of all sets, and ∗p for the type of all propositions.
However, this is only a kind of ‘sugaring’ to facilitate the interpretation: in
the formal type theory discussed in this book, there are no such things as ∗s or
∗p, but only ∗.
With this notation, we see that some of the example constants of Sections 8.1
and 8.3 satisfy the following typing conditions:176 Deﬁnitions
− (sets) rectangle : ∗s and D(n) : ∗s,
− (objects) c : R (with R : ∗s),
− (propositions) increasing(f) : ∗p and total(S,R) : ∗p.
In a schematic form, we may summarise all this in a table (see Figure 8.4),
showing these three elementary kinds of deﬁnitions in an abstract setting.
(sets) Γ1  A(...) := E1 : ∗s
(objects) Γ2  a(...) := E2 : S
(propositions) Γ3  B(...) := E3 : ∗p
with S : ∗s
Figure 8.4 Three diﬀerent kinds of deﬁnitions
It is obvious that there is one line missing in Figure 8.4: a line representing
a deﬁnition of a proof of a proposition (see Figure 8.5).
(proofs) Γ4  b(...) := E4 : P with P : ∗p
Figure 8.5 A missing kind of deﬁnition
This is the kind of deﬁnition which gives a name, viz. b(...), to a proof E4
of a proposition P.
By means of the following example we shall make clear that this kind of def-
inition should indeed be added, since it is very important in the formalisation
of mathematics, in particular when one wants to apply a valid (i.e. proven)
theorem.
Consider the following example from mathematics:
‘Theorem. Let m and n be positive natural numbers and assume
that they are coprime. Then there are integers x and y such that
mx + ny = 1.’
(Two positive natural numbers are coprime if their greatest common divisor
is 1.)
Remark 8.7.2 This theorem (or a slightly diﬀerent version of it) is known
under the name Bézout’s Lemma. More information about it can be found in
Remark 15.1.1. We shall devote Chapter 15 to Bézout’s Lemma, in which we
formalise a proof of it in the formal system λC extended with deﬁnitions. This
serves as the major example of the system-with-deﬁnitions being developed in
this book.8.7 Giving names to proofs 177
The theorem states that:
∃x,y∈Z(mx + ny = 1)
which depends on a context that we can summarise as:
m : N+, n : N+, u : coprime(m,n),
where N+ is the type of the positive naturals.
The third declaration expresses an assumption: variable u represents an as-
sumed ‘proof’ (cf. Section 8.6) of the proposition coprime(m,n).
Suppose that we have a correct proof of the theorem, in a formalised version;
say formalproof. Then formalproof has type ∃x,y : Z. (mx + ny = 1), fol-
lowing PAT, and we obtain the following version of Bézout’s Lemma, writing
the context in ﬂags:
m : N+
n : N+
u : coprime(m,n)
formalproof : ∃x,y : Z. (mx + ny = 1)
An important aspect of such a theorem is that it can be applied. For example,
we might want to use Bézout’s Lemma with m = 55 and n = 28, which is
allowed since their greatest common divisor is 1. Say we have a proof U of
the coprimality of 55 and 28. Then we can apply the theorem by means of an
instantiation, employing the substitution:
[m := 55], [n := 28], [u := U].
Note that we instantiate the assumption u of type coprime(m,n) with the
proof U of type coprime(55,28); hence, the m and n in the type of u have been
instantiated, as well.
Remark 8.7.3 We use the symbol ‘:=’ for substitution as we did in Sec-
tion 1.6. Note that the symbol ‘:=’ is overloaded, since we have also decided to
employ it for a deﬁnition.
The result of applying Bézout’s Lemma in this special case is that (without
a context):
∃x,y : Z. (55x + 28y = 1).
How can we obtain a proof for ∃x,y : Z. (55x + 28y = 1)? It is not hard
to imagine that such a proof may be constructed by taking the expression
formalproof and substituting [m := 55], [n := 28], [u := U] everywhere in this178 Deﬁnitions
expression. This procedure specialises the general proof formalproof into a
proof of ∃x,y : Z. (55x + 28y = 1).
All this can be realised very quickly and in a formal manner, as well, when
we give a name to that proof (as suggested in Figure 8.5), say p. In ﬂag format:
m : N+
n : N+
u : coprime(m,n)
p(m,n,u) := formalproof : ∃x,y : Z. (mx + ny = 1)
Or, in the formal format for deﬁnitions:
m : N+
, n : N+
, u : coprime(m,n) 
p(m,n,u) := formalproof : ∃x,y : Z. (mx + ny = 1).
Now we may formally conclude that, for the instantiation with [m := 55],
[n := 28], [u := U]:
p(55,28,U) : ∃x,y : Z. (55x + 28y = 1).
And this is a perfect use of a deﬁnition, exactly following the patterns as we
have described earlier. Hence, it is worth while to also allow deﬁned names for
proofs. So all four kinds of deﬁnitions discussed in the beginning of this section
have become part of our ‘deﬁnition tool box’.
8.8 A general proof and a specialised version
We have expressed a version of Bézout’s Lemma in the previous section, but
we did not prove it there, although we gave the name p(m,n,u) to a formal
proof that we supposed to exist. Part of this omission will be remedied in the
present section, since we shall write down a proof in the usual mathematical
format: see Figure 8.6.
In the proof-in-words given here, we consider the set S of all ‘linear combi-
nations’ of m and n, i.e. the numbers mx+ny for integer x and y. The positive
part of S has a minimum, say d. A clever calculation shows that d divides m,
and also n. The desired result then follows easily.
We invite the reader to study the details of the proof and to check its cor-
rectness. The formal proof of this lemma, expressed in λD, will be the subject
of Chapter 15.
In the previous section we also claimed that p(55,28,U) represents a proof
of Bézout’s Lemma in the special case when m = 55 and n = 28, where U8.8 A general proof and a specialised version 179
General theorem: (Bézout’s Lemma)
Let m and n ∈ N+
be coprime. Then ∃x,y∈Z(mx + ny = 1).
Proof Let S be the set of all integer numbers mx + ny, where x ∈ Z and y ∈ Z, and
let S+
be the subset of the positive elements of S. Let d be the minimum of S+
.
Since d ∈ S+
, we have d > 0. Also d ∈ S, hence:
(1) d = mx0 + ny0
for certain x0,y0 ∈ Z.
Divide m by d: we get
(2) m = qd + r,
for certain q and r with 0 ≤ r < d (r is the remainder of the division).
From (1) and (2) we obtain m = q(mx0 + ny0) + r, hence r = m(1 − qx0) − n(qy0),
implying that r ∈ S.
If r were greater than 0, then r ∈ S+
, so r ≥ d since d = min(S+
). But r < d;
contradiction. Hence, r = 0.
So, m = qd by (2), hence d|m.
In a similar manner we can prove d|n.
Since m and n are coprime, d must be 1, so 1 ∈ S.
Hence there exist x,y ∈ Z such that mx + ny = 1.
Figure 8.6 A proof of Bézout’s Lemma
represents a proof of the fact that 55 and 28 are coprime. The result is now
that ∃x,y : Z. (55x + 28y = 1).
In order to support this claim, we also write out the specialised proof; see
Figure 8.7.
Special theorem: (Bézout’s Lemma for m = 55 and n = 28)
∃x,y∈Z(55x + 28y = 1).
Proof Let S be the set of all integer numbers 55x+28y, where x ∈ Z and y ∈ Z, and
let S+
be the subset of the positive elements of S. Let d be the minimum of S+
.
Since d ∈ S+
, we have d > 0. Also d ∈ S, hence:
(1) d = 55x0 + 28y0
for certain x0,y0 ∈ Z.
Divide 55 by d: we get
(2) 55 = qd + r,
for certain q and r with 0 ≤ r < d.
From (1) and (2) we obtain 55 = q(55x0 +28y0)+r, hence r = 55(1−qx0)−28(qy0),
implying that r ∈ S.
If r were greater than 0, then r ∈ S+
, so r ≥ d since d = min(S+
). But r < d;
contradiction. Hence, r = 0.
So, 55 = qd by (2), hence d|55.
In a similar manner we can prove d|28.
Since 55 and 28 are coprime, d must be 1, so 1 ∈ S.
Hence there exist x,y ∈ Z such that 55x + 28y = 1.
Figure 8.7 A proof of Bézout’s Lemma with m = 55 and n = 28180 Deﬁnitions
A proof as in Figure 8.7 is not something one easily encounters, neither in
mathematics, nor in a formalisation. We give it here just to illustrate our claim:
the proofs in Figures 8.6 and 8.7 are very similar, with the only diﬀerence the
use of the general numbers m and n in the ﬁrst case, and the special numbers
55 and 28 in the second case.
It is important to realise that both proofs may be read independently as
convincing mathematical argumentations for the validity of the respective the-
orems: one may read, for example, the specialised proof and believe it without
even being aware of the general version.
This proof specialisation works properly, but is very cumbersome. A math-
ematician will apply the general lemma to this special case without devoting
many words to this. And in a formal setting such as λD, one can suﬃce with in-
stantiating the proof name p(m,n,u) to p(55,28,U), since the latter expression
fully encapsulates the proof of the special theorem.
Remark 8.8.1 For the special theorem there also exists a short, direct proof
that does not use the general theorem, viz.:
‘Since 55.(−1) + 28.2 = 1, by elementary logic: ∃x,y∈Z(55x + 28y = 1).’
But this is irrelevant. The point that we want to make is that the specialised
proof of the theorem, as presented in Figure 8.7, is indeed a correct proof; the
length of the proof does not matter for this observation.
## 8.9 Mathematical statements as formal deﬁnitions
In Section 8.7 we have seen that giving names to proof objects can be useful. But
this also has consequences for our formalisation of mathematical statements if
we realise that every statement in the judgement-format of λC,
Γ  M : N,
can also be represented in deﬁnition format:
Γ  a(...) := M : N.
This small transformation enables us to treat statements and deﬁnitions in
a similar manner, by taking the deﬁnition format as the reigning format. The
only complication is then that in every statement the term M must be preceded
by a constant and parameter list, a(...). But this small inconvenience causes
great proﬁt in the case M is a proof term proving N, because it enables us to
apply theorem N in a smooth but formal manner. We have demonstrated this
in Sections 8.7 and 8.8, when applying Bézout’s Lemma to a special case.
In order to show how this transformation works, we give an example in
which we consistently employ the deﬁnition format for the formalisation of8.9 Mathematical statements as formal deﬁnitions 181
mathematics. Consider the following text, which repeats the deﬁnition of ‘total’
(cf. Figure 8.1) and continues with some other notions and related statements.
‘A relation R on a set S is called total if for all x,y ∈ S we
have R(x,y) or R(y,x).
The inverse of a relation R is the relation R such that R(x,y)
iﬀ R(y,x).
If R is total, then also the inverse of R is total.
The relation R on S such that R(x,y) iﬀ x = y, is called the
identity relation on S.
If S has more than one element, then the identity relation on
S is not total.
An example of a total relation on R is ≤.’
This text contains three deﬁnitions-in-a-context, namely of the notions ‘to-
tal’, ‘inverse’ and ‘identity relation’. These deﬁnitions have been mixed with
three unproven statements:
− If R is total, then also the inverse of R is total.
− If S has more than one element, then the identity relation on S is not total.
− The relation ≤ on R is a total relation.
Below we represent all these as formal deﬁnitions, in ﬂag format. The three
missing proof objects are provisionally called open-term1 to open-term3. For
clearness’ sake, we specialise ∗ to either ∗s or ∗p (cf. Notation 8.7.1).
(a) S : ∗s
(b) R : (S × S) → ∗p
(1) total(S,R) := ∀x,y : S . (R(x,y) ∨ R(y,x)) : ∗p
(2) inverse(S,R) := λ(x,y) : (S × S) . (R(y,x)) : (S × S) → ∗p
(3) p1(S,R) := open-term1 : total(S,R) ⇒ total(S,inverse(S,R))
(4) Id(S) := λ(x,y) : (S × S) . (x = y) : (S × S) → ∗p
(5) p2(S) := open-term2 : (|S| ≥ 2) ⇒ ¬(total (S,Id(S))
(6) p3 := open-term3 : total(R,≤)
Figure 8.8 A formalised mathematical text in deﬁnition format
This example shows that the formal deﬁnition format as we have introduced
it in Section 8.5 is very powerful: formal deﬁnitions can be used as the basic
units for expressing oneself in a type-theoretic ambiance, and a formalised182 Deﬁnitions
mathematical text is no more than a list of well-formed deﬁnitions. This is a
point of great importance, which we shall fruitfully exploit in the chapters to
come.
But we still have to ﬁnd out what the notion ‘well-formedness’ means for
deﬁnitions. This we discuss in the following two chapters.
## 8.10 Conclusions
In the previous chapters there has hardly been any need for deﬁnitions or
abbreviations: the logical systems that we considered were relatively simple.
Remember, however, that we used a deﬁnition for ⇔ (see Remark 7.3.1). More-
over, there were several ‘hidden’ deﬁnitions in Chapter 7: for example, ⊥ was
deﬁned as (‘identiﬁed with’) Πα : ∗. α, and ¬A was introduced as abbreviating
A → ⊥.
When formalising more substantial parts of logic and mathematics, we can-
not do without deﬁnitions. An introduction to this concept of ‘deﬁnition’ was
given earlier in this chapter.
We have become acquainted with deﬁnitions, their nature and their usage.
The main purpose of a deﬁnition is to single out a useful notion and enable one
to refer to it later; this is an essential desire in both logic and mathematics.
Moreover, deﬁnitions have proven to be extremely useful in the development of
any mathematical theory; it is even inevitable to use deﬁnitions, since without
them one very soon loses grip on the complexity of what one wishes to express.
We do not consider inductive and recursive deﬁnitions, although this kind of
deﬁnitions is often used in proof assistants. But since we can do without them,
we do not incorporate them in our type system. This has certain advantages:
it keeps our system simpler and it relieves us of the obligation to inspect each
inductive deﬁnition on its ‘soundness’.
We have introduced a general format for deﬁnitions:
a := E,
expressing that a is deﬁned as E.
Since deﬁnitions are often expressed in a context and since we like to work
with typed expressions, we have extended this format to:
Γ  a(...) := M : N,
with Γ a list of declarations, a the deﬁned constant and (...) the parameter
list, consisting of the subject variables of Γ, listed in the same order. In such
a deﬁnition-in-a-context, a(...) has been deﬁned relative to Γ as M, having
type N. The parameter list is essentially superﬂuous, but we employ it in spite
of this, for several reasons.
Using a deﬁnition amounts to calling upon the deﬁned constant a, provided8.11 Further reading 183
with an instantiation of the parameter list, each parameter substituted with
an appropriate expression. Such a ‘compound’ substitution is rather precise
work, since it has to satisfy the typing conditions as stated in the declarations,
and should also be applied to all types in the variable declarations that are
involved. Hence, substitution has a direct (and cumulative) eﬀect on the typing
conditions.
We have observed that it is natural to also use a deﬁnition for identifying a
proof of a proposition. We argued that this kind of deﬁnition is desirable for
being able to make use of (‘apply’) a valid proposition (a theorem, a lemma) in
diﬀerent ‘situations’. Such a desire can easily be satisﬁed by naming the proof
of a theorem, and instantiating this proof later, in the new circumstances, by
means of a substitution.
It is interesting to see that also statements, e.g. expressed as λC-judgements,
ﬁt in the general format for deﬁnitions that we have developed, with only a
slight adaptation. This enables us to employ a uniﬁed standard format for
formally expressing mathematical texts: a satisfactory formalisation consists of
an ordered list of formal deﬁnitions, and no more than that. This is a promising
road, which we will follow in the chapters to come.
Now that we have investigated the pragmatic aspects of deﬁnitions, it be-
comes time to formalise the concept of ‘deﬁnition’ in one of our formal type-
theoretic systems, for which we shall take λC. The desired extension of λC asks
for new derivation rules, which makes the system more complex. But it also
makes things easier for the formalisation of logical and mathematical content,
since deﬁnitions are so handy, useful and even indispensable in ‘real-life’ situa-
tions. Formal derivation rules for deﬁnitions enable one to mimic the common
way of thinking, in particular as regards deﬁnitions, in the formal setting of
λC. This is the subject of the following two chapters.
## 8.11 Further reading
As we have seen in this chapter, deﬁnitions are everywhere in mathematics
and they have an interesting structure with dependencies on parameters that
can be sets, objects or proofs. In formal logics, deﬁnitions are left unanalysed
and are used as ‘meta-level’ abbreviations: in a book on formal logic one ﬁnds
statements like ‘we deﬁne ϕ(x,y) to be the formula x + y = y + x’ or ‘we
abbreviate the formula x + y = y + x to ϕ(x,y)’. But no formal rules are
introduced for what is a well-formed deﬁnition, or rules for instantiating a
deﬁnition or for unfolding it (i.e. ‘undoing’ a deﬁnition, by replacing a constant
by its deﬁniens, properly instantiated). For example, ϕ(2,3) can be ‘unfolded’
to 2+3 = 3+2. But in a book text, ϕ(2,3) and 2+3 = 3+2 would just be used184 Deﬁnitions
as synonyms. (We come back to unfolding in Section 9.5.) So, deﬁnitions are
treated as ‘abbreviations in the meta-language’. In various mathematics texts
one would even be more sloppy, writing ‘we abbreviate the formula x+y = y+x
to ϕ’, and then later write ϕ(2,3) for 2 + 3 = 3 + 2.
Deﬁnitions have been the subject of study by many philosophers. In ordinary
language, deﬁnitions are not only used as a (parameterised) abbreviation, but
have other purposes. As mathematics also uses natural language, these issues
also come up when formalising mathematics. So, the question of what deﬁni-
tions in ordinary language mean in terms of formal mathematics is important,
but this is not what is dealt with in this chapter (or book): we only deal with
the correct treatment of formal mathematical deﬁnitions, not with the process
of understanding what a linguistic deﬁnition means formally.
For further reading on the topic of deﬁnitions from a linguistic or philosophic
perspective, the Stanford Encyclopedia of Philosophy is a good starting point
(see Gupta, 2014). Also the paper On Denoting by B. Russell (Russell, 1905) is
interesting, because it was the starting point for lots of discussions and research
into the topic.
When implementing a system as a proof assistant, deﬁnitions are indispens-
able, so all proof assistants have an implementation of deﬁnitions. Unfolding of
deﬁnitions is an operation that a proof assistant would do sparingly, because
unlimited deﬁnition unfolding increases the size of formulas. Even though proof
assistants have a formal deﬁnition mechanism implemented, the formal rules for
deﬁnitions are often not described as a calculus and are thus left unexplained.
The ﬁrst study of deﬁnitions in the context of λC and related type theories
was by P.G. Severi and E. Poll (Severi & Poll, 1994). The rules presented there
are, on the one hand, more restricted than ours, because they do not allow
parameterised deﬁnitions. All deﬁnitions are of the form c := t : A and if
one wants to give a parameter to a deﬁnition, it has to be ‘abstracted over’
by a λ-abstraction. So, for example, total(S,R) := ∀x,y∈S(R(x,y) ∨ R(y,x)),
cf. Figure 8.1, would have to be deﬁned with a double λ-abstraction, e.g. as
follows:
Total := λS : ∗s . λR : S → S → ∗p . ∀x,y : S . (R(x,y) ∨ R(y,x)).
It should be noted that this method of replacing a number of parameters
by λ-abstractions only works if the λ-abstractions are allowed by the type
theory: there is no restriction on which variables can be used as parameters,
but in general there is a restriction on the λ-abstractions that one can do.
(However, in λC there happens to be none.) See Kamareddine et al. (2004) for
a close investigation of the various possibilities of restrictions on abstractions
and parameter use.
On the other hand, the deﬁnitions by Severi & Poll (1994) are more general,Exercises 185
because ‘local deﬁnitions’ are allowed: a deﬁnition can be introduced at any
time inside the context and it can be abstracted over, so deﬁnitions can occur
deeper inside a term or a proof. This allows, for example, a local deﬁnition
within a proof, where the scope of the deﬁnition is limited to the proof in
which it is used. We see such a deﬁnition in the proof about the greatest
common divisor in Figure 8.6, where the deﬁnitions of S and S+ are local to
that proof.
In systems with global and local variables, the distinction between them is
part of the syntax. It will be obvious that there is a need for diﬀerent rules
concerning the two kinds of deﬁnitions.
For local deﬁnitions, as they are introduced by Severi & Poll (1994), without
parameters, one allows contexts which contain declarations x : A and deﬁni-
tions c := t : A in arbitrary order. There are rules for ensuring the correctness
of these contexts and there are the usual rules for λ, Π, etcetera. The crucial
rule for allowing ‘local deﬁnitions’ is the following derivation rule:
Γ, c := t : A  M : B
Γ  (c := t : A in M) : (c := t : A in B)
This allows a deﬁnition to go ‘deeper in a term’, making it possible to have
e.g. local deﬁnitions in a proof. In the setting developed in the present book,
however, local deﬁnitions are not essential, since they may easily be represented
by ‘global’ ones, as we will demonstrate later.
In the Automath project, a deﬁnition is sometimes formalised via a β-redex,
following the idea that c := t : A in M is convertible with (λc : A. M)t.
(They have the same normal form.) In that case one has to consider a ‘mini
reduction’ to allow the replacement of just one occurrence of c in M. That is,
if M[c] depicts M in which a speciﬁc occurrence of c is ‘highlighted’, we have
(λc : A. M[c])t → (λc : A. M[t])t, with M[t] being M in which t replaces the
speciﬁc occurrence of c.
Exercises
8.1 In Section 8.7, we gave the name p(m,n,u) to a proof of the proposition
∃x,y : Z. (mx + ny = 1)
in the context Γ ≡ m : N+, n : N+, u : coprime(m,n).
Assume that we have constructed, in context m : N+, n : N+, a proof
(i.e. an inhabitant) q(m,n) of the proposition
coprime(m,n) ⇒ coprime(n,m).
Find an inhabitant of ∃x,y : Z. (nx + my = 1) in context Γ.186 Deﬁnitions
## 8.2 The formal text represented below in ﬂag format, is about a number of
well-known notions in analysis, containing some statements with omitted
proofs.
V : ∗s
u : V ⊆ R
(1) bounded-from-above(V,u) :=
∃y : R. ∀x : R. (x ∈ V ⇒ x ≤ y) : ∗p
s : R
(2) upper-bound(V,u,s) := ∀x : R. (x ∈ V ⇒ x ≤ s) : ∗p
(3) least-upper-bound(V,u,s) := upper-bound(V,u,s) ∧
∀x : R. (x < s ⇒ ¬upper-bound(V,u,x)) : ∗p
v : V = ∅
w : bounded-from-above(V,u)
(4) p4(V,u,v,w) := ... : ∃1s : R. (least-upper-bound(V,u,s)
(5) S := {x : R | ∃n : R. (n ∈ N ∧ x = n
n+1)} : ∗s
(6) p6 := ... : S ⊆ R
(7) p7 := ... : bounded-from-above(S,p6)
(8) p8 := ... : least-upper-bound(S,p6,1)
(a) Translate the text into a more usual format, as you might ﬁnd in a
textbook. (Note: ∃1 expresses unique existence; ‘there exists exactly
one ...’.)
(b) Which of the eight lines are formalised deﬁnitions? Which are for-
malised mathematical statements?
(c) Which constants have been introduced in the text and which con-
stants will have been introduced before?
(d) Underline all instantiations of parameter lists in the formal text and
explain accurately what has been instantiated for what, and why that
is correct.
## 8.3 Consider the formal text in Exercise 8.2. Describe the partial order rep-
resenting the dependencies between the deﬁnitions given in this text. (Cf.
the end of Section 8.5.)
## 8.4 The following formal text in ﬂag format is about some well-known notions
in algebra, where ‘op’ means a binary operation on S, in Curried form
(cf. Remark 1.2.6).Exercises 187
S : ∗s
op : S → S → S
(1) semigroup(S,op) :=
∀x,y,z : S . (op x(op y z) = op (op xy)z) : ∗p
u : semigroup(S,op)
e : S
(2) unit(S,op,u,e) := ∀x : S . (op xe = x ∧ op ex = x) : ∗p
(3) monoid(S,op,u) := ∃e : S . (unit(S,op,u,e)) : ∗p
e1,e2 : S
(4) p4(S,op,u,e1,e2) :=
... : (unit(S,op,u,e1) ∧ unit(S,op,u,e2)) ⇒ e1 = e2
(a) Translate the text into a more usual format, as you might ﬁnd in a
textbook. Use inﬁx notation when appropriate.
(b) Underline all variables that are bound to a binding variable intro-
duced in the text.
(c) Rewrite lines (1) and (2) in the format Γ  a(...) := M : N as
described in Section 8.5.
## 8.5 Identify the deﬁnitions in the following text and rewrite the text in a
formal form, using exclusively the deﬁnition format, as demonstrated in
Figure 8.8. Assume that R is a type. Employ the ﬂag format and the set
notation {x : R|P x}.
‘The real number r is rational if there exist integer numbers p and q
with q = 0 such that r = p/q. A real number that is not rational is called
irrational. The set of all rational numbers is called Q. Every natural
number is rational. The number 0.75 is rational, but
√
2 is irrational.’
## 8.6 Consider the following mathematical text:
‘If k, l and m are integers, m being positive, then one says that k is
congruent to l modulo m if m divides k − l. We write k ≡ l(mod m) to
indicate that k is congruent to l modulo m.
Hence −3 ≡ 17(mod 5), but not −3 ≡ −17(mod 5).
If k ≡ l(mod m), then also l ≡ k(mod m).
k ≡ l(mod m) if and only if there is an integer u such that k = l+um.’
(a) Rewrite the texts in a formal form, as a list of deﬁnitions. Assume
that Z is a type. Employ the ﬂag format. Formalise k ≡ l(mod m) as
eqv(k,l,m,u), with u a proof that m is positive.188 Deﬁnitions
(b) Indicate the scopes of all variables and constants introduced in the
formal text.
(c) Identify all instantiations of the parameter lists introduced in the
formal text and check that the type conditions are respected.9
Extension of λC with deﬁnitions
## 9.1 Extension of λC to the system λD0
In the present chapter we investigate the formal aspects of adding deﬁnitions
to a type system. In this we follow the pioneering work of N.G. de Bruijn (cf.
de Bruijn, 1970). As the basic system we take λC, the most powerful system
in the λ-cube. System λC is suitable for the PAT-interpretation, because it
encapsulates λP. But it also covers the nice second order aspects of λ2. There-
fore, λC appears to be enough for the purpose of ‘coding’ mathematics and
mathematical reasonings and is an excellent candidate for the natural exten-
sion we want, being almost inevitable for practical applications: the addition
of deﬁnitions.
We start with an extension leading from λC to a system called λD0. This
system contains a formal version of deﬁnitions in the usual sense, the so-called
descriptive deﬁnitions, so it can be used for a great amount of applications in
the realm of logic and mathematics. But λD0 does not yet allow a satisfactory
representation of axioms and axiomatic notions; these will be considered in the
following chapter, in which a small, further extension of λD0 leads to our ﬁnal
system λD. (We have noticed before that we do not consider inductive and
recursive deﬁnitions, since we can do without them; see Section 8.2.)
In order to give a proper description of λD0, we ﬁrst extend our set of
expressions, as given in Deﬁnition 6.3.1 for λC. Since the expressions of λD0
are the same as those for λD, we call the set EλD.
We describe EλD in Deﬁnition 9.1.1. We assume that, apart from the inﬁnite
set of variables, V , we also have an inﬁnite set of constants: C. We take symbols
a,a1,ai,a,b,... as names of constants, just as we took x,x1,xi,x,y,... as
names for variables. Moreover, we assume that variables and constants come
from disjoint sets, and that  and ∗ are special symbols that are distinct and
not in V or C:
V ∩ C = ∅, ∗ = , ∗, ∈ V ∪ C.190 Extension of λC with deﬁnitions
Deﬁnition 9.1.1 (Expressions of λD0 and λD, EλD)
The set EλD of expressions of λD0 (and λD) is deﬁned by:
EλD = V || ∗ |(EλD EλD)|(λV : EλD . EλD)|(ΠV : EλD . EλD)|C(EλD).
The ‘overlining’ in EλD means a list of EλD-expressions.
First we repeat from Section 8.5 what a (descriptive) deﬁnition is; for the
meaning of the overlinings in x : A and a(x), see Notation 8.5.1. We also
introduce the name ‘environment’ for a list of deﬁnitions.
Deﬁnition 9.1.2 (Descriptive deﬁnitions in λD0; environment)
(1) A (descriptive) deﬁnition in λD0 has the form
x : A  a(x) := M : N,
with all xi ∈ V , a ∈ C, and all Ai,M,N ∈ EλD.
(2) An environment Δ is a ﬁnite (empty or non-empty) list of deﬁnitions.
We use symbols such as D,Di,... as meta-names for deﬁnitions. An envi-
ronment of length k will be denoted by e.g. Δ ≡ D1,...,Dk.
With regards to a deﬁnition, we distinguish the following elements:
Deﬁnition 9.1.3 (Elements of a deﬁnition)
Let D ≡ x : A  a(x) := M : N be a deﬁnition. Then:
− x : A is the context of D.
− a is the deﬁned constant of D, with x as parameter list.
− a(x) is the deﬁniendum of D.
− M : N is the statement of D, M is the deﬁniens or the body of D, and N is
the type of D.
## 9.2 Judgements extended with deﬁnitions
How can we incorporate formal deﬁnitions into our most general type system,
the Calculus of Constructions, i.e. λC?
Recall that the prominent expressive entity in λC is the judgement (also
called typing judgement), having the form
Γ  M : N.
In the presence of deﬁnitions, such a judgement may well depend on one
or more deﬁned constants. In particular, M and N, but also the types in the
context Γ, may contain one or more constants: a1, a2, .... So each judgement
must have the possibility to be preceded by an environment, which is a list
Δ ≡ D1,...,Dk of deﬁnitions.
Let’s use meta-symbol ‘;’ for the separation between an environment and a
judgement. Then we obtain a new general format for a judgement with deﬁni-
tions:9.2 Judgements extended with deﬁnitions 191
Deﬁnition 9.2.1 (Judgement with deﬁnitions; extended judgement)
A judgement with deﬁnitions or extended judgement has the form
Δ ; Γ  M : N,
with Δ an environment, Γ a context and M,N ∈ EλD.
We pronounce this as: ‘M has type N in environment Δ and context Γ.’
By abuse of language, we will still use the simple word ‘judgement’ for such
a ‘judgement with deﬁnitions’; sometimes we’ll speak of extended judgements
to distinguish them from the judgements without deﬁnitions, as presented in
the previous chapters.
By writing out the environment Δ and the context Γ we obtain:
D1,D2,...,Dk ; x1 : A1,...,xn : An  M : N.
So in this format, the basic statement M : N has been ‘decorated’ at the
front with a list Δ and a list Γ:
(1) the environment Δ binding the constants occurring in M : N,
(2) the context Γ binding the free variables occurring in M : N.
Remark 9.2.2 Note that the binding eﬀects in the whole judgement are more
complicated than this: we have ‘accumulated dependencies’ in a judgement with
deﬁnitions. In order to make this clear, we consider the following judgement-
with-deﬁnitions:
D1,D2,...,Dk ; x1 : A1,...,xn : An  M : N.
Then we have:
(1) The deﬁned constant ai of deﬁnition Di, may occur in each of the deﬁni-
tions Di+1,...,Dk, and also in each of the types A1,...,An, in M and in N.
However, this ai may not occur in any of the preceding D1,...,Di−1.
(2) A context variable xj may occur in each of the types Aj+1,...,An of
following declarations, and in M or in N.
However, xj may not occur in any of the Di’s, nor in any of the preceding
types A1,...,Aj−1, nor in the type Aj itself.
Note: in practice, it regularly happens that these matters seem to be disre-
garded. For example, one may ﬁnd an xj in one of the Di’s, but then it is
clearly meant to be a ‘diﬀerent’ one.
Similar to our notations regarding contexts, we use the following notation
convention for environments:
Notation 9.2.3 Let Δ be an environment (in the list representation) and
D a deﬁnition. Then Δ,D stands for the list consisting of Δ, extended on the
right with D.192 Extension of λC with deﬁnitions
As a consequence of the extension of judgements with deﬁnitions, we have to
revise the derivation rules for λC (see Figure 6.4, which contains the derivation
rules for the systems of the λ-cube, so in particular for λC). First of all, the
judgements in these rules must be replaced by extended judgements. So all
judgements of the form Γ  K : L must be replaced by judgements of the
form Δ; Γ  K : L. But that is obviously not all: for the extension of λC with
deﬁnitions, we have to add some new rules. It will also turn out that we need
a revision of the conversion rule.
In Section 9.8 we give a full description of λD0, which is λC extended with
(descriptive) deﬁnitions. But before we describe the new derivation system
λD0, we investigate two new rules:
− a rule for introducing a deﬁnition with a context, by attaching a fresh deﬁned
constant with corresponding parameter list to a deﬁniens, and adding the
newly obtained deﬁnition (including its context) to an existing environment,
− and a rule for using a deﬁnition by instantiating the parameter list with
appropriate expressions.
These two aspects of a deﬁnition are formalised in the rules (def ) and (inst),
to be developed in the following two sections, respectively.
Remark 9.2.4 We do not consider recursive deﬁnitions. Therefore, the de-
ﬁned constant a in a deﬁnition x : A  a(x) := M : N is the only occurrence
of a in that deﬁnition; so a does not occur in M (and also not in one of the
types Ai in A, or in N).
We come back later to the issue of how to deal with recursive deﬁnitions; see
e.g. Section 14.4, Remark 14.4.2 and Section 14.15.
## 9.3 The rule for adding a deﬁnition
Firstly, we describe how to extend the environment Δ of a judgement which
has already been accepted as correct, say
(i) Δ ; Γ  K : L.
So what we want is to append a new, well-formed deﬁnition to Δ. A provision
is, of course, that the deﬁnition newly added to Δ is itself ‘well-formed’.
So let’s consider a ‘new’ deﬁnition
D ≡ x : A  a(x) := M : N
which we desire to add to Δ at the end.
We should allow that this D itself depends on the environment Δ, since the
deﬁned constants of Δ may be used in A, M or N. So in order that the new
deﬁnition D becomes ‘acceptable’, obviously M : N itself must be derivable
with respect to not only the context x : A, but also the environment Δ.9.4 The rule for instantiating a deﬁnition 193
Hence, we have as a requirement that
(ii) Δ ; x : A  M : N.
This leads to the following rule:
Deﬁnition 9.3.1 (Derivation rule for adding a deﬁnition to an environment)
Let a be a fresh name with respect to Δ, and D ≡ x : A  a(x) := M : N.
(def )
Δ ; Γ  K : L Δ ; x : A  M : N
Δ,D ; Γ  K : L
The requirement that a be fresh implies that a has not yet been deﬁned
in Δ. So when referring to a, there can be no confusion about which a in Δ,D
we mean.
## 9.4 The rule for instantiating a deﬁnition
Now that we know how to insert a deﬁnition in an environment, we investi-
gate how to use a deﬁnition occurring in an environment. As mentioned in
Section 8.4, this amounts to invoking the deﬁned constant with a proper in-
stantiation of the parameter list.
The instantiation process is not trivial, since instantiating a variable can
change the types in the declaration list. See the boxed example at the end of
Section 8.4, where the instantiation of S with R has as a consequence that the
type of R changes from (S × S) → ∗ to (R × R) → ∗, since variable S in that
type must be instantiated as well.
Let’s consider a deﬁnition, of the form
D ≡ x1 : A1,...,xn : An  a(x1,...,xn) := M : N.
Assume now that we wish to instantiate the parameter list (x1,...,xn),
replacing the xi by expressions Ui, respectively. What are the requirements
in order that these instantiations work out well, so that a(U1,...,Un) is a
well-formed expression?
We consider the Ui one by one.
For U1, instantiating x1, the requirement is easy:
U1 must have type A1.
What about U2? Note that we cannot say simply ‘U2 must have type A2’,
since variable x1 may occur in A2, and consequently this x1 should ﬁrst be
instantiated by U1.
So the requirement becomes:
U2 must have type A2[x1 := U1].194 Extension of λC with deﬁnitions
Things become more involved for U3, and so on, but it is not so hard to see
what the general pattern is:
U3 must have type A3[x1 := U1, x2 := U2] (since A3 may contain both x1
and x2), and so on.
Remark 9.4.1 The substitutions for A3 and higher are presented as simulta-
neous substitutions; to be executed all together, ‘in one sweep’. This is, however,
not essential, since variables x1 up to xn occurring in the Ai are bound to the
context in D, namely x1 : A1,...,xn : An; hence, these variables are unknown
outside D. This brings along that no xi can occur in any Uj.
As a consequence, it does not matter whether we use simultaneous or sequen-
tial substitutions in the expressions above; so we may also say, for example:
U3 must have type A3[x1 := U1][x2 := U2].
So the general requirement is that
Ui : Ai[x1 := U1,...,xi−1 := Ui−1].
Although this requirement is clear and well argued, it does not look very
nice. So we try to give it a better appearance. Note that, for each type Ai, the
variables from xi upwards to xn do not occur in Ai. So there is no objection
against extending the substitution list above, leading to:
Ui : Ai[x1 := U1,...,xn := Un],
since the added substitutions xi := Ui up to xn := Un are ‘void’; they do
nothing.
Again, we propose an abbreviation (see also Notation 8.5.1):
Notation 9.4.2 We write [x := U] as an abbreviation for the simultaneous
substitution [x1 := U1,...,xn := Un].
This enables us to write the requirement discussed above as follows:
Ui : Ai[x := U], for 1 ≤ i ≤ n.
If these requirements have been satisﬁed, we may instantiate parameter list
x of a(x) with U, obtaining a(U).
So the desired derivation rule for instantiation has the following form:
Δ ; Γ  U1 : A1[x := U]
. . .
Δ ; Γ  Un : An[x := U]
Δ ; Γ  a(U) : ...?
in which the type of the a(U) in the conclusion still has to be ﬁlled in.9.4 The rule for instantiating a deﬁnition 195
But ﬁrst, we propose a condensed notation for the list of judgements being
the premisses, by using ‘overlining’ again:
Notation 9.4.3 We write Δ ; Γ  U : V for the list of extended judgements
Δ ; Γ  U1 : V1,
. . .
Δ ; Γ  Un : Vn.
So the premisses of the rule may be written in the following compact format:
Δ ; Γ  U : A[x := U].
All that’s left to do now, is to ﬁnd a type for a(U) in the conclusion:
Δ ; Γ  a(U) : ...?.
Since a(x) has type N and the variables xi may occur in this N, the xi in
N should be instantiated (i.e. substituted for) as well. So the type becomes
N[x := U], and the result is:
Δ ; Γ  a(U) : N[x := U].
So now we are ready to write down the derivation rule for introducing an
instantiation of the parameter list of a constant (below we discuss why we state
this rule for constants with non-empty parameter lists only).
Deﬁnition 9.4.4 (Derivation rule for instantiation, 1)
Let a be a constant with non-empty parameter list, and let D ∈ Δ, where
D ≡ x : A  a(x) := M : N. Then:
(inst-pos)
Δ ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
The appearance of this rule is quite convincing, and not too complicated –
in particular by the adequate use of ‘overlining’. However, do not forget that
the upper judgement is in fact an abbreviation for a list of n judgements for
some n > 0.
Remark 9.4.5 We consider here the instantiation a(U1,...,Un) with respect
to the environment Δ and the context Γ. It is worth noting that the constant
a, being the head of the instantiation a(U1,...,Un), may also occur inside one
or more of the Uj.
For example, when we would have deﬁned a(n), in context n : N, as being
some expression which represents n2, then one instantiation could be a(a(5)),
and another one could be a(plus(a(k),a(l))), for some known k and l; the
meaning of these expressions is obviously (52)2 or (k2 + l2)2, respectively.196 Extension of λC with deﬁnitions
However, we are not yet done: there is a good reason why we forbade the
parameter list of a being empty in the above rule. Because if it were, then there
would be no xi to instantiate, so there would be no Ui as well, and the list of
n judgements on the upper side of the derivation rule would become the empty
list.
The text of Deﬁnition 9.4.4 then would become:
Let a be a constant with empty parameter list, and let D ∈ Δ, where
D ≡ ∅  a() := M : N. Then:
(inst-zero)
no requirements
Δ ; Γ  a() : N
??
This rule is not what we want, because it permits us to derive the judgement
Δ ; Γ  a() : N for any Δ and Γ: we have no check on the correctness of Δ
and Γ in the conclusion. It is important to recognise that in Deﬁnition 9.4.4,
the correctness of Δ and Γ is a consequence of the correctness of the premisses:
each of these already implies the correctness of both Δ and Γ.
So we have to ﬁnd something to mend these possible sources of incorrectness.
It is obviously suﬃcient to ensure that environment Δ and context Γ together
are correct.
A clever way out is the following: if we are able to determine the derivability
of any statement with respect to environment Δ and context Γ, then automat-
ically Δ;Γ itself must be well-formed. So why not take the simplest statement
that we know, namely ∗ : ? Our requirement then becomes:
Δ; Γ  ∗ : .
Note that, since the deﬁnition under consideration (D ≡ ∅  a() := M : N)
is an element of this Δ, well-formedness of Δ immediately implies that D is
well-formed.
So now we have a premiss to ensure well-formedness in the case of an empty
parameter list. Hence, for deﬁnitions D in which the deﬁned constant has an
empty parameter list, the derivation rule becomes amazingly simple:
Deﬁnition 9.4.6 (Derivation rule for instantiation, 2)
Let a be a constant with empty parameter list, and let D ∈ Δ, where
D ≡ ∅  a() := M : N. Then:
(inst-zero)
Δ ; Γ  ∗ : 
Δ ; Γ  a() : N
We can combine this rule (inst-zero) with the rule (inst-pos) into one, to
obtain the following instantiation rule (inst) for λD0, covering both cases:9.5 Deﬁnition unfolding and δ-conversion 197
Deﬁnition 9.4.7 (Derivation rule for instantiation)
Let a be a constant and let D ∈ Δ, where D ≡ x : A  a(x) := M : N. Then:
(inst)
Δ ; Γ  ∗ :  Δ ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
In this combined instantiation rule, we ﬁnd literally the (inst-zero)-rule in
case the parameter list of a is empty (because then all but the ﬁrst premiss
vanishes). If this parameter list is non-empty, we recognise the (inst-pos)-rule,
but with an extra requirement: the newly added ﬁrst premiss. It is not hard
to show, however, that in this case the ﬁrst premiss is a consequence of each
of the remaining ones; so it does not enlarge the amount of eﬀort required: we
may just ignore that ﬁrst premiss if the parameter list is not empty.
So the reason to insert the premiss Δ; Γ  ∗ :  in the general (inst)-rule
is that we desire the rule to have a simple appearance, and yet cover both
cases. In this we succeeded; the additional burden in the latter case is only
apparently a nuisance.
## 9.5 Deﬁnition unfolding and δ-conversion
There is an important aspect of deﬁnitions that we have not yet formalised: our
intention that a deﬁned constant ‘takes the place of’ (‘stands for’, ‘abbreviates’)
the deﬁniens. The intended meaning of the deﬁniendum and the deﬁniens is
that they are the same.
For example, in Figure 8.1 we have deﬁned D(n) as follows, considering it
to be an abbreviation for a set depending on natural number n:
n : N+
D(n) := the set of all positive integer divisors of n
We clearly intend that, by this deﬁnition, D(n) denotes that set, so – as a
set – they are the same; for arbitrary k in N we obtain (after instantiation)
that:
D(k) = {d ∈ N+ | d|k},
and this remains so for other instantiations, for example:
D(15) = {d ∈ N+ | d|15} (so D(15) = {1,3,5,15}).
In the same manner, we wish to identify the deﬁniendum ‘total(S,R)’ (see
Deﬁnition 8.1) with ‘∀x,y∈S(xRy ∨ yRx)’, and consequently
total(N,≤) ⇔ ∀x,y∈N(x ≤ y ∨ y ≤ x).
These kinds of equalities/equivalencies have not yet found their way into198 Extension of λC with deﬁnitions
our system. This is, however, necessary. For example, if we want to prove that
total(N,≤), then all we can do is to prove that ∀x,y∈N(x ≤ y∨y ≤ x). Suppose
that we succeed in the latter task:
Δ ; ∅  formalproof : ∀x,y∈N(x ≤ y ∨ y ≤ x).
Then we are apparently ‘almost ready’, but the ﬁnal step to
Δ ; ∅  formalproof : total(N,≤)
cannot yet be made.
So our ﬁrst thought is to introduce a rule that says: if a(x) has been deﬁned as
K, then a(x) may be replaced by K (and vice versa). But this is not enough:
the above example shows that something like this should also hold for an
instantiation a(U):
If we have a deﬁnition
D ≡ Γ  a(x) := M : N,
where D ∈ Δ for some well-formed Δ, then it must be permitted to replace
a(U) by M[x := U].
And there is more: such a replacement of an expression by some deﬁnitional
equivalent one should clearly be permitted on a wider scale, since their in-
tended meaning is the same. For example, since the expressions total(N,≤)
and ∀x,y∈N(x ≤ y ∨ y ≤ x) have the same meaning, a replacement of either of
them by the other should be admitted, also when occurring as a subexpression.
This reminds us of the Conversion rule for systems in the λ-cube (cf., for
example, Section 4.7), which permitted replacement of any expression by a
(well-formed) β-convertible one. And indeed, in Section 9.7 we shall adapt
the conversion rule in such a manner that also deﬁnitional equivalence will be
covered.
But we have to start with giving a neat description of the mentioned notion of
deﬁnitional equivalence, which we shall call δ-conversion. We make this notion
precise in a number of steps, comparable to the transition from β-reduction to
β-conversion, as discussed in Section 1.8.
First, we introduce a relation called one-step deﬁnition unfolding or δ-reduct-
ion; note that this unfolding is always relative to the environment Δ in which
the deﬁnition occurs.
Deﬁnition 9.5.1 (One-step deﬁnition unfolding; one-step δ-reduction,
Δ
→)
If Γ  a(x) := M : N is an element of environment Δ, then:
(1) (Basis) a(U)
Δ
→ M[x := U],
(2) (Compatibility) If M
Δ
→ M, then ML
Δ
→ ML, LM
Δ
→ LM, λx. M
Δ
→
λx. M and b(...,M,...)
Δ
→ b(...,M,...).9.5 Deﬁnition unfolding and δ-conversion 199
As usual (cf. Deﬁnitions 1.5.2 and 1.8.1), compatibility (2) is the formal
counterpart of the informal desire that (1) extends to subexpressions:
If a(U) is a subexpression of K (say K ≡ ...a(U)...), then a(x) := M
implies:
K ≡ ...a(U)...
Δ
→ ...M[x := U]....
Remark 9.5.2 We use the notation
Δ
→ for one-step δ-reduction with respect
to environment Δ, without mentioning the δ. This is not consistent with our
notation →β for one-step β-reduction. A better notation would probably be
Δ
→δ;
but in the presence of the Δ, we take the liberty to leave out subscript δ, thus
simplifying the image for the human eye.
A similar remark holds for the notations to be introduced below:
Δ
 and
Δ
=.
In case M
Δ
→ M, we say that M is obtained from M by one-step unfolding
in M a certain deﬁnition registered in Δ. If this regards an occurrence of the
constant a (so a(U) is replaced by M[x := U], as above), then one also says
that this occurrence of constant a gets unfolded.
Remark 9.5.3 Unfolding concerns one occurrence at a time: other occur-
rences of the same constant are left untouched in the described unfolding step.
And this is what we want, since one is usually only ‘locally’ interested in what
a constant represents. This diﬀers from β-reduction in an essential manner,
since β-reduction requires that all bound occurrences of the variable are replaced
by the argument. Hence, although the mechanisms of reduction and unfolding
are tightly connected to the same basic notion, namely substitution, they behave
diﬀerently and therefore we treat them in a diﬀerent manner. That this can be
realised in our formalisation is an advantage of the style with parameters that
we employ, over the style with λ-abstractions as described in Section 8.11.
The process the other way round, corresponding to the inverse relation of
Δ
→, is called (one-step) folding: if M
Δ
→ M, then M is the result of folding a
certain instantiated constant in M.
Similarly to what we did in Sections 1.8 and 1.9 regarding →β, which we
extended to β and =β, we deﬁne the notions ‘zero-or-more-step δ-reduction
relative to Δ’, or
Δ
, and ‘δ-conversion relative to Δ’, or
Δ
=:
Deﬁnition 9.5.4 (δ-reduction (zero-or-more-step),
Δ
)
M
Δ
 N if there is an n and there are expressions M0 to Mn such that M0 ≡ M,
Mn ≡ N and for all i such that 0 ≤ i < n:
Mi
Δ
→ Mi+1 .200 Extension of λC with deﬁnitions
Deﬁnition 9.5.5 (δ-conversion,
Δ
=)
M
Δ
= N (to be read as: ‘M and N are convertible with respect to Δ’) if there
is an n and there are expressions M0 to Mn such that M0 ≡ M, Mn ≡ N and
for all i such that 0 ≤ i < n:
either Mi
Δ
→ Mi+1 or Mi+1
Δ
→ Mi .
So M and N are δ-convertible (or M
Δ
= N) if the one can be obtained from
the other by successively folding or unfolding a number of deﬁnitions occurring
in it.
Remark 9.5.6 The relation
Δ
= is an equivalence relation on expressions, just
as =β is (cf. Lemma 1.8.6). It is:
− reﬂexive: for all L: L
Δ
= L,
− symmetric: for all L, M: if L
Δ
= M, then M
Δ
= L, and
− transitive: for all L, M and N: if L
Δ
= M and M
Δ
= N, then L
Δ
= N.
Comparable to what we have said in the case of β-reduction (see Section 1.9),
we deﬁne the δ-normal form of an expression, with respect to an environ-
ment Δ:
Deﬁnition 9.5.7 (Unfoldable, δ-normal form, δ-nf)
Let Δ be an environment.
(1) A constant a is unfoldable with respect to Δ, if a is bound to a descriptive
deﬁnition in Δ, say: x : A  a(x) := M : N.
(2) K is in δ-normal form (or: is in δ-nf) with respect to Δ, if there occurs no
constant in K that is unfoldable with respect to Δ.
(3) K has a δ-normal form (has a δ-nf) with respect to Δ, if there is an L in
δ-nf with respect to Δ such that K
Δ
= L. One also says in this case: K is
δ-normalising, and L is a δ-normal form of K (with respect to Δ).
## 9.6 Examples of δ-conversion
We continue with giving examples of the notions (un-)folding, δ-reduction and
δ-conversion.
Let’s assume that we have started to compose a mathematics book in λD0, in
which deﬁned constants are included for addition, multiplication and squaring
of integer numbers, and a deﬁned constant for equality on the integers. For
convenience, we denote them with the usual symbols (‘+’, ‘·’, ‘..2’ and ‘=’),
written in inﬁx notation (as to the symbols ‘+’, ‘·’ and ‘=’) and with superscript
(for ‘..2’), respectively.
Then we can add the following λD0-text to our formal mathematics book:9.6 Examples of δ-conversion 201
(D1) x : Z,y : Z  a(x,y) := x2 + y2 : Z
(D2) x : Z,y : Z  b(x,y) := 2 · (x · y) : Z
(D3) x : Z,y : Z  c(x,y) := a(x,y) + b(x,y) : Z
(D4) x : Z,y : Z  lemma(x,y) := c(x,y) = (x + y)2 : ∗p
Now take Δ ≡ D1,...,D4 and consider the expression
E ≡ a(a(x,x),a(y,y)),
with respect to Δ, in the context Γ ≡ x : Z,y : Z. This expression E is well-
formed with respect to Γ and Δ, since each of the three occurrences of a is
followed by an instantiated parameter list of the proper length (viz. 2), and in
each case, the two parameters have the proper type (viz. Z).
For example: subexpression a(x,x) of E is a correct instantiation of a(x,y)
as deﬁned in D1; the instantiation substitutions are [x := x] and [y := x]. The
following subtlety is worth noting: in [x := x], the ﬁrst occurrence of x is the
one bound in D1, but the second occurrence of x is another copy of x: it is the
one bound in the context Γ of E.
The mentioned instantiation a(x,x) has the type Z, again, as is desired by
the rules for well-formedness (w.r.t. Δ and Γ) as given in Section 9.4.
In expression E, there are three ways to start ‘unfolding’, i.e. to apply a
single δ-reduction. We picture these three possibilities in Figure 9.1.
(a(x,x))2
+ (a(y,y))2
a(x2
+ x2
,a(y,y)) a(a(x,x),y2
+ y2
)
a(a(x,x),a(y,y))
            9
XXXXXXXXXXXX z ?
Δ
Δ
Δ
Figure 9.1 Possible ﬁrst steps of unfolding E ≡ a(a(x,x),a(y,y))
From this ﬁgure we can see that, for example:
a(x2 + x2,a(y,y))
Δ
= a(a(x,x),y2 + y2).
Continue the diagram yourself, until you have a picture of the complete δ-
reduction behaviour of E with respect to Δ. The bottom expression in that
diagram will be:
(x2 + x2)2 + (y2 + y2)2,
being a δ-normal form of E with respect to Δ. (Such a δ-normal form is unique,
as we shall see in Corollary 10.5.4.)
In Figure 9.2, we picture one of the two possible complete δ-reduction ‘paths’
(cf. Deﬁnition 1.9.5) of the expression lemma(u,v), for given u,v : Z. Here the
path ends in the expression (u2 +v2)+2·(u·v) = (u+v)2, which is a δ-normal
form with respect to Δ, again.202 Extension of λC with deﬁnitions
lemma(u,v)
↓Δ
c(u,v) = (u + v)2
↓Δ
a(u,v) + b(u,v) = (u + v)2
↓Δ
(u2
+ v2
) + b(u,v) = (u + v)2
↓Δ
(u2
+ v2
) + 2 · (u · v) = (u + v)2
Figure 9.2 A reduction path for lemma(u,v)
9.7 The conversion rule extended with
Δ
→
Now that we have introduced δ-conversion, we can include it in the Conversion
rule. From the discussion in Section 9.5 it can easily be concluded that this is
what we want:
If Δ;Γ  A : B and B
Δ
= B, then also Δ;Γ  A : B.
Now B is well-formed, since it is part of the judgement Δ;Γ  A : B. But
just as in the original Conversion rule dealing with β-conversion only (see e.g.
Section 4.7), it is not guaranteed that B is well-formed as well. So again, we
have to add an extra requirement about B: we require that Δ;Γ  B : s, for
s a sort, in order to ensure well-formedness of B.
Hence, we obtain the following conversion rule for δ-conversion:
(δ-conv)
Δ;Γ  A : B Δ;Γ  B : s
Δ;Γ  A : B
if B
Δ
= B.
We are not yet done, because it is quite natural to combine this rule for δ-
conversion with the β-conversion rule in λC (see Figure 6.4). So we permit that
B and B are related by β-conversion, by δ-conversion, or by a combination
thereof.
Before we discuss this further, we extend the formal deﬁnition of one-step
β-reduction (cf. Deﬁnitions 1.8.1, 2.11.2, 3.6.2 and the comment to Theo-
rem 6.3.11) to λD0. In particular, we add a compatibility rule for constants
with instantiated parameter lists:
Deﬁnition 9.7.1 (One-step β-reduction for expressions in λD0, →β)
(1) (Basis) (λx : K . M)N →β M[x := N].
(2) (Compatibility) Assume M →β N, then also ML →β NL, LM →β
LN, λx : M . K →β λx : N . K, λx : K . M →β λx : K . N, Πx : M . K →β
Πx : N . K, Πx : K . M →β Πx : K . N and a(U,M,V ) →β a(U,N,V ).
The deﬁnitions of zero-or-more-step β-reduction (β) and β-conversion (=β)9.8 The derivation rules for λD0 203
can remain as they are (see Deﬁnitions 1.8.3 and 1.8.5), albeit that they concern
the new one-step β-reduction as given in the above deﬁnition.
Now we can give the appropriate deﬁnition for the new relation
Δ
=β, which
combines β- and δ-conversion:
Deﬁnition 9.7.2 (βδ-conversion,
Δ
=β)
We say that M βδ-converts to N with respect to Δ, or M
Δ
=β N, if there is
an n and there are expressions M0 to Mn such that M0 ≡ M, Mn ≡ N and
for all i such that 0 ≤ i < n:
Mi →β Mi+1 or Mi
Δ
→ Mi+1 or Mi+1 →β Mi or Mi+1
Δ
→ Mi .
This leads us to the following general conversion rule for λD0:
Deﬁnition 9.7.3 (Derivation rule for β-δ-conversion):
(βδ-conv)
Δ;Γ  A : B Δ;Γ  B : s
Δ;Γ  A : B
if B
Δ
=β B.
## 9.8 The derivation rules for λD0
Now we can summarise what we have developed in this chapter, by giving
the full system of derivation rules for λD0 (see Figure 9.3), as an extension of
λC. All judgements are in the λD0-format, hence in the form Δ;Γ  K : L.
Obviously, the new element in comparison with λC (see Figure 6.4) is the
environment Δ. Let’s inspect the new rules.
(var), (weak), (form), (appl), (abst) As compared with Figure 6.4, the
environment Δ is the only extension for these ﬁve rules, which therefore need
no further explanation. Just as in Section 6.2, sort s ranges over ∗ and , and
the pair (s1,s2) may be each of the pairs composed from these two sorts: (∗,∗),
(,∗), (,) or (∗,).
(def ) and (inst) These two rules were treated in Sections 9.3 and 9.4.
(sort) With regard to the (sort)-rule, it will be no surprise that we take
the environment Δ ≡ ∅, reﬂecting the empty context appearing in the corre-
sponding λC-rule. So both Δ and Γ are empty, which brings along that there
is nothing to be checked when invoking this rule. This is in agreement with the
fact that (sort) acts as the start of every derivation: it is the only rule without
premisses.
(conv) For the conversion rule, we need, apart from the new Δ, another
extension with respect to λC, as we explained in the previous section (see
Deﬁnition 9.7.2): the relation =β must be upgraded to
Δ
=β. For the sake of
simplicity, we rename (βδ-conv) to (conv).204 Extension of λC with deﬁnitions
This comment makes the rules in Figure 9.3 understandable and acceptable
as a ‘natural’ extension of the λC-rules, suitable for satisfying our desire to
include deﬁnitions.
(sort) ∅ ; ∅  ∗ : 
(var)
Δ ; Γ  A : s
Δ ; Γ, x : A  x : A
if x ∈ Γ
(weak)
Δ ; Γ  A : B Δ ; Γ  C : s
Δ ; Γ, x : C  A : B
if x ∈ Γ
(form)
Δ ; Γ  A : s1 Δ ; Γ, x : A  B : s2
Δ ; Γ  Πx : A. B : s2
(appl)
Δ ; Γ  M : Πx : A. B Δ ; Γ  N : A
Δ ; Γ  MN : B[x := N]
(abst)
Δ ; Γ, x : A  M : B Δ ; Γ  Πx : A. B : s
Δ ; Γ  λx : A. M : Πx : A. B
(conv)
Δ ; Γ  A : B Δ ; Γ  B
: s
Δ ; Γ  A : B if B
Δ
=β B
(def )
Δ ; Γ  K : L Δ ; x : A  M : N
Δ , x : A  a(x) := M : N ; Γ  K : L
if a ∈ Δ
(inst)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x) := M : N ∈ Δ
Figure 9.3 Derivation rules for λD0
9.9 A closer look at the derivation rules of λD0
On closer examination, there is more to be said about some of the λD0-rules.
Firstly, we observe that the (weak)-rule and the (def )-rule have notable simi-
larities:
− The (weak)-rule makes it possible to weaken the context Γ of a judgement
Δ;Γ  A : B, by adding a new entry at the end of Γ (viz. the declaration
x : C).
− The (def )-rule makes it possible to weaken the environment Δ of a judge-
ment Δ;Γ  K : L, by adding a new entry at the end of Δ (viz. the
deﬁnition x : A  a(x) := M : N).9.9 A closer look at the derivation rules of λD0 205
This implies that (weak) and (def ) may both be considered as weakening
rules (cf. Section 4.3): one for contexts, the other for environments.
Another correspondence exists between the rules (var) and (inst), albeit
more hidden than between (weak) and (def ):
− The (var)-rule tells us what the type of a variable x is (namely A), provided
that this variable is the subject of the last declaration x : A in the context
and that A is ‘correct’ with respect to Δ and Γ.
− The (inst)-rule tells us what the type of an instantiated constant a(...)
is, provided that a(x) is the deﬁniens of a deﬁnition somewhere in Δ and
that the list (...) contains an instantiation U of the parameter list x. The
condition is that U must be ‘correct’ with respect to Δ and Γ.
Hence, (var) and (inst) establish types for the ‘basic’ expressions in λD0,
namely: (i) a variable, and (ii) an expression starting with a constant. From
these basic expressions, one builds more complex ones by means of (appl),
(abst), (form) and (inst) (again).
The rules left are the ‘initial’ rule (sort) and the rule for manipulating the
type: (conv).
There is a second view on the (var)-rule: one may also consider this rule as
stating that the ﬁnal declaration, x : A, in a context Γ is itself derivable with
respect to a ‘legal’ Δ–Γ-pair.
A counterpart of this option for environment Δ appears to be missing. It
would be something like ‘The ﬁnal deﬁnition D ∈ Δ is itself derivable with
respect to “legal” Δ and Γ’. This is, of course, not realisable, since a deﬁnition
D ≡ x : A  a(x) := M : N is not a statement, and therefore it does not ﬁt in
the format for what we allow behind the ‘’.
One can, however, extract two acceptable statements out of this deﬁnition,
namely a(x) : N and M : N. Both are intuitively ‘valid’ statements, in a
proper environment and with context x : A, because: (1) M : N is the ob-
servation upon which the deﬁnition has been based in the mentioned context,
and (2) a(x) : N follows from our intention that a(x) is a new name for M,
and hence inherits all its properties.
It turns out that we do not need new derivation rules for this pair of state-
ments: both statements are derivable from the rules we already have. We state
this as a lemma.
Lemma 9.9.1 Assume Δ; x : A  M : N. Let D ≡ x : A  a(x) := M : N.
Then:
(1) Δ,D ; x : A  M : N, and
(2) Δ,D ; x : A  a(x) : N.206 Extension of λC with deﬁnitions
Proof Consider the (def )-rule. In the ﬁrst premiss, take Γ ≡ x : A and take
M : N for K : L; then the ﬁrst and the second premisses are two identical
copies of the assumption. Hence we obtain (1) as an immediate result.
The Start Lemma, to be formulated in the following chapter (Lemma 10.4.7,
part (1b)), gives us (2) (see Exercise 10.6).
As will turn out in the following chapters, the second part of Lemma 9.9.1
is worth singling out as an extra rule. We give it the name (par) because it
is about the typing of a deﬁned constant in its ‘pure’ form – i.e. followed by
a parameter list instantiated in the simplest manner, namely with variables
x1,...,xn; these ‘mimic’ exactly the original parameters x1,...,xn.
Hence, we add the rule given in Figure 9.4:
(par)
Δ ; x : A  M : N
Δ,D ; x : A  a(x) : N
if D ≡ x : A  a(x) := M : N and a ∈ Δ
Figure 9.4 The derived rule (par) for λD0
Remember that (par) does not belong to the basic rules; so it may be used
whenever we like, but we need not consider it in our theoretical investigations.
## 9.10 Conclusions
In this chapter we have investigated the formal format for so-called descriptive
deﬁnitions, which connect the deﬁned constant a to an explicit deﬁniens M.
Our main concern has been the addition of such deﬁnitions to the type system
λC. This eventually results in a formal type system called λD0.
Because of the presence of deﬁned constants in judgements, we have extended
the typing judgements in front with a list of useable deﬁnitions (an environ-
ment Δ). This has led to a general format for judgements-with-deﬁnitions, also
called extended judgements:
Δ ; Γ  M : N .
We have discussed several derivation rules for such extended judgements.
We started with the rule (def ) for adding a deﬁnition to an environment of
a judgement. Next, we investigated the conditions necessary for a ‘neat’ in-
stantiation of the parameters of a deﬁned constant. This turned out to be an
intricate process. The rule for describing what appropriate instantiations are
has ﬁrst been given in two separate versions: one for a non-empty parameter
list and one for an empty list. But it turned out that these two parts can also
be presented together, in one (inst)-rule.9.11 Further reading 207
Next, we have described the necessity of deﬁnition unfolding. We considered
the consequences of the deﬁnition mechanism for convertibility: a descriptive
deﬁnition naturally may be unfolded in an expression (by replacing a deﬁned
name by its deﬁniens), without altering its meaning. In formalising this process
of unfolding, we have to take the instantiations of the parameters into account.
These instantiations reﬂect the necessary updating caused by the actual situ-
ation.
For the formalisation of unfolding, we have introduced the notion of (one-
step) δ-reduction, and its generalisation: δ-conversion. The latter was obtained
similarly to the way in which β-conversion has been based on β-reduction.
We have also considered the notion of δ-normal form, being an expression in
which there are no unfoldable constants. After giving examples of δ-reduction,
we have formalised an extended Conversion rule, (conv), which takes both
β-conversion and δ-conversion into account.
Finally, we have given the list of derivation rules of λD0. We observed several
correspondences between these rules. One of these correspondences was the
reason for the formulation of a useful derived rule, called (par).
## 9.11 Further reading
N.G. de Bruijn was the ﬁrst to draw explicit attention to deﬁnitions and to
make deﬁnitions part of the formal language itself, not just a ‘meta-notion’.
Formal rules for deﬁnitions in type theory were ﬁrst spelled out explicitly
in his Automath project (de Bruijn, 1970), which has an elaborate, formal
mechanism of deﬁnitions (see also van Daalen, 1973). The rules we give here
are reminiscent of the ones of Automath.
A comparison between the Automath systems and Pure Type Systems (in-
cluding type theories like λC) is given by Kamareddine et al. (2003), where
the notion of parameterised deﬁnitions, as we have introduced in the present
chapter, is added to the Pure Type Systems framework.
The type theory λC by Th. Coquand and G. Huet (Coquand & Huet, 1988)
does not include a mechanism for deﬁnitions, but the ﬁrst implementation of
the system as a proof assistant obviously had one. The deﬁnitions were seen as
an ‘abbreviation mechanism’ that didn’t need a formal description or analysis;
this opinion diﬀers from our vision on deﬁnitions, as we have amply set out in
the previous chapters.
The idea of progressively extending a ‘book’, as a document containing math-
ematical knowledge, by adding ‘lines’, is of course the basis of almost every
mathematical text. In Automath (and in λD) the book consists of deﬁnition-208 Extension of λC with deﬁnitions
like expressions; the added lines contain new constructions that are given a
name, via a deﬁnition again.
We see the same pattern of development in the ﬂag-style – also called Fitch
style – way of doing natural deduction (see Section 7.8 and Fitch, 1952).
In the present chapter – and the whole book – we employ the transformation
from tree style to ﬂag style in an implicit manner: we give the formal derivation
rules of the type theory in a tree style, writing all the contexts in full. But when
we do examples of type derivations, we mostly prefer to use a ﬂag style. This
saves us from copying the contexts, because they are in the ﬂags. See, for
example, Chapter 7; we shall also employ the ﬂag style in Chapter 11 and
further.
Exercises
9.1 Consider the environment Δ ≡ D1,D2,D3,D4 of Section 9.6. Describe the
dependencies between the four deﬁnitions and give all possible linearisa-
tions of the corresponding partial order.
9.2 Consider the following two deﬁnitions, Di and Dj:
x : A  a(x) := K : L,
y : B  b(y) := M : N.
Let Δ ; Γ  U : V and assume that Di and Dj are elements of the
list Δ, where Di precedes Dj.
(a) Describe exactly where the constant a may occur in Di and Dj.
(b) Describe where the constant b may occur in Δ.
## 9.3 The text in Exercise 8.2 contains eight new deﬁnitions. Let Δ be the
corresponding environment. Rewrite the type in line (8) in such a manner
that all deﬁnitions of Δ have been unfolded.
9.4 See Section 9.6. Let Δ ≡ D1,...,D4.
Give the full δ-reduction diagram of c(a(u,v),b(w,w)).
## 9.5 Check that all instantiations of the parameters of constants deﬁned and
used in Exercise 8.2 satisfy the requirements imposed by the (inst)-rule.
## 9.6 Consider the following environment Δ consisting of six deﬁnitions, in
which we use, for the sake of convenience, some well-known formats such
as the Σ and inﬁx-notations:
D1 ≡ f : N → R, n : N  a1(f,n) := Σn
i=0(f i) : R,
D2 ≡ f : N → R, d : R  a2(f,d) := ∀n:N(f (n+1) − f n = d) : ∗p,
D3 ≡ f : N → R, d : R, u : a2(f,d), n : N 
a3(f,d,u,n) := formalprf3 : f n = f 0 + n · d,Exercises 209
D4 ≡ f : N → R, d : R, u : a2(f,d), n : N 
a4(f,d,u,n) := formalprf4 : a1(f,n) = 1
2 ·(n+1)·(f 0+f n),
D5 ≡ f : N → R, d : R, u : a2(f,d), n : N 
a5(f,d,u,n) := formalprf5 :
a1(f,n) = (n + 1) · f 0 + 1
2 · n · (n + 1) · d,
D6 ≡ ∅  a6 := formalprf6 : Σ100
i=0(i) = 5050.
Assume that formalprf3 to formalprf6 are meta-terms, standing for
real proof terms.
(a) Rewrite this environment in ﬂag format.
(b) What is a name used for a2 in the standard literature?
(c) Find the δ-normal form with respect to Δ of a5(λx : N. 2x,2,u,100),
where u is an inhabitant of a2(λx : N. 2x,2).
9.7 We call a deﬁnition D correct in environment Δ if Δ,D ; ∅  ∗ : .
Consider D1 to D6 as in Exercise 9.6.
(a) On what condition can you derive that D1 is correct in environment ∅?
(b) How do you prove that D2 is correct in environment D1?
(c) The same question for D3 in environment D1,D2.
## 9.8 See Exercises 9.6 and 9.7.
(a) Let Δ ≡ D1,...,D5. Assume that D6 is correct in environment Δ
and Δ ; ∅  (a1(λx : N. x, 100) = (λx : N. x)5050) : ∗p. Derive:
Δ ; ∅  formalprf6 : a1(λx : N. x, 100) = (λx : N. x)5050 .
(b) Assume that the conditions mentioned in Exercise 9.7´ (a) have been
satisﬁed. What is the fastest manner to prove
D1 ; f : N → R, n : N  a1(f,n) : R ?
9.9 Let Γ ≡ A : ∗, B : ∗, C : ∗. Prove, by giving full derivations in λD0:
(a) ∅; Γ  ∗ : ,
(b) ∅; Γ  A : ∗,
(c) ∅; Γ  B : ∗,
(d) ∅; Γ  C : ∗.
9.10 Let J1,...,Jn be judgements such that, listed in this order, they form a
derivation. Let
Jn ≡ Δn ; Γn  Mn : Nn | Jn
be the ﬁnal judgement in this derivation, with Jn its justiﬁcation in λD0.
Assume that for all i < j: if Ji ≡ Δi ; Γi  Mi : Ni, then we have that
Δi ; Γi  ∗ : .
(a) Let Jn be a case of the (weak)-rule. Prove that
Δn ; Γn  ∗ : .
(b) The same if Jn is a case of the (var)-rule.210 Extension of λC with deﬁnitions
(c) The same if Jn is a case of the (def )-rule.
(d) The same if Jn is a case of one of the other λD0-rules as given in
Figure 9.3.10
Rules and properties of λD
## 10.1 Descriptive versus primitive deﬁnitions
As we have explained before, our intention is to switch over from λC to an
extended formal system with deﬁnitions that can be fruitfully used for the
formalisation of mathematical texts (including logic).
In the previous chapter we have deﬁned the system λD0, an extension of
λC with deﬁnitions as ‘ﬁrst class citizens’. We have based λD0 on so-called
descriptive deﬁnitions. The word ‘descriptive’ means that each deﬁned constant
is connected to an explicit deﬁniens, giving a formal description of what the
constant represents. The new name (the constant), so to say, ‘stands for’ the
‘describing’ expression to which it has been coupled in its deﬁnition.
When it comes to mathematics (and logic) in general, there is still one thing
that we miss: the possibility to express so-called primitive notions, necessary
for the incorporation of axioms and axiomatic notions. These appear as soon
as we go beyond the so-called constructive logic (cf. Sections 7.4 and 11.8), or
when we incorporate mathematics in a style based on axioms, as often happens.
The constants introduced in primitive deﬁnitions – as opposed to those in de-
scriptive deﬁnitions – are not accompanied by a descriptive expression. These
so-called primitive constants are only provided with a type to which the con-
stant belongs, but there is no further restriction or characterisation. Conse-
quently, primitive constants cannot be unfolded, simply because there is noth-
ing to unfold them to.
A primitive deﬁnition can be seen as the axiomatic introduction of a logical
or mathematical object one assumes to exist, but cannot construct. It can also
be used for an axiom one assumes to hold but cannot prove in the (limited)
framework of λC. An example is the axiom DN from classical logic, the ‘double
negation law’ (see Section 7.4).
So we are dealing with the following two kinds of deﬁnitions:212 Rules and properties of λD
− descriptive deﬁnitions, being the ‘genuine’, well-known ones, which are cou-
pled to a description (the deﬁniens) and a type;
− primitive deﬁnitions, not being deﬁnitions in the original sense, since they
miss a description and are only conﬁned to a type.
In their formal appearance, the essential diﬀerence between the two kinds of
deﬁnition is the presence or non-presence of a deﬁniens. The points of agree-
ment are:
− both kinds of constants have similar behaviour as to the instantiation of
their parameter lists; and
− both kinds of constants are connected to a type.
Because of these similarities, we have chosen to put the introduction process
of the two kinds of constants on a par. This implies that we extend the common
meaning of the word ‘deﬁnition’ to the primitive or axiomatic names. Hence,
our word ‘deﬁnition’ from now on also encompasses the cases where there exists
no description, but only a type.
As you may imagine, descriptive deﬁnitions form the great majority in an
average formalised piece of mathematics; primitive deﬁnitions tend to be rather
exceptional, particularly in the long run.
In the remainder of the present chapter we extend λD0 with primitive deﬁ-
nitions. The resulting system is called λD.
System λD is our ultimate formal machinery, which we ﬁrstly show to be
a nice vehicle for the formalisation of logical notions, together with a corre-
sponding deduction system (see Chapter 11). The system is also very suited for
the formalisation of a larger body of mathematics (as the following chapters
will demonstrate). Hence, λD fulﬁls our desire to have a powerful machinery
for the formalisation of mathematical theories – the great proﬁt being that
the formalisation process enforces the formal content to become thoroughly
veriﬁed.
## 10.2 Axioms and axiomatic notions
Let’s have a closer look at axioms, or – in general – primitive entities. These
are concepts or principles that are postulated to exist or to hold. They form
the fundamentals of a certain theory, which are necessary as a kind of basis.
They are so elementary that they are not constructible or derivable from other
entities.
Examples of such primitive entities are:
− the set N of natural numbers, as a basis of Peano arithmetic;
− the number 0 in N and the successor function s : N → N, as basic with
respect to N;10.2 Axioms and axiomatic notions 213
− the axiom of induction in Peano arithmetic;
− the axioms of Zermelo–Fraenkel set theory; for example: the Extensionality
Axiom (sets with the same elements are equal), or the Empty Set Axiom
(there exists a set with no elements).
These entities are all primitive in the respective theories. Note that the en-
tities in the examples are varying in nature: they may be a set (N), an element
of a set (0, s) or the assertion of a proposition which one accepts as elemen-
tary and hence should be accepted without a proof (Induction, Extensionality,
Empty Set).
We have already met such primitive entities in Section 7.4, where we dis-
cussed the laws of the excluded third (ET) and double negation (DN). Both
propositions cannot be proved in constructive logic. So, when we want to do
classical logic, we need to add them (or at least one of them; see the relevant
passages in the beginning of the mentioned section).
In Section 7.4 we proposed to add ET as an assumption in front of the
context – a kind of pre-context. This worked out ﬁne there. However, this
solution of the problem has deﬁnitely disadvantages:
− It complicates derivations in more complex situations, in particular when
several primitive entities must be accounted for: then we always need to
drag along a sizeable pre-context.
− It is not immediately clear how to deal with primitive entities that are them-
selves presented in a context. For example, we can express Induction with a
context (instead of with universal quantiﬁcation over P), as follows:
‘Let P be any predicate on N. We axiomatically assume that induction
holds for P.’
More formally, we can express this as follows:
Induction property: In context P : N → ∗p , we assume
P 0 ⇒ (∀n∈N(P n ⇒ P(sn)) ⇒ ∀n∈N(P n)).
For these reasons, we have chosen another approach to primitive entities: we
do not regard them as overall assumptions, but as a kind of deﬁnitions. To be
precise, we regard them as deﬁnitions without deﬁnientes (see Section 10.1).
We speak in these cases of a deﬁnition of a primitive entity or a primitive
deﬁnition.
Formally, we use the symbol ⊥ ⊥ for the non-existing deﬁniens in such a
primitive deﬁnition. This enables us to use the same format as for the usual
descriptive deﬁnitions (cf. Deﬁnition 9.1.2).
Deﬁnition 10.2.1 (Primitive deﬁnition, deﬁnition, environment)
(1) A primitive deﬁnition has the form x : A  a(x) := ⊥ ⊥ : N.
(2) A deﬁnition is either a descriptive or a primitive one.214 Rules and properties of λD
(3) As a consequence, an environment, being a list of deﬁnitions, can now also
include primitive deﬁnitions.
Example 10.2.2 Some of the above examples can be expressed as follows in
this format (we suppress empty parameter lists):
∅  N := ⊥ ⊥ : ∗s
∅  0 := ⊥ ⊥ : N
∅  s := ⊥ ⊥ : N → N
P : N → ∗p  ind(P) := ⊥ ⊥ :
P0 ⇒ (∀n : N. (Pn ⇒ P(sn)) ⇒ ∀n : N. Pn
∅  iET := ⊥ ⊥ : Πα : ∗. (α ∨ ¬(α))
We can now use ind(P) for any predicate P on N, by employing the deriva-
tion rule (inst).
For example: say that we have deﬁned the functions ‘cube’ and + on N, and
that we have derived the relevant properties of arithmetic. Now we want to
prove by induction that
∀n∈N(9 | n3 + (n + 1)3 + (n + 2)3), where a|b means: a divides b.
We can deﬁne property Q as λn : N. (9 | n3+(n+1)3+(n+2)3), a predicate
of type N → ∗p, and take as our new goal:
∀n : N. Qn.
Now using the primitive deﬁnition ind(P), we get with (inst) that:
ind(Q) : Q0 ⇒ (∀n : N. (Qn ⇒ Q(sn))) ⇒ ∀n : N. Qn.
Hence, it suﬃces to ﬁnd an inhabitant (say r) of Q0 and an inhabitant
(say t) of ∀n : N. (Qn ⇒ Q(sn)), in order to derive, using (appl) twice, that
ind(Q)rt : ∀n : N. Qn, so ind(Q)rt : ∀n : N. (9 | n3 + (n + 1)3 + (n + 2)3)
by (conv). (See Exercise 10.1.)
## 10.3 Rules for primitive deﬁnitions
All we need to make this operational in λD0 is to provide the derivation rules
for primitive deﬁnitions. First we give the rule for including a primitive deﬁ-
nition in the environment Δ. This rule is an adapted version of (def ), given in
Deﬁnition 9.3.1.
It is obvious that we do not copy the second premiss Δ ; x : A  M : N
of the rule (def ): in the case of primitive entities there is no M available.
Hence, we switch to a second premiss as given below, which guarantees the
well-formedness of N, with respect to the environment Δ and the context x : A.
(def -prim)
Δ ; Γ  K : L Δ ; x : A  N : s
Δ , x : A  a(x) := ⊥ ⊥ : N ; Γ  K : L
if a ∈ Δ10.4 Properties of λD 215
With respect to the instantiation rule (inst), the only modiﬁcation is the
⊥ ⊥ in the deﬁnition. So we obtain the following (inst-prim)-rule, in which the
ﬁrst premiss is necessary for the case Γ ≡ ∅, just as in the λD0-rule (see Sec-
tion 9.4):
(inst-prim)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x) := ⊥ ⊥ : N ∈ Δ
Since these new rules (def -prim) and (inst-prim) for primitive deﬁnitions
are so similar to the ‘general’ rules (def ) and (inst) for descriptive deﬁnitions,
it is worthwhile to put them side by side. See Figure 10.1, in which we have
boxed the relevant statements, containing the diﬀerences between the ‘proper’
and the ‘primitive’ cases.
(def )
Δ ; Γ  K : L Δ ; x : A  M : N
Δ , x : A  a(x) := M : N ; Γ  K : L
if a ∈ Δ
(def -prim)
Δ ; Γ  K : L Δ ; x : A  N : s
Δ , x : A  a(x) := ⊥ ⊥ : N ; Γ  K : L
if a ∈ Δ
(inst)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x) := M : N ∈ Δ
(inst-prim)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x) := ⊥ ⊥ : N ∈ Δ
Figure 10.1 Comparing the derivation rules for (def ) and (inst) in λD
The system λD0 extended with primitive deﬁnitions and the (def -prim)-
and (inst-prim)-rules is called λD.
The full set of derivation rules for λD is listed in Appendix D.
## 10.4 Properties of λD
When it comes to the properties of λD, it turns out that many of them are
a straightforward extension of the corresponding properties of λC (see Sec-216 Rules and properties of λD
tion 6.3). Of course, since deﬁnitions enter the stage, there is more to be
said. In particular, this concerns statements about deﬁnition unfolding and
δ-conversion. Below we give the relevant lemmas for λD.
The statements are very much like the ones in Section 6.3. The proofs are
also very similar, and for the extension with deﬁnitions the proofs are like the
ones in Severi & Poll (1994). As λD is not exactly the same as the system
in that paper, we give full proofs of the properties below in the note Geuvers
(2014a). Concerning δ-conversion, we only give the relevant normalisation and
conﬂuence properties.
The set of expressions of λD is the same as the set of expressions of λD0:
EλD (see Deﬁnition 9.1.1). So it is important to note that we do not consider
‘⊥ ⊥’ as an expression: it is a meta-symbol in judgements, on a par with e.g. ‘:=’
and ‘’.
Next, we establish that λD0 is indeed an extension of λC and that λD, in
its turn, extends λD0. Each of these three systems has its own notion of deriv-
ability, implied by the speciﬁc rules of each system. By abuse of notation, we
use the symbol ‘’ for each of these three notions. If this may cause confusion,
we add a phrase to mend this, such as: ‘Γ;Δ  K : L in λD’.
Lemma 10.4.1 (Inclusion of λC in λD0, and of λD0 in λD.)
(1) If Γ  K : L in λC, then ∅;Γ  K : L in λD0; and
(2) If Δ;Γ  K : L in λD0, then Δ;Γ  K : L in λD.
Next, we focus on λD; we use the notation a(x) := K/⊥ ⊥ to indicate that
it does not matter whether a is attached to a description, viz. K, or has
primitively been deﬁned as a constant.
The following deﬁnition is an extension of Deﬁnition 9.1.3.
Deﬁnition 10.4.2 (Elements of a deﬁnition in λD)
Let D ≡ Γ  a(x) := K/⊥ ⊥ : L be a deﬁnition.
− Γ is the context of D.
− a is the deﬁned constant of D, with x as parameter list.
− a(x) is the deﬁniendum of D.
− K/⊥ ⊥ : L is the statement of D.
− K resp. ⊥ ⊥ is the deﬁniens (also called: body) of D.
− L is the type of D.
If D ≡ Γ  a(x) := K : L, then the deﬁnition is called a descriptive or proper
deﬁnition, and a is a proper constant.
If D ≡ Γ  a(x) := ⊥ ⊥ : L, then the deﬁnition is called a primitive deﬁnition,
and a is a primitive constant.10.4 Properties of λD 217
The following lemma concerns (free) variable and constant occurrences:
Lemma 10.4.3 (Free Variables and Constants Lemma)
Let Δ; Γ  M : N, where Δ ≡ Δ1,D,Δ2 with D ≡ x : A  a(x) := K/⊥ ⊥ : L,
and Γ ≡ y : B. Then:
(1) For all i, FV (Ai) ⊆ {x1,...,xi−1}; FV (K),FV (L) ⊆ {x}.
(2) For all j, FV (Bj) ⊆ {y1,...,yj−1}; FV (M),FV (N) ⊆ {y}.
(3) Constant a does not occur in Δ1.
(4) If constant b occurs in A, K or L, then b = a and b is the deﬁned constant
of some D ∈ Δ1.
(5) If constant b occurs in B, M or N, then b is the deﬁned constant of some
D ∈ Δ.
Next, we deﬁne legality for expressions, environments or contexts, which in
each case means that they are ‘accepted’ in some derivation (cf. Deﬁnition 6.3.7
and Lemma 6.3.8):
Deﬁnition 10.4.4 (Legal expression, legal environment, legal combination,
legal context)
(1) An expression M is called legal, if there exist an environment Δ, a con-
text Γ, and N such that Δ;Γ  M : N or Δ;Γ  N : M. (For such Δ and Γ,
we call M legal with respect to Δ and Γ.)
(2) An environment Δ is called legal, if there exist a context Γ, and M and N
such that Δ; Γ  M : N.
(3) An environment Δ and a context Γ form a legal combination, if there exist
M and N such that Δ; Γ  M : N.
(4) A context Γ is called legal, if there exist an environment Δ, and M and N
such that Δ; Γ  M : N.
We have the following extension of the Subexpression Lemma (6.3.8):
Lemma 10.4.5 (Legality Lemma)
(1) If Δ ≡ Δ1,Δ2 and Δ is legal, then Δ1 is legal.
(2) If Γ ≡ Γ1,Γ2 and Γ is legal, then Γ1 is legal.
(3) If M is legal, then every subexpression of M is legal.
There is more to be said about legal environments:
Lemma 10.4.6 (Legal Environment Lemma)
If D ≡ x : A  a(x) := M/⊥ ⊥ : N occurs in a legal Δ, say Δ ≡ Δ1,D,Δ2,
then:
(1) each Ai is legal with respect to Δ1 and x1 : A1,...,xi−1 : Ai−1;
(2) both M and N are legal with respect to Δ1 and x : A.
Legality is also used in the following lemmas:218 Rules and properties of λD
Lemma 10.4.7 (Start Lemma for declarations and deﬁnitions)
(1) (Start for contexts) If Δ;Γ is a legal combination and (x : A) ∈ Γ, then
we have Δ; Γ  x : A.
(2) (Start for environments) Let D ≡ x : A  a(x) := M : N. If Δ is legal
and D ∈ Δ, then both (1a) Δ; x : A  M : N and (1b) Δ; x : A  a(x) : N.
Lemma 10.4.8 (Thinning Lemma, Condensing Lemma)
(1) (Thinning) Let Δ1 ⊆ Δ2, Γ1 ⊆ Γ2, and let Δ2;Γ2 be a legal combination.
Now if Δ1 ; Γ1  M : N, then Δ2 ; Γ2  M : N.
(2) (Condensing of environments) If Δ1,D,Δ2 ; Γ  M : N, where deﬁnition
D is Γ  a(x) := K/⊥ ⊥ : L, and a does not occur in either Δ2, Γ, M or N,
then Δ1,Δ2 ; Γ  M : N.
(3) (Condensing of contexts) If Δ; Γ1, x : A, Γ2  M : N and x does not
occur in Γ2, M or N, then Δ; Γ1,Γ2  M : N.
For ‘backtracking’ a derivation from a certain judgement, we have the fol-
lowing lemma; parts (1) to (4) are ‘λD-copies’ of the corresponding parts of
Lemma 6.3.6; part (5), concerning an instantiated constant, is new:
Lemma 10.4.9 (Generation Lemma)
(1) If Δ;Γ  x : C, then there exist a sort s and an expression B such that
B
Δ
=β C, Δ;Γ  B : s and x : B ∈ Γ.
(2) If Δ;Γ  MN : C, then there are A, B such that Δ;Γ  M : Πx : A. B
and Δ;Γ  N : A and C
Δ
=β B[x := N].
(3) If Δ;Γ  λx : A. b : C, then there are a sort s and an expression B such
that C
Δ
=β Πx : A. B and Δ;Γ  Πx : A. B : s and Δ;Γ,x : A  b : B.
(4) If Δ;Γ  Πx : A. B : C, then there are s1 and s2 such that C
Δ
=β s2 and
Δ;Γ  A : s1 and Δ;Γ,x : A  B : s2.
(5) If Δ;Γ  a(U) : C, then constant a must be the deﬁned constant in a
deﬁnition D ≡ x : Aa(x) := M/⊥ ⊥ : N in Δ, and C
Δ
=β N[x := U]; moreover:
− if |Γ| = n > 0, then there is B such that Δ;Γ  U : B and, for all 1 ≤ i ≤ n,
Bi
Δ
=β Ai[x := U];
− if |Γ| = 0 and D is a descriptive deﬁnition, then there is N such that
N
Δ
=β N and Δ;Γ  M : N;
− if |Γ| = 0 and D is a primitive deﬁnition, then Δ;Γ  N : s for some sort s.
The relation β-reduction in λD is the same as in λD0 (see Deﬁnition 9.7.1).
In a similar manner we have β, =β and
Δ
=β for the expressions of λD. We
have the following extension of Lemma 6.3.9:
Lemma 10.4.10 (Uniqueness of Types up to βδ-conversion)
If Δ; Γ  K : L1 and Δ; Γ  K : L2, then L1
Δ
=β L2.10.5 Normalisation and conﬂuence in λD 219
And also (cf. Lemma 6.3.10):
Lemma 10.4.11 (Substitution Lemma)
Let Δ; Γ1,x : A,Γ2  M : N and Δ; Γ1  L : A.
Then Δ; Γ1, Γ2[x := L]  M[x := L] : N[x := L].
The importance of the following lemma has already been explained after
Lemma 2.11.5; see also Lemma 6.3.13:
Lemma 10.4.12 (Subject Reduction)
If Δ; Γ  M : N and M
Δ
 M or M β M, then Δ; Γ  M : N.
Consequently, the lemma also holds if M
Δ
β M, where
Δ
β is the symbol for
a sequence of β- and δ-reductions (with respect to Δ), in an arbitrary mixture.
## 10.5 Normalisation and conﬂuence in λD
We continue with the investigation of the normalisation and conﬂuence prop-
erties of λD. We don’t give proofs in this section, but refer for those to Geuvers
(2014a). As we saw earlier (e.g. in Sections 1.9 and 6.3), ‘normalisation’ is an-
other word for ‘termination’. So we are interested in the termination behaviour
of the reduction relations →β and
Δ
→, both separately and combined. Termi-
nation is desirable as a property, since it prevents inﬁnite reduction paths. We
recall that ‘weak normalisation’ of a term M only ensures the existence of a
reduction path to a term in β-normal form (see Deﬁnition 1.9.6); ‘strong nor-
malisation’ holds if all reduction paths terminate after a ﬁnite number of steps
– which number may vary according to the path chosen.
Firstly, we consider the new relation
Δ
→, which formalises the ‘unfolding’
of a deﬁnition. Given a legal expression L in λD, does there always exist a
δ-reduction path starting with L which terminates? This is indeed the case.
(A proof can be given by considering a clever order for unfolding the proper
constants in an expression, and eliminating them one by one.)
Theorem 10.5.1 (Weak Normalisation of
Δ
→)
For each legal Δ, the relation
Δ
→ is weakly normalising.
It requires more eﬀort to prove that strong normalisation holds for
Δ
→:
Theorem 10.5.2 (Strong Normalisation of
Δ
→)
For each legal Δ, the relation
Δ
→ is strongly normalising.
We also have conﬂuence for λD with respect to deﬁnition unfolding; so if220 Rules and properties of λD
M
Δ
 N1 and M
Δ
 N2, then there is N3 such that N1
Δ
 N3 and N2
Δ
 N3
(cf. Theorem 1.9.8):
Theorem 10.5.3 (δ-conﬂuence in (λD,
Δ
→))
For each legal Δ, the relation
Δ
 is conﬂuent.
And this, in its turn, brings along that δ-normal forms are unique (cf.
Lemma 1.9.10):
Corollary 10.5.4 (Uniqueness of δ-normal forms in (λD,
Δ
→))
For every L ∈ λD that is legal with respect to Δ and Γ, there is a unique
expression M such that L
Δ
 M and M is in δ-normal form with respect to Δ.
Note that M is in δ-normal form if (and only if) M contains no proper
constants; there may, however, occur primitive constants in such an M.
We have now investigated the behaviour of λD with respect to deﬁnition
unfolding (δ-reduction). But we are not yet done, because there still is a more
fundamental reduction relation in λD, namely β-reduction. And although we
observed that both β- and δ-reduction, separately, satisfy nice properties (viz.
WN and SN, i.e. weak and strong normalisation), this is no guarantee that
these properties also hold for a combination of the two reductions,
Δ
β. For a
reduction L0
Δ
β ..., which may for example start as follows:
L0
Δ
→ L1 →β L2 →β L3
Δ
→ L4 →β ...,
it is not clear whether it will end after a ﬁnite number of steps. We now turn
to WN and SN for
Δ
β.
Our ﬁrst concern is whether the property CR (or Conﬂuence; cf. Theo-
rem 1.9.8) holds for
Δ
β.
Theorem 10.5.5 (Church–Rosser for
Δ
β in λD; CR; βδ-conﬂuence)
Suppose that for an expression L ∈ EλD holds that L
Δ
β L1 and L
Δ
β L2.
Then there is an expression L3 ∈ EλD such that L1
Δ
β L3 and L2
Δ
β L3.
A consequence of βδ-conﬂuence is, as before (cf. Lemma 1.9.10(2)):
Corollary 10.5.6 (Uniqueness of βδ-normal form)
If L ∈ EλD has a βδ-normal form, then this normal form is unique.
What remains are the questions of weak and strong normalisation. Both
properties hold in λD. The ﬁrst one follows from Weak Normalisation for λC.10.6 Conclusions 221
The second one is also a consequence of the corresponding theorem for λC, but
the proof is more complicated.
Theorem 10.5.7 (Weak Normalisation for
Δ
β in λD)
If L ∈ EλD and L is legal, then there is a βδ-reduction sequence starting with
L which ends in a βδ-normal form after a ﬁnite number of steps.
Theorem 10.5.8 (Strong Normalisation for
Δ
β in λD)
If L ∈ EλD and L is legal, then there is no inﬁnite βδ-reduction sequence
starting with L.
## 10.6 Conclusions
In this chapter we have argued that it is desirable to have a possibility for the
handling of axioms and axiomatic (also called ‘primitive’) notions. This has
led us to a distinction between the descriptive deﬁnitions, as dealt with in the
previous chapter, and the primitive ones.
A descriptive deﬁnition Δ; Γ  a(x) := M : N has a body M, which opens
the possibility to unfold an instantiation a(U) into M[x := U]. In a primitive
deﬁnition Δ; Γ  a(x) := ⊥ ⊥ : N, however, such unfolding is impossible (and
not intended).
We have given several examples of axioms and primitive notions, to em-
phasise that such entities really form part of a natural build-up of logic and
mathematics.
For the formalisation of such notions, we added two more rules to system
λD0: a (def -prim)-rule for adding a primitive deﬁnition to the tail of an en-
vironment, and an (inst-prim)-rule for instantiating the parameter list of a
primitive constant. These rules are similar to the corresponding (def )- and
(inst)-rules already present in λD0, but since they miss the deﬁniens parts in
the deﬁnitions, some changes in the shape of the rules are required.
Altogether, we have thus obtained our ﬁnal system: λD. We have concluded
with an overview of the relevant properties of λD, including the desired normal-
isation and conﬂuence properties, which are very important for λD to behave
well.
## 10.7 Further reading
The use of a deﬁnition-like mechanism for adding parameterised axioms to a
type theory originates from the Automath project (de Bruijn, 1970). There, a
deﬁnition without body is called a ‘primitive notion’, PN. So a deﬁniens can
either be an expression or ‘PN’, in which case it is an axiom or an axiomatic222 Rules and properties of λD
notion. The Automath approach views a formalisation as a book with lines.
Each line builds on the previous ones and contains a deﬁnition or a primitive
notion. That is, it contains either a deﬁnition with or a deﬁnition without a
body. So, from Automath we inherit the idea to treat deﬁnitions and axioms
very much on a par, and we formalise them in λD with a similar syntactic
construction.
Normalisation and conﬂuence are important properties to establish the log-
ical consistency of a type theory. They also are crucial to make an implemen-
tation of the type theory as a proof assistant or proof checker possible. Let us
expand on these two issues.
In a type theory like λD, proofs are represented as λ-terms. So in an im-
plementation of λD as a proof checker, the basic functionality would be to
verify the well-formedness of a term, which is done by type-checking the term
(i.e. computing the type of the term). A general description of type check-
ing algorithms (and their correctness) for Pure Type Systems can be found
in van Benthem Jutting (1993) and van Benthem Jutting et al. (1994). The
algorithms and proofs described therein apply directly to λD.
Here we outline the connection with conﬂuence and normalisation of the
reduction relation. The crucial point is that, when type-checking a term, one
has to check βδ-convertibility. For example, to compute the type of the term
F M, one has to
(1) compute the type of M, say A,
(2) compute the type of F, say B,
(3) check if the type B can be βδ-reduced to a type of the shape Πx : C . D,
(4) if yes, then check whether C
Δ
=β A,
(5) if yes, then the type of F M is D[x := M].
In the third step, normalisation guarantees that this check terminates: we
can continue reducing the so-called ‘outermost’ redex (see Terese, 2003) of B
until we either arrive at an expression of the shape Πx : C . D or we arrive
at a normal form which is not of this shape. (The uniqueness of the normal
form is a consequence of conﬂuence.) In the fourth step, normalisation and
conﬂuence guarantee that this check is decidable: just compute the normal
form on both sides and check if they are the same. For this to work, we only
need weak normalisation in steps (3) and (4), because this implies that we have
a strategy (see above) for computing the normal form.
It should be noted that in practice a proof checker would not reduce two
terms to normal form to check their βδ-convertibility, because this would be
too expensive (in time and space). An ‘equality checker’ tries to decide con-
vertibility as fast as possible without doing too many reductions.Exercises 223
Strong normalisation is important because it guarantees the termination of
the reduction process, whatever reduction strategy one prefers, so it allows
one to choose the reduction path in order to establish the convertibility of two
terms. This can be proﬁtable, since a clever choice of the reduction path may
speed up the reduction process considerably.
To prove the logical consistency of a type theory, one way to reason is as
follows: suppose the system is inconsistent. Then  M : ⊥ for some M. It
follows that there also is an M in normal form with  M : ⊥, because of
normalisation and subject reduction. And then we derive a contradiction from
the fact that a term of type ⊥ in the empty context cannot be in normal form
(see Proposition 5.2.31 of Barendregt, 1992). For λD, this argument works: we
can show that there is no term of type ⊥ in the empty context. To show that
a speciﬁc environment (containing primitive notions) is consistent, a similar
argument can be applied. For example, we can show that the environment
that introduces classical logic as a primitive notion is consistent: there is no
term M in normal form of type ⊥ in this environment.
Exercises
## 10.1 See Section 10.2. Show that
∀n∈N (9 | n3 + (n + 1)3 + (n + 2)3)
by giving an informal proof based on induction.
10.2 A ‘contradiction’ is formalised in λD as being an inhabitant of ⊥.
(a) Show that the following primitive deﬁnition causes inconsistency, be-
cause it enables the derivation of a contradiction in λD:
A,B : ∗p  k(A,B) := ⊥ ⊥ : (A ⇒ B) ⇒ A.
(b) Show that the following pair of primitive deﬁnitions causes inconsis-
tency:
∅  ιDN := ⊥ ⊥ : ∀A : ∗p . (¬¬A ⇒ A),
∅  neg-imp := ⊥ ⊥ : ∀A : ∗p . (A ⇒ ¬A).
(c) Show that the following deﬁnition, resembling the induction axiom,
causes inconsistency:
P : N → ∗p  ind-s(P) := ∀n : N. (P n ⇒ P(sn)) ⇒ ∀n : N. P n.
10.3 (a) Give a modiﬁed version of Lemma 9.9.1(1) for primitive deﬁnitions
and prove it.
(b) Formulate a (par-prim)-rule for primitive deﬁnitions, as a natural
companion to the (par)-rule for descriptive deﬁnitions (cf. Figure 9.4).
10.4 Let Δ; Γ be a legal combination. Give a proof of
Δ; Γ  ∗ : .
(Use induction on the structure of the derivation of Δ; Γ  M : N.)224 Rules and properties of λD
10.5 Prove Lemma 10.4.7(1).
10.6 Prove that Lemma 9.9.1(2) is a consequence of Lemma 9.9.1(1) and
Lemma 10.4.7(2).
10.7 Let Δ; Γ be a legal combination. Prove the following (hint: see Exer-
cise 10.4 and Lemma 10.4.7(1)):
(a) If (x : A) ∈ Γ, then Δ; Γ  A : s for some sort s.
(b) If x is fresh, then also Δ; Γ, x : ∗ is a legal combination.
(c) If (x : ∗) ∈ Γ and y is fresh, then also Δ; Γ, y : x is a legal combi-
nation.
10.8 Prove Lemma 10.4.5(1).11
Flag-style natural deduction in λD
## 11.1 Formal derivations in λD
Now that we have developed system λD, being the Calculus of Constructions
enriched with deﬁnitions and primitive notions, we can do better when express-
ing logic. In particular, we can now do constructive logic in an eﬃcient and
elegant manner. This can be done already in λD0, since there are no axioms
in constructive logic.
In Sections 7.1 and 7.2, we encountered a number of ‘hidden’ deﬁnitions
dealing with logic in λC. As examples, we repeat three of them below, now
using the standard format of λD as described in the previous sections.
Absurdity
In Section 7.1, we identiﬁed the absurdity ⊥ with Πα : ∗. α. The symbol ⊥
was not part of the λC syntax; it acted as a ‘new name’ (or shorthand) for the
expression Πα : ∗. α. This is exactly what a descriptive deﬁnition does, so we
write this now as:
∅  ⊥() := Πα : ∗. α : ∗.
(Since this is our ﬁrst exercise with the system λD, we do not omit the empty
parameter list, as would have been allowed by Notation 8.3.3.)
Negation
In the same Section 7.1, we took ¬A as an abbreviation for A → ⊥. This
clearly is a descriptive deﬁnition again, but this time one with a non-empty
context, since we silently presupposed that A : ∗ (the deﬁnition holds for all
propositions A):
A : ∗  ¬(A) := A → ⊥() : ∗.
The ﬂag-manner to write this deﬁnition is:
A : ∗
¬(A) := A → ⊥() : ∗226 Flag-style natural deduction in λD
Conjunction
In Section 7.2 we considered the second order encodings for ∧ and ∨. Let’s
consider conjunction here. Its deﬁnition depends on two parameters, viz. the
free variables A and B. (Note that C is a bound variable, and not a parameter
of the deﬁnition.)
A : ∗
B : ∗
∧(A,B) := ΠC : ∗ . (A → B → C) → C : ∗
How can logical deﬁnitions like the ones above be formally derived in λD?
Let’s consider how they ﬁt into the λD scheme (Figure 9.3).
First look at the absurdity deﬁnition ∅  ⊥() := Πα : ∗. α : ∗. If we
want to incorporate this deﬁnition into an environment, e.g. by means of the
(par)-rule, it suﬃces to construct a derivation of
∅ ; ∅  Πα : ∗. α : ∗.
It will be clear that we can simply start with the corresponding derivation in
λC and ‘copy’ it in λD-style:
λC λD0
(1) ∅  ∗ :  (sort) ∅ ; ∅  ∗ :  (sort)
(2) α : ∗  α : ∗ (var) ∅ ; α : ∗  α : ∗ (var)
(3) ∅  Πα : ∗. α : ∗ (form) ∅ ; ∅  Πα : ∗. α : ∗ (form)
Figure 11.1 ‘Copying’ a λC-derivation into λD0
After this, we may append the deﬁnition of ⊥ to the (still empty) environ-
ment in line (3), right-hand side. In order to keep things clear for the reader,
we abbreviate the deﬁnition by
D1 ≡ ∅  ⊥() := Πα : ∗. α : ∗,
and we derive in λD with the rule (par) (see Figure 9.4):
(4) D1 ; ∅  ⊥() : ∗ (par).
The next task is to incorporate the above deﬁnition of ¬ into λD. We ab-
breviate it by D2:
D2 ≡ A : ∗  ¬(A) := A → ⊥() : ∗.
As we want to introduce this deﬁnition D2 in the environment as well, just
as we did in (4) with D1, we try to derive the following judgement:
D1, D2 ; A : ∗  ¬(A) : ∗.11.1 Formal derivations in λD 227
Note that we need D1 in the environment, because we use ⊥ in D2.
The above judgement is indeed derivable, as we demonstrate in Figure 11.2.
D1 ≡ ∅  ⊥() := Πα : ∗. α : ∗
D2 ≡ A : ∗  ¬(A) := A → ⊥() : ∗
(1) ∅ ; ∅  ∗ :  (sort)
(2) ∅ ; α : ∗  α : ∗ (var) on (1)
(3) ∅ ; ∅  Πα : ∗. α : ∗ (form) on (1), (2)
(4) D1 ; ∅  ⊥() : ∗ (par) on (3)
(5) D1 ; ∅  ∗ :  (def ) on (1), (3)
(6) D1 ; A : ∗  A : ∗ (var) on (5)
(7) D1 ; A : ∗  ⊥() : ∗ (weak) on (4), (5)
(8) D1 ; A : ∗, y : A  ⊥() : ∗ (weak) on (7), (6)
(9) D1 ; A : ∗  A → ⊥() : ∗ (form) on (6), (8)
(10) D1,D2 ; A : ∗  ¬(A) : ∗ (par) on (9)
Figure 11.2 A λD0-derivation for the deﬁnition of ¬
We take some time to look deeper into this derivation. First note that, for
convenience’s sake, we list the two deﬁnitions in a kind of preamble at the
beginning of the derivation, together with their ‘meta-names’ D1 and D2. This
permits us to write the derivation in the condensed form as given in Figure 11.2;
oﬃcially, the ‘meta-names’ D1 and D2 in lines (4) to (10) should be replaced
by the unabbreviated deﬁnitions they represent.
As is usual with the development of derivations (cf. Chapters 2 to 7, and in
particular Section 2.6), we start at the bottom end. So we ask ourselves the
question: how can we arrive at the ﬁnal judgement, being:
(10) D1, A : ∗  ¬(A) := A → ⊥() : ∗ ; A : ∗  ¬(A) : ∗.
This judgement is a consequence of the (par)-rule, if we can derive:
(9) D1 ; A : ∗  A → ⊥() : ∗,
which in its turn, since A → ⊥() is an abbreviation of Πy : A. ⊥(), can be
obtained from the (form)-rule applied on the judgements
(6) D1 ; A : ∗  A : ∗, and
(8) D1 ; A : ∗, y : A  ⊥() : ∗.
We leave it to the reader to continue this bottom-up analysis of the derivation
above.
In a similar manner, one can derive the formal λD-version of the deﬁnition
of conjunction. See Figure 11.3 for an outline; the details are left to the reader
(Exercise 11.2). Note that this derivation does not appeal to deﬁnitions D1 or
D2, because neither ⊥ nor ¬ play a role in the deﬁnition of ∧. There would228 Flag-style natural deduction in λD
be, however, no objection against maintaining D1 and D2 in the environment
of the judgement.
D3 ≡ A : ∗, B : ∗  ∧(A,B) := ΠC : ∗. (A → B → C) → C : ∗
. . .
. . .
(..) D3 ; A : ∗,B : ∗  ∧(A,B) : ∗ (par)
Figure 11.3 The shape of a λC-derivation for the deﬁnition of ∧
## 11.2 Comparing formal and ﬂag-style λD
In Chapter 4 – to be precise, in Section 4.6 – we decided to suppress less inter-
esting steps in derivations, when this does not harm the cogency. In particular,
we tended to omit applications of the rules (sort), (var), (weak) and (form).
This enabled us to develop derivations in ﬂag style that have a nice and con-
vincing appearance, without having to bother about the more administrative
steps that the type systems require. We have maintained this procedure in
later chapters, which includes the examples in λC given in Chapter 7.
We do the same in λD: we suppress, if we desire so, the occurrences of not-
so-interesting steps (in particular, the ones mentioned above, plus (def )), so we
can concentrate on the steps that really matter. Applying this to our derivation
in Figure 11.2, we can skip lines (1), (2), (5) and (7).
An interesting question is how a derivation in the linear format as employed
in Figure 11.2 relates to a ﬂag-style derivation. In order to demonstrate this,
we make a faithful copy in ﬂag format of the derivation in Figure 11.2. We
take the shortened version as described just now, but for ease of reference we
maintain the original line numbers:
(3) Πα : ∗. α : ∗ (form)
(D1) ⊥() := Πα : ∗. α : ∗ deﬁnition
(4) ⊥() : ∗ (par) on (3) and (D1)
(a) A : ∗
(6) A : ∗ (var)
(b) y : A
(8) ⊥() : ∗ (weak), twice, on (4) and (6)
(9) A → ⊥() : ∗ (form) on (6) and (8)
(D2) ¬(A) := A → ⊥() : ∗ deﬁnition
(10) ¬(A) : ∗ (par) on (9) and (D2)11.3 Conventions about ﬂag-style proofs in λD 229
There clearly is a close resemblance between this ﬂag version and the ‘oﬃcial’
λD0 version of Figure 11.2 (in the shortened form).
When looking closer at the ﬂag version above, it strikes the eye that in
line (D1) there appears an almost-duplication of the information contained in
the embracing lines (3) and (4), and similarly with (D2) and lines (9) and (10).
It appears reasonable to maintain only deﬁnitions (D1) and (D2), and erase
lines (3), (4), (9) and (10).
For example, when condensing the triple (3), (D1) and (4) into (D1) alone:
⊥() := Πα : ∗. α : ∗,
we should agree on the convention that this single line incorporates derivability
of the omitted statements (3) and (4).
A second observation is that lines (6) and (8) are more or less superﬂuous:
line (9) can also be seen as an obvious consequence of assumption (a) and
line (4). So we may skip lines (6) and (8), and therefore also assumption (b).
Implementing the mentioned adaptations, we obtain the following ﬂag-style
derivation:
(D1) ⊥() := Πα : ∗. α : ∗ (form) and (par)
(a) A : ∗
(D2) ¬(A) := A → ⊥() : ∗ (form) and (par)
Hence, by rewriting the λD proof into ﬂag format, and omitting some very
obvious lines, we obtain a ﬂag derivation that is identical to the presentation
of the corresponding deﬁnitions in the beginning of Section 11.1. It is tempting
to conjecture, albeit based on very little evidence, that the formal derivation
system λD as we developed it, can be fruitfully employed for a faithful reﬂection
of the more intuitive approach towards deﬁnitions as we have employed, for
example, in Chapter 7.
## 11.3 Conventions about ﬂag-style proofs in λD
The examples in the previous section, in particular in the ‘condensed form’ of
the ﬁnal paragraphs, show how speciﬁc lines in the ﬂag-style presentation have
a speciﬁc ‘meaning’.
For example, a line of the form
c(x) := M : N
in an environment Δ and a context Γ, where parameter list x is the list of the
subject variables in Γ, has a triple meaning:
(1) the statement M : N is derivable with respect to Δ and Γ,230 Flag-style natural deduction in λD
(2) the deﬁnition D ≡ Γ  c(x) := M : N is added at the end of Δ,
(3) the statement c(x) : N is derivable in the extended environment Δ,D
and context Γ.
This kind of ‘multiple meaning’ of assumptions, deﬁnitions and other lines
in λD0 can be made more formal by explicitly giving a sort of ‘operational
semantics’ to ﬂag-style derivations. We conﬁne ourselves to an illustrative sit-
uation to show how this semantics works. In this example we record the state
of a derivation as a pair {D | Γ} of an environment and a context. This state
changes when the context changes, and when a new deﬁnition is added.
{∅ | ∅}
(a) x1 : A1
{∅ | x1 : A1}
(b) x2 : A2
{∅ | x1 : A1, x2 : A2}
(1) a(x1,x2) := M1 : N1
{x1 : A1, x2 : A2  a(x1,x2) := M1 : N1 | x1 : A1, x2 : A2}
{x1 : A1, x2 : A2  a(x1,x2) := M1 : N1 | x1 : A1}
(2) b(x1) := M2 : N2
{x1 : A1, x2 : A2  a(x1,x2) := M1 : N1, x1 : A1  b(x1) := M2 : N2 |
x1 : A1}
In this example we see that:
− each time a ﬂag is raised, the context is extended; when the ﬂag is hauled
down (at the end of a ﬂagpole), context Γ accordingly shrinks;
− a deﬁnition a(x) := M : N under a context of ﬂags expresses that the
corresponding deﬁnition D ≡ Γ  a(x) := M : N is added to the environ-
ment Δ, where Γ corresponds to the ﬂag context.
Moreover, the statements M : N and a(x) : N, implicitly present within D,
correspond to the following two derivable judgements: Δ ; Γ  M : N and
Δ,D ; Γ  a(x) : N.
When constructing a single derivation, either in the oﬃcial λD format or in
the ﬂag format, we gradually build up an environment Δ. One may choose at
any time to start a new derivation from scratch, thus ‘throwing away’ previous
information; an example of this is given in Section 11.1, where deﬁnition D3 did
not depend on the derivations leading to deﬁnitions D1 and D2 (see Figures 11.2
and 11.3).
An alternative working method, which we prefer to follow in the chapters to
come, is to condense all obtained derivations into one big overall derivation.
This can easily be done by attaching new derivations to old ones. Such a11.3 Conventions about ﬂag-style proofs in λD 231
continuous-derivation approach is advantageous, since then all judgements,
including the deﬁnitions, stay ‘alive’ (i.e. valid and attainable), and therefore
remain serviceable in a later stage. A disadvantage may of course be that there
is a good chance that we ‘drag along’ judgements (in particular deﬁnitions) that
are superﬂuous.
Remark 11.3.1 In the latter approach, when building one big coherent deriva-
tion, context Γ may grow and shrink from line to line, just like a stack in a
computer, but the environment Δ only becomes bigger and bigger: once added,
a deﬁnition is never erased.
This non-erasing situation for deﬁnitions is standard in our system λD,
since, as one may easily check, there is no derivation rule for deleting a deﬁ-
nition.
A reader not content with this fact may easily design an extra derivation rule
– being a provable consequence of the oﬃcial rules – which makes it possible to
eliminate superﬂuous deﬁnitions from an environment. This is allowed by the
Condensing Lemma, 10.4.8(2).
That we do not erase deﬁnitions in λD may be justiﬁed as follows. An en-
vironment may be seen as a listing of all facts that matter or may matter: a
judgement recorded as a deﬁnition can always be called upon at a later stage,
by using its name and instantiating its parameters. Therefore, the environment
acts as a kind of log-book of our achievements. And indeed, there is a natural
correspondence between the ‘knowledge’ built up in a (logic or mathematics)
book and the mentioned log-book of a derivation. We’ll see this better in the
examples of the following chapters.
In order to streamline the presentation of ﬂag derivations, we shall from now
on only use the deﬁnition format. That is, we present derivations consistently
as a list of deﬁnitions, in agreement with our informal discussion in Section 8.9.
In a ﬂag derivation, we turn every statement relative to a
certain context, into a deﬁnition, by choosing a new deﬁned
name and appending that name in front of the statement.
So instead of Γ  M : N we write Γ  c(x) := M : N in ﬂag derivations.
Remark 11.3.2 This approach is followed in the pioneering system Au-
tomath, devised and exploited in the late 1960s and the 1970s by N.G. de
Bruijn and his group in Eindhoven, the Netherlands. (Cf. de Bruijn, 1970;
Nederpelt et al., 1994.)
We are aware that application of the above convention may introduce non-232 Flag-style natural deduction in λD
essential deﬁned names; i.e. names that are never used after they have been
deﬁned. On the other hand, this approach enables a simpliﬁed version of system
λD, in particular when presented in ﬂag format, since there are no longer
statements-as-such: statements are all embedded into deﬁnitions.
## 11.4 Introduction and elimination rules
In this chapter we consider λD-formalised logic as a start for the exploration
of the usefulness of λD as a system for the formalisation of mathematics. We
go even further: in the present chapter and the ones to come we investigate
whether it is true that such a formalisation can be made in a ‘natural’ manner;
that is, close to the way a mathematician is used to develop theories.
In order to pave our survey of how to encode logic in λD, we recall our
endeavours in Chapter 7, where we have shown that logic, in particular natu-
ral deduction, can be fruitfully embedded into the Calculus of Constructions,
λC. Presently, with λD, we have more expressive power, which enables us to
precisely register inside the formal derivation which natural deduction rules
are used during the development of a derivation. This makes it easier for the
writer to communicate the logical background of a step in a derivation; and
thereby enables the reader to follow the proof with better understanding.
We demonstrate this point with an example from predicate logic. We give a
λD-derivation in ﬂag format embodying a proof of the following tautology:
if ∀x∈S(A ⇒ P(x)), then A ⇒ ∀x∈S(P(y)),
for a given predicate P over a set S, and a proposition A.
A formal derivation of this tautology in λD is easy, as the reader can see in
Figure 11.4. As before (see Section 7.6) we write ∀ for Π, and ⇒ for →.
Remark 11.4.1 We have added deﬁned constants to every statement, in
conformity with Remark 11.3.2. The names a1 to a3 do not play a further role
in the present derivation. This is, however, exceptional: deﬁned constants turn
out to be very useful and will regularly be called upon; see, for example, line (5).
There are two lines in this derivation that are a result of the (appl)-rule:
− Line (1) is a consequence of ∀-elimination, since we apply the proposition
∀x∈S(A ⇒ P(x)) to y in S, which results in A ⇒ P(y). Formally: the u
inhabiting the coded ∀-expression is applied to the y inhabiting S, resulting
in uy inhabiting the coded version of A ⇒ P(y).
− It is followed by line (2), in which the obtained uy has been applied to v,
being an inhabitant of A. From a logical point of view, we have a case of
⇒-elimination here: A ⇒ P(y) and A lead to P(y).11.4 Introduction and elimination rules 233
(a) S : ∗
(b) P : S → ∗
(c) A : ∗
(d) u : ∀x : S . (A ⇒ P x)
(e) v : A
(f) y : S
(1) a1(S,P,A,u,v,y) := uy : A ⇒ P y (appl) on (d) and (f)
(2) a2(S,P,A,u,v,y) := uy v : P y (appl) on (1) and (e)
(3) a3(S,P,A,u,v) := λy : S . uy v : ∀y : S . P y (abst) on (2)
(4) a4(S,P,A,u) := λv : A. λy : S . uy v :
A ⇒ ∀y : S . P y (abst) on (3)
(5) a5(S,P,A) := λu : (∀x : S . (A ⇒ P x)). a4(S,P,A,u) :
(∀x : S . (A ⇒ P x)) ⇒ A ⇒ ∀y : S . P y (abst) on (4)
Figure 11.4 A λD-derivation of a logical tautology
Hence, the annotation (appl) used in both lines is in a sense too general: it
hides the information that in line (1) the logical ∀-elimination rule has been
used, and in line (2) the logical ⇒-elimination rule. This makes the given
derivation less transparent than one might desire.
A similar remark can be made about lines (3) to (5): all these are annotated
with (abst), concealing that we have, from a logical point of view, a case of
∀-introduction in line (3) and of ⇒-introduction in lines (4) and (5).
In the present chapter we demonstrate how the deﬁnition mechanism may
help us to disclose such information if we wish so, as part of the derivation and
on the spot where it ‘happens’. Therefore it is worthwhile to redo our system-
atic discussion of the so-called ‘logical constants’ that we have discussed earlier,
notably in Chapter 7 and (as examples of deﬁnitions) in Section 11.1. We shall
introduce a number of deﬁnitions that embody the logical introduction- and
elimination-rules. We have to choose which rules to include: it is not immedi-
ately clear which ones to insert and which to omit. We try to be concise but
also practical.
Another thing is that we do not make the fundamental choice to only con-
sider constructive logic. Hence, we admit the axiom of the excluded third or
that of the double negation – see Section 7.4. The reason is that mathematicians
often employ classical logic, and we respect this preference.
Below, we start with the rules of constructive propositional logic, but cross
over to classical propositional logic as soon as this is appropriate. Deﬁnitions
and rules for predicate logic will be given thereafter, again in the two versions.234 Flag-style natural deduction in λD
In between, we give examples in order to demonstrate how these introduction
and elimination rules ‘work’. A summary of the presented rules for constructive
and classical natural deduction in λD will be given in Appendix A.
## 11.5 Rules for constructive propositional logic
We start with the connectives closest connected to type theory, namely impli-
cation, absurdity and negation.The logical introduction and elimination rules
for ⇒, ⊥ and ¬ are described in Remarks 7.1.1 and 7.1.2. We recall from
Section 5.4, IV, that A ⇒ B may simply be encoded as A → B, being an
abbreviation for Πx : A. B if x ∈ FV(B) (which is here the case).
In λD we can give a name to each of the corresponding natural deduc-
tion rules. For example, we shall introduce the λD-constant ⊥-in for the ⊥-
introduction rule. See Figures 11.5, 11.6 and 11.7 below.
Notation 11.5.1 For reasons of space, we sometimes combine ﬂags. In Fig-
ure 11.5 we employ such a condensed representation on two occasions:
− we combine the two ﬂags A : ∗p and B : ∗p , concerning declarations that
have the same type ∗p;
− we use a double ﬂag between lines (2) and (3) for the subsequent declarations
u : A ⇒ B and v : A, presented horizontally instead of vertically.
In order to emphasise that we are dealing with propositions, we write ∗p
instead of ∗ (see Notation 8.7.1).
A,B : ∗p
(1) ⇒(A,B) := A → B : ∗p
Notation: A ⇒ B for ⇒ (A,B)
u : A → B
(2) ⇒-in(A,B,u) := u : A ⇒ B
u : A ⇒ B | v : A
(3) ⇒-el(A,B,u,v) := uv : B
Figure 11.5 Deﬁnition and rules for ⇒
Notation 11.5.2 We make our formalised versions of mathematics more
readable by inserting notation conventions as extra lines in a derivation. See
the ‘Notation’ following line (1): thereby we agree to write expressions like
⇒(A,B) as A ⇒ B, in inﬁx notation, which is more reader-friendly. Such
a convention is just made for our comfort; it is not meant to be an actual
extension of the language. Otherwise said: we suppose that such notational
abbreviations have been undone in the ‘real’ λD-text.11.5 Rules for constructive propositional logic 235
(1) ⊥ := ΠA : ∗p . A : ∗p
A : ∗p
u : A | v : A ⇒ ⊥
(2) ⊥-in(A,u,v) := v u : ⊥
u : ⊥
(3) ⊥-el(A,u) := uA : A
Figure 11.6 Deﬁnition and rules for ⊥
Note that we could as well have deﬁned ⊥-in(A,u,v) as ⇒-in(A,u,v) in
line (2) of Figure 11.6, since ⊥-in is a special case of ⇒-in. The rule ¬-in in
Figure 11.7 is also a special case of ⇒-in, with ⊥ for B. Similarly, ¬-el is a
special case of ⇒-el. (Cf. Remark 7.1.2.)
A : ∗p
(1) ¬(A) := A ⇒ ⊥ : ∗p
Notation: ¬A for ¬(A)
u : A → ⊥
(2) ¬-in(A,u) := u : ¬A
u : ¬A | v : A
(3) ¬-el(A,u,v) := uv : ⊥
Figure 11.7 Deﬁnition and rules for ¬
Names for the proof objects corresponding to introduction and elimination
rules, as introduced above, can be particularly informative when we are inter-
ested in the natural deduction background of a derivation. See the following
example, demonstrating that A implies ¬¬A.
A : ∗p
u : A
v : ¬A
(1) a1(A,u,v) := ¬-el(A,v,u) : ⊥
(2) a2(A,u) := ¬-in(¬A,λv : ¬A. a1(A,u,v)) : ¬¬A
(3) a3(A) := ⇒-in(A,¬¬A,λu : A. a2(A,u)) : A ⇒ ¬¬A
Figure 11.8 Derivation of A ⇒ ¬¬A in natural deduction style236 Flag-style natural deduction in λD
In Figure 11.8 we clearly see that the rules ¬-elimination, ¬-introduction
and ⇒-introduction have consecutively been used to obtain the result.
Such a presentation may be useful for the goal described. However, in case
we are dealing with ⇒, ⊥ or ¬, the usual type-theoretic style is often more
attractive. This is particularly the case when one is interested in the derivation
as such, and not so much in the logical structure. The reason is that the original
(unfolded) proof objects are considerably shorter. See Figure 11.9, in which we
condensed the derivation of Figure 11.8 still further by omitting line (1).
A : ∗p
u : A
(2) a2(A,u) := λv : ¬A. v u : ¬¬A
(3) a3(A) := λu : A. a2(A,u) : A ⇒ ¬¬A
Figure 11.9 Derivation of A ⇒ ¬¬A in type-theoretic style
That the unfolded proof objects are shorter than the folded ones, as we see in
Figures 11.9 vs. 11.8, is not the usual situation. In the natural deduction rules
concerning conjunction, disjunction and biimplication, a deﬁniendum such as
∧(A,B) is considerably shorter than ΠC : ∗p . (A ⇒ B ⇒ C) ⇒ C, the
deﬁniens. In these cases we can make good use of the natural deduction style.
We ﬁrst give the relevant rules for ∧ and ∨, corresponding to the introduction
and elimination rules as discussed and explained in Section 7.2, I and II. The
proof objects in line (2) of Figure 11.10 and line (4) of Figure 11.11 have been
copied from that section. See also Section 11.1. Check the remaining lines in
these ﬁgures yourself.
A,B : ∗p
(1) ∧(A,B) := ΠC : ∗p . (A ⇒ B ⇒ C) ⇒ C : ∗p
Notation: A ∧ B for ∧(A,B)
u : A | v : B
(2) ∧-in(A,B,u,v) := λC : ∗p . λw : A ⇒ B ⇒ C . wuv : A ∧ B
u : A ∧ B
(3) ∧-el1(A,B,u) := uA(λv : A. λw : B . v) : A
(4) ∧-el2(A,B,u) := uB (λv : A. λw : B . w) : B
Figure 11.10 Deﬁnition and rules for ∧11.6 Examples of logical derivations in λD 237
A,B : ∗p
(1) ∨(A,B) := ΠC : ∗p . (A ⇒ C) ⇒ (B ⇒ C) ⇒ C : ∗p
Notation: A ∨ B for ∨(A,B)
u : A
(2) ∨-in1(A,B,u) := λC : ∗p . λv : A ⇒ C . λw : B ⇒ C . v u : A ∨ B
u : B
(3) ∨-in2(A,B,u) := λC : ∗p . λv : A ⇒ C . λw : B ⇒ C . wu : A ∨ B
C : ∗p
u : A ∨ B | v : A ⇒ C | w : B ⇒ C
(4) ∨-el(A,B,C,u,v,w) := uC v w : C
Figure 11.11 Deﬁnition and rules for ∨
Note that the ∨-el-rule in Figure 11.11 has, exceptionally, a body (uC v w)
that is shorter than the deﬁniendum.
The deﬁnition of biimplication as the conjunction of the implications in
both directions immediately leads to the introduction and elimination rules
concerned. See Figure 11.12.
A,B : ∗p
(1) ⇔ (A,B) := (A ⇒ B) ∧ (B ⇒ A) : ∗p
Notation: A ⇔ B for ⇔ (A,B)
u : A ⇒ B | v : B ⇒ A
(2) ⇔-in(A,B,u,v) := ∧-in(A ⇒ B,B ⇒ A,u,v) : A ⇔ B
u : A ⇔ B
(3) ⇔-el1(A,B,u) := ∧-el1(A ⇒ B,B ⇒ A,u) : A ⇒ B
(4) ⇔-el2(A,B,u) := ∧-el2(A ⇒ B,B ⇒ A,u) : B ⇒ A
Figure 11.12 Deﬁnition and rules for ⇔
## 11.6 Examples of logical derivations in λD
We give two examples in order to demonstrate how (constructive) natural
deduction works in λD. For that purpose we ﬁrstly revisit the example from
Section 7.3 (see Figure 7.1): a derivation of the logical tautology
(A ∨ B) ⇒ (¬A ⇒ B).238 Flag-style natural deduction in λD
Having the introduction and elimination rules available in λD (see the previ-
ous section), we ﬁrst give the derivation in the explicit natural deduction style.
See Figure 11.13. In this presentation, it is clearly visible how the derivation is
driven by natural deduction as the system for logic: in every line we ﬁnd one
instance of a logical introduction or elimination rule, which is more informative
than the λC-rules (appl) and (abst) used in Figure 7.1.
(a) A,B : ∗p
(b) x : A ∨ B
(c) y : ¬A
(d) u : A
(1) a1(A,B,x,y,u) := ¬-el(A,y,u) : ⊥
(2) a2(A,B,x,y,u) := ⊥-el(B,a1(A,B,x,y,u)) : B
(3) a3(A,B,x,y) := ⇒-in(A,B,λu : A. a2(A,B,x,y,u)) : A ⇒ B
(4) a4(A,B,x,y) := ⇒-in(B,B,λv : B . v) : B ⇒ B
(5) a5(A,B,x,y) := ∨-el(A,B,B,x,a3(A,B,x,y),a4(A,B,x,y)) : B
(6) a6(A,B,x) := ⇒-in(¬A,B,λy : ¬A. a5(A,B,x,y)) : ¬A ⇒ B
(7) a7(A,B) := ⇒-in(A ∨ B,¬A ⇒ B,λx : A ∨ B . a6(A,B,x)) :
(A ∨ B) ⇒ (¬A ⇒ B)
Figure 11.13 A derivation in natural deduction style of (A∨B) ⇒ (¬A ⇒ B)
Remark 11.6.1 The names a1 to a3 already appeared in Figures 11.8 and
11.9, although they are obviously intended to refer to other constants than the
ones in Figure 11.13. This is a case of reuse of constant names which is not
in agreement with the rules of λD. We do it nevertheless, in order to keep the
number of constant names within reasonable bounds. We are aware, however,
that such overloading of names is not without danger.
It is worthwhile to compare this derivation with the one expressed in Sec-
tion 7.3. There are many correspondences: the derivation given in Figure 7.1
follows lines similar to those in Figure 11.13, although the reasonings deviate
in some details. In the following section (Figure 11.15) we shall reproduce the
same λD-derivation, but with the shorter proof objects corresponding to the
type-theoretic style, according to the following convention.
In a ﬂag derivation, we shall often use the type-theoretic style for proof
objects corresponding to the natural deduction rules for ⇒, ⊥ and ¬.11.7 Suppressing unaltered parameter lists 239
We continue with a second example: the commutativity of ∨. That is, we
prove the simple fact that A ∨ B implies B ∨ A.
The derivation in Figure 11.14 is based on the two introduction rules for ∨
(lines (1) and (2)) and the elimination rule for ∨ (line (3)). In the proof, we
use the type-theoretic style. We leave it to the reader to formulate the four
proof objects in natural deduction style (Exercise 11.7).
A,B : ∗p
u : A ∨ B
(1) a1(A,B,u) := λv : A. ∨-in2 (B,A,v) : A ⇒ (B ∨ A)
(2) a2(A,B,u) := λw : B . ∨-in1 (B,A,w) : B ⇒ (B ∨ A)
(3) a3(A,B,u) := u(B ∨ A) a1(A,B,u) a2(A,B,u) : B ∨ A
(4) sym-∨(A,B) := λu : A ∨ B . a3(A,B,u) : (A ∨ B) ⇒ (B ∨ A)
Figure 11.14 Commutativity of ∨
Note that sym-∨(A,B) inhabits the property (A ∨ B) ⇒ (B ∨ A); it is not
the property itself.
## 11.7 Suppressing unaltered parameter lists
When looking back at the example derivation in Figure 11.13, we notice that
the presence of parameter lists following the constants a1 to a7 obscures the
general picture. The more so, because in the proof objects occurring in these
examples, the corresponding parameter lists bear no interesting information:
in all cases we see ‘identical’ instantiations for the parameters: A for A, B for
B, and so on.
Hence, no information is lost when we omit such non-interesting parameter
lists, both in the deﬁnienda (so before the ‘:=’-sign) as in the proof objects. And
without these lists, we can better concentrate on the things that matter, such as
the course of the derivation. We realise that this contradicts our arguments to
consistently mention the parameter lists in the deﬁnienda; see Remark 8.3.2.
The advantages of suppressing unessential parameter lists are, however, too
important to neglect.
To show the eﬀects of this convention, we rewrite the derivation of Fig-
ure 11.13 in this novel format. We also take the opportunity to apply the
type-theoretic style for the ⇒-, ⊥- and ¬-rules, and for the ∨-el-rule. See Fig-
ure 11.15.
Hence, we adopt the following notational option, which we call the parameter
list convention:240 Flag-style natural deduction in λD
(a) A,B : ∗p
(b) x : A ∨ B
(c) y : ¬A
(d) u : A
(1) a†
1 := y u : ⊥
(2) a2 := a1 B : B
(3) a3 := λu : A. a2 : A ⇒ B
(4) a4 := λv : B . v : B ⇒ B
(5) a5 := xB a3 a4 : B
(6) a6 := λy : ¬A. a5 : ¬A ⇒ B
(7) a7 := λx : A ∨ B . a6 : (A ∨ B) ⇒ (¬A ⇒ B)
†
parameters suppressed
Figure 11.15 Suppressed parameter lists and short proof objects
Notation 11.7.1 (Parameter list convention)
Parameter lists that literally reﬂect the context in which they have been in-
troduced may be suppressed completely.
This applies not only when introducing a deﬁned constant, as in the left-
hand sides of lines (1) to (7) of Figure 11.13, but also when using a constant
with unaltered parameter list in the proof objects.
The result is convincing. In the text to come, we shall employ the parameter
list convention whenever we consider it useful. This will mostly be in examples,
not in the derivations that are essential for the development of this course. If
we employ the convention, we shall mention this in a footnote accompanying
the ﬁrst constant with suppressed parameter list (cf. Figure 11.15).
Note, however, that this convention makes it harder to distinguish between
variables and constants: some constants now deceptively resemble variables,
since they do not show their parameter lists.
## 11.8 Rules for classical propositional logic
When one wishes to do classical logic, we need to add an axiom. In λD we do
this by the addition of a primitive deﬁnition. We may choose, as we already
mentioned in Section 7.4, either the law of the excluded third A∨¬A (ET) or
the double negation law ¬¬A ⇒ A (DN).
Since we add an axiom, we go beyond λD0 and employ the extra rules of
λD. In Figure 11.16, we formulate axiom ET in λD and subsequently derive11.8 Rules for classical propositional logic 241
DN. In line (1) we primitively introduce ET, by giving a name, exc-thrd, to
an inhabitant. So exc-third is an axiomatically assumed constant of type ET.
We express it as an axiom in a context, namely A : ∗p. This diﬀers from the
approach in Section 7.4, where we introduced proof object iET of the type
ΠA : ∗. A ∨ ¬A.
A : ∗p
(1) exc-thrd(A) := ⊥ ⊥ : A ∨ ¬A
(2) a2(A) := λv : A. v : A ⇒ A
u : ¬¬A
v : ¬A
(3) a3(A,u,v) := uv : ⊥
(4) a4(A,u,v) := a3(A,u,v) A : A
(5) a5(A,u) := λv : ¬A. a4(A,u,v) : ¬A ⇒ A
(6) a6(A,u) := exc-thrd(A) A a2(A) a5(A,u) : A
(7) doub-neg(A) := λu : ¬¬A. a6(A,u) : ¬¬A ⇒ A
Figure 11.16 The law of the excluded third, entailing the double negation law
The derivation resembles the λC version given in Section 7.4. We use the
type-theoretic style discussed in Section 11.5. This enables us to produce a
short derivation, albeit that it is not immediately clear which natural deduction
rules have been applied. Find out yourself which introduction or elimination
rules apply to lines (2) to (7).
Note that doub-neg may be conceived as implying a kind of elimination rule
concerning the double negation symbol (¬¬): if we have a proof of ¬¬A, then
we can obtain a proof of A with the help of doub-neg (by the aid of ⇒ -el).
In the same vein, we may consider an introduction rule for ¬¬, since we have
derived in Figure 11.9 (without the exc-thrd-axiom, hence constructively) that
from A we may conclude ¬¬A.
Since both transitions (from A to ¬¬A and vice versa) occur so often, we
devote two extra rules to them: ¬¬-in and ¬¬-el. See Figure 11.17.
We continue with a derivation of the tautology (¬A ⇒ B) ⇒ (A ∨ B), the
‘reversal’ of the tautology derived in Figure 11.13 (see Figure 11.18). This is
a non-constructive tautology: it can only be proved with the help of DN (or
ET); and indeed, in line (10) of Figure 11.18 we use the non-constructive rule
¬¬-el. We suppress parameters as explained in the previous section, and use242 Flag-style natural deduction in λD
A : ∗p
u : A
v : ¬A
(1) ¬¬-in(A,u) := λv : ¬A. v u : ¬¬A
u : ¬¬A
(2) ¬¬-el(A,u) := doub-neg(A) u : A
Figure 11.17 Natural deduction rules for ¬¬
a mixture of the type-theoretic style and the natural deduction style, choosing
what is convenient.
(a) A,B : ∗p
(b) u : ¬A ⇒ B
(c) v : ¬(A ∨ B)
(d) w : A
(1) a†
1 := ∨-in1(A,B,w) : A ∨ B
(2) a2 := v a1 : ⊥
(3) a3 := λw : A. a2 : ¬A
(e) w : B
(4) a4 := ∨-in2(A,B,w) : A ∨ B
(5) a5 := v a4 : ⊥
(6) a6 := λw : B . a5 : ¬B
(7) a7 := ua3 : B
(8) a8 := a6 a7 : ⊥
(9) a9 := λv : ¬(A ∨ B). a8 : ¬¬(A ∨ B)
(10) a10 := ¬¬-el(A ∨ B,a9) : A ∨ B
(11) a11 := λu : (¬A ⇒ B). a10 : (¬A ⇒ B) ⇒ (A ∨ B)
†
parameters suppressed
Figure 11.18 A derivation in natural deduction of (¬A ⇒ B) ⇒ (A ∨ B)
We leave most of the reasoning employed in the derivation of Figure 11.18
to the reader. There is only one aspect to which we pay special attention. The
original goal (¬A ⇒ B) ⇒ (A ∨ B), line (11), induces assumption (b) and
the new goal A ∨ B, line (10). For attaining the latter goal, we try proof by
contradiction: we assume the opposite, ¬(A∨B) (see assumption (c)) and try
to derive ⊥ (see line (8)), in which we succeed.11.9 Alternative natural deduction rules for ∨ 243
Remark 11.8.1 Proof by contradiction (or ‘indirect proof’) is a standard
strategy in classical logic. It has the following pattern.
To prove A, we can try the following scheme:
¬A
. . .
⊥
It suﬃces to ﬁll the dots with a proper proof. The motivation in natural
deduction style is that after ﬁlling the dots, ¬-in followed by ¬¬-el indeed
gives A as a result (check this; see also lines (9) and (10) in Figure 11.18).
A proof by contradiction may be called upon in every step of a proof. It is,
however, wise to use it with considerable care – namely only when no direct
proof appears to be at hand. The reason for this prudence is that a rash use of
‘proof by contradiction’ may easily lead to an unnecessary detour.
## 11.9 Alternative natural deduction rules for ∨
The two example derivations we gave in Figures 11.13 and 11.18 may be com-
bined into one derivable biimplication:
(A ∨ B) ⇔ (¬A ⇒ B).
Hence, A ∨ B and ¬A ⇒ B are interchangeable in classical logic. This has
the following strategic consequences for the disjunction:
− If A∨B occurs in a reasoning-under-construction as the goal to be proved, it
is possible to prove the implication ¬A ⇒ B instead. This ‘classical’ method
can be applied in many more cases than the original ∨-in-rule, which asks
for a proof of either A or B; such a proof is seldom at hand.
− And vice versa: if we are allowed to use A∨B (it is part of our ‘knowledge’
at a certain point in a reasoning), we may as well appeal to the implication
¬A ⇒ B.
Both strategies for dealing with disjunction are current in mathematics.
Therefore, we shall extend our set of introduction and elimination rules in λD
one more time.
Since ∨ is commutative (see Figure 11.14), we may interchange A and B in
A ∨ B; this brings along that A ∨ B is also equivalent to ¬B ⇒ A. Hence, the
new introduction and elimination rules for ∨ come in pairs, as one can see in
Figure 11.19.
Remark 11.9.1 In several lines of the derivation in Figure 11.19, we re-
fer to constants with non-speciﬁc names that were deﬁned earlier. In order to244 Flag-style natural deduction in λD
prevent confusion, we add an extra subscript to such constants. For example,
a10[Fig. 11.18] in line (1) is the constant a10 in Figure 11.18.
A,B : ∗p
u : ¬A ⇒ B
(1) ∨-in-alt1(A,B,u) := a10[Fig. 11.18](A,B,u) : A ∨ B
v : ¬B ⇒ A
(2) a2(A,B,v) := ∨-in-alt1(B,A,v) : B ∨ A
(3) ∨-in-alt2(A,B,v) := a3[Fig. 11.14](B,A,a2(A,B,v)) : A ∨ B
u : A ∨ B
v : ¬A
(4) ∨-el-alt1(A,B,u,v) := a5[Fig. 11.13](A,B,u,v) : B
w : ¬B
(5) ∨-el-alt2(A,B,u,w) := ∨-el-alt1(B,A,a3[Fig. 11.14](A,B,u),w) : A
Figure 11.19 Alternative rules for ∨
Remark 11.9.2 The alternative introduction rules ∨-in-alt1 and ∨-in-alt2
start from the assumption that a certain implication holds: in the ﬁrst case
¬A ⇒ B, in the second case ¬B ⇒ A.
In actual usage of these rules, such implications will often result from a
derivation themselves. So, for example, a typical use of the ﬁrst alternative
introduction rule for ∨ may have the format as depicted below. (We give an
example of this procedure in Figure 11.20.)
. . .
x : ¬A
. . .
a(...,x) := ... : B
∨-in-alt1(A,B,λx : ¬A. a(...,x)) : A ∨ B
We continue with two examples of the use of the alternative ∨-rules, which
together justify the well-known biimplication
¬(A ∧ B) ⇔ (¬A ∨ ¬B).
We advise the reader to study the content of the derivations in Figures 11.20
and 11.21 ‘from bottom to top’, since that is the way they were devised.11.9 Alternative natural deduction rules for ∨ 245
A,B : ∗p
u : ¬(A ∧ B)
v : ¬¬A
(1) a†
1 := ¬¬-el(A,v) : A
w : B
(2) a2 := ∧-in(A,B,a1,w) : A ∧ B
(3) a3 := ua2 : ⊥
(4) a4 := λw : B . a3 : ¬B
(5) a5(A,B,u) := ∨-in-alt1(¬A,¬B,λv : ¬¬A. a4) : ¬A ∨ ¬B
†
parameters suppressed
Figure 11.20 Proof of the lemma: ¬(A ∧ B) entails ¬A ∨ ¬B
A,B : ∗p
u : ¬A ∨ ¬B
v : A ∧ B
(1) a†
1 := ∧-el1(A,B,v) : A
(2) a2 := ∧-el2(A,B,v) : B
(3) a3 := ¬¬-in(A,a1) : ¬¬A
(4) a4 := ∨-el-alt1(¬A,¬B,u,a3) : ¬B
(5) a5 := a4 a2 : ⊥
(6) a6(A,B,u) := λv : A ∧ B . a5 : ¬(A ∧ B)
†
parameters suppressed
Figure 11.21 Proof of the lemma: ¬A ∨ ¬B entails ¬(A ∧ B)
Remark 11.9.3 A proof as in Figure 11.20 can also be read from top to
bottom: start with propositions A and B, make the assumptions ¬(A∧B) and
¬¬A, then conclude to A in line (1); next, assume B, conclude to A ∧ B
in line (2); and so forth. In this manner one may deﬁnitely check that the
derivation is correct, from start to end.
This manner of reading a proof does, however, not give much insight into how
such a proof has been constructed and what its intuitive ideas are. Almost every
proof, and certainly the more sophisticated ones, has been devised in a non-
linear manner: one usually starts at the end (the goal), develops intermediate246 Flag-style natural deduction in λD
results, sets new goals, and so on. Regularly, there have been attempts that have
failed (and therefore have not been recorded).
This art of ‘proof ﬁnding’ is illustrated in various parts of this book. Alto-
gether, ﬁnding a proof is an ingenuous mixture of routine and bright ideas. And
when studying a proof, it is the task of the reader to value it at its true worth.
## 11.10 Rules for constructive predicate logic
Predicate logic is the logic obtained by extending propositional logic with the
quantiﬁers ∀ and ∃. We start with the constructive rules for the universal
quantiﬁer ∀.
As we have already discussed in Section 5.4, V, an expression ∀x∈S(P(x))
is naturally coded as Πx : S . P x in type theory. This makes it easy to ﬁnd
out what the introduction and elimination rules for ∀ become in λD (see Fig-
ure 11.22). For a clear exposition, we write ∗ as either ∗s (when dealing with
sets) or ∗p (for propositions); see Notation 8.7.1.
S : ∗s | P : S → ∗p
(1) ∀(S,P) := Πx : S . P x : ∗p
Notation: ∀x : S . P x for ∀(S,P)
u : Πx : S . P x
(2) ∀-in(S,P,u) := u : ∀x : S . P x
u : ∀x : S . P x | v : S
(3) ∀-el(S,P,u,v) := uv : P v
Figure 11.22 Deﬁnition and rules for ∀
Remark 11.10.1 We only formulate the ∀-rules in the ﬁrst order case, with
x ranging over a set S, because this is the standard situation. Similar rules
can be developed for the second order case, when the variable ranges over e.g.
propositions. Such a situation occurs, for example, in previously mentioned
second order deﬁnitions such as ⊥ := ΠA : ∗p . A : ∗p (see Section 11.5).
We noticed in Section 11.5 that we use the λD-versions of the natural de-
duction rules for ⇒, ⊥ and ¬ only sparingly, since the type-theoretic style
gives shorter proof objects. The same holds for the ∀-rules: we only employ
the rules as deﬁned above if we want to emphasise that a ∀-introduction or a
∀-elimination takes place. So, the constructed proof objects in these cases will11.10 Rules for constructive predicate logic 247
usually be given in the type-theoretic style, i.e. u instead of ∀-in(S,P,u) and
uv instead of ∀-el(S,P,u,v).
We continue with the constructive rules for the existential quantiﬁer ∃. The
corresponding natural deduction rules are discussed in Section 7.5, together
with their λC-translations.
Below we recapitulate these results, but now in λD. We employ the second
order deﬁnition of ∃, which we repeat (with slight adaptations) in line (1). The
proof object in line (2) is easy to ﬁnd; see Exercise 7.12(a). The proof object
in line (3) was derived in Section 7.5.
S : ∗s | P : S → ∗p
(1) ∃(S,P) := ΠA : ∗p . ((∀x : S . (P x ⇒ A)) ⇒ A) : ∗p
Notation: ∃x : S . P x for ∃(S,P)
u : S | v : P u
(2) ∃-in(S,P,u,v) := λA : ∗p . λw : (∀x : S . (P x ⇒ A)). wuv :
∃x : S . P x
u : ∃x : S . P x | A : ∗p | v : ∀x : S . (P x ⇒ A)
(3) ∃-el(S,P,u,A,v) := uAv : A
Figure 11.23 Deﬁnition and rules for ∃
The usage of the ∃-introduction rule will be obvious: in order to establish
that ∃x : S . P x, it suﬃces to ﬁnd a u in S satisfying P. This is precisely what
the expression suggests. The ∃-elimination rule is more complicated. For its
justiﬁcation, see Section 7.5. Note that the ﬁve assumptions in line (3) are a
well-formed context. This implies that x does not occur as a free variable in
A, as is required in Section 7.5.
The ∃-elimination rule of Figure 11.23 is commonly used as follows.
Suppose that we are engaged in constructing a derivation and that the reign-
ing goal is proposition A, while we have detected that ∃x : S . P x is a usable
fact. In order to ﬁll the gap between ∃x : S . P x and A, the rule ∃-el suggests
to us to ﬁnd an inhabitant of ∀x : S . (P x ⇒ A) (becoming the new goal).
A natural strategy to attain this is to assume x : S and P x, and to ﬁnd an
inhabitant of A. Note that this is the same goal A as before, but now in a
context enlarged with the mentioned two extra assumptions. If we succeed in
fulﬁlling this assignment, then ∃-el enables us to conclude the original goal A.
A schematic picture of this strategy in type theory is:248 Flag-style natural deduction in λD
. . .
a(...) := ... : ∃x : S . P x
x : S
u : P x
. . .
b(...,x,u) := ... : A
c(...,x) := λu : P x. b(...,x,u) : P x ⇒ A
d(...) := λx : S . c(...,x) : ∀x : S . (P x ⇒ A)
e(...) := ∃-el(S,P,a(...),A,d(...)) : A
We continue with an example in which both ∃-in and ∃-el play a role, and
for which a λC-derivation was asked in Exercise 7.13. See Figure 11.24. The
lemma we prove is:
∃x : S . P x ⇒ ∀y : S . (P y ⇒ Qy) ⇒ ∃z : S . Qz.
In the derivation, the ﬂags x : S and w : P x are raised since we have an
inhabitant (viz. u) of ∃x : S . P x. This conforms with the schematic picture
of the ∃-elimination strategy sketched just now. Check the details.
S : ∗s | P : S → ∗p | Q : S → ∗p
u : ∃x : S . P x | v : ∀y : S . (P y ⇒ Qy)
x : S | w : P x
(1) a†
1 := v x : P x ⇒ Qx
(2) a2 := a1 w : Qx
(3) a3 := ∃-in(S,Q,x,a2) : ∃z : S . Qz
(4) a4 := λx : S . λw : P x. a3 : ∀x : S . (P x ⇒ ∃z : S . Qz)
(5) a5 := ∃-el(S,P,u,∃z : S . Qz,a4) : ∃z : S . Qz
(6) a6(S,P,Q) := λu : (∃x : S . P x). λv : (∀y : S . (P y ⇒ Qy)). a5 :
∃x : S . P x ⇒ ∀y : S . (P y ⇒ Qy) ⇒ ∃z : S . Qz
†
parameters suppressed
Figure 11.24 An example concerning the rules for ∃
Remark 11.10.2 The two assumptions in the second ﬂag, viz. ∃x : S . P x
and ∀y : S . (P y ⇒ Qy), do not match the ∃-el-rule: although it appears
tempting to conclude Qy as a result of this rule, this is incorrect since y occurs
free in Qy. See Remark 7.5.2.11.11 Rules for classical predicate logic 249
As another example, we consider the following well-known proposition:
∃x∈S(P(x)) ⇒ ¬∀x∈S(¬P(x)).
In a λD-derivation of this proposition, the ∃-el-rule can be used directly: see
Figure 11.25.
S : ∗s | P : S → ∗p
u : ∃x : S . P x
v : ∀y : S . ¬(P y)
(1) a†
1 := ∃-el(S,P,u,⊥,v) : ⊥
(2) a2 := λv : (∀y : S . ¬(P y)). a1 : ¬∀y : S . ¬(P y)
(3) a3(S,P) := λu : (∃x : S . P x). a2 : (∃x : S . P x) ⇒ ¬(∀y : S . ¬(P y))
†
parameters suppressed
Figure 11.25 Example: ∃ implies ¬∀¬
In setting up this derivation, we have the disposal of ∃x : S . P x in one of
the ﬂags. So, when we wish to apply ∃-elimination, aiming at goal ⊥ in line (1),
we have to derive an inhabitant of ∀x : S . (P x ⇒ ⊥). But such an inhabitant
is already at hand, namely v in the last ﬂag, because ¬P y is equivalent to
P y ⇒ ⊥.
The rest of the derivation will speak for itself.
## 11.11 Rules for classical predicate logic
When combining the introduction and elimination rules for the quantiﬁers
with constructive propositional logic, we obtain constructive predicate logic. In
that system, similarly to the situation with constructive propositional logic, we
miss some tautologies with quantiﬁers that mathematicians intuitively accept
to hold. An example is the reversal of the last example in the previous section,
namely:
¬∀x∈S(¬P(x)) ⇒ ∃x∈S(P(x)).
This expression is naturally considered to be true, since it says: ‘If not all
elements of S do not satisfy P, then there must be an element of S that does
so.’ But it is not derivable in (ﬁrst or second order) constructive predicate
calculus.
Adding the propositional axiom DN (or ET), we obtain classical predicate
logic, in which the above expression can be derived, as we show below. As a
consequence, we may combine the two propositions into the classical predicate-
logical fact (in shorthand): ∃ ⇔ ¬∀¬.250 Flag-style natural deduction in λD
Remark 11.11.1 There exists a counterpart of the equivalence ∃ ⇔ ¬∀¬
mentioned above, to the eﬀect that also ∀ ⇔ ¬∃¬ is valid in classical predicate
logic. This is left to the reader (Exercise 11.16; see also Exercise 7.12(b)).
In the proof we make good use of another simple equivalence regarding
quantiﬁers, which admits a constructive proof:
¬∃x∈S(P(x)) ⇒ ∀x∈S(¬P(x)).
We ﬁrst give a derivation of the latter proposition (Figure 11.26), and next
for the former one (Figure 11.27).
For the last-mentioned proposition, we have already given a proof in λC
(see Section 7.6). But there we did not yet have a formal deﬁnition apparatus.
The derivation in Figure 11.26 enables the reader to compare the λC- and the
λD-approach to formal proof development. It is a simple exercise with natural
deduction. We only mention that the goal ⊥ in line (2) can easily be derived
from assumption ¬∃x : S . P x, and the fact that y : S and v : P y imply
∃z : S . P z (line (1)). The rest is routine.
S : ∗s | P : S → ∗p
u : ¬∃x : S . P x
y : S
v : P y
(1) a†
1 := ∃-in(S,P,y,v) : ∃z : S . P z
(2) a2 := ua1 : ⊥
(3) a3 := λv : P y . a2 : ¬(P y)
(4) a4 := λy : S . a3 : ∀y : S . ¬(P y)
(5) a5(S,P) := λu : (¬∃x : S . P x). a4 : (¬∃x : S . P x) ⇒ ∀y : S . ¬(P y)
†
parameters suppressed
Figure 11.26 Example: ¬∃ implies ∀¬
The derivation in Figure 11.27 is a consequence: it uses line (4) of Fig-
ure 11.26. We apply the method proof by contradiction (see Remark 11.8.1)
by adding ﬂag v : ¬∃y : S . P y in order to obtain ∃y : S . P y in line (4), via
line (3) and ¬¬-el. We recall that ¬¬-el is based on the axiom DN, hence the
derivation is non-constructive.
In classical predicate logic it appears advantageous to add alternative rules
for ∃, inspired by the equivalence of ∃ and ¬∀¬ that we have established above.
The motivation for adding these alternative rules is similar to the situation
with disjunction (cf. Section 11.9). In practical proof ﬁnding, the constructive11.11 Rules for classical predicate logic 251
S : ∗s | P : S → ∗p
u : ¬∀x : S . ¬(P x)
v : ¬∃y : S . P y
(1) a†
1 := a4[Fig. 11.26](S,P,v) : ∀z : S . ¬(P z)
(2) a2 := ua1 : ⊥
(3) a3 := λv : (¬∃y : S . P y). a2 : ¬¬∃y : S . P y
(4) a4 := ¬¬-el(∃y : S . P y, a3) : ∃y : S . P y
(5) a5(S,P) := λu : (¬∀x : S . ¬(P x)). a4 : ¬∀x : S . ¬(P x) ⇒ ∃y : S . P y
†
parameters suppressed
Figure 11.27 Example: ¬∀¬ implies ∃
rule ∃-in turns out to be rather restrictive, just as ∨-in is: in order to obtain
a proof of ∃x : S . P x, the procedure suggested by ∃-in is to ﬁnd a so-called
‘witness’, i.e. a certain entity a of type S that satisﬁes P. But existence of an
x satisfying P x does not always imply that we can point out a witness.
In classical logic we can derive ∃x : S . P x without a witness if we can prove
¬∀x : S . ¬(P x), as Figure 11.27 demonstrates.
For reasons of symmetry, we also add an alternative ∃-el-rule, leading (the
other way round) from ∃ to ¬∀¬. This rule is based on the constructive example
derivation of Figure 11.25, which uses the original ∃-el.
Both alternative rules for ∃ are given in Figure 11.28.
S : ∗s | P : S → ∗p
u : ¬∀x : S . ¬(P x)
(1) ∃-in-alt(S,P,u) := a4[Fig. 11.27](S,P,u) : ∃x : S . P x
u : ∃x : S . P x
(2) ∃-el-alt(S,P,u) := a2[Fig. 11.25](S,P,u) : ¬∀x : S . ¬(P x)
Figure 11.28 Alternative rules for ∃
We conclude this section with an example concerning the alternative ∃-in-
rule. We prove the following lemma in λD:
¬∀x∈S(P(x)) ⇒ ∃x∈S(¬P(x)).
The ‘natural’ bottom-up construction of the derivation depicted in Fig-
ure 11.29 soon leads to the goal ∃y : S . ¬(P y) (see line (6)). We replace it by
the goal ¬∀y : S . ¬¬(P y) (line (5)), in order to be able to apply ∃-in-alt.
The rest of the derivation will speak for itself.252 Flag-style natural deduction in λD
S : ∗s | P : S → ∗p
u : ¬∀x : S . P x
v : ∀y : S . ¬¬(P y)
x : S
(1) a†
1 := v x : ¬¬(P x)
(2) a2 := ¬¬-el(P x,a1) : P x
(3) a3 := λx : S . a2 : ∀x : S . P x
(4) a4 := ua3 : ⊥
(5) a5 := λv : (∀y : S . ¬¬(P y)). a4 : ¬∀y : S . ¬¬(P y)
(6) a6 := ∃-in-alt(S,λy : S . ¬(P y),a5) : ∃y : S . ¬(P y)
(7) a7(S,P) := λu : (¬∀x : S . P x). a6 : (¬∀x : S . P x) ⇒ ∃y : S . ¬(P y)
†
parameters suppressed
Figure 11.29 Example: ¬∀ implies ∃¬
Remark 11.11.2 In Figures 11.26 and 11.29 we derived ¬∃ ⇒ ∀¬ and
¬∀ ⇒ ∃¬. These implications are actually biimplications (Exercise 11.15).
## 11.12 Conclusions
In the present chapter we embarked upon a ﬁrst investigation into the poten-
tial of λD. We started with logic and discovered that λD is a framework as
convincing for the expression of logical connectives and quantiﬁers, as λC. It
turned out that, when using the tree format of the λD-rules, one is obliged to
proceed in a meticulous manner. The positive news is that this leads to the
desired results, but this is obviously not so pleasant for a human user.
Therefore, we have reintroduced the ﬂag style that we have already em-
ployed in our λC-presentation. By permitting to omit a number of obvious
derivation steps, and by condensing the steps concerned with deﬁnitions, we
have succeeded in developing a useful and feasible ﬂag format for λD.
As we mentioned already in Chapter 7, it is worthwhile to investigate the
precise nature of natural deduction as a logical apparatus. This may facilitate
understanding and clarify what’s really happening in the logical steps of a
proof; insight in these matters makes proofs more convincing, since the logical
background highly contributes to the reliability of a piece of mathematics.
Another tool of logic often used in mathematics is that of rewriting an ex-
pression into a logically equivalent one. For example, an expression such as
¬(x > 0 ∧ x < 10) may be replaced by ¬(x > 0) ∨ ¬(x < 10), and vice versa.11.13 Further reading 253
The rationale behind this is again logical, since the mentioned proof steps can
be traced back to the logical equivalence ¬(A∧B) ⇔ (¬A∨¬B). The validity
of such a logical tautology can well be shown by means of a proof in natural
deduction (cf. Figures 11.20 and 11.21). This is a general observation. Hence,
one may consider natural deduction to be the essential logical framework un-
derlying mathematical reasoning; and rewriting to be a secondary method –
albeit a very useful one.
Natural deduction as a formal logical method has already been a major topic
in Chapter 7, with a view to λC. In the present section we have investigated
whether a deﬁnition mechanism in type theory can help to make natural de-
duction still more accessible and usable. It has turned out that, indeed, natural
deduction may be successfully incorporated in λD. We have encapsulated the
λD-versions of the introduction and elimination rules for the basic symbols of
logic (⇒, ⊥, ¬, ∧, ∨, ⇔, ∀ and ∃), and have illustrated their use in (logical)
derivations. The mentioning of the natural deduction rules makes a reasoning
more transparent and understandable for a human being. It turned out, how-
ever, that for the natural deduction rules concerning ⇒, ⊥, ¬ and ∀, and for
the ∨- and ∃-elimination rules, the type-theoretic style of λC is often more
appropriate, since this gives shorter proof objects.
In order to be able to also work with classical logic in λD, we have added
the axiom ET (‘excluded third’) as a primitively inhabited proposition. We
have also given a practical set of alternative rules for the disjunction which
are derivable in classical logic. Examples showed how these alternative rules
may enter into the matter. Other alternative rules were introduced for the
use of quantiﬁers in classical logic and we added several examples of logical
derivations in which the quantiﬁer rules play a role.
In the process of developing a natural deduction framework in the setting
of type theory, we have furthermore studied several strategies to successfully
exploit the rules presented.
The given examples foreshadow how the natural deduction rules may be
used in mathematics; and indeed, these logical rules are frequently employed
in a mathematical ambiance, as we shall see in the chapters to come.
We recall that the λD-version of all natural deduction rules that have been
discussed in the present section (both constructive and classical) are sum-
marised in Appendix A, as a service to the reader.
## 11.13 Further reading
The rules we use for natural deduction are the standard ones that can be found
e.g. in van Dalen (1994). The diﬀerence is that now they are presented in a254 Flag-style natural deduction in λD
ﬂag style, which was popularised by F. Fitch (Fitch, 1952), and can also be
found in the textbook of Nederpelt & Kamareddine (2011). The presence of
deﬁnitions in λD gives yet more possibilities to apply natural deduction in a
ﬂexible manner.
Natural deduction systems, and other systems for formal logic, have already
been discussed in Section 7.8.
There are various source books in mathematical logic, of which Logic and
Structure (van Dalen, 1994) is still a good introduction. A more philosophical
introduction to logic is Kneale & Kneale (1962), a substantial book which also
nicely describes the history of logic.
Exercises
## 11.1 Let Δ be an environment containing the deﬁnitions of ⊥, ¬, ⇒, ∧, ∨ and
∃ as presented in this chapter.
(a) Prove: (∧(⊥,⊥))⊥
Δ
=β ¬(⊥ ⇒ ¬(⊥)).
(b) Give the δ-normal form of ∃(S,λx : S . (P x ∨ Qx)).
## 11.2 Take Γ ≡ A : ∗, B : ∗, C : ∗. For D3 see Figure 11.3. Extend the
derivations given in Exercise 9.9 in order to prove:
(a) ∅; Γ  (A → B → C) → C : ∗,
(b) D3 ; A : ∗, B : ∗  ∧(A,B) : ∗.
11.3 Let Γ ≡ S : ∗, P : S → ∗ and D4 ≡ Γ  ∀(S,P) := Πx : S . P x : ∗.
Give a full derivation in λD0 of D4 ; Γ  ∀(S,P) : ∗.
## 11.4 Describe the ‘states’ (see Section 11.3) corresponding to the derivation
given in Figure 11.4.
## 11.5 Let D1 ≡ ∅  N := ⊥ ⊥ : ∗ and D2 ≡ ∅  s := ⊥ ⊥ : N → N (cf. Exam-
ple 10.2.2).
(a) Prove that D1 is a legal environment in λD.
(b) Derive D1,D2 ; ∅  s : N → N in λD.
## 11.6 Let D and D be the deﬁnitions in λD-format of ¬ and ∨ as given in
this chapter. Assume that we already have a derivation showing that
D,D ; ∅  ∗ : .
(a) Give a full derivation in λD of the judgement
D,D ; ∅  Πα : ∗. ∨ (α,¬(α)) : ∗.
(b) Prove that the deﬁnition of iET (see Example 10.2.2) may be ap-
pended to D,D; i.e. the resulting environment is legal, again.
## 11.7 Write the proof objects in the λD-derivation of Figure 11.14 in natural
deduction style (cf. Section 11.5).Exercises 255
## 11.8 Write the derivation of (¬A ⇒ B) ⇒ (A ∨ B), as given in Figure 11.18,
in natural deduction style.
## 11.9 Redo the following exercises of Chapter 7 in the λD-style of Section 11.6,
hence with ﬂags. You may use a mixture of the natural deduction style and
the type-theoretic style, and you may apply the parameter list convention
(Notation 11.7.1).
(a) Exercise 7.6(b),
(b) Exercise 7.8(b),
(c) Exercise 7.12(b).
## 11.10 Give a λD-derivation in classical logic, in the style as employed from
Section 11.6 onwards, of the following tautology:
((A ⇒ B) ⇒ A) ⇒ A.
(Hint: see Remark 11.8.1 and Exercise 7.1(b).)
11.11 As the previous exercise (note: Exercises 7.1(a) and 7.1(b) and the
alternative rules for ∨ may be helpful):
(a) (A ⇒ B) ∨ A,
(b) (A ⇒ B) ∨ ¬B.
## 11.12 Give λD-derivations of the following tautologies:
(a) In constructive logic: (A ⇔ B) ⇒ (¬A ⇔ ¬B),
(b) In classical logic: (A ⇔ B) ⇒ ((A ∧ B) ∨ (¬A ∧ ¬B)),
(c) ¬(A ∨ B) ⇔ (¬A ∧ ¬B). (Can this be done constructively?)
11.13 Give λD0-derivations (so using constructive logic only) of the following
lemmas:
(a) ET implies DN (see also Section 7.4),
(b) DN implies ET.
11.14 Let S and T be sets and R a predicate on S×T, coded R : S → T → ∗p.
Give a λD-derivation of the following tautology of constructive logic:
¬∃x∈S∃y∈T (R(x,y)) ⇒ ∀x∈S∀y∈T (¬R(x,y)).
## 11.15 Let S be a set and P a predicate on S. Give λD-derivations for the
following tautologies of classical logic; you may use the alternative rules
given in Figure 11.28:
(a) ∃x∈S(¬P(x)) ⇒ ¬∀x∈S(P(x)),
(b) ∀x∈S(¬P(x)) ⇒ ¬∃x∈S(P(x)).
## 11.16 As the previous exercise:
∀x∈S(P(x)) ⇔ ¬∃x∈S(¬P(x)).
## 11.17 As Exercise 11.15:
∀x∈S[¬∃y∈S(P(y)) ⇒ ∃z∈S(¬P(z))].256 Flag-style natural deduction in λD
## 11.18 Let S and T be sets, P and Q predicates on S, and R a predicate on
S × T. Give λD-derivations of the following tautologies:
(a) ∃x∈S(P(x) ∨ Q(x)) ⇒ (∃x∈S(P(x)) ∨ ∃x∈S(Q(x))),
(b) ∃x∈S∀y∈T (R(x,y)) ⇒ ∀y∈T ∃x∈S(R(x,y)).12
Mathematics in λD: a ﬁrst attempt
## 12.1 An example to start with
Logic, a fundamental part of many sciences, can be fruitfully expressed and
used in an appropriate type-theory-with-deﬁnitions such as λD. We have dem-
onstrated this extensively in Chapter 11. Our conclusion is that a ﬂag-style
approach, which is still fully formal, is very similar to the common informal
style of deduction which is standard for reasoning in both logic and mathemat-
ics. The type theory λD can be fruitfully exploited for expressing the logical
system of natural deduction in a feasible and practical manner.
In the present chapter, we turn to mathematics. The deductive framework
of logic is essential for doing mathematics, since it embodies the principles of
reasoning, but mathematics itself is much more than logic (or reasoning) alone.
In order to explore these matters, we start with some illustrative examples,
showing the possibilities and the problems connected with doing mathematics
in type theory. Our purpose is to investigate whether (or rather: to show how)
λD ‘works’ in mathematical practice.
It will turn out that a formal translation of a mathematical text into the
λD-format may demand more eﬀort than expected. This is due, of course, to
the very precise nature of the ‘formal language’ λD, requiring all aspects to
be spelled out, sometimes even to an annoying degree of detail; although the
ﬂag style alleviates the burden to some extent.
For the time being, we accept these inconveniences as inevitable – in the
hope that the gains of ultimate precision will prove to be greater than the
losses. We come back to this subject in the course of the following chapters.
We begin with a simple example about partially ordered sets, namely the
proof that there can be at most one minimum in such a set. This proof, based
on the corresponding deﬁnition, is straightforward; see below.
We recall that a relation R on a set S is a partial order if it is reﬂexive,258 Mathematics in λD: a ﬁrst attempt
antisymmetric and transitive; see Section 8.5 for the mathematical deﬁnitions
of these notions.
Deﬁnition 12.1.1 Let S be a set and ≤ a binary relation on S.
Then m ∈ S is a least element of S with respect to ≤ if ∀n∈S(m ≤ n).
Lemma 12.1.2 Let S be a set, partially ordered by ≤. Assume that
S has a least element with respect to ≤. Then this least element is
unique.
Proof Assume that m1 and m2 are elements of S and that both are
least elements. Then ∀n∈S(m1 ≤ n) and ∀n∈S(m2 ≤ n). In partic-
ular, m1 ≤ m2 and m2 ≤ m1. Hence, m1 = m2, by antisymmetry
of ≤. It follows that, if S has a least element, then this element is
unique.
Let’s formalise this proof in λD. We use the ﬂag format (see Section 11.2).
The ﬁrst attempt is represented in Figure 12.1, in which we combine the
ﬂags of m1 and m2 (see Notation 11.5.1). In the ﬂags of u and v we express the
assumption that both m1 and m2 are least elements. (See also Remark 12.6.1.)
S : ∗s
m1,m2 : S
u : ∀n : S . (m1 ≤ n)
v : ∀n : S . (m2 ≤ n)
(1) a1(S,m1,m2,u,v) := t1 : m1 ≤ m2
(2) a2(S,m1,m2,u,v) := t2 : m2 ≤ m1
(3) a3(S,m1,m2,u,v) := t3 : m1 = m2
w : S has a least element
(4) a4(S,w) := t4 : the least element is unique
Figure 12.1 A ﬁrst attempt of proving Lemma 12.1.2 in λD
Browsing through this derivation-like ﬁgure, we note several problems. Some
of them can be solved in a straightforward manner:
− The symbol ‘≤’ stands for an arbitrary relation on S, being a partial order.
These implicit assumptions will be made explicit in Section 12.4.
− The ∀-quantiﬁer is not ‘basic’ in λD, but in Section 5.4 we proposed to code
∀ as Π.
− This also solves the question of what to take for the unknown terms t1 and
t2 in lines (1) and (2): these must be instances of the ∀-elimination rule (see
Figure 11.22).12.2 Equality 259
So we may take
t1 ≡ ∀-el(S,λx : S . m1 ≤ x,u,m2) and
t2 ≡ ∀-el(S,λy : S . m2 ≤ y,v,m1),
or simply t1 ≡ um2 and t2 ≡ v m1.
The remaining problems appear to be more serious. The questions are:
Q1 The symbol ‘=’ in line (3) denotes the basic equality relation, which is
fundamental in all areas of mathematics, but is not yet a part of our
system. How can this be remedied?
Q2 What has to be taken for t3?
Q3 How to express that S has a least element, as required in the last ﬂag?
Q4 What about its uniqueness?
Q5 And how to prove it, i.e. what is the proof object t4?
## 12.2 Equality
We start with equality (Q1). (Question Q2 will be answered in Section 12.4,
questions Q3 to Q5 in Section 12.6.) An easy way out is to suppose that the
notion ‘equality’ belongs to what we call foreknowledge. But this attitude does
not solve our question, because we have to know the formal rules for dealing
with equality.
Equality obviously is a relation between two arguments: for each pair of
elements x and y, we have a proposition (namely that x = y). But since
we work with a system in type theory, each element should have a type; so
suppose that S is the type of both x and y. Then we can see equality as a
binary predicate on S. We write x =S y for the equality of x and y in S.
So, equality is a parameterised binary relation: for every type S we have
an equality relation =S : S → S → ∗, which is a binary relation on terms of
type S. We may have equality in N, equality in Z, and so on.
Now the core question is: what does it mean that elements x and y of S
are ‘equal’? A fertile philosophical answer, due to the German mathematician
G.W. Leibniz (1646–1716), is that two objects are equal if they are indis-
cernible in all conceivable circumstances. This indiscernibility of x and y can
be expressed more concisely as follows: ‘For any predicate P on S, the validity
of P x is equivalent to the validity of P y ’; that is, for given P either both P x
and P y hold, or neither of them holds. If this is the case, then there is no
possibility to discriminate between x and y. Hence, they are equal.
Now one could decide to take this equality as a primitive relation. In that
case we consider it as a ‘law’ or axiom, which is then usually called Leibniz’s
law. But the nice thing is that Leibniz’s view on equality can be formalised260 Mathematics in λD: a ﬁrst attempt
as a descriptive deﬁnition in λD, so that we do not need an axiom. We take
the Π for expressing the generalisation over all predicates, and formally deﬁne
eq(S,x,y), expressing the equality of x and y (for x,y : S), as
ΠP : S → ∗p . (P x ⇔ P y).
See Figure 12.2, line (1).
Remark 12.2.1 Even a simpler deﬁnition would do, namely:
ΠP : S → ∗p . (P x ⇒ P y),
with ⇒ instead of ⇔. See Exercise 12.2.
We also use Figure 12.2 to show that this deﬁned equality is a reﬂexive
relation, as expected (see line (3)). We use the name eq-reﬂ(S,x) for the proof
of reﬂexivity (hence not for the property itself).
S : ∗s
x : S
y : S
(1) eq(S,x,y) := ΠP : S → ∗p . (P x ⇔ P y) : ∗p
P : S → ∗p
(2) a2(S,x,P) := ...?... : P x ⇔ P x
(3) eq-reﬂ(S,x) := λP : S → ∗p . a2(S,x,P) : eq(S,x,x)
Figure 12.2 Deﬁnition of equality, and the reﬂexivity property for equality
Remark 12.2.2 We obtain a second order deﬁnition of equality, since the Π
ranges over predicates P, and P : S→∗ : . Hence, the Π in the formula is
a second order ∀-quantiﬁer. This cannot be covered by the ﬁrst order ∀-symbol
dealt with in Sections 5.4, part V, and 7.5. See also Remark 11.10.1.
There is one hole in the derivation: the proof object of line (2) is still open.
We need a proof of P x ⇔ P x. There are two obvious strategies to ﬁll the hole:
(1) The ad-hoc approach: immediately ﬁnd an inhabitant of P x ⇔ P x. This
is not hard: we may take the expression
⇔-in(P x,P x,λu : P x. u,λu : P x. u),
which is appropriate since λu : P x. u is an inhabitant of both P x ⇒ P x and
P x ⇐ P x.
(2) The general approach: ﬁrst prove a lemma to the eﬀect that A ⇔ A holds
for arbitrary A of type ∗p, give its proof a name (say ⇔-reﬂ(A)), and then ﬁll
the hole with the instantiated expression ⇔-reﬂ(P x).
The formalisation of such a lemma and its proof is easy; we leave it to the12.2 Equality 261
reader. Both strategies solve the problem. We suppose that one of these has
been chosen in line (2) of Figure 12.2.
Since formal equality plays such an important role in mathematics, we in-
troduce a notation convention in our λD-text, for a smoother representation
(see Figure 12.3, which replaces Figure 12.2). Denoting eq(S,x,y) as x =S y,
being more reader-friendly, we employ the usual symbol ‘=’, subscripted with
the set in which the equality is taken; moreover, we use inﬁx notation (see also
Notation 11.5.2).
S : ∗s
x : S
y : S
(1) eq(S,x,y) := ΠP : S → ∗p . (P x ⇔ P y) : ∗p
Notation : x =S y for eq(S,x,y)
. . .
(3) eq-reﬂ(S,x) := λP : S → ∗p . a2(S,x,P) : x =S x
Figure 12.3 A notation convention for equality, and its use
It is not hard to also prove symmetry and transitivity for this equality, by
proving x =S y ⇒ y =S x, and (x =S y ∧ y =S z) ⇒ x =S z, in appropriate
contexts.
These proofs may be based on the corresponding properties for biimplication:
− (symmetry) if A ⇔ B, then B ⇔ A, and
− (transitivity) if A ⇔ B and B ⇔ C, then A ⇔ C.
We leave the corresponding proofs to the reader.
A simple consequence of the deﬁnition of equality is that it satisﬁes substi-
tutivity. This notion can be expressed as follows:
‘One always may substitute equals for equals’,
or, more formally:
‘For all predicates P on S, if x =S y and P holds for x, then P also holds
for y’.
This implies the following: if an expression t1 occurs in any proposition, and
we know that t1 =S t2, then one may replace t1 by t2 without inﬂuencing the
truth value. (This explains the name ‘substitutivity’.)
We formalise substitutivity in Figure 12.4.262 Mathematics in λD: a ﬁrst attempt
S : ∗s
P : S → ∗p
x,y : S
u : x =S y
(1) a1(S,P,x,y,u) := uP : P x ⇔ P y
(2) a2(S,P,x,y,u) := ⇔-el1(P x,P y,a1(S,P,x,y,u)) : P x ⇒ P y
v : P x
(3) eq-subs(S,P,x,y,u,v) := a2(S,P,x,y,u) v : P y
Figure 12.4 Substitutivity as property of equality
## 12.3 The congruence property of equality
There are several properties of equality that can be derived from the deﬁnitions
in the previous section. One of them is called the congruence property. It has
some similarities with substitutivity, but congruence concerns ordinary func-
tions (with a set as co-domain), and not predicates (which are functions with
a proposition as co-domain). But again, the idea is to allow the substitution of
a t1 by a t2 that is equal to t1.
This congruence property can be phrased as follows:
‘For all functions f : S → T and x,y : S, if x =S y, then fx =T fy.’
One says in this case: ‘equality is a congruence for function application’.
Again, this is a property we obviously should have. A promising attempt is to
try substitutivity (see Figure 12.4): use x =S y to derive the result fx =T fy.
Therefore we must ﬁnd an appropriate predicate.
One possibility is to unfold the goal fx =T fy. This gives:
ΠQ : T → ∗p . (Q(f x) ⇔ Q(f y)).
Hence, we raise a ﬂag Q : T → ∗p and try to prove Q(f x) ⇔ Q(f y). This
is easy now: substitutivity (using x =S y) on the predicate λz : S . Q(f z)
transforms a proof of Q(f x) into one of Q(f y) (see line (1) in Figure 12.5).
The ﬁnal part of this derivation serves to dismiss the last two ﬂags, one with
⇒-in and one with the (abst)-rule. Note that we cannot take ∀-in instead of
the λ-expression in line (3), since the Π in the unfolding of f x =T f y is second
order (cf. Remark 12.2.2). Line (4) is a consequence of the (conv)-rule.
We can also derive the congruence property directly from substitutivity by
making a smart choice for the predicate involved in substitutivity. This leads
to a second proof of congruence.12.3 The congruence property of equality 263
S,T : ∗s
f : S → T
x,y : S
u : x =S y
Q : T → ∗p
v : Q(f x)
(1) a†
1 := eq-subs(S,λz : S . Q(f z),x,y,u,v) : Q(f y)
(2) a2 := λv : Q(f x). a1 : Q(f x) ⇒ Q(f y)
(3) a3 := λQ : T → ∗p . a2 : ΠQ : T → ∗p . (Q(f x) ⇒ Q(f y))
(4) eq-cong1(S,T,f,x,y,u) := a3 : f x =T f y
†
parameters suppressed
Figure 12.5 First proof of the congruence property for equality
This time we take predicate Q1, with the following description:
Q1 ≡ λz : S . (f x =T f z),
where Q1 obviously depends on S, T, f and x. Note that x is a ‘free’ variable
in this expression, whereas variable z is bound by the λ; so Q1 is a predicate
‘about’ a z of type S.
Now Q1 x is convertible to f x =T f x, which is valid by reﬂexivity; and Q1 y
is convertible to f x =T f y, the desired equality in the congruence property.
Substitutivity gives that x =S y and Q1 x imply Q1 y. Hence, substitutivity
gives (again) the result desired (see Figure 12.6).
S,T : ∗s
f : S → T
x : S
(1) Q1(S,T,f,x) := λz : S . (f x =T f z) : S → ∗p
y : S
u : x =S y
(2) eq-cong2(S,T,f,x,y,u) :=
eq-subs(S,Q1(S,T,f,x),x,y,u,eq-reﬂ(T,f x)) : f x =T f y
Figure 12.6 Second proof of the congruence property for equality264 Mathematics in λD: a ﬁrst attempt
So we have a formally deﬁned equality, together with three important prop-
erties: reﬂexivity, substitutivity and the congruence property.
In the previous section we have already mentioned ‘symmetry’ and ‘tran-
sitivity’, two other properties that are very fundamental for equality. In Sec-
tion 12.5 we deal with these. But ﬁrst we note that (variants of) symmetry
and transitivity are important in a more general setting, namely with respect
to orders. This is the subject of the following section.
## 12.4 Orders
Now that we know how to code ‘equality’, we need to say more about the
other relation playing a role in the proof of Lemma 12.1.2, namely the ordering
relation denoted ‘≤’. First, ≤ must have a type. For this we take S → S → ∗p,
so the relation between x and y is represented by the twofold application ≤ x y.
We start with a formalisation of this notion ‘partial order’ (see Figure 12.7).
In line (5) is expressed what a partial order means, i.e. what it is as a type
(namely, an antisymmetric preorder).
Remark 12.4.1 We are fairly liberal in employing notation conventions (see
also Chapter 11 and Figure 12.3). For example, we shall take identical binding
symbols (such as quantiﬁers) ‘together’, as is usual in the mathematical nota-
tion: we write ∀x,y : S . P x instead of ∀x : S . ∀y : S . P x. Similarly, we write
λx,y : S . ... for λx : S . λy : S . .... See e.g. Figure 12.9, line (9).
Earlier (Figure 12.3), we introduced x =S y for eq(S,x,y). We now allow a
similar inﬁx notation x ≤S y (see Figure 12.7) for a very diﬀerent syntactical
structure: the twofold application ≤ x y (which is (≤ x)y) on elements x and
y of a set S. The symbol S is not part of the original expression ≤ x y.
S : ∗s
≤ : S → S → ∗p
Notation : x ≤S y for ≤ xy (on S)
(1) reﬂ(S,≤) := ∀x : S . (x ≤S x) : ∗p
(2) trans(S,≤) :=
∀x : S . ∀y : S . ∀z : S . (x ≤S y ⇒ y ≤S z ⇒ x ≤S z) : ∗p
(3) pre-ord(S,≤) := reﬂ(S,≤) ∧ trans(S,≤) : ∗p
(4) antisymm(S,≤) := ∀x : S . ∀y : S . (x ≤S y ⇒ y ≤S x ⇒ x =S y) : ∗p
(5) part-ord(S,≤) := pre-ord(S,≤) ∧ antisymm(S,≤) : ∗p
Figure 12.7 Deﬁnitions regarding partial orders12.4 Orders 265
We now try to formalise the proof attempt of Figure 12.1. The ﬁnal part of
the proof, expressed in line (4) of that ﬁgure, will be dealt with in Section 12.6,
in which we explain how to formalise ‘uniqueness’.
First we give a skeleton proof , which only contains the necessary ﬂags and
the types (see Figure 12.8). The proof skeleton expresses the basic ideas and the
course of the derivation being expressed in the informal proof of Lemma 12.1.2
(but for the last sentence).
(a) S : ∗s
(b) ≤ : S → S → ∗p
(c) r : part-ord(S,≤)
(d) m1,m2 : S
(e) u : ∀n : S . (m1 ≤S n) | v : ∀n : S . (m2 ≤S n)
(1) ... : m1 ≤S m2
(2) ... : m2 ≤S m1
(3) ... : pre-ord(S,≤) ∧ antisymm(S,≤)
(4) ... : antisymm(S,≤)
(5) ... : ∀x : S . ∀y : S . (x ≤S y ⇒ y ≤S x ⇒ x=S y)
(6) ... : m1 ≤S m2 ⇒ m2 ≤S m1 ⇒ m1 =S m2
(7) ... : m2 ≤S m1 ⇒ m1 =S m2
(8) ... : m1 =S m2
(9) ... : ∀m1,m2 : S . ((∀n : S . (m1 ≤S n)) ⇒ (∀n : S . (m2 ≤S n)) ⇒
(m1 =S m2))
Figure 12.8 A skeleton proof for the ﬁrst part of Lemma 12.1.2
The proof is a consequence of antisymmetry (line(4), elaborated in line (5)),
combined with lines (1) and (2). This is the leading idea in the incomplete
derivation of Figure 12.8.
We invite the reader to compare the given skeleton proof with the informal
proof in Section 12.1, and with lines (1) to (3) of the proof attempt given
in Figure 12.1. (In ﬂags (d) and (e) we combine ﬂags, as proposed in Nota-
tion 11.5.1.)
In Figure 12.9 we have ﬁlled in all proof objects in the skeleton proof, and
given them names. For the sake of clarity, we underline the types, so that this
derivation can be easily compared with the proof skeleton in Figure 12.8.
The problem in this part of the derivation is question Q2 of Section 12.1:266 Mathematics in λD: a ﬁrst attempt
to ﬁnd t3, which is a proof (in the form of an inhabitant) of m1 =S m2. The
solution is the proof object in line (8).
(a) S : ∗s
(b) ≤ : S → S → ∗p
(c) r : part-ord(S,≤)
(d) m1,m2 : S
(e) u : ∀n : S . (m1 ≤S n) | v : ∀n : S . (m2 ≤S n)
(1) a†
1 := um2 : m1 ≤S m2
(2) a2 := v m1 : m2 ≤S m1
(3) a3 := r : pre-ord(S,≤) ∧ antisymm(S,≤)
(4) a4 := ∧-el2(pre-ord(S,≤), antisymm(S,≤), a3) :
antisymm(S,≤)
(5) a5 := a4 : ∀x : S . ∀y : S . (x ≤S y ⇒ y ≤S x ⇒ x=S y)
(6) a6 := a5 m1 m2 : m1 ≤S m2 ⇒ m2 ≤S m1 ⇒ m1 =S m2
(7) a7 := a6 a1 : m2 ≤S m1 ⇒ m1 =S m2
(8) a8 := a7 a2 : m1 =S m2
(9) a9(S,≤,r) := λm1,m2 : S . λu : ... . λv : ... . a8 :
∀m1,m2 : S . ((∀n : S . (m1 ≤S n)) ⇒ (∀n : S . (m2 ≤S n)) ⇒
m1 =S m2)
†
parameters suppressed
Figure 12.9 A formal proof of the ﬁrst part of Lemma 12.1.2 in λD
We give little comment on Figure 12.9, since most of it will speak for itself:
− We suppress parameters, following Notation 11.7.1.
− We use the type-theoretic style whenever we ﬁnd this convenient.
− Lines (3) and (5) are only meant to help the reader: we repeat earlier state-
ments (given in ﬂag (c) and line (4), respectively), but with an unfolded
type. This is permitted by the (conv)-rule.
12.5 A proof about orders
In Figures 12.2 and 12.4, we have formally introduced the properties reﬂexivity
and substitutivity for equality. Proofs of the properties symmetry and transi-
tivity are suggested in Section 12.2, but not spelled out. In the present section
we show an alternative manner to obtain these results, since both properties12.5 A proof about orders 267
can be derived from the ﬁrst two. We do not claim that the methods presented
here are either shorter or easier than the proofs suggested in Section 12.2 –
on the contrary. Our endeavours appear, however, to be a useful exercise with
substitutivity.
We ﬁrst show that symmetry follows from reﬂexivity and substitutivity: see
Figure 12.10 (at the end of this section we do the same for transitivity).
The idea behind the proof is the following. Assume x =S y. Then we have
to prove that also y =S x. Now ﬁrst recall that reﬂexivity gives: x =S x.
Secondly, focus on the ﬁrst x of this equality, which we underline for the sake
of clarity: x =S x. Then apply substitutivity: since x =S y, we may replace x
by y, thus obtaining y =S x. So we are done.
Formally: consider the predicate Q2(S,x) := λz : S . (z =S x), for which
we have that (Q2(S,x))x →β (x =S x) and (Q2(S,x))y →β (y =S x); the
deﬁnition of eq-subs in Figure 12.4, with Q2(S,x) substituted for P, then does
the job.
S : ∗s
x : S
(1) Q2(S,x) := λz : S . (z =S x) : S → ∗p
(2) a2(S,x) := eq-reﬂ(S,x) : x =S x
y : S
u : x =S y
(3) eq-sym(S,x,y,u) :=
eq-subs(S, Q2(S,x),x,y,u, a2(S,x)) :
y =S x
(4) a4(S) := λx,y : S . λu : (x =S y). eq-sym(S,x,y,u) :
∀x,y : S . (x =S y ⇒ y =S x)
Figure 12.10 Symmetry of equality follows from reﬂexivity and substitutivity
In line (4) of Figure 12.10, we give a λ-term as inhabitant, which is shorter
than what we would obtain with the (more natural) logical introduction rules
for ⇒ and ∀.
The deﬁnitions in lines (1) and (2) are inserted to make the proof more
comprehensible for a human reader: the formal proof now narrowly follows the
informal explanation given above. There is no objection against condensing
the essence of the proof into one proof term, by the unfolding of the constants
Q2 and a2 in line (3). This permits us to omit lines (1) and (2). The result is
depicted in Figure 12.11.268 Mathematics in λD: a ﬁrst attempt
S : ∗s | x,y : S | u : x =S y
eq-sym
(S,x,y,u) :=
eq-subs(S, λz : S . (z =S x),x,y,u, eq-reﬂ(S,x)) : y =S x
Figure 12.11 A shorter version of the core of the derivation of Figure 12.10
We conclude this section with the promised derivation of transitivity of equal-
ity, using similar methods as in the above derivation of symmetry.
We give an alternative to the proof suggested in Section 12.2 (see Fig-
ure 12.12). The important thing is, again, to devise an appropriate predi-
cate Q. It turns out that Q3(S,x) := λw : S . (x =S w) does the job together
with Substitutivity, since (Q3(S,x))y converts to x =S y and (Q3(S,x))z to
x =S z. Hence, the essence of the proof is the following: given that x =S y
(i.e. (Q3(S,x))y), then if also y =S z we may substitute z for y in x =S y, to
obtain x =S z (i.e. (Q3(S,x))z).
We leave it to the reader to check the details (Exercise 12.3(a)).
S : ∗s
x : S
(1) Q3(S,x) := λw : S . (x =S w) : S → ∗p
y,z : S
u : x =S y
v : y =S z
(2) eq-trans(S,x,y,z,u,v) :=
eq-subs(S, Q3(S,x),y,z,v,u) : x =S z
(3) a3(S) := λx,y,z : S .λu : (x =S y).λv : (y =S z).eq-trans(S,x,y,z,u,v) :
∀x,y,z : S . (x =S y ⇒ y =S z ⇒ x =S z)
Figure 12.12 Transitivity of equality follows from substitutivity
## 12.6 Unique existence
We have succeeded (see Figure 12.9) in translating the main part of the proof
of Lemma 12.1.2, but the ﬁnal statement of the proof, the lemma itself, and the
related Deﬁnition 12.1.1, have not yet been transferred to λD. In this section
we investigate how this can be done.12.6 Unique existence 269
The ﬁrst thing that we consider is a formal description of the property ‘being-
a-least-element’, which is the subject of Deﬁnition 12.1.1. See Figure 12.13.
(For a ‘least element’ it is not necessary that the relation is a partial order.)
(a) S : ∗s | ≤ : S → S → ∗p | m : S
(1) Least(S,≤,m) := ∀n : S . (m ≤ n) : ∗p
Figure 12.13 A formal version of Deﬁnition 12.1.1
We use the name Least, with a capital ‘L’, because m is intended to be a
least element of the type S. Later, we use ‘least’ to denote a least element of a
subset of S (see Figure 15.1).
So now we can express ‘m is a least element of S with respect to relation ≤’.
Remark 12.6.1 This deﬁnition also enables us to rephrase the ﬂags in (e)
of Figure 12.9 as u : Least(S,≤,m1) and v : Least(S,≤,m2), thus bringing
our formal proof and the informal one of Section 12.1 closer together.
We have not yet formally expressed that such an m is unique when ≤ is
a partial order, which is the conclusion of Lemma 12.1.2. How about this
uniqueness of existence? Let’s investigate the various modes of existence:
− To begin with, we already have the property existence as such, expressible
by means of the quantiﬁer ∃. (See Section 7.5 for its λC-version and Fig-
ure 11.23, line (1), for its deﬁnition in λD.)
− Obviously, ∃x∈S(P(x)) means ‘there exists at least one x in S satisfying P’.
Hence, we sometimes write ∃≥1 instead of just ∃.
− A counterpart of ∃≥1 is ‘there exists at most one’, which we express as ∃≤1.
So ∃≤1
x∈S(P(x)) means that there either are no x’s in S satisfying P, or just
one. A common way of establishing ‘at most one’ is by proving that ‘two is
impossible’ (and hence also three, four, ... are impossible). In formal form:
∀y,z : S . (P(y) ⇒ P(z) ⇒ y =S z);
or, in words: if we observe ‘two’ elements of S satisfying P, then they are
necessarily equal.
− It is now easy to express ‘exactly one’, as the conjunction of ‘at most one’
and ‘at least one’.
It is clear how to formalise all this in λD; see Figure 12.14.
Notation 12.6.2 In Figure 11.23 we agreed to allow the common notation
∃x : S . P x as an alternative notation for ∃(S,P).
Similarly, we allow ∃≤1x : S . P x as alternative notation for ∃≤1(S,P), and
also ∃1x : S . P x for ∃1(S,P).270 Mathematics in λD: a ﬁrst attempt
S : ∗s
P : S → ∗p
(1) ∃(S,P) := ΠA : ∗p . ((∀x : S . (P x ⇒ A)) ⇒ A) : ∗p
(2) ∃≥1
(S,P) := ∃(S,P) : ∗p
(3) ∃≤1
(S,P) := ∀y,z : S . (P y ⇒ P z ⇒ (y =S z)) : ∗p
(4) ∃1
(S,P) := ∃≥1
(S,P) ∧ ∃≤1
(S,P) : ∗p
Figure 12.14 Various existential quantiﬁers
With respect to the proof in Figure 12.9, we observe that the type in line (9)
of that ﬁgure, viz.
∀m1,m2 : S . ((∀n : S . (m1 ≤S n)) ⇒ (∀n : S . (m2 ≤S n)) ⇒ m1 =S m2),
corresponds to ∀y,z : S . (P y ⇒ P z ⇒ (y =S z)), if P is the ‘least-element-
predicate’:
λm : S . Least(S,≤,m).
Hence, a9(S,≤,r) of Figure 12.9 is by line (3) of Figure 12.14 and the (conv)-
rule also an inhabitant of ∃≤1x : S . Least(S,≤,x).
So all we need now is the assumption that there is a least element of S
(i.e. ∃≥1x : S . Least(S,≤,x)), to be able to conclude that there is exactly one
least element (∃1x : S . Least(S,≤,x)). This observation corresponds precisely
to the last sentence of the informal proof in Section 12.1.
Hence, we now can express the full Lemma 12.1.2 and its proof in a formal
λD-version (see Figure 12.15, which is an extension of Figure 12.9).
. . .
(10) a10 := a9[Fig. 12.9] : ∃≤1
x : S . Least(S,≤,x)
(d) w : ∃≥1
x : S . Least(S,≤,x)
(11) a11(S,≤,r,w) := ∧-in(∃≥1
...,∃≤1
...,w,a10) :
∃1
x : S . Least(S,≤,x)
Figure 12.15 A completed formal version of Lemma 12.1.2 and its proof
So a11(S,≤,r,w) in Figure 12.15 (or the connected deﬁniens, which has the
same meaning), together with context (a)–(d) of Figure 12.9, is a represen-
tation of the full proof of that lemma. The lemma itself is represented by the
type of line (11) in Figure 12.15, since this line may be read as:
‘In context (a)–(d), a11(S,≤,r,w) inhabits ∃1x : S . Least(S,≤,x).’12.7 The descriptor ι 271
We have here a good example of the following general observation about
formal theorems and formal proofs in λD, which corresponds to the PAT-
interpretation (see Section 5.4):
Theorems and proofs
Let the following judgements be both derivable in λD:
Γ  a(x) := N : ∗p and
Γ  b(x) := M : N.
Then, in context Γ:
a(x) (or N) represents a theorem and
b(x) (or M) represents a proof of that theorem.
(Remember that a lemma is formally the same as a theorem; the diﬀerence
is that a lemma is considered to be less important, or only a stepping stone to
a theorem.)
Remark 12.6.3 In the present chapter we have done a lot of work to achieve
a relatively small result: one deﬁnition, one lemma and one proof have been
formalised. This may be disappointing to a newcomer in the area of formal
proving.
Note, however, that our take-oﬀ in Section 12.1 was a bit naive. We started
boldly with an example that was simple, but not standing on its own. Hence,
we had to account for several basic notions that had no formal representation
yet: equality was one of these notions, the partial order relation ≤ another one.
Many basic properties of equalities had to be expressed in formal form, which
took some time.
The necessity to deliver every ‘dirty detail’ is sometimes not very pleasant,
but inevitable for a justiﬁed formalisation. Some of these annoyances can be
avoided, e.g. by choosing a more deliberate build-up of the mathematical ediﬁce.
For the time being, we are happy with the progress we make.
## 12.7 The descriptor ι
In the previous section we saw how to express that m is a least element with
respect to relation ≤ on set S: that is the case if we have an inhabitant of
Least (S,≤,m). We proved, informally and formally, that such an m (if it
exists) is unique when ≤ is a partial order on S. In the traditional mathematical272 Mathematics in λD: a ﬁrst attempt
setting, this implies that we can identify such a least element with a name: it
is usual to talk about the minimum of S with respect to ≤, or to reserve a
special notation for it, e.g. Min(S) (or rather: Min(S,≤)).
Note that, as long as the uniqueness hasn’t been proved, we only may speak
of a minimum (which is the same as a least element); whereas uniqueness only
allows us to call it the minimum.
In some ﬁelds of mathematics, the descriptor ι (pronounced ‘ióta’ and ﬁrst
proposed by F.L.G. Frege, who lived 1848–1925) is used for naming (‘describ-
ing’) such a uniquely existing element: ιx∈S(P(x)) then represents the (unique)
element x of S that has property P(x).
So in this notation, we have that the minimum of set S with respect to
relation ≤ is ιm∈S(Least(S,≤,m)).
In λD, we can easily add the ι-operator as a primitive constant. This constant
depends on a set S, a predicate P, and a proof u that there exists exactly one
element in S that satisﬁes predicate P. In Figure 12.16, we call it ι(S,P,u)
(that is: the element of S for which P holds, being unique because of u).
A characteristic property of ι(S,P,u) is that it satisﬁes predicate P. To
express this, we must also add a primitive inhabitant of P(ι(S,P,u)), being a
(primitive) proof of this property.
In Figure 12.16 we propose an alternative notation ιu
x:S(P x) that is quite
similar to the usual one: ιx∈S(P(x)), the main diﬀerence being that the obliga-
tory proof u for the unique existence of such an x is added as a superscript. In
line (2), we give the name ι-prop(S,P,u) to the primitively assumed inhabitant
of the proposition that P holds for the element described by means of the iota.
S : ∗s
P : S → ∗p
u : (∃1
x : S . P x)
(1) ι(S,P,u) := ⊥ ⊥ : S
Notation : ιu
x:S(P x) for ι(S,P,u)
(2) ι-prop(S,P,u) := ⊥ ⊥ : P (ιu
x:S(P x))
Figure 12.16 The descriptor ι
As a general example of the use of this formal ι-operator, we prove the
following obvious (and useful) property: if there is exactly one element in S
satisfying P, then an element x of S for which P holds must necessarily be
equal to ιu
x:S(P x). This is expressed in the following lemma.12.7 The descriptor ι 273
Lemma 12.7.1 Let S be a set, P a predicate on S and assume
∃1
x∈S(P(x)). Then ∀z∈S(P(z) ⇒ (z =S ιx∈S(P(x)))).
The proof of Lemma 12.7.1 is given in Figure 12.17. The judgements in
lines (1) and (3) are ‘Notes for the reader’, as we have used earlier.
(a) S : ∗s | P : S → ∗p | u : (∃1
x : S . P x)
(1) a†
1 := u : (∃≥1
x : S . P x ∧ ∃≤1
x : S . P x)
(2) a2 := ∧-el2 (∃≥1
x : S . P x, ∃≤1
x : S . P x, u) : ∃≤1
x : S . P x
(3) a3 := a2 : ∀x,y : S . (P x ⇒ P y ⇒ (x =S y))
(b) z : S | v : P z
(4) a4 := a3 z (ιu
x:S(P x)) v ι-prop(S,P,u) : z =S ιu
x:S(P x)
(5) a5(S,P,u) := λz : S . λv : P z . a4 : ∀z : S . (P z ⇒ (z =S ιu
x:S(P x)))
†
parameters suppressed
Figure 12.17 Lemma 12.7.1 and its proof
The proof in Figure 12.17 is not hard to understand. The ﬁnal result stated
in line (5) is the combined derivation of the lemma (the type) and its proof
(the deﬁniens), both in context (a). This exempliﬁes the observation about
‘Theorems and proofs’ in the previous section.
Remark 12.7.2 Seemingly, ι(S,P,u) depends on the proof u of ∃1x : S . P x.
Now assume that we have two diﬀerent proofs u1 and u2 of this uniqueness.
Then it is imaginable that ι(S,P,u1) and ι(S,P,u2) are also diﬀerent; which
is clearly undesirable. We can easily prove, however, that this does not oc-
cur: both ι(S,P,u1) and ι(S,P,u2) satisfy predicate P, as a consequence of
ι-prop(S,P,u1) and ι-prop(S,P,u2), respectively. But since there is exactly
one element satisfying P (of which fact we even have two proofs!), we can de-
rive in λD that ι(S,P,u1) must be equal to ι(S,P,u2), using either of these
proofs.
One calls such a situation irrelevance of proof: ιu
x:S(P x) only depends on the
existence of proof u, not on its exact content. See also Section 14.13 for this
matter.
We are now able to deﬁne the (unique) minimum of a set S with respect to
the partial order ≤ on S, provided that there is a least element of S. See line (1)
in Figure 12.18. Since we use the ι, we need that ∃1m : S . Least(S,≤,m), which
is a consequence of assumption (b). We proved this in Figure 12.15.
We also take the opportunity to give a compact rephrasing of the original
example, Lemma 12.1.2 (and its proof), with the new minimum-operator. See274 Mathematics in λD: a ﬁrst attempt
line (2) of Figure 12.18. This lemma can be expressed in words as follows: ‘Let
≤ be a partial order on S; if S has a least element x, then x is the minimum
of S.’
(a) S : ∗s | ≤ : S → S → ∗p | r : part-ord(S,≤)
(b) w : ∃≥1
x : S . Least(S,≤,x)
(1) Min(S,≤,r,w) :=
ι(S,λm : S . Least(S,≤,m),a11 [Fig. 12.15](S,≤,r,w)) : S
(2) a2(S,≤,r,w) :=
a5[Fig. 12.17](S,λm : S . Least(S,≤,m), a11[Fig. 12.15](S,≤,r,w)) :
∀x : S . (Least(S,≤,x) ⇒ (x =S Min(S,≤,r,w)))
Figure 12.18 The minimum-operator, and a lemma with proof
## 12.8 Conclusions
In the present chapter we have given a ﬁrst introduction to the formalisation of
mathematics in λD. We selected an example from mathematics, dealing with
a deﬁnition, a lemma and a proof (all about the notion ‘least element’).
As could be expected, we immediately became confronted with a lack of
formalised foreknowledge about common notions in mathematics that play
a role in this example, such as equality and inequalities. Hence, we had to
introduce these notions.
With regard to equality, it appeared indispensable to also discuss notions
such as reﬂexivity, substitutivity and the congruence property. For the formal-
isation of more general relations, we have considered orders in general, together
with their characteristic properties: reﬂexivity, transitivity and antisymmetry.
As another example, we have given a λD-proof of the lemma that symmetry
of equality follows from reﬂexivity and substitutivity. We also gave a formal
proof that transitivity of equality follows from substitutivity.
As a demonstration of how these formal notions work in practice, we have
elaborated a complete formal proof of the original example, which turned out
well. In the course of the formalisation, we introduced a formal quantiﬁer for
unique existence, which enabled us to accurately express the contents of the
example lemma.
Next, reconsidering the original example, we have noticed that the unique
existence of an entity enables one to identify it. For example, the uniqueness
of a least element permits us to speak about the minimum. Since it is natural12.9 Further reading 275
to give a name to a uniquely existing entity, we have added the descriptor ι
as a primitive extension to our formal machinery. The unique element of set S
satisfying property P is denoted ι(S,P,u) (or ιu
x:S(P x)), where u codes a proof
of the uniqueness. We concluded the chapter with a few short demonstrations
of use and utility of the descriptor ι.
Altogether, our ﬁrst confrontation of λD with a part of mathematics has
led to convincing results. Hence, our investigations described in the present
chapter inspire conﬁdence that we are on the right path with our endeavours
to use λD as a well-designed backbone for the formalisation of mathematics.
In the following chapters we will be fortiﬁed in this opinion. But before
we start exploring this in a more systematic manner, in a build-up from the
ground, we consider the relation between sets and subsets. This is basic in
mathematics, but its formalisation seems to conﬂict with a fundamental prop-
erty of type theory, namely: decidability of typing. The following chapter is
devoted to an adequate formalisation of the set-notion.
## 12.9 Further reading
In the present chapter we see that some actual mathematics can be done in
λD, but that, in order to do that in a smooth way, we need to introduce a
notion of equality and a description operator, ι. The formal treatment of these
notions, roughly in the way we do in λD, goes back to A. Church (Church,
1940), where he introduces the simple theory of types and uses it to deﬁne a
system for higher order logic. The idea of descriptions – also called deﬁnite
descriptions – dates further back to 1905 (Russell, 1905). In Church’s system,
equality is also deﬁned as Leibniz-equality. A deﬁnite description operator is
introduced axiomatically by Church (1940), similar to our introduction of ι as
a primitive notion.
From a logical point of view, the deﬁnite description operator ι can be seen
as a convenient abbreviation mechanism: in case we can prove that there is a
unique x satisfying a certain property P, we give it a name and refer to it via
that name. This does not extend the power of the logic in terms of the formulas
that are provable: it is a conservative extension. This can be seen from the fact
that alternatively one can ‘reason under an ∃-elimination’: suppose one wants
to prove C, given a proof of ∃x : A. (P(x)). Now, one raises ﬂags x : A and
q : P(x) and tries to construct a proof of C. Upon success, one eliminates the
ﬂags and concludes C out of the scope of these ﬂags. With unique existence,
and by the use of the description operator, this becomes simpler, because one
can just refer to ‘the element a : A that satisﬁes P(a)’, without having to raise
these ﬂags. The uniqueness guarantees that every time we eliminate a proof of
∃x : A. (P(x)), we get the same element of type A that satisﬁes property P.276 Mathematics in λD: a ﬁrst attempt
The ι-operator is related to D. Hilbert’s ε-operator (Hilbert & Bernays,
1939), also called the choice operator, which gives an element εx(P(x)) that
satisﬁes P in case one can prove ∃x(P(x)). This is stronger than the description
operator, because it does not require uniqueness. However, the ε-operator is
usually only considered in relatively weak logical systems and then the aim
is to show that it can be eliminated. This is also one of the aims of Hilbert’s
Program, where the ε-terms are the ‘ideal elements’; the aim of Hilbert is
to show that these can be eliminated, thus showing that the extension with
ε-terms is a conservative extension. Hilbert & Bernays (1939) show this, for
example, for quantiﬁer-free predicate logic.
It should be noted that both the choice and the description operator are
much weaker than the Axiom of Choice (see van Dalen et al., 1978). This is a
crucial axiom in set theory that states that, if we have a collection of non-empty
sets Ai, indexed by i ∈ I, then there exists a choice function f that assigns to
every i ∈ I an element of Ai. The Axiom of Choice cannot be eliminated in
the way mentioned above and it is debated in the foundation of mathematics.
Exercises
## 12.1 Give a proof of the symmetry of equality in λD as suggested in Sec-
tion 12.2, by ﬁrst proving the symmetry property for biimplication.
12.2 Let S : ∗s, x,y : S  eq-alt(S,x,y) := ΠP : S → ∗p . (P x ⇒ P y) : ∗p
be a deﬁnition.
(a) Prove that eq-alt is a reﬂexive relation.
(b) Prove that eq-alt is a symmetric relation. (Hint: consider, given x : S
and y : S, the predicate λz : S . eq-alt(S,z,x).)
(c) Prove that eq-alt is a transitive relation.
(d) Check the substitutivity property for eq-alt. What can you conclude
about the predicate eq-alt?
12.3 (a) Check that line (3) of Figure 12.10 and line (2) of Figure 12.12 satisfy
the derivation rules of λD.
(b) The same question for lines (1) and (2) of Figure 12.18.
12.4 Let S be a set, partially ordered by ≤. For m,n ∈ S, deﬁne m < n as
m ≤ n ∧ (m = n).
(a) Formalise the deﬁnition of < in λD and introduce the notation x <S y.
Prove the following by giving derivations in λD (in parts (c) and (d) you
may suﬃce with skeleton proofs, cf. Figure 12.8):
(b) < is irreﬂexive, i.e. ∀m∈S(¬(m < m)),
(c) < is strictly antisymmetric, i.e. ∀m,n∈S(¬((m < n) ∧ (n < m))),
(d) < is transitive.Exercises 277
## 12.5 Let S be a set, P a predicate on S and let n be an element of S such
that P(n) and ∀x∈S(P(x) ⇒ (x = n)). Prove the following by giving
λD-derivations, ﬁrst as skeleton proofs, and then as complete proofs:
(a) ∃1
x∈S(P(x)),
(b) n =S ιx∈S(P(x)). (Hint: use Lemma 12.7.1.)
## 12.6 Let S be a set, partially ordered by ≤. An element m in S is called a
minimal element of S (with respect to ≤), if ∀x∈S(x ≤ m ⇒ x =S m) (cf.
Section 8.6).
(a) If m is a minimal element of S, is this necessarily the only one?
(b) Prove the following (you may suﬃce with a skeleton proof in λD): if
m is a least element of S (with respect to ≤), then m also is a minimal
element of S.
(c) As in part (b): if m is a least element of S, then m is the only minimal
element of S.
(You may use classical logic and Exercise 12.5.)
12.7 A monoid is a set S with a binary operation ◦ : (S × S) → S that is
associative, i.e. ∀x,y,z∈S((x ◦ y) ◦ z = x ◦ (y ◦ z)).
Let (S,◦) be a monoid. Assume that (S,◦) has a unit, i.e. an element
e such that e ◦ x = x and x ◦ e = x, for all x in S.
(a) Formalise these notions by giving the corresponding λD-deﬁnitions.
(Take S → S → S as the type of ◦.)
(b) Prove in λD that the unit is unique.
(c) Assume that every element x of S has an inverse, i.e. an element y
such that x◦y = e and y◦x = e. Give a skeleton proof in λD to show
that every x has a unique inverse.
(d) Raise a ﬂag with x : S and express the inverse of x in λD.
12.8 ‘Invert’ the implication arrow in the type of line (2) of Figure 12.18 and
prove that also this type is inhabited in context (a), (b). (Use substitu-
tivity; see Section 12.2.)
## 12.9 Assume that the set R of real numbers has been formalised as a type
in λD. Moreover, assume that the number 0 has been formalised as a
term of type R, the binary subtraction operation ‘−’ as a term of type
R → R → R, the relations >R, ≥R and <R as terms of type R → R → ∗p,
and the unary absolute value operator |...| as a term of type R → R.
Moreover, let the set N be formalised as a type in λD, and the rela-
tion >N as a term of type N → N → ∗p.
An (inﬁnite) sequence of reals is then represented by a map f from N
to R.278 Mathematics in λD: a ﬁrst attempt
(a) Express in λD the convergence property for a sequence:
f : N → R has limit l if ∀ε>0∃N∈N∀n>N(|f(n) − l| < ε).
(Hint: formalise ∀ε>0(P(ε)) as ∀ε : R. (ε >R 0 ⇒ P ε).)
(b) Give a mathematical proof, using classical logic, of the following
proposition:
If sequence f : N → R has limit l, then this limit is unique.
(Hint: Assume that f has two diﬀerent limits l1 and l2. Deﬁne ε as
1
2 |l1−l2| and derive a contradiction, using the triangle inequality, viz.
∀x,y,z∈R(|x − y| + |x − z| ≥ |y − z|).)
(c) Transform the proof in (b) into a skeleton proof in λD. (You may
use inﬁx notation.) Indicate where it is not yet possible to provide
an appropriate proof object, because formalised mathematical fore-
knowledge is missing.13
Sets and subsets
## 13.1 Dealing with subsets in λD
In type theory, sets are not directly represented, although we have often treated
sets as types (i.e. objects of type ∗) in the previous chapters. We wrote ∗s
instead of ∗ to underline this. However, types and sets have very diﬀerent
backgrounds. In Chapters 2 to 6, we introduced types as formal expressions,
in order to eliminate undesired properties from the (‘free’) untyped lambda
calculus. Sets, on the other hand, are mathematical constructs, meant to enable
us to talk about collections of mathematical objects.
Until now, considering sets as types has worked out ﬁne. But we may expect
serious problems when it comes to subsets. The reason is that the Uniqueness
of Types property (see e.g. Lemma 10.4.10) conﬂicts with the ‘natural’ view
on subsets. For example, let S be a set and T a proper subset of S. Now let c
be an element of S. In type theory this could be expressed as c : S. But what
if we wish to express that c is also an element of the subset T? Then c : T
doesn’t work, because types S and T are diﬀerent, hence Uniqueness of Types
would be violated.
As another example, let P be a property of elements in S. Then one can form
the set {x ∈ S |P x} of all elements of S satisfying P. Now, for c : S, to decide
c : {x ∈ S |P x}, we would have to decide if P c holds, which is undecidable
in general. Hence, treating subsets as types violates decidability of typing.
To make this example more concrete, let S be R, let P be λx : R. x ≥ 0
and suppose F : {x ∈ R | x ≥ 0} → R is the square root function. Now,
if we need to type-check the term F M with M : R, we have to verify that
M : {x ∈ R | x ≥ 0}; that is, we have to ﬁnd a proof of M ≥ 0. This
is undecidable: following the famous results by Church (1936b) and Turing
(1936) there is no general algorithm to decide if something is provable.
This is a serious issue in type theory. On the one hand, we are content with
decidability of typing, as we argued in earlier chapters. This makes type theory280 Sets and subsets
strong as a system for proof checking, which can be executed with a deﬁnite
answer (either ‘ok’, or ‘not ok’, but never ‘we don’t know’). Decidability of
typing is also helpful in proof ﬁnding.
On the other hand, decidability of typing prevents the usual handling of sub-
sets. This is strange for the average mathematician, who is used to considering
an object of a set as naturally belonging to every ‘superset’. So we conclude
that sets cannot be identiﬁed with types in a straightforward manner. Re-
searchers have developed several views on how to deal with (sub-)sets in type
theory, leading to diﬀerent starting points, each with their own advantages and
disadvantages. (We mention the most prominent views in Section 13.8.)
So in order to be able to fruitfully incorporate set theory in our type-theoretic
framework of λD, we have to make a choice about the treatment of subsets. In
doing so, we have to take a decision about one fundamental issue, which has
been mentioned several times before: whether or not to stick to decidability of
typing, and to Uniqueness of Types.
It is tempting to abandon Uniqueness of Types in order to treat types in
the way mathematics treat sets. Then an element can belong to several types;
for example, the number 3 may have type N, and also Z, and R; moreover, the
same 3 may also have type ‘the odd natural numbers’, and ‘the interval of all
reals between −2 and 10’.
This would give us great freedom in typing a term, and would solve many
of our problems with subsets. However, this has serious drawbacks for the
eﬀectivity of a type system as a basis for proof checking.
Remember that we want proof checking to be decidable. In our type-theoretic
framework, this means that given a pre-term p it should be decidable if it is a
well-formed proof term, and if so, what proposition A it is a proof of (so p : A).
In particular, proof checking is decidable, through the fact that type checking
is decidable.
Therefore, we hereby declare to maintain decidability of typing, and conse-
quently to accept all the consequences arising from this choice, in particular
with respect to subsets.
Before describing our choice for the representation of subsets, we mention
a number of notions related to sets in mathematics. Sets are mathematical
entities that embody the idea of ‘collecting objects together’. So a set S may
be thought of as being the collection of its elements. The notion elementhood
is expressed by the symbol ∈; so x ∈ S if and only if x is one of S’s elements.
One says that S is a subset of T (notation: S ⊆ T) if all elements of S are also
elements of T.
Further notions related to sets are equality of sets, subsets, union, intersec-
tion, diﬀerence, complement, powerset and Cartesian product.13.1 Dealing with subsets in λD 281
The notion ‘complement’ of a set is a relative notion: one considers ‘the
complement of S with respect to T’.
The powerset P(S) of some set S is deﬁned as the set of all its subsets. Note
that the notions ‘set’ and ‘element’ are not absolute: an element of P(S) is
itself a set, which may have elements again. For example, {x ∈ N | x is even}
is both a set and an element (e.g. of P(N)).
Another essential aspect of set theory is the existence of a set building con-
struct (enabling the so-called Set Comprehension). This is usually denoted by
curly brackets: {x ∈ S | P(x)} denotes all elements of set S that satisfy predi-
cate P. For example, {x ∈ R |−2 < x < 10} is the ‘interval’ of all real numbers
between −2 and 10.
Now we discuss how to incorporate subsets in our type theory λD. A smooth
and fruitful manner to do this is to use predicates for representing subsets.
Let’s assume that we have a type S which we consider as our basic set of
entities, and that we want to isolate a subset V of S. Let P be the predicate
describing whether x is element of subset V or not, so we can deﬁne P as
P = λx : S . (x ∈ V ), having type S → ∗p. There clearly is a straightforward
correspondence between this subset V and the mentioned predicate P, since
for arbitrary x : S we have: x ∈ V ⇔ P(x).
Hence, it is not a great step to consider the predicate P as representing the
subset V . This is a fruitful identiﬁcation, since predicates are already part of
our formal system λD, so there is no need for new symbols or operations to
deal with the notion of subset.
In this subset-as-predicate view we start with a type, say S, acting as a set.
Next, subsets of S are represented as predicates over S. Consequently, the
powerset ps(S) coincides with the collection S → ∗p of all predicates over S
(see Figure 13.1, line (1)).
How about elementhood? This is easy, again: x is an element of subset V of S
if x satisﬁes predicate V over S, i.e. if V x holds. We express this in Figure 13.1,
line (2). In order to emphasise the correspondence between ‘x is an element
of subset V ’ and ‘x satisﬁes predicate V ’, we introduce the new symbol ε,
resembling the usual elementhood-symbol ∈, but not being identical: we wish
to keep the diﬀerence in mind. We write x εSV in this situation, or x ε V if it
is clear what the type S is (see the Notation following line (2)).
Figure 13.1 also contains the deﬁnition of inclusion of a subset in another,
and the deﬁnition of the union of subsets. These have a natural appearance,
and the more so if we add some sugaring notation, for example: V ⊆S W and
V ∪S W, for ⊆(S,V,W) and ∪(S,V,W), respectively.
This looks promising. Hence, we follow the subset-is-predicate approach of
Figure 13.1, where subsets of a type S are coded as predicates over this S.282 Sets and subsets
S : ∗s
(1) ps(S) := S → ∗p : 
x : S
V : ps(S)
(2) element(S,x,V ) := V x : ∗p
Notation : x εSV or x ε V for element(S,x,V )
V,W : ps(S)
(3) ⊆(S,V,W) := ∀x : S . (x ε V ⇒ x ε W) : ∗p
(4) ∪(S,V,W) := λx : S . (x ε V ∨ x ε W) : ps(S)
Figure 13.1 Subsets as predicates over a type
## 13.2 Basic set-theoretic notions
In this section we consider a number of basic notions about (sub-)sets and
see how these can be formalised in λD by means of the subset-as-predicate
approach chosen in the previous section (see Figure 13.1). The crucial point is
that in this approach there are only subsets, which are formalised as predicates.
The notion x ∈ V should not be identiﬁed with x : V but with x ε V , which is
a type. To establish x ∈ V we have to give a proof; that is, we have to construct
a proof term p : x ε V .
We now consider quantiﬁcations. Let S be a type representing a set. If V is a
subset of S, then we formalise V not as a type, but as a predicate on S. Hence,
we have S : ∗s, but V : S → ∗p. Now suppose that we want to quantify over the
‘subset’ V , for example by expressing that ∀x∈V (P(x)) for some predicate P.
Then we cannot formalise this immediately in λD as ∀x : V . P x, since V is
not a type (cf. the rule (form); recall that ∀ is a sugared version of Π).
An elegant way out is to quantify over the type S, and restrict the domain
of the x’s by means of the extra condition that x must satisfy V . So we have
the following translation convention:
∀x∈V (P(x))  ∀x : S . (x ε V ⇒ P x).
There is a similar solution for the existential quantiﬁer. This time we need
an ∧ instead of an ⇒ (examine why):
∃x∈V (P(x))  ∃x : S . (x ε V ∧ P x).
So in our formalisation every quantiﬁer ranges over a type.
Example 13.2.1 The expression ∀x ε V . (x ε W) has an illegal format,
hence we cannot use it for the deﬁnition of the inclusion V ⊆ W. But we can
write ∀x : S . (x ε V ⇒ x ε W) (see line (3) of Figure 13.1).13.2 Basic set-theoretic notions 283
In Figure 13.2 we build further on lines (1) and (2) of Figure 13.1. In order to
get the complete picture, we repeat the deﬁnitions of inclusion and union, and
add other ones. We also incorporate the customary notation for subset com-
prehension {x : S | V x} (cf. the previous section) for the subset-as-predicate
λx : S . V x. Writing x ε V instead of V x, we obtain {x : S |x ε V } as a
recognisable notation for the subset-as-predicate.
Inclusion between subsets of S and equality of subsets are propositions (see
lines (1) and (2) of Figure 13.2).
Note that we apply the following translations:
V is a subset of the type S  V : ps(S) (or V : S → ∗p)
V is a subset of W  V ⊆ W
for V and W subsets of the type S (or ∀x : S . (x ε V ⇒ x ε W))
Next, we deﬁne in Figure 13.2 the union, intersection and diﬀerence of two
subsets of S; which are subsets, again. And we consider the complement of a
subset, with respect to S.
S : ∗s
V : ps(S)
Notation : {x : S |x ε V } for λx : S . V x
W : ps(S)
(1) ⊆(S,V,W) := ∀x : S . (x ε V ⇒ x ε W) : ∗p
Notation : V ⊆ W for ⊆(S,V,W)
(2) IS(S,V,W) := V ⊆ W ∧ W ⊆ V : ∗p
(3) ∪(S,V,W) := {x : S |x ε V ∨ x ε W} : ps(S)
(4) ∩(S,V,W) := {x : S |x ε V ∧ x ε W} : ps(S)
(5) \(S,V,W) := {x : S |x ε V ∧ ¬(x ε W)} : ps(S)
Notation : V = W, V ∪ W, V ∩ W, V \W, respectively
(6) c
(S,V ) := {x : S |¬(x ε V )} : ps(S)
Notation : V c
for c
(S,V )
Figure 13.2 Propositions and operations concerning sets
The new notation enables us, for example, to deﬁne the union of V and W
in a familiar manner:
∪(S,V,W) := {x : S | x ε V ∨ x ε W} : ps(S).
For convenience’s sake, we allow the usual inﬁx notations in Figure 13.2.284 Sets and subsets
The base set S is not mentioned in these sugared notations. Furthermore, we
overload the symbol ‘=’, since this equality symbol, earlier having been deﬁned
for elements, is now also employed for subsets.
Consider the expression y ε {x : S |P x}. Undoing the sugaring concerning
both ε and {...|...}, we obtain (λx : S . P x)y, which is β-equal to P y. This
β-equality is used in Figure 13.3. Line (1) can be considered as an introduction
rule for ε, and line (2) as its elimination rule.
S : ∗s
P : ps(S)
y : S
u : P y
(1) ε-in(S,P,y,u) := u : y ε {x : S |P x}
v : (y ε {x : S |P x})
(2) ε-el(S,P,y,v) := v : P y
Figure 13.3 Introduction and elimination rules for the new element symbol
In order to demonstrate how one works with these set notions, we give the
proof of a simple set-theoretic theorem in λD (see Figure 13.4). We prove the
following:
For all subsets V and W of S: if V ⊆ Wc, then V \W = V .
Since the proof is an easy exercise with logic and with the deﬁnition mech-
anism of λD, we only make some remarks about the way in which the proof
terms are constructed.
We start in Figure 13.4 (lines (1) to (4)) with the ﬁrst part of the proof,
showing that we always have the inclusion V \W ⊆ V (independent of whether
or not V ⊆ Wc). In line (1) we use that (x ε V \W)
Δ
=β (x ε V ∧¬(x ε W)). An
alternative to proof term v in line (1) is a proof term based on ε-el (construct
it yourself).
The second part of the proof (lines (5) to (10)), proving V ⊆ V \W, is slightly
more complicated. Now we need that V ⊆ Wc. Lines (11) and (12) conclude
the proof.
We omit several proof terms based on logical rules: from Figure 13.4 onwards
we will often only mention the logical rule employed, by giving a hint, without
bothering about the details. We take it that the reader is by now suﬃciently
accustomed to the use of the logical (natural deduction) rules in λD. Hence, we
will often omit the detailed arguments for these rules, since they can be easily13.2 Basic set-theoretic notions 285
constructed following familiar patterns. Of course, a hint can lead to several
solutions; for example, the logical hint ...use ⇒ -in on a2 ... in line (3) can
be ﬁlled in with
− ⇒-in(x ε V \W,x ε V,λv : (x ε V \W). a2) (in the natural deduction style),
or directly with
− λv : (x ε V \W). a2 (in the type-theoretic style).
S : ∗s | V,W : ps(S)
x : S
v : (x ε V \W)
(1) a†
1 := v (or : use ε-el) : x ε V ∧ ¬(x ε W)
(2) a2 := ... use ∧-el1 on a1 ... : x ε V
(3) a3 := ... use ⇒-in on a2 ... : x ε V \W ⇒ x ε V
(4) a4(S,V,W) := ... use ∀-in on a3 ... : V \W ⊆ V
u : V ⊆ Wc
x : S
v : x ε V
(5) a5 := uxv : x ε Wc
(6) a6 := a5 : ¬(x ε W)
(7) a7 := ... use ∧-in on v and a6 ... : x ε V ∧ ¬(x ε W)
(8) a8 := a7 : x ε V \W
(9) a9 := ... use ⇒-in on a8 ... : (x ε V ) ⇒ (x ε V \W)
(10) a10(S,V,W,u) := ... use ∀-in on a9 ... : V ⊆ V \W
(11) a11(S,V,W,u) := ... use ∧-in on a4(S,V,W) and a10(S,V,W,u) ... :
V \W = V
(12) a12(S,V,W) := ... use ⇒-in on a11 ... :
(V ⊆ Wc
) ⇒ (V \W = V )
†
parameters suppressed
Figure 13.4 An example proof about sets
We invite the reader to study the details. We conﬁne ourselves to two com-
mentary remarks:
− It would be more in line with logic (but also more involved) to replace the
proof term uxv in line (5) by a ∀-el-step, followed by an ⇒-el-step.
− In lines (6) and (8), we could also have used ε-el and ε-in, respectively.286 Sets and subsets
A proof as given in Figure 13.4 requires some eﬀort to construct, but on
completion its course is clearly visible, in particular when we omit everything
but the skeleton proof – otherwise said: when we concentrate on the types.
Some conventions for syntactic sugaring make the proof more transparent, as
this derivation demonstrates; using dots or only hints for obvious arguments
simpliﬁes matters considerably.
Remark 13.2.2 A representation of a proof in λD-style can shed light on
interesting aspects. As a small example: in Figure 13.4 we see in line (11) a
reference to two proof objects: a4 and a10. Note that the parameter list of a4
is one entry shorter than that of a10; this corresponds to what we have noticed
earlier: that the proof of V \W ⊆ V does not depend on the assumption of
V ⊆ Wc, but the proof of V ⊆ V \W does.
Reﬂecting on the notions introduced in this section, there remains one ques-
tion: we have deﬁned subset-equality IS(S,V,W) (in sugared version: V = W)
in Figure 13.2 as the conjunction of V ⊆ W and W ⊆ V . How does this
equality relate to the Leibniz-equality as discussed in Section 12.2?
Since we have S : ∗p, but ps(S) : , we cannot write V =ps(S) W for Leibniz-
equality of V and W by using the deﬁnition of x =S y as given in line (1) of
Figure 12.3. We can, however, deﬁne a similar Leibniz-equality on the powerset
of S as ΠK : ps(S) → ∗p . (K V ⇔ K W) – in words: for all predicates K on
the powerset of S, if V satisﬁes K, then also W; and vice versa. Let’s denote
this Leibniz-equality of V and W by V =ps(S) W.
Now it would obviously be desirable that the subset-equality V = W implies
the Leibniz-equality V =ps(S) W, and vice versa.
It is easy to show (Exercise 13.1) that Leibniz-equality implies subset-equal-
ity. For the implication the other way round, however, no proof can be con-
structed with what we have. So it is necessary to add another axiom. This we
do in Figure 13.5.
S : ∗s
V,W : ps(S)
(1) eq-subset(S,V,W) := ΠK : ps(S) → ∗p . (K V ⇔ K W) : ∗p
Notation : V =ps(S) W for eq-subset(S,V,W)
u : V = W
(2) IS-prop(S,V,W,u) := ⊥ ⊥ : V =ps(S) W
Figure 13.5 V = W implies V =ps(S) W13.3 Special subsets 287
## 13.3 Special subsets
Another basic notion connected with sets is that of the ‘empty set’, the set
having no elements. In our powerset approach we cannot suﬃce with one empty
set relative to a universe; we have to deﬁne, for every type S : ∗s, an empty
set ∅(S) with respect to that S. Such an ∅(S) (denoted ∅S) is a subset of S,
coded as the predicate λx : S . ⊥ on S (Figure 13.6).
We also deﬁne the ‘full subset’ of S, which contains all elements of S. It is
coded as the predicate λx : S . ¬⊥. (Note that full-set(S) is the complement
of ∅S relative to S; see Exercise 13.6(a).)
S : ∗s
(1) ∅(S) := {x : S | ⊥} : ps(S)
Notation : ∅S for ∅(S)
(2) full-set(S) := {x : S | ¬⊥} : ps(S)
Figure 13.6 The empty set and full set as subsets of a type S
As a simple exercise, we prove that the empty set is included in every subset
of S, and that every subset is included in the full set (see Figure 13.7). In
line (3) we use that x ε ∅S is β-equal to ⊥, and in line (7) that x ε full-set(S)
is β-equal to ¬⊥.
. . .
V : ps(S)
x : S | u : x ε ∅S
(3) a†
3 := u : ⊥
(4) a4 := ... use ⊥-el on a3 ... : x ε V
(5) a5 := ... use ⇒-in and ∀-in ... : ∅S ⊆ V
x : S | v : x ε V
(6) a6 := λy : ⊥. y : ¬⊥
(7) a7 := a6 : x ε full-set(S)
(8) a8 := ... use ⇒-in and ∀-in ... : V ⊆ full-set(S)
†
parameters suppressed
Figure 13.7 Lemma: ∅S ⊆ V ⊆ full-set(S), for all subsets V
In Figure 13.8 we practise with the empty-set notion. We prove that if a
subset of S is not the empty set, then it has at least one element; and vice288 Sets and subsets
versa. In the derivation we have omitted several proof objects, and replaced
them by hints.
In line (6) we apply ∃-in-alt (see Figure 11.28), making the derivation non-
constructive. So we use classical logic. This is in accordance with our earlier
decision (see Section 11.4) to take classical logic as our basic system for logic.
S : ∗s
V : ps(S)
u : V = ∅S
v : V ⊆ ∅S
(1) a†
1 := ... use ∧-in on v and a5[Fig. 13.7] ... : V = ∅S
(2) a2 := ua1 : ⊥
(3) a3 := ... use ¬-in ... : ¬(V ⊆ ∅S)
(4) a4 := a3 : ¬∀x : S . (x ε V ⇒ x ε ∅S)
(5) a5 := a4 : ¬∀x : S . (¬(x ε V ))
(6) a6 := ∃-in-alt(S,λx : S . (x ε V ),a5) : ∃x : S . (x ε V )
(7) a7 := ... use ⇒-in ... : (V = ∅S) ⇒ ∃x : S . (x ε V )
u : ∃x : S . (x ε V )
v : V = ∅S
x : S | w : x ε V
(8) a8 := ... use ∧-el1 on v ... : V ⊆ ∅S
(9) a9 := a8 xw : x ε ∅S
(10) a10 := a9 : ⊥
(11) a11 := ... use ∃-el on u and a10 ... : ⊥
(12) a12 := ... use ¬-in on a11 ... : V = ∅S
(13) a13 := ... use ⇒-in on a12 ... : (∃x : S . (x ε V )) ⇒ (V = ∅S)
(14) a14(S,V ) := ... use ⇔ -in on a7 and a13 ... :
(V = ∅S) ⇔ ∃x : S . (x ε V )
†
parameters suppressed
Figure 13.8 Properties of the empty set
## 13.4 Relations
Now that we have seen how to represent sets in λD, the time has come to look
at notions which are connected with sets. The ﬁrst matter that we study is the
notion relation.
As we have observed before, a relation on S is a binary predicate over S.13.4 Relations 289
In line with type theory, we employ Currying for binary functions (see Re-
mark 1.2.6) and write binary predicates over S as composite unary predicates,
of type S → S → ∗p.
We mentioned earlier that relations may have speciﬁc properties such as
reﬂexivity, symmetry or transitivity. These properties are easily expressible
in λD (see Figure 13.9). A relation having all three properties is called an
equivalence relation.
Remark 13.4.1 We have added a bit of sugar in line (4) of Figure 13.9:
ρ ∧ σ ∧ τ is not oﬃcial syntax; it should be read as (ρ ∧ σ) ∧ τ.
S : ∗s
R : S → S → ∗p
(1) reﬂexive(S,R) := ∀x : S . (Rxx) : ∗p
(2) symmetric(S,R) := ∀x,y : S . (Rxy ⇒ Ry x) : ∗p
(3) transitive(S,R) := ∀x,y,z : S . (Rxy ⇒ Ry z ⇒ Rxz) : ∗p
(4) equivalence-relation(S,R) :=
reﬂexive(S,R) ∧ symmetric(S,R) ∧ transitive(S,R) : ∗p
Figure 13.9 Basic notions connected to relations
Remark 13.4.2 We have deﬁned the relations in Figure 13.9 on the ‘full’
S, being a type. If we want to consider such relations for a subset of S (i.e. a
predicate over S), say V , we can employ a coding similar to the one used in
the beginning of Section 13.2. For example, reﬂexivity on subset V of S can be
deﬁned as:
reﬂ-subset(S,V,R) := ∀x : S . (x ε V ⇒ Rxx).
An equivalence relation enables one to divide a set into non-empty equiva-
lence classes. These can be deﬁned as in Figure 13.10: the equivalence class of
x consists of all y’s related to x. We abbreviate class(S,R,u,x) by [x]R, thus
hiding two parameters.
Equivalence classes have three important characteristics:
(1) ∀x : S . ([x]R = ∅S),
(2) ∀x,y : S . ([x]R = [y]R ∨ ([x]R ∩ [y]R = ∅S)),
(3) ∀y : S . ∃x : S . (y ε [x]R).
We can express this in words as follows:
(1) No class is empty.
(2) If the intersection of two classes is non-empty, then the classes coincide.
(3) Every element of S belongs to some class; otherwise said: the union of all
classes is the full S. (See also Exercises 13.10 and 13.11.)290 Sets and subsets
S : ∗s
R : S → S → ∗p
u : equivalence-relation(S,R)
x : S
class(S,R,u,x) := {y : S | Rxy} : ps(S)
Notation : [x]R for class(S,R,u,x)
Figure 13.10 Equivalence classes
Together, (2) and (3) imply: each x belongs to exactly one class.
As a demonstration of what we have achieved now, and also as an exercise,
we prove (2) in the following form, which is equivalent (Exercise 13.9):
∀x,y,z : S . (z ε [x]R ⇒ z ε [y]R ⇒ ([x]R = [y]R)).
In words: if there is a z that belongs to both class [x]R and class [y]R, then these
classes must be the same – hence, we never have ‘partial overlap’ between two
classes, but either no overlap or full overlap. (Note that this does not imply
that x = y; it only entails that x and y belong to the same class.)
The proof is given as a derivation in Figure 13.11.
Remark 13.4.3 Since we assume that R is an equivalence relation on S,
we have symmetry and transitivity of R. We do not spell this out, but only
mention it (see lines (4)–(6)). Note that we do not need reﬂexivity.
We only give a short comment and leave it to the reader to study the details
of how this proof has been developed.
− Start from the bottom upwards: the type of line (12) contains our goal.
− Decomposition of the goal leads to a number of ﬂags and to the goals regis-
tered in the types of lines (9) and (10).
− The ﬁrst of these new goals is rephrased in line (8) and leads to the ﬂags
in (d) and the goal m ε [y]R in line (7). This goal type can be rewritten to
m ε {n : S | Ry n}, so a proof of Ry m will do.
− We get Ry m by using assumptions w, u and v, which give us Rxm, Rxz
and Ry z (lines (1) to (3)). These three together lead to Ry m via symmetry
and transitivity of R (lines (4) to (6)).
− Finally, note how nicely we can use line (9), in order to obtain the ‘mirror
result’ in line (10): a swap of two pairs of parameters suﬃces.
The rest is routine.13.5 Maps 291
(a) S : ∗s | R : S → S → ∗p | u : equivalence-relation(S,R)
(b) x,y,z : S
(c) u : (z ε [x]R) | v : (z ε [y]R)
(d) m : S | w : (m ε [x]R)
(1) a†
1 := ... use ε-el on w ... : Rxm
(2) a2 := ... use ε-el on u ... : Rxz
(3) a3 := ... use ε-el on v ... : Ry z
(4) a4 := ... use symmetry on a2 ... : Rz x
(5) a5 := ... use transitivity on a3 and a4 ... : Ry x
(6) a6 := ... use transitivity on a5 and a1 ... : Ry m
(7) a7 := a6 : m ε [y]R
(8) a8 := ... use ⇒-in and ∀-in on a7 ... :
∀m : S . (m ε [x]R ⇒ m ε [y]R)
(9) a9 := a8 : [x]R ⊆ [y]R
(10) a10(S,R,u,x,y,z,u,v) := a9(S,R,u,y,x,z,v,u) : [y]R ⊆ [x]R
(11) a11 := ... use ∧-in on a9 and a10 ... : [x]R = [y]R
(12) a12(S,R,e) := ... use ⇒-in and ∀-in on a11 ... :
∀x,y,z : S . (z ε [x]R ⇒ z ε [y]R ⇒ [x]R = [y]R)
†
parameters suppressed
Figure 13.11 Proof of a lemma about equivalence classes
Until now, we have discussed relations R on a single type S, represented as
binary predicates over this S, so R : S → S → ∗p (using Currying). A natural
extension is to consider relations on a pair of types, say S and T. (In such a
case one also speaks of a relation between S and T.) The obvious representation
of such a relation has type S → T → ∗p.
Examples 13.4.4 Assume that we have N and Z as types. Consider the
relation R between N and Z that holds between n : N and x : Z if n = x2 + 1.
So we have R 5 2, R5 (−2), and ¬(R 5 x) for any other x : Z. This relation
can be coded as R := λn : N. λx : Z. (n = x2 + 1) : N → Z → ∗p.
## 13.5 Maps
A map can be seen as a special kind of relation. To be precise: a map from set
S to set T is a relation F : S → T → ∗p, such that:
∀x∈S∃1
y∈T (F xy).292 Sets and subsets
So the essential property that turns a relation into a map is that each x ∈ S
has a relation with exactly one y ∈ T. We call such a relation a functional
relation. Because of the uniqueness of the y related to such an x, one usually
prefers to consider F as a unary symbol and one writes F(x) = y instead of
F xy.
Remark 13.5.1 One can consider a wider notion of ‘map’ and speak of a
map if there is, for each x, at most one related y (so there may be none). Such
a relation is also called a partial map. In the present text, however, maps are
always ‘total’, in the sense explained above.
We have already seen that the notion of a map is a core concept in type
theory: we write F : A → B in order to express that F is a map from A to B;
where A → B is also an abbreviation of Πx : A. B (cf. Notation 5.2.1).
Fortunately, the connection between a map as an inhabitant of a (functional)
Π-type and a map as a functional relation (a predicate) is easy to establish.
Given the map F : S → T, we have the relation R = λx : S . λy : T . (y = F x);
and vice versa, given R : S → T → ∗p with u : ∀x : S . ∃1y : T . Rxy, we have
the function F = λx : S . ιux
y:T (Rxy). (For the ι, see Figure 12.16.) This is
expressed in lines (1) and (3) of Figure 13.12. In line (2) we add some more
information (we leave it to the reader to derive the proof object).
S,T : ∗s
F : S → T
(1) R(S,T,F) := λx : S . λy : T . (y =T F x) : S → T → ∗p
(2) a2(S,T,F) := ... Exerc. 13.12(a)... :
∀x : S . ∃1
y : T . (R(S,T,F)xy)
R : S → T → ∗p
u : ∀x : S . ∃1
y : T . Rxy
(3) F(S,T,R,u) := λx : S . ιux
y:T (Rxy) : S → T
Figure 13.12 The connection between a functional relation and a type-
theoretic function
Remark 13.5.2 In mathematics, the words ‘function’ and ‘map’ often mean
the same thing, albeit that ‘map’ sometimes suggests a more abstract viewpoint.
We shall continue to represent maps in the type-theoretic format, which is
– in our framework – more basic than the functional relation format.
It is easy to express some properties that maps F : S → T may have, such
as injectivity, surjectivity and bijectivity (see Figure 13.13). Another directly13.5 Maps 293
expressible notion is that of the inverse of a bijective map (again, see Fig-
ure 13.13).
S,T : ∗s
F : S → T
(1) injective(S,T,F) := ∀x1,x2 : S . (F x1 =T F x2 ⇒ x1 =S x2) : ∗p
(2) surjective(S,T,F) := ∀y : T . ∃x : S . (F x =T y) : ∗p
(3) bijective(S,T,F) := injective(S,T,F) ∧ surjective(S,T,F) : ∗p
u : bijective(S,T,F)
(4) a4(S,T,F,u) := ... Exerc. 13.12(b)... :
∀y : T . ∃1
x : S . (F x =T y)
(5) inv(S,T,F,u) := λy : T . ι
a4(S,T,F,u)y
x:S (F x =T y) : T → S
Figure 13.13 Some well-known notions connected with maps
Things become a bit more complicated when the domain of function F is
not the type S, but a subset V of S. Following the line that we have taken
earlier, the type of such an F then becomes Πx : S . ((x ε V ) → T), with an
extra argument, x ε V .
As an example of the extra administration necessary for such a function F
on a subset, we give the corresponding deﬁnition of injectivity in Figure 13.14.
S,T : ∗s
V : ps(S)
F : Πx : S . ((x ε V ) → T)
(1) inj-subset(S,T,V,F) := ∀x1,x2 : S . Πp : (x1 ε V ). Πq : (x2 ε V ).
((F x1 p =T F x2 q) ⇒ x1 =S x2) : ∗p
Figure 13.14 Injectivity of a map on a subset
Other notions that can relatively easily be formalised, are, given sets S and
T, and a function F : S → T :
− The F-image of a subset V of source set S; the image of V is the subset of T
consisting of all the F-values of elements in V .
− The F-origin of a subset W of range set T; the origin of W is the subset
of S consisting of all elements which have F-values in W.294 Sets and subsets
S,T : ∗s
F : S → T
V : ps(S)
(1) image(S,T,F,V ) := {y : T | ∃x : S . (x ε V ∧ F x =T y)} : ps(T)
W : ps(T)
(2) origin(S,T,F,W) := {x : S | F x ε W} : ps(S)
Figure 13.15 Image and origin of a subset
See Figure 13.15 for a formal description of image and origin.
We conclude this section with an example concerning these notions. We
prove the following lemma in λD:
For F : S → T and V ⊆ S, we have that V ⊆ origin(image(V )).
The idea behind the proof is simple: let s ε V , then F s ε image(V ) (by the
deﬁnition of image), hence (by the deﬁnition of source) s ε origin(image(V )).
The λD-proof – see Figure 13.16 – is hardly more complicated than that. The
justiﬁcation for the formal proof is directly based on the deﬁnitions of image
and origin as given in Figure 13.15. It is a good exercise for the reader to check
precisely that the given proof is a correct λD-derivation (Exercise 13.16(a)).
S,T : ∗s
F : S → T
V : ps(S)
s : S | u : (s ε V )
(1) a†
1 := eq-reﬂ[Fig. 12.2](T, F s) : F s =T F s
(2) a2 := ... use ∧-in ... : s ε V ∧ F s =T F s
(3) a3 := ... use ∃-in ... : ∃x : S . (x ε V ∧ F x =T F s)
(4) a4 := a3 : F s ε image(S,T,F,V )
(5) a5 := a4 : s ε origin(S,T,F,image(S,T,F,V ))
(6) a6(S,T,F,V ) := ... use ⇒-in and ∀-in ... :
V ⊆ origin(S,T,F,image(S,T,F,V ))
†
parameters suppressed
Figure 13.16 A lemma about image and origin of a subset13.6 Representation of mathematical notions 295
## 13.6 Representation of mathematical notions
In the present chapter we have investigated how to represent a subset of a
type S in type theory, and we have decided to identify a subset of S with a
predicate on S, representing both as λx : S . P x. Such a many-to-one map of
mathematical notions into λD-constructs occurs more often. In the diagram
below (Figure 13.17) we give a list of some basic notions which have a diﬀer-
ent meaning in mathematics, but are represented by the same λD-constructs.
(Compare this with the way in which logical notions are represented in type
theory; see Figure 5.2.)
mathematics the type theory of λD
function space A → B Πx : A. B A : ∗s, B : ∗s
implication A ⇒ B Πx : A. B A : ∗p, B : ∗p
universal statement ∀x∈A(B(x)) Πx : A. B A : ∗s, B : ∗p
function from A to B λx : A. t A : ∗s, t : B : ∗s
predicate on A λx : A. t A : ∗s, t : ∗p
subset of A λx : A. t A : ∗s, t : ∗p
two-valued function from A × B to C λx : A. λy : B . t A,B : ∗s, t : C : ∗s
binary relation R over A × B λx : A. λy : B . t A,B : ∗s, t : ∗p
Figure 13.17 Coding mathematics in λD
There are clearly advantages of this ‘compression’ of diﬀerent notions into
the same form. For example, this enables us to keep the system λD relatively
simple and ‘lean’. Moreover, similar calculational patterns in mathematics and
logic coincide in λD, as we have already noticed before; see e.g. Examples 2.4.8
and 2.4.9.
On the other hand, a clear disadvantage is that the interpretation of λD-
expressions becomes ambiguous. When confronted, for example, with λx : A. t,
it is not clear whether this represents a function, a predicate or a subset. This
can be cumbersome when we want to decipher the mathematical meaning of a
certain text given purely in λD-coded form, without further comment.
This disadvantage disappears almost completely, however, when one takes
the precaution to divide the ∗’s into ∗s and ∗p, as advocated in Section 8.7 (cf.
Notation 8.7.1). This simple sugaring, albeit not oﬃcial syntax of λD, enables
one to give an unambiguous interpretation of almost all of the mentioned no-
tions (see Figure 13.17, ﬁnal column). The only exception is that predicates296 Sets and subsets
over a type and subsets of that type cannot be distinguished, as a consequence
of our choice in Section 13.1 to identify these notions in the λD-coding.
## 13.7 Conclusions
We have seen that it is not straightforward how to deal with subsets in type
theory, since there is a potential conﬂict of interests between two visions:
− the liberal view of the mathematical community towards set-membership,
which is undecidable in general and allows an element to be a member of
several sets;
− the strict typing discipline in type theory (and in particular, in λD), which
is decidable and where terms have a unique type.
The diﬀerences are explainable because of the divergent perspectives:
− In mathematics, one is usually not focused on a mechanised veriﬁcation. It
suﬃces that a fellow mathematician (or a student) can follow the reasoning
and thereby obtains conﬁdence in the correctness of the mathematical con-
tent that is presented. Hence, the conviction that a viable proof path exists
is enough; mathematical training enables one to choose the eﬀective steps
necessary to complete a mathematical argument, and thus one obtains a
great, tradition-honoured trust in the results. The experienced mind makes
the proper choices – in general – for a fruitful processing of the mathematical
material.
− The perspective of type theory, on the other hand, is diﬀerent. Its centre
of interest is all imaginable proofs, including the extremely complex ones,
or the tedious ones, or the long ones (e.g. concerning the correctness of
computer programs), where humans tend to lose their concentration. Here
the crucial thing is that an automatic veriﬁcation can be executed by a
computer program. This introduces the point of decidability, which is crucial
for a ﬂuid advancement of the veriﬁcation process. Human interventions
should be minimised; preferably, to the level of non-interference. Decidability
makes this possible, at least in principle: it may still happen that a decidable
procedure takes an unknown amount of time or space, which may cause
problems as long as the procedure is not ﬁnished. So feasibility is another
point. However, experiences with the use of type theory have demonstrated
that the veriﬁcation of mathematical content in formal form does not tend
to last forbiddingly long or to cost too much memory space.
Decidability and feasibility are particularly important for proof checking, so
also for type checking. Subsets are amply present in mathematics, in particular
in proofs. Hence, a careful treatment of the formalisation of the notions ‘set’
and ‘subset’ is very relevant. We have chosen the subset-as-predicate approach,13.8 Further reading 297
since there is a direct correspondence between subsets and predicates, and since
predicates are already part of our λD machinery.
We have put the chosen approach to the test by formalising several notions
connected with subsets, such as the basic notions of inclusion, union and inter-
section. Moreover, we have practised with the formal apparatus by considering
examples. We have also formalised a number of relations on (sub-)sets, in par-
ticular equivalence relations and equivalence classes, maps between sets and a
number of notions connected with maps. It worked out well, which gives us
conﬁdence in the rightness of our choice.
In Section 13.6 we explained that there is a many-to-one map of mathematics
into λD, meaning that diﬀerent mathematical notions are represented by the
same λD-constructs. The interpretation of a piece of λD-code as originally
intended remains, however, possible, if one has added a bit of sugar during the
coding process, in the sense that one writes ∗s instead of ∗ for the type of sets,
and ∗p for the type of propositions.
In the forthcoming chapters we continue the endeavour to deal with subsets
via the subsets-as-predicates approach, as we did in the present chapter. It
will turn out that our choice is fruitful. Sometimes we shall ﬁnd that it is
not easy to force mathematics into this jacket, but it is doable and does not
create insurmountable problems. The more we practise, the better it goes.
And sometimes, the meticulous formalisation that we pursue has, also when
considering subsets, unexpected consequences: it may evoke new insights and
a deeper view of mathematics and its meaning. These are the real moments of
satisfaction – or beauty, for some of us.
So indeed, there is a price to be paid for maintaining decidability of typing
and Uniqueness of Types, but it appears not to be too high. And we still do
succeed – so we’ve got nothing serious to complain about, the more so as we
realise that the proﬁts of decidability are impressive.
## 13.8 Further reading
The standard for set theory is Zermelo–Fraenkel axiomatic set theory (ZF),
sometimes extended with the Axiom of Choice (AC). This is a ﬁrst order
theory about the ∈-relation, that axiomatises which sets exist and how sets
can be formed from other sets. Axiomatic set theory is one of the answers
to the foundational and consistency questions that arose around 1900. The
foundational question is whether all of mathematics can be based on one simple
basic set of assumptions and constructions. G. Cantor (Cantor, 1874) was the
ﬁrst to develop set theory for this, as early as 1874, where he also showed that
there exist various levels of inﬁnity. Cantor’s ﬁrst set theory is inconsistent,
as was noticed by C. Burali-Forti and later by B. Russell, using his famous298 Sets and subsets
paradox, which he discovered in 1901 (see van Heijenoort, 1967, pp. 124–125;
Russell, 1903). Since then the question of creating a consistent foundation for
mathematics has become a major topic of research.
Russell developed his Ramiﬁed Type Theory, ﬁrst in The Principles of Math-
ematics (Russell, 1903), and later it was shown by A.N. Whitehead and Russell
in the famous three volumes of Principia Mathematica (Whitehead & Russell,
1910) that one can actually formalise many essential parts of mathematics in
this type theory. (For a modern view on these matters, see Kamareddine et
al., 2002, 2004.) For Russell, this shows the viability of the so-called logicist
approach, which asserts that all of mathematics can be based on (reduced to)
logic.
The Principia Mathematica has been very inﬂuential, even though the subtle
ramiﬁcation of its type theory is sometimes felt as awkward and Whitehead
and Russell had to resort to an additional ‘axiom of reducibility’ to make their
approach viable. It was later shown, ﬁrst by F.P. Ramsey (Ramsey, 1926), that
the addition of the axiom of reducibility makes the ramiﬁcation superﬂuous.
In 1940, A. Church deﬁned the simple theory of types (Church, 1940), which
can be seen as a ‘deramiﬁcation’ of Russell’s type theory. Church used it to
deﬁne the language of higher order logic. On top of it he deﬁned the natural
deduction derivation rules of higher order logic, so proofs in his system are
‘external’: they are derivation trees. Compared to the simple theory of types,
our system λD internalises derivations as typed λ-terms. On top of that, we
add type dependency (allowing the deﬁnition of objects that depend on proofs)
and we add a deﬁnition mechanism.
To overcome paradoxes and regain consistency, E.F.F. Zermelo chose another
way: he axiomatised set theory in 1908. His axioms were later (around 1921)
adapted by A.H. Fraenkel, which led to a system now known as ZF (see e.g.
Jech, 2003, or van Heijenoort, 1967, where the original papers of Zermelo and
Fraenkel can be found). This axiom system is widely used, albeit mostly in the-
oretical investigations: mathematicians hardly ever base their work explicitly
on ZF. The system describes which sets exist, where sets are just ‘collections of
things’ that don’t have any structure. So, one can recover the natural numbers
in set theory by describing it as the set {∅,{∅},{{∅}},...}, but also in diﬀerent
ways. There is no ‘typing’ involved in the sense that one can recognise a natural
number from the shape of the expression. This makes formalising mathematics
in pure set theory relatively unnatural. See van Dalen et al. (1978) for a clear
exposition of ZF.
The advantage of set theory over type theory is that various ‘natural con-
structions’ are directly available, like the union of two sets. In the present chap-
ter we have looked at ways to also include these in our type theory, starting
from a practical point of view: which set-operations are needed when formal-13.8 Further reading 299
ising mathematics and how we include them in our type theory by providing
the proper primitive notions.
There are various ways of formalising sets in type theory, each of which has
its own advantages and disadvantages. In the present chapter we have chosen
‘sets as predicates’, which works well, as we have indicated by showing how to
deal with the basic set-theoretic constructions. We now overview some other
possible approaches and we brieﬂy indicate why we have not chosen them.
(1) Follow the approach of Russell and Whitehead to use their Ramiﬁed Type
Theory to formalise sets. They also follow the ‘sets-as-predicates’ ap-
proach, but their predicates live in a diﬀerent type theory. As we have
already indicated above, Ramsey and Church have shown that the ramiﬁ-
cation is unnecessarily complicated, so we don’t follow that approach.
(2) Formalize Zermelo–Fraenkel axiomatic set theory directly, by declaring a
ﬁxed basic type V : ∗ of all sets and letting the sets be terms of this type V .
Then both elements and sets are represented as terms of type V and ele-
menthood is a relation on V , so ∈ : V → V → ∗. By assuming the axioms of
Zermelo and Fraenkel we obtain ZF. The ZF-approach is widely employed
to settle foundational issues, but it is not used for the real formalisation
of mathematics, because the intrinsic untyped behaviour of ZF does not
reﬂect everyday mathematics, where a type-like classiﬁcation forms a nat-
ural and widely used concept. The ∈-relation in ZF set theory relates
entities of the same level, where everyday mathematical practice views it
as relating an object to a collection. This idea is much better reﬂected in
the type-theoretic framework. Also, using set theory for formalising math-
ematics involves a lot of coding: numbers are encoded as sets and so are
functions, relations, etcetera. In type theory we make an attempt to avoid
too much coding and we feel that using Zermelo–Fraenkel axiomatic set
theory for formal mathematics is not a natural thing.
(3) Treat powersets as types, by letting ps(S), deﬁned as S →∗, be of type ∗.
This is an attractive idea, because now the powerset of a type is again
a type, which feels closer to axiomatic set theory. We then immediately
have ps(ps(S)) : ∗, etcetera, so all powersets of types are again types.
In van Benthem Jutting (1977) it is shown that this formalization of set
theory, together with a number of primitive deﬁnitions about equality and
pairing, is enough to deal with sets as they occur in the foundations of
mathematics precisely described by E. Landau in his early and inﬂuential
book Foundations of Analysis (Landau, 1930). It is a bit unusual that in
this approach an element a of type S is on the same level as an element V
of type ps(S), while V plays the role of a set (namely a subset of S). This300 Sets and subsets
mixture of elements and sets on the same level does not cause problems
in Jutting’s formalisation, using the system Automath, since Automath
has a logical strength that is comparable to λP. However, when copying
Jutting’s primitive deﬁnitions to λD (or λC), the resulting system turns
out to be inconsistent, as J.H. Geuvers has proved (see Geuvers, 2013). The
problem arises here since we basically have S→∗ : ∗. This is comparable
to ∗ : ∗, which is known to cause inconsistency.
(4) Formalize subsets as Σ-types. A much-used solution in type theory to deal
with subsets is to add so-called Σ-types (we have already mentioned them
in Sections 5.7 and 6.5). A Σ-type consists of dependent pairs. To be precise,
for S : ∗, and P : S → ∗, the Σ-type Σx : S . P x is the type of all pairs
a,q where a : S and q : P a. One can view Σx : S . P x as the subset of
S consisting of all elements a for which P a holds, where the proof of P a,
i.e. the term q of type P a, is attached to a. So, if a : S and q : P a, we
don’t just have a : Σx : S . P x, but a,q : Σx : S . P x.
To have Σ-types in λD, we need four new derivation rules:
(Σ-form)
Δ;Γ  S : ∗s Δ;Γ,x : S  B : ∗p
Δ;Γ  Σx : S . B : ∗s
(Σ-pair)
Δ;Γ  M :S Δ;Γ  N :B[x := M] Δ;Γ  Σx : S . B : ∗s
Δ;Γ  M,N : Σx : S . B
(Σ-proj1)
Δ;Γ  K : Σx : S . B
Δ;Γ  π1K : S
(Σ-proj2)
Δ;Γ  K : Σx : S . B
Δ;Γ  π2K : B[x := π1K]
The rule (Σ-form) serves for the formation of Σ-types. The rule (Σ-pair)
states that if M is of type S and it satisﬁes the predicate λx : S . B,
which is proved by N (since N : B[x := M]), then the pair M,N is
of type Σx : S . B. The rules (Σ-proj1) and (Σ-proj2) tell how to project
information out of a pair: one can either project to the ﬁrst component
(via π1) or the second component (via π2) of a pair.
The type system of the well-known proof assistant Coq (see Coq Develop-
ment Team, 2012) contains Σ-types, which are deﬁned as inductive types.
The usual notation {x : S | B} is used there for Σx : S . B.13.8 Further reading 301
In a competing system, called PVS (see PVS, 1992), a term M of type S
may be of type {x : S | B} as well. The derivation rule in PVS is:
M : S N : B[x := N]
M : {x : S |B}
Although this looks a lot more familiar, this approach has serious draw-
backs: one does not have decidability of typing and there is no Uniqueness
of Types.
In both approaches, one needs to add symbols and rules to λD if one wants
to have Σ-types. Since we intend to keep the system as simple as possible,
we choose not to use Σ-types.
(5) Subsets via embeddings. Yet another approach is to simulate a subset of S
by considering a diﬀerent type, V , that is related to S by an injective
embedding in : V → S. The image in(V ) of V is the subset of S that we
wish to capture. This image may be considered to be a ‘copy’ of V , since
V and in(V ) are bijectively (‘one-to-one’) related. One may also deﬁne
the map out : in(V ) → V as the inverse of in, and we have, among other
things, that out(in(y)) =V y. Given such an embedding in of V into S,
we may consider V itself to represent the subset (instead of in(V )), thus
avoiding a ‘typing clash’ caused by the situation that a term both has
type in(V ) and S (which is impossible, since in(V ) is not a type). If one
wants to see a y of type V as also having type S, then this can be done
via the injection in: consider the ‘copy’ in(y) of y. Hence, by shifting back
and forth between V and in(V ), we can deal with elements of type V
as if they were of type S as well. Of course, this involves a lot of extra
administration; but it works, and we don’t have to abandon decidability
of typing and Uniqueness of Types.
This approach can be applied nicely to the general situation where we
wish to represent a set {x : S | P x}. Suppose S : ∗ and P : S → ∗. We
can now primitively assume a type subtype(S,P) : ∗, which takes the role
of V above. We declare, primitively again, the embedding function in from
subtype(S,P) to S, having the property of being an injection. If desired,
we may combine this with the inverse function out, deﬁned on those x’s
in S for which P holds. A concrete implementation of this approach in
type theory was given by L.S. van Benthem Jutting (see Nederpelt et al.,
1994, pp. 763/4). There are close correspondences between Σ-types and the
subtypes obtained via embeddings. For example, the Σ-type Σx : S . P x
ﬁnds its counterpart in the type subtype(S,P).
Because a lot more primitive notions have to be added to λD, we have
not followed this approach.302 Sets and subsets
Exercises
13.1 Let V and W be subsets of S that are Leibniz-equal (V =ps(S) W) as
described in the ﬁnal part of Section 13.2. Give a λD-derivation to prove
that V and W are also subset-equal (V = W; see Figure 13.2).
If a λD-derivation is required in this exercise or one of the following ones,
you may suﬃce with only mentioning the logical arguments in ‘hints’, as
we have done regularly in the present chapter (cf. Section 13.2).
13.2 Let S : ∗s and V,W : ps(S).
(a) Show that the following is an immediate consequence of eq-reﬂ (see
Figure 12.2):
∀x : S . ((x ε V c) ⇔ ¬(x ε V )).
(b) Prove in λD: (V ⊆ W) ⇒ (Wc ⊆ V c).
13.3 Let S : ∗s.
(a) We have that full-set(S) : ps(S). Why is S itself not a subset of S,
i.e. not S : ps(S)?
(b) Show that S not a member of its own powerset (i.e. show that S ε ps(S)
is not derivable).
(c) Explain why we cannot code the powerset of the powerset of S as
ps(ps(S)).
(d) For T : , deﬁne PS(T) as T → ∗p. Give a legal λD-expression
representing the powerset of the powerset of the powerset of S.
## 13.4 Prove in λD, for S : ∗s and V : ps(S):
(a) V ∪ ∅S = V ,
(b) V ∩ ∅S = ∅S,
(c) V ∪ full-set(S) = full-set(S),
(d) V ∩ full-set(S) = V .
## 13.5 Prove in λD, for S : ∗s and V : ps(S):
(a) V ∪ V c = full-set(S),
(b) V ∩ V c = ∅S.
## 13.6 Let S be a type.
(a) Prove in λD: full-set(S) = (∅S)c.
(b) Let V be a subset of S. Prove: V = full-set(S) ⇔ ∃x : S . ¬(x ε V ).
13.7 Prove the following lemmas in λD, for S : ∗s and V,W : ps(S):
(a) (V ∩ W = V ) ⇒ V ⊆ W,
(b) V \W = V ∩ Wc,
(c) V ⊆ W ⇔ V \W = ∅S (see Figure 13.7).Exercises 303
## 13.8 Let R be a binary relation on the set S that is symmetric and transitive.
Assume that ∀x : S . ∃y : S . (Rxy). Prove in λD that R is also reﬂexive.
## 13.9 See Section 13.4. Prove in λD that the following two versions of the second
characteristic of an equivalence class are indeed equivalent:
(2a) ∀x,y : S . ([x]R = [y]R ∨ ([x]R ∩ [y]R = ∅S)),
(2b) ∀x,y,z : S . (z ε [x]R ⇒ z ε [y]R ⇒ ([x]R = [y]R)).
## 13.10 Let the binary relation R be an equivalence relation on S. Prove the
following lemmas in λD:
(a) No class is empty (hint: see Figure 13.8),
(b) ∀x,y,z : S . ((y ε [x]R ∧ z ε [x]R) ⇒ Ry z),
(c) ∀y : S . ∃x : S . (y ε [x]R).
13.11 (a) Let S,T : ∗s and F : T → ps(S). Give a λD-deﬁnition of the ‘big
union’ (S,T,F), notation z:T (F z), being the subset of S consist-
ing of all ‘elements’ of the subsets F(z), for all z : T.
(b) Rewrite characteristic (3) for a partition in equivalence classes, as
described in Section 13.4, using the -symbol.
(c) Prove in λD that this new version of characteristic (3) is equivalent
to the original one.
## 13.12 Fill the following gaps:
(a) In line (2) of Figure 13.12.
(b) In line (4) of Figure 13.13.
13.13 Let S1,S2,S3 : ∗s. Let F : S1 → S2 and G : S2 → S3. Then the
composition of F and G is the function G◦F := λx : S1 . (G(F x)). Prove
the following lemmas in λD:
(a) If F and G are injective, then G ◦ F is injective.
(b) If F and G are surjective, then G ◦ F is surjective.
13.14 Let S,T : ∗s, F : S → T and assume that u proves that F is a bijection.
Prove in λD:
∀y : T . (F(inv(S,T,F,u)y) =T y).
13.15 (a) Extend Figure 13.14 with deﬁnitions for surjectivity and bijectivity
of a function F on subset V , i.e. F : Πx : S . ((x ε V ) → T).
(b) Also give a deﬁnition of the inverse in case F is bijective (cf. Fig-
ure 13.13); ﬁrst prove that such an inverse is indeed a function, i.e.
each y of type T has a unique function value under ‘inverse’.
13.16 (a) Check lines (4) and (5) of Figure 13.16.
(b) Let S,T : ∗s, let F : S → T be an injection and V : ps(S). Prove the
following in λD:
∀x : S . (F x ε image(S,T,F,V ) ⇒ x ε V ).14
Numbers and arithmetic in λD
## 14.1 The Peano axioms for natural numbers
In the previous chapters we have become acquainted with the use of λD for
doing mathematics, by selecting a few examples and investigating the issues
that we came across.
Let’s now make a fresh start by thoroughly exploring the most fundamental
entities in mathematics: natural and integer numbers. This will not be easy,
since in the process of development we have to pretend that we ‘know nothing’
about subjects we are so familiar with. As a consequence, we have to build up
our knowledge from scratch, which may seem cumbersome, but it is also quite
interesting, since we are obliged to scrutinise the foundations of mathematics.
In the present section, we start with the basis: natural numbers. Integers
will be the main topic of following sections.
In Chapter 1 we saw how natural numbers, and operations on naturals such
as addition and multiplication, can be coded in untyped lambda calculus, as so-
called Church numerals (see Exercise 1.10). There also exist encodings of these
notions in typed lambda calculi: in the chapter about λ2 we have discussed
the so-called polymorphic Church numerals; see, for example, Section 3.8 and
Exercise 3.13. (For Church numerals in λ→: see Section 2.14.)
Therefore, it would be a type-theoretically justiﬁed choice to introduce the
natural numbers in this manner. This can be done by writing down the ap-
propriate deﬁnitions, since λ2 is a subsystem of λD. An immediate advantage
of this choice is that calculations using basic operations such as addition and
multiplication may be handed over to the inherent β-reduction mechanism
of λD.
There are, however, several objections against this choice.
− Firstly, it has been shown that induction, one of the most fundamental proof
principles of natural numbers, cannot be derived by means of the poly-306 Numbers and arithmetic in λD
morphic Church numerals, not in λ2 or λP2 (Geuvers, 2001), and also not
in λD. Hence, we need an extra axiom to represent it.
− Secondly, the representation of some basic functions on the naturals is diﬃ-
cult. For example, the encoding of the predecessor in Church-numeral style
is ineﬃcient and far from natural (see e.g. Geuvers & Nederpelt, 1994, Exer-
cise 32.11). The reason is that Church numerals facilitate iteration, but not
primitive recursion as a construction scheme.
− Thirdly, the Church numerals are not appropriate to also deal with integers,
so we have to introduce integers in a diﬀerent manner, which appears neither
elegant nor convenient.
− Finally, the approach to introduce naturals in the Church format is not very
‘natural’ for mathematicians, who are used to older and more intuitively
acceptable formats. The most accepted one is via the axioms of G. Peano
(Peano, 1889), which include induction. This is the approach that we will
follow henceforth.
We now elucidate this fundamental view of the mathematician G. Peano
(1858–1932). He introduces the natural numbers as a set equipped with a
zero element and a successor function, similar to Church’s set-up, but with a
diﬀerent elaboration. Formally, Peano postulates the existence of a set N, a
singled-out element 0 in it and a function s from N to N. So in N we have
elements 0, s(0), s(s(0)), etcetera, representing the numbers we are acquainted
with: 0, 1, 2, etcetera. Of course, it is quite sensible to identify these two lists.
Next, Peano enforces by means of axioms that these formal numbers behave
as expected. An important property is that the successor function must deliver
new numbers, over and over again. Therefore, Peano adds two axioms. The aim
of these axioms is to prevent the ‘chain of numbers’ retracing its own footsteps:
ax-nat1 : ∀x∈N(s(x) = 0),
ax-nat2 : ∀x,y∈N(s(x) = s(y) ⇒ x = y).
By ax-nat1, none of the elements s(s(...(0)...)) (i.e. with at least one s),
can be equal to 0. By ax-nat2, two elements of the form s(s(...(0)...)) with
a diﬀerent number of s’s are unequal. (Check this informally; you will need
ax-nat1.) Axiom ax-nat2 expresses that s is an injective function (cf. Fig-
ure 13.13), but ax-nat1 implies that s is not surjective.
Remark 14.1.1 Although natural numbers are fundamental, there are things
that are still ‘more fundamental’, namely logic and equality: see the nega-
tion sign occurring in ax-nat1, the implication symbol in ax-nat2 and the ∀-
quantiﬁers and the equality symbols appearing in both axioms. Of course, also
the rules of logic and the characteristic properties of equality belong to this
primeval material. (See Chapters 7, 11 and 12 for the formal representation of
these matters.)14.1 The Peano axioms for natural numbers 307
Peano recognised another thing as essential for the set of natural numbers,
namely the possibility to establish a property for all natural numbers by (math-
ematical) induction. Induction is the well-known principle which enables the
transfer of the validity of both P(0) and P(n) → P(n + 1), for all n ∈ N, to
the validity of P on the full N (see also Section 10.2). Formally:
axiom of induction for N : for all predicates P on N,
(P(0) ∧ ∀x∈N(P(x)⇒P(s(x)))) ⇒ ∀x∈N(P(x)).
In Figure 14.1 you ﬁnd the fundamental notions and the three axioms of
Peano for the naturals, in the setting of λD.
(1) N := ⊥ ⊥ : ∗s
(2) 0 := ⊥ ⊥ : N
(3) s := ⊥ ⊥ : N → N
(4) ax-nat1 := ⊥ ⊥ : ∀x : N. ¬(sx =N 0)
(5) ax-nat2 := ⊥ ⊥ : ∀x : N. ∀y : N. (sx =N sy ⇒ x =N y)
P : N → ∗p
(6) ax-nat3(P) := ⊥ ⊥ : (P 0 ∧ ∀x : N. (P x ⇒ P(sx))) ⇒ ∀x : N. P x
Figure 14.1 The Peano-axioms for natural numbers
Remark 14.1.2 The names ax-nat1 and ax-nat2 are given to inhabitants
of the axioms (which themselves are expressed as types); similarly, ax-nat3(P)
names an inhabitant of the induction property for P, not the property itself.
Apparently, we have succeeded in formalising the Peano-naturals in λD. Note
that we need six primitive deﬁnitions in Figure 14.1, which are only ‘justiﬁed’
by a nowadays generally accepted view on the basics of natural numbers. This
gives us a suﬃcient guarantee with regards to their acceptability.
Remark 14.1.3 We remind the reader that all primitive deﬁnitions have to
be scrupulously accounted for, since they contain notions or statements of an
axiomatic nature; hence, their content is not formally justiﬁed (and more than
that: formal justiﬁcation is mostly impossible).
So we have to be very careful with primitive deﬁnitions. For example, there
is no formal objection against a primitive deﬁnition declaring that true (¬⊥)
is equivalent to false (⊥); nor is there any formal objection against an axiom
stating that 0 =N s(0). But in both cases we have a big problem: either logic
collapses (since ⊥≡¬⊥ implies that ‘everything is provable’), or mathematics
breaks down (because 0 =N s(0) implies that all natural numbers are equal).
Hence, there are several lessons to learn from this discussion:308 Numbers and arithmetic in λD
(1) There should be a separate justiﬁcation for all primitive deﬁnitions in a
λD-text.
(2) It appears wise to use primitive deﬁnitions only sparingly.
(3) Even a full check of a λD-text on its compliance to the syntactical require-
ments imposed by the derivation rules, does not guarantee that it contains
sensible mathematical content, since the primitive notions could be contra-
dictory or meaningless.
These observations do by no means hold exclusively for λD: every mathe-
matical exposition has the same provisos, and to the same extent, since there
are always fundamental concepts that must be introduced without formal jus-
tiﬁcation.
It is obvious that each s(s(...(0)...)), including 0 itself, has type N. One
might wonder whether the Peano-axioms are not too weak, in the sense that
there may be more elements in N than the ones of the form s(s(...(0)...)).
This fear is taken away by the following lemma:
Lemma 14.1.4 For all n ∈ N: n = 0 ∨ ∃m∈N(n = s(m)).
A proof of this lemma is amazingly simple, even when formalised in λD: all
we have to do is apply induction on the predicate
P ≡ λn : N. (n =N 0 ∨ ∃m : N. (n =N sm)).
We sketch the proof of Lemma 14.1.4 in the usual mathematical style, albeit
with ﬂags (see Figure 14.2). Note that induction works perfectly, although we
do not appeal to the induction hypothesis P(k) in the body of the proof. This
is exceptional, but yet in accordance with the induction principle.
The formal λD-version follows exactly the same pattern, although it needs
more explicit proof terms. We leave it to the reader.
## 14.2 Introducing integers the axiomatic way
In the previous section we investigated how natural numbers can be dealt with
in type theory, on the basis of the Peano-axioms. The basic number system
in many mathematical applications, however, is the larger set Z of integer
numbers. In particular, most of number theory is about integer numbers. In
mathematical analysis, one prefers even larger systems, such as real numbers
or complex numbers.
Since this book aims at giving an impression of how type theory can be
used for mathematics and proofs, we decide to focus on integer numbers. Our
justiﬁcation is that we analyse one major example in the following chapter,
namely Bézout’s Lemma (cf. Remark 8.7.2), for which we need more than
natural numbers alone, but no more than integer arithmetic.14.2 Introducing integers the axiomatic way 309
Deﬁne, for n ∈ N, P(n) := (n = 0 ∨ ∃m∈N(n = s(m)))
step (i) P(0), since 0 = 0; use ∨-in.
step (ii) k ∈ N
P(k)
s(k) = s(k) (by reﬂexivity of =)
∃m∈N(s(k) = s(m)) (by ∃-in)
s(k) = 0 ∨ ∃m∈N(s(k) = s(m)) (by ∨-in)
P(s(k)) (by deﬁnition of P)
∀k∈N(P(k) ⇒ P(s(k))) (by ⇒-in and ∀-in)
step (iii) ∀n∈N(P(n)) (by induction on (i) and (ii))
Figure 14.2 An informal proof of Lemma 14.1.4
Hence, we take the integers as our basic number system, of which the naturals
are a subset. In the remainder of the present chapter we ﬁnd out how that vision
can be expressed in type theory, borrowing the formal notion ‘subset’ from the
previous chapter.
So we put aside the Peano-axioms for the naturals as dealt with in Sec-
tion 14.1 (in particular: Figure 14.1) and start from scratch. As with the natu-
rals, we prefer to introduce the integer numbers primitively, by giving a number
of determining axioms. It will not come as a surprise that these axioms are a
kind of extension of the Peano-axioms.
The ﬁve primitive deﬁnitions for the introduction of integers that we present
below are an adaptation of the ones given by A. Margaris (Margaris, 1961),
elaborated with the help of A. Visser and R. Iemhoﬀ (2009, pers. comm.).
The axiomatisation of the integers postulates a set (Z) with a speciﬁc element
(0) and again a successor function (s), this time from Z to Z (see Figure 14.3,
lines (1) to (3)).
The axiom ax-int1 in line (4) declares that s is a bijection: not only an
injection (cf. ax-nat2), but also a surjection (cf. Figure 13.13).
A consequence of surjectivity is that for all y in Z there is an x in Z such
that s(x) = y; see line (7). So Z not only stretches out to the right, but also
to the left. This is of course what we expect.
By the injectivity, such an x with s(x) = y is unique. This is proven in
lines (8) to (12). So we conclude (line (13)):
∀y∈Z∃1
x∈Z(s(x) = y).
Consequently (cf. Section 12.7), we may give a name to such an x, uniquely310 Numbers and arithmetic in λD
existing as a companion for each y in Z. Clearly, this x is the predecessor of y,
which we call p(y) (see line (14)).
Then ι-prop (see Figure 12.16, line (2)) immediately gives: s(p(y)) = y
(line (15)), and an easy consequence is that also p(s(y)) = y (line (17)). Hence,
successor and predecessor cancel each other, which is obvious since p is the
inverse of s. We call this s-p-annihilation and p-s-annihilation, respectively.
(1) Z := ⊥ ⊥ : ∗s
(2) 0 := ⊥ ⊥ : Z
(3) s := ⊥ ⊥ : Z → Z
(4) ax-int1 := ⊥ ⊥ : bijective(Z,Z,s)
(5) inj-suc := ... use ∧ -el1 ... : injective(Z,Z,s)
(6) surj-suc := ... use ∧ -el2 ... : surjective(Z,Z,s)
y : Z
(7) a7(y) := surj-suc y : ∃≥1
x : Z. (sx =Z y)
x1,x2 : Z | u : sx1 =Z y | v : sx2 =Z y
(8) a8(...) := eq-sym(Z,sx2,y,v) : y =Z sx2
(9) a9(...) := eq-trans(Z,sx1,y,sx2,u,a8(...)) : sx1 =Z sx2
(10) a10(...) := inj-suc x1 x2 a9(...) : x1 =Z x2
(11) a11(y) := ... use ⇒-in and ∀-in ... : ∃≤1
x : Z. (sx =Z y)
(12) a12(y) := ... use ∧-in on a7(y) and a11(y) ... :
∃1
x : Z. (sx =Z y)
(13) a13 := ... use ∀-in ... : ∀y : Z. ∃1
x : Z. (sx =Z y)
(14) p := λy : Z. ι(Z,λx : Z. (sx =Z y),a12(y)) : Z → Z
y : Z
(15) s-p-ann(y) := ι-prop(Z,λx : Z. (sx =Z y),a12(y)) : s(py) =Z y
(16) a16(y) := s-p-ann(sy) : s(p(sy)) =Z sy
(17) p-s-ann(y) := inj-suc (p(sy))y a16(y) : p(sy) =Z y
Figure 14.3 A formal set-up for integer numbers in λD and some consequences
In Appendix B we give a list of the interesting statements and lemmas
dealt with in the present chapter, starting with the ones in Figure 14.3.
We obviously also want an axiom about induction for the integers, ax-int2,
which replaces ax-nat3 in Figure 14.1. For Z we need the so-called ‘symmetric
induction’ axiom, extending the usual induction axiom in ‘both directions’:
apart from the prerequisites P(0) and ∀x∈Z(P(x) ⇒ P(s(x))), we also require14.2 Introducing integers the axiomatic way 311
the implication in the ‘opposite’ direction: ∀x∈Z(P(x) ⇒ P(p(x))). Only then,
one is allowed to conclude the universal validity of P on Z. This leads to the
following induction axiom for Z (compare it with the induction axiom for N as
given in the previous section):
axiom of induction for Z: for all predicates P on Z,
[P(0) ∧ ∀x∈Z(P(x) ⇒ (P(s(x)) ∧ P(p(x))))] ⇒ ∀x∈Z(P(x)).
We introduce this as a primitive proposition in Figure 14.4, with proof object
ax-int2.
P : Z → ∗p
ax-int2(P) := ⊥ ⊥ :
[P 0 ∧ ∀x : Z. (P x⇒(P(sx) ∧ P(px)))] ⇒ ∀x : Z. P x
Figure 14.4 The induction axiom for integer numbers
Remark 14.2.1 In this axiom, the ‘starting point’ of the induction is 0, since
we must have P 0. But any other integer number than 0 would do as well. Prove
this variant of induction for Z yourself (Exercise 14.18).
Next, we single out the integers from 0 ‘upwards’, the natural numbers, as
a subset N of Z. This asks for one deﬁnition and an axiom, as expressed in
Figures 14.5 and 14.6.
In line (2) of Figure 14.5, we present N as a predicate over Z (i.e. a subset),
by means of a deﬁnition:
N := λx : Z. ΠP : Z → ∗p . (nat-cond(P) ⇒ P x).
We explain what this deﬁnition expresses. First, we look at the condition
nat-cond := P 0 ∧ ∀y : Z. (P y ⇒ P(sy))
occurring in N. If nat-cond holds for P, then, in particular, 0 and all its suc-
cessors satisfy P. This implies intuitively that P contains all natural numbers.
Now the above deﬁnition says that N satisﬁes x if all predicates P over Z
satisfying nat-cond also satisfy x. Hence, under the subset-interpretation, N is
included in all P’s that satisfy nat-cond.
Remark 14.2.2 If we imagine Z in the usual manner as a straight line, inﬁ-
nite in both directions, then each predicate P that satisﬁes nat-cond represents
an interval [x,∞), i.e. a set of integers greater than or equal to a certain x.
Since 0 is an element of all these P’s, we always have x ≤ 0. The predicate N
is the intersection of all these P.
It is not hard to prove that N itself satisﬁes nat-cond, since N0 holds and
∀x : Z. (Nx ⇒ N(sx)) (Exercise 14.2). See lines (3) and (4) of Figure 14.5.312 Numbers and arithmetic in λD
(Recall that x ε N is an alternative notation for Nx; see Figure 13.1.) It follows
in line (6) that N is the smallest subset of Z satisfying nat-cond (Exercise 14.3).
P : Z → ∗p
(1) nat-cond(P) := P 0 ∧ ∀x : Z. (P x ⇒ P(sx)) : ∗p
(2) N := λx : Z. ΠP : Z → ∗p . (nat-cond(P) ⇒ P x) : Z → ∗p
(3) zero-prop := ... [Exerc. 14.2(a)] ... : 0 ε N
(4) clos-prop := ... [Exerc. 14.2(b)] ... : ∀x : Z. (x ε N ⇒ sx ε N)
(5) a5 := ... use ∧ -in ... : nat-cond(N)
(6) nat-smallest := ... [Exerc. 14.3] ... :
ΠQ : Z → ∗p . (nat-cond(Q) ⇒ (N ⊆ Q))
Figure 14.5 The natural numbers as a subset of Z
There is still one fundamental problem with the formal presentation of Z
as given up to now: it does not enforce that this Z conforms to the intuitive
‘picture’ of Z, in which it stretches out inﬁnitely to the right and to the left –
without loops or repetitions. There are models (i.e. mathematical structures)
satisfying the formal axioms of Z as we have presented so far that do not comply
with this picture. For example, every ﬁnite set satisﬁes the above formalisation,
if we choose one element as representing 0 and let the successor function s
‘rotate’ through this set. Take e.g. S ≡ {a,b,c,d}, take a = 0 and s such that
s(a) = b, s(b) = c, s(c) = d and s(d) = a, again. Then 0 is in S, the function s
is bijective and symmetric induction holds. So S is a model of the axioms of Z
we have given so far. In this model, the N as deﬁned above coincides with Z.
This means that our formalisation so far does not capture the integers as we
imagine them. So we have to do something about it. The solution is simple,
as follows from Margaris (1961) and Visser and Iemhoﬀ (2009): add one extra
axiom to the eﬀect that p0, the predecessor of 0, is not in N. This prevents
loops as above, and ﬁnite models in general (Exercise 14.4).
And this is what we do in Figure 14.6.
ax-int3 := ⊥ ⊥ : ¬(p0 ε N)
Figure 14.6 The third axiom for natural numbers
So now we have the integers (expressions of type Z), the natural numbers
(being those n of type Z for which n ε N)) and the negative integers (the n of
type Z for which ¬(n ε N)).14.3 Basic properties of the ‘new’ N 313
## 14.3 Basic properties of the ‘new’ N
The next thing that we have to do is to convince ourselves that the Peano-
axioms (see Figure 14.1) ‘hold’ for the new N.
Let’s consider them one by one:
ax-nat1: ∀x : N. ¬(sx =N 0).
In the new setting, this expression becomes: ∀x : Z. (x ε N ⇒ ¬(sx =Z 0)).
This is easy to prove: let x : Z, assume x ε N. If sx =Z 0, then p(sx) =Z p0,
hence x =Z p0 (since p and s annihilate each other; Figure 14.3, line (17)). It
follows that p0 ε N, contradicting ax-int3. So ¬(sx =Z 0). (Fill in the details
by giving the corresponding λD-derivation.)
The next Peano-axiom is:
ax-nat2: ∀x : N. ∀y : N. (sx =N sy ⇒ x =N y).
This becomes: ∀x,y : Z. (x ε N ⇒ (y ε N ⇒ (sx =Z sy ⇒ x =Z y))), which
follows directly from ax-int1 (cf. line (5) in Figure 14.3).
We record the Z-equivalents of ax-nat1 and ax-nat2, being theorems now,
as nat-prop1 and nat-prop2 in Figure 14.7. (We omit the corresponding proof
objects.)
(1) nat-prop1 := ... : ∀x : Z. (x ε N ⇒ ¬(sx =Z 0))
(2) nat-prop2 := ... : ∀x,y : Z. (x ε N ⇒ (y ε N ⇒ (sx =Z sy ⇒ x =Z y)))
Figure 14.7 The ﬁrst two Peano-axioms for N in the new setting
Finally, we have the third Peano-axiom:
ax-nat3(induction): for all predicates P of type N → ∗p:
(P 0 ∧ ∀x : N. (P x ⇒ P(sx))) ⇒ ∀x : N. P x.
First, we note that the type N → ∗p, which is Πx : N. ∗p, is not available
now (N is no longer a type, so Π-abstraction over N is not permitted).
In the present setting, all predicates must be over the type of the integers.
For predicates over N, we apply the solution developed in the beginning of Sec-
tion 13.2: we include the condition x ε N in the body of the two ∀-expressions.
This leads to the following rephrasing of the induction axiom:
induction for N as subset of Z: for all predicates P of type Z → ∗p:
(P 0 ∧ ∀x : Z. (x ε N ⇒ (P x ⇒ P (sx)))) ⇒ ∀x : Z. (x ε N ⇒ P x).
Again, it is not necessary to formulate this as an extra axiom, because it is
a theorem: it can be derived from our axioms for integers and the deﬁnition
of N. The proof is given in Figure 14.8.314 Numbers and arithmetic in λD
The start is familiar by now: we raise a ﬂag with an arbitrary P and a
second one assuming the left-hand side of the main implication. We have to
prove the right-hand side of this implication, namely ∀x : Z. (x ε N ⇒ P x).
However, assuming an x of type Z such that x ε N does not immediately lead
to the desired result P x: an obvious option is to use the deﬁnition of N for
this x and P, but this does not work. The reason is that the deﬁnition of N
has ∀x : Z. (P x ⇒ P(sx)) in its ‘condition’, whereas we have in the second
ﬂag the weaker statement ∀x : Z. (x ε N ⇒ (P x ⇒ P(sx))).
The solution that works is to ‘upgrade’ the predicate P by adding z ε N,
and consider the predicate Q := λz : Z. (z ε N ∧ P z) (see line (1) of the
derivation), for which we can prove ∀x : Z. (Qx ⇒ Q(sx)) (line (11)). This
enables us to apply the deﬁnition of N (see line (13), where w inhabits Nx).
The remainder of the proof is mainly technique.
P : Z → ∗p
(1) Q†
:= λz : Z. (z ε N ∧ P z) : Z → ∗p
u : P 0 ∧ ∀x : Z. (x ε N ⇒ (P x ⇒ P(sx)))
(2) a2 := ... use ∧ -el1 on u ... : P 0
(3) a3 := ... use ∧ -el2 on u ... : ∀x : Z. (x ε N ⇒ (P x ⇒ P(sx)))
(4) a4 := ... use ∧ -in on zero-prop and a2 ... : Q0
y : Z | v : Qy
(5) a5 := ... use ∧ -el1 on v ... : y ε N
(6) a6 := ... use ∧ -el2 on v ... : P y
(7) a7 := clos-prop y a5 : sy ε N
(8) a8 := a3 y a5 : P y ⇒ P(sy)
(9) a9 := a8 a6 : P(sy)
(10) a10 := ... use ∧ -in on a7 and a9 ... : Q(sy)
(11) a11 := ... use ⇒ -in and ∀-in ... : ∀y : Z. (Qy ⇒ Q(sy))
(12) a12 := ... use ∧ -in on a4 and a11 ... : nat-cond(Q)
x : Z | w : x ε N
(13) a13 := w Q a12 : Qx
(14) a14 := ... use ∧ -el2 on a13 ... : P x
(15) a15 := ... use ⇒ -in and ∀-in ... : ∀x : Z. (x ε N ⇒ P x)
(16) nat-ind(P) := ... use ⇒ -in on a15 ... :
(P 0 ∧ ∀x : Z. (x ε N ⇒ (P x ⇒ P(sx)))) ⇒ ∀x : Z. (x ε N ⇒ P x)
†
parameters suppressed
Figure 14.8 Induction over the natural numbers14.3 Basic properties of the ‘new’ N 315
So we have adapted versions of all three Peano-axioms for natural numbers
available as theorems in Z, with proofs nat-prop1, nat-prop2 (see Figure 14.7)
and nat-ind (Figure 14.8, line (16)).
We recall an important property of natural numbers, given in Lemma 14.1.4:
for all n ∈ N we have n = 0 or ∃m∈N(n = s(m)). Obviously, we now may replace
the part ∃m∈N(n = s(m)) by p(n) ∈ N.
In order to make this formal, we again quantify over Z (not over N) and
add n ε N as a condition. This leads to the following λD-reformulation of
Lemma 14.1.4:
Lemma 14.3.1 ∀x : Z. (x ε N ⇒ (x =Z 0 ∨ px ε N)).
A proof of this lemma uses nat-ind (see Figure 14.8). For the predicate P
we take:
P := λx : Z. (x =Z 0 ∨ px ε N),
since induction for N as a subset of Z, which we described above, eventually
leads to ∀x : Z. (x ε N ⇒ P x), and this is the content of Lemma 14.3.1 after
substitution of P.
A formal proof in λD, following these lines, is not too hard. We leave it to
the reader (Exercise 14.5). In order to be able to give a formal reference to
Lemma 14.3.1, we register the λD-version (without proof object) under the
name nat-split in line (1) of Figure 14.9.
Using elementary logic, we can rewrite this as in line (2). Since we may view
px ε N as ‘x is positive’, and ¬(x ε N) as ‘x is negative’, line (2) expresses
that an integer is negative, zero or positive. This is known as the tripartition
property of the integers. See line (5) of Figure 14.9.
(1) nat-split := ... : ∀x : Z. (x ε N ⇒ (x =Z 0 ∨ px ε N))
(2) nat-split-alt := ... : ∀x : Z. (¬(x ε N) ∨ x =Z 0 ∨ px ε N)
x : Z
(3) pos(x) := px ε N
(4) neg(x) := ¬(x ε N)
(5) trip := nat-split-alt : ∀x : Z. (neg(x) ∨ x =Z 0 ∨ pos(x))
Figure 14.9 Positive and negative numbers, and the tripartition property
Below, we list a number of useful lemmas about positive and negative num-
bers. The proofs are left to the reader (Exercise 14.7). By combining parts (a)
and (b) of Lemma 14.3.2, we see that the ‘⇒’ in nat-split can be replaced by
a ‘⇔’.316 Numbers and arithmetic in λD
Lemma 14.3.2 (a) ∀x : Z. (pos(sx) ⇔ x ε N),
(b) ∀x : Z. (pos(sx) ⇔ (x =Z 0 ∨ pos(x))),
(c) ∀x : Z. (neg(px) ⇔ (x =Z 0 ∨ neg(x))).
Lemma 14.3.3 implies that the disjunctions in trip are ‘exclusive’: an integer
is either negative, or 0, or positive.
Lemma 14.3.3 (a) ∀x : Z. (pos(x) ⇔ x =Z 0 ∧ ¬neg(x)),
(b) ∀x : Z. (neg(x) ⇔ x =Z 0 ∧ ¬pos(x)),
(c) ∀x : Z. (x =Z 0 ⇔ ¬pos(x) ∧ ¬neg(x)).
## 14.4 Integer addition
Now that we have formalised the integers in λD, with the naturals as a subset,
the next thing is to investigate how arithmetical operations can be formalised
for these numbers, since we want to compute with them. Our ﬁrst aim is
addition: the computation of a sum of two numbers. Usually, computational
operations are introduced by means of a recursive deﬁnition. That’s also the
case with addition.
Let’s consider the recursive deﬁnition for adding two natural numbers. The
standard approach is the following. In order to compute x + y, one uses recur-
sion over the second argument, i.e. y. (This is an arbitrary choice: it could just
as well be the ﬁrst argument.) One then distinguishes two cases for this argu-
ment, in accordance with Lemma 14.1.4: it may be either 0 or the successor of
another natural number (see also nat-split in Figure 14.9).
The standard recursive deﬁnition then has the following shape:
(i) m + 0 = m,
(ii) m + s(n) = s(m + n).
We do an example to see how this works.
Example 14.4.1 For the computation of the sum 2 + 3, or, more precisely,
s(s(0)) + s(s(s(0))), we obtain from (ii) that
2 + 3 = s(s(0)) + s(s(s(0))) = s[s(s(0)) + s(s(0))].
(In the third expression we use one pair of square brackets, for clarity.)
Repetition of the procedure on s(s(0)) + s(s(0)) results in s[s(s(0)) + s(0)],
hence 2 + 3 = s(s[s(s(0)) + s(0)]).
One step further, we get 2 + 3 = s(s(s[s(s(0)) + 0])).
Then, ﬁnally, we use (i) for the computation of the subexpression s(s(0))+0.
Hence, 2 + 3 = s(s(s(s(s(0))))), which is 5 by deﬁnition; so altogether we get
2 + 3 = 5, just as expected.
Note that we have used substitutivity and transitivity of = in this calcula-
tion.14.4 Integer addition 317
Since the number m in (i) and (ii) does not change in the recursion, we can
view this recursive deﬁnition as a family of many unary +-operations, one for
each m ∈ N. To make this explicit, we write down the recursive equations for
each of these +m-operations separately, as follows:
(i) +m(0) = m,
(ii) +m(s(n)) = s(+m(n)).
Hence, the recursive equations tell us, for ﬁxed m, what function +m does
with n:
− in (i), the case n = 0 is given;
− in (ii), the situation for n is ‘scaled up’ to the situation for s(n): if we know
what +m does with n, then the equation tells us the eﬀect on s(n).
The word ‘recursion’ literally refers to the reverse process: not scaling ‘up’,
but scaling ‘down’. (Recursion literally means ‘walking back’.) This is how an
actual computation works. In the example above, for the computation of +2(3),
we need (by (ii)) to compute +2(2). But in order to compute this +2(2), we
need +2(1). Finally we have to compute +2(0); for this, (i) gives an answer.
So the recursion stops and delivers a result.
Remark 14.4.2 Characteristic for recursive deﬁnitions is that the deﬁniens
occurs left and right of the deﬁnitional =-sign. See equation (ii), where the +m
occurs on both sides. So the function +m is not expressed as a ‘new’ symbol:
it is deﬁned in terms of itself.
It is essential for recursion that the process comes to a halt. When the re-
cursion stops, there should be a unique ‘outcome’, in which the deﬁniens is no
longer present. In general, this requires a so-called well-founded recursion. Such
a well-founded recursion delivers a ‘proper’ function as a result – in this case:
an operator +m that gives a unique answer when applied to an argument n.
Until now, we have silently assumed that m and n are natural numbers.
It will be clear that the same recursive equations also apply to integers, but
they apparently do not suﬃce. The scheme above appears to be tailored for
‘upwards’ counting from 0 via (ii): +m(1) = s(+m(0)), +m(2) = s(+m(1)),
etcetera. When extending m and n to the integers, it is not immediately clear
what +m does when applied to a negative number.
Since we want to be able to add integer numbers, our ﬁrst impulse is to add
a third entry to the recursion scheme, allowing ‘downwards’ counting:
(iii) m + p(n) = p(m + n).
However, this turns out to be superﬂuous, since (iii) is a consequence of (ii),
as we show now. Assume (ii) m+s(n) = s(m+n)). Since this equation holds
for all n, also m + s(p(n)) = s(m + p(n)). By s-p-ann, m + n = s(m + p(n)),
so p(m + n) = p(s(m + p(n))), which is m + p(n) by p-s-ann.318 Numbers and arithmetic in λD
So also for Z, equations (i) and (ii) are enough.
To incorporate deﬁnitions such as +m by well-founded recursion (see Re-
mark 14.4.2; see also Exercise 14.9) into the format of λD, we need a kind
of Recursion Theorem for Z. Such a theorem indeed exists, as an immediate
generalisation of the Recursion Theorem for natural numbers (see van Dalen
et al., 1978). Both theorems, the original one and the generalised one, are
provable in λD with the formalised knowledge that we have developed in the
previous sections and chapters. We do not demonstrate this here because of
the complexity of the proofs. See Geuvers (2014b) for details.
The theorem for Z reads as follows:
Theorem 14.4.3 (Recursion Theorem for Z)
Let A be a type, a : A and let f1,f2 : A → A.
Then there exists exactly one function g : Z → A such that
− g 0 =A a,
− g(sx) =A f1(g x) if x : Z and pos(sx),
− g(px) =A f2(g x) if x : Z and neg(px).
Let’s investigate the content of the theorem. For the unique g that must
exist according to this theorem, we have:
g 0 =A a,
g 1 =A g(s0) =A f1(g 0) =A f1 a since s0 is positive,
g 2 =A g(s1) =A f1(g 1) =A f1(f1 a), etcetera.
How about g(k) for negative k?
g(−1) =A g(p0) =A f2(g 0) =A f2(a) since p0 is negative,
g(−2) =A ... =A f2(f2 a), etcetera.
So a is the value of g in 0, function f1 provides the g-values for positive
numbers and f2 for negative numbers. The theorem says that the recursive
process produces a unique g-value for each integer, so g is indeed a function
on Z.
Remark 14.4.4 Theorem 14.4.3 enables one to recursively deﬁne a function
with diﬀerent descriptions for positive and negative numbers. For example, the
absolute-value-function abs, with
abs(x) :=

x if x ≥ 0,
−x if x < 0,
can easily be deﬁned by means of the Recursion Theorem for Z (Exercise 14.6).
Although we give no proof of Theorem 14.4.3, we state it in λD, under the
name spec-rec-th, but without a proof object (see Figure 14.10).14.4 Integer addition 319
A : ∗s | a : A | f1,f2 : A → A
spec-rec-th(A,a,f1,f2) := ... :
∃1
g : Z → A. [g 0 =A a ∧
∀x : Z. [(pos(sx) ⇒ (g(sx) =A f1(g x))) ∧
(neg(px) ⇒ (g(px) =A f2(g x))) ]]
Figure 14.10 The Recursion Theorem for Z in λD
When recursively deﬁning addition +m as we have done above, we apparently
have to take Z for A, integer m for a, the successor function s for f1 and the
predecessor function p for f2. The Recursion Theorem for Z then states that
there exists exactly one g : Z → Z such that
– g 0 =Z m,
– ∀x : Z. (pos(sx) ⇒ g(sx) =Z s(g x)) and
– ∀x : Z. (neg(px) ⇒ g(px) =Z p(g x)).
By giving the name +m to this g, we get what we want, albeit that we like
to omit the conditions ‘pos(sx)’ and ‘neg(px)’, respectively. This is indeed
permitted, because s is a bijection according to ax-int1, and function p is
the inverse of function s. What we thus obtain is a restricted version of the
Recursion Theorem for Z:
Theorem 14.4.5 (Recursion Theorem for Z, with bijection)
Let A be a type, a : A and f : A → A, a bijection.
Then there exists exactly one function g : Z → A such that
− g 0 =A a,
− g(sx) =A f(g x) for all x : Z.
This theorem is an immediate consequence of Theorem 14.4.3: given a bijec-
tive f, take f1 := f and f2 := f−1 in that theorem (see Exercise 14.10).
The restricted theorem is suitable for the addition operator +m, since s is a
bijection. It permits applying the simple recursion scheme that we had before,
when taking m for a, function s for f and writing +m for g:
− +m 0 =Z m,
− ∀x : Z. (+m(sx) =Z s(+m x)).
Formally, we can express this as in Figure 14.11. For convenience’s sake,
in line (2) we have given a name to the predicate involved: rec-add-prop(m).
In line (4), the function plus(m) is deﬁned as the function that satisﬁes the
predicate, i.e. the unique function satisfying the properties plus(m)0 = m
and, for all integers n, plus(m)(s(n)) = s(plus(m)n). By means of a Notation
Convention, we introduce +m as notation for plus(m).320 Numbers and arithmetic in λD
(1) a1 := ax-int1 : bijective(Z,Z,s)
m : Z
(2) rec-add-prop(m) := λg : Z → Z. (g 0 =Z m ∧ ∀x : Z. (g(sx) =Z s(g x))) :
(Z → Z) → ∗p
(3) rec-add-lem(m) := ... use Theorem 14.4.5... :
∃1
g : Z → Z. (rec-add-prop(m) g)
(4) plus(m) := ι(Z → Z,rec-add-prop(m),rec-add-lem(m)) : Z → Z
Notation : +m for plus(m)
Figure 14.11 Addition +m : Z → Z in λD
Now we are in the position to deﬁne the binary plus-operation; see line (1) of
Figure 14.12. In lines (2) and (3), the recursive equations for + are expressed,
which can be derived since +m has been deﬁned as the function satisfying
rec-add-prop. Line (4) contains the consequence that we have discussed above.
We leave the proof terms in lines (2) to (4) to the reader (Exercise 14.11).
(1) + := λx : Z. λy : Z. (+x y) : Z → Z → Z
Notation : x + y for + xy
x : Z
(2) plus-i(x) := ... : x + 0 =Z x
y : Z
(3) plus-ii(x,y) := ... : x + sy =Z s(x + y)
(4) plus-iii(x,y) := ... : x + py =Z p(x + y)
Figure 14.12 Properties of addition in Z, formalised in λD
## 14.5 An example of a basic computation in λD
In order to show how computations are executed on this fundamental level, we
give a formal λD-proof for the statement that 1+2 equals 3. This is not simple
(see Figure 14.13). For eq-reﬂ, eq-trans and eq-cong1, see Figures 12.2, 12.12
and 12.5, respectively.
In the proof, there are only three really interesting lines, namely lines (2), (4)
and (5), in which we appeal to the two deﬁnition lines for addition, with con-
stants plus-i and plus-ii (see Figure 14.12). The other eight lines in the proof
are meant to establish the necessary ‘administration’ related to the naming of
numbers 1, 2 and 3, and to the use of reﬂexivity, transitivity and congruence
as properties of equality.14.5 An example of a basic computation in λD 321
Notation 14.5.1 Since equality of numbers concerns integers only in the
remainder of this book, we simply write ‘=’ instead of ‘=Z’ in the λD-texts to
come.
(i) 1 := s0 : Z
(ii) 2 := s1 : Z
(iii) 3 := s2 : Z
(1) a1 := eq-reﬂ(Z,1 + 2) : 1 + 2 = 1 + s1
(2) a2 := plus-ii(1,1) : 1 + s1 = s(1 + 1)
(3) a3 := eq-reﬂ(Z,s(1 + 1)) : s(1 + 1) = s(1 + s0)
(4) a4 := eq-cong1(Z,Z,s,1 + s0,s(1 + 0),plus-ii(1, 0)) :
s(1 + s0) = s(s(1 + 0))
(5) a5 := eq-cong1(Z,Z,λn : Z. s(s(n)),1 + 0,1,plus-i(1)) :
s(s(1 + 0)) = s(s1)
(6) a6 := eq-reﬂ(Z,s(s1)) : s(s(1)) = 3
(7) a7 := eq-trans(Z,1 + 2,1 + s1,s(1 + 1),a1,a2) : 1 + 2 = s(1 + 1)
(8) a8 := eq-trans(Z,1 + 2,s(1 + 1),s(1 + s0),a7,a3) : 1 + 2 = s(1 + s0)
(9) a9 := eq-trans(Z,1 + 2,s(1 + s0),s(s(1 + 0)),a8,a4) : 1 + 2 = s(s(1 + 0))
(10) a10 := eq-trans(Z,1 + 2,s(s(1 + 0)),s(s1),a9,a5) : 1 + 2 = s(s1)
(11) a11 := eq-trans(Z,1 + 2,s(s1),3,a10,a6) : 1 + 2 = 3
Figure 14.13 A proof in λD that 1 + 2 = 3
A condensed version of the proof reads as follows:
1+2
(1)
= 1+s1
(2)
= s(1+1)
(3)
= s(1+s0)
(4)
= s(s(1+0))
(5)
= s(s(1))
(6)
= 3.
The lines (1), (3) and (6) use reﬂexivity of equality, together with the deﬁ-
nitions in lines (i) to (iii), which imply that
− s1
Δ
= 2, hence 1 + 2 = 1 + s1,
− 1
Δ
= s0, hence s(1 + 1) = s(1 + s0), and
− s(s(1))
Δ
= 3, respectively.
The underlying derivation rule is (conv) in all three cases.
The conclusions based on the transitivity of equality (lines (7) to (11)) are
straightforward – albeit annoying.
Remark 14.5.2 A human text writer would immediately (even without men-
tioning this) infer A = G from the chain of equalities A = B = C = D = E =
F = G (see above).
But formally, we have to do this step by step:
− from A = B and B = C, follows A = C (line (7));322 Numbers and arithmetic in λD
− from A = C and C = D, follows A = D (line (8)); and so on, until
− from A = F and F = G, follows A = G (line (11)).
This makes the derivation in Figure 14.13 rather lengthy.
It might help to generalise transitivity (eq-trans) to several lemmas for many-
fold transitivity, expressing e.g. that:
− Lemma eq-trans-4. From A = B = C = D follows A = D;
− Lemma eq-trans-5. From A = B = C = D = E follows A = E; and so on,
to a reasonable limit.
(Find out yourself how, for example, eq-trans-4 can be deﬁned by a double
use of eq-trans.)
With eq-trans-7, we can condense lines (7) to (11) into one line, of the form:
eq-trans-7(...) : 1 + 2 = 3.
## 14.6 Arithmetical laws for addition
We continue with an exposition in λD-style of several arithmetical laws con-
cerning addition. First, as a preparation for the proof that + is a commutative
operation, we establish the ‘reversals’ of plus-i, plus-ii and plus-iii as deﬁned
in Figure 14.12. The proofs of parts (a) and (b) are by (symmetric) induction,
hence based on the axiom ax-int2 (Figure 14.4) for integers. In order to give a
good impression of how this symmetric induction works, we spell out these in-
duction proofs in words. We leave it to the reader to provide the corresponding
λD-proofs.
Lemma 14.6.1 (a) ∀x : Z. (0 + x = x),
(b) ∀x,y : Z. (sx + y = s(x + y)),
(c) ∀x,y : Z. (px + y = p(x + y)).
Proof (a) We use symmetric induction for integers.
Take P ≡ λx : Z. (0 + x = x), then:
(1) P 0 because 0 + 0 = 0 by plus-i.
(2) Induction hypothesis: P x, i.e. 0 + x = x.
Then P(sx), since 0 + sx = s(0 + x) = sx, by plus-ii and the induction
hypothesis, respectively.
Also P(px), since 0 + px = p(0 + x) = px, by plus-iii and the induction
hypothesis.
Hence: ∀x : Z. (P x ⇒ (P(sx) ∧ P(px))).
Final conclusion by ax-int2: ∀x : Z. (P x), i.e. ∀x : Z. (0 + x = x).
(b) Let x be ﬁxed in Z. We proceed by symmetric induction on y in Z. Let
Q := λy : Z. (sx + y = s(x + y)). Then:14.6 Arithmetical laws for addition 323
(1) Q0, since sx + 0 = sx = s(x + 0) by plus-i (twice).
(2) Induction hypothesis: Qy, i.e. sx + y = s(x + y).
Then Q(sy), since sx + sy = s(sx + y) = s(s(x + y)) = s(x + sy), by
plus-ii, induction hypothesis and plus-ii, respectively.
Also Q(py), since on the one hand: sx + py = p(sx + y) = p(s(x + y)) =
x + y by plus-iii, induction hypothesis and p-s-annihilation. On the other
hand: s(x+py) = s(p(x+y)) = x+y, by plus-iii and s-p-annihilation. It
follows that sx + py = s(x + py), i.e. Q(py).
Hence ∀y : Z. (Qy ⇒ (Q(sy) ∧ Q(py))).
Conclusion by induction (ax-int2): ∀y : Z. (sx + y = s(x + y)).
Final conclusion by ∀-in: ∀x,y : Z. (sx + y = s(x + y)).
(c) We have shown in Section 14.4 that +m(pn) = p(+m(n)) is a conse-
quence of +m(sn) = s(+m(n)). Similarly, ∀x,y : Z. (px + y = p(x + y)) is a
consequence of (b) (show it yourself).
We leave it to the reader (Exercise 14.12(a)) to give a proof of the commu-
tativity of addition; that is:
Lemma 14.6.2 ∀x,y : Z. (x + y = y + x).
We give two more properties of addition:
Lemma 14.6.3 (a) ∀x,y : Z. (px + sy = x + y),
(b) ∀x,y : Z. (sx + py = x + y).
Proof (a) We have: px + sy = p(x + sy) = p(s(x + y)) = x + y, by
Lemma 14.6.1(c), plus-ii and annihilation.
(b) Prove it yourself.
Addition is also associative:
Lemma 14.6.4 ∀x,y,z : Z. (x + (y + z) = (x + y) + z).
The proof of associativity is straightforward and therefore omitted. Do it
yourself (Exercise 14.12(b)).
We continue with the so-called Cancellation Laws, which allow us to ‘strike
out’ an identical added value at both sides of an equality:
Lemma 14.6.5 (Cancellation Laws for addition)
(a) (Right Cancellation) ∀x,y,z : Z. (x + z = y + z ⇒ x = y),
(b) (Left Cancellation) ∀x,y,z : Z. (x + y = x + z ⇒ y = z).
A proof of the Right Cancellation Law is left to the reader (Exercise 14.12(c)).
The Left Cancellation Law then follows directly from the commutativity of ad-
dition (Lemma 14.6.2).324 Numbers and arithmetic in λD
Note that the converses of both Cancellation Laws also hold:
∀x,y,z : Z. (x = y ⇒ x + z = y + z)
and
∀x,y,z : Z. (y = z ⇒ x + y = x + z),
since both are a consequence of the congruence property of functions (see
Figure 12.6).
We list most of the extra results obtained in this section, in λD-format but
without proof objects, in Figure 14.14.
x : Z
(1) plus-i-alt(x) := ... : 0 + x = x
y : Z
(2) plus-ii-alt(x,y) := ... : sx + y = s(x + y)
(3) plus-iii-alt(x,y) := ... : px + y = p(x + y)
(4) comm-add(x,y) := ... : x + y = y + x
z : Z
(5) assoc-add(x,y,z) := ... : x + (y + z) = (x + y) + z
(6) right-canc-add(x,y,z) := ... : x + z = y + z ⇒ x = y
(7) left-canc-add(x,y,z) := ... : x + y = x + z ⇒ y = z
Figure 14.14 More properties of addition in Z
## 14.7 Closure under addition for natural and negative numbers
We now focus on an important property of addition for elements of the subset
N, namely the nice property that N is closed under addition; that is:
Lemma 14.7.1 (Closure of N under addition)
∀x,y : Z. ((x ε N ∧ y ε N) ⇒ x + y ε N).
Proof The proof is by induction for the natural numbers (nat-ind; see Fig-
ure 14.8). We take x ﬁxed and apply induction on y. Therefore we ﬁrst re-
formulate Lemma 14.7.1 in order to facilitate induction (check that the two
expressions are equivalent):
To prove: ∀x : Z. (x ε N ⇒ ∀y : Z. (y ε N ⇒ x + y ε N)).
So take x of type Z ﬁxed, and assume x ε N. To prove:
∀y : Z. (y ε N ⇒ x + y ε N).
For the proof by induction on y, we consider an appropriate induction pred-
icate, viz. P := λy : Z. (x + y ε N).
We now obtain:14.7 Closure under addition for natural and negative numbers 325
(1) P 0, since x + 0 = x and x ε N, by assumption.
(2) Let y : Z such that y ε N and P y. To prove: P(sy). Now P y means
x+y ε N; then also s(x+y) ε N by clos-prop (Figure 14.5), so x+sy ε N,
which is P(sy).
Hence, ∀y : Z. (y ε N ⇒ (P y ⇒ P(sy))).
By nat-ind we may conclude that ∀y : Z. (y ε N ⇒ P y), as desired.
We formalise this proof and its conclusion in Figure 14.15, in the style to
which we are now used: many proof objects are not actually given, but only
hinted at. Note that P depends on the ‘ﬁxed’ x: the parameter list, (x), has
been suppressed in accordance with Notation 11.7.1.
x : Z
(1) P†
:= λy : Z. (x + y ε N) : Z → ∗p
u : x ε N
(2) a2 := ... use plus-i and eq-sym ... : x = x + 0
(3) a3 := ... use eq-subs on a2 and u ... : P 0
y : Z | v : y ε N
w : P y
(4) a4 := clos-prop (x + y) w : s(x + y) ε N
(5) a5 := ... use plus-ii and eq-sym ... : s(x + y) = x + sy
(6) a6 := ... use eq-subs on a5 and a4 ... : P (sy)
(7) a7 := ... use ⇒-in twice, and ∀-in, on a6 ... :
∀y : Z. (y ε N ⇒ (P y ⇒ P (sy)))
(8) a8 := ... use ∧-in on a3 and a7, and ⇒-el on nat-ind(P) ... :
∀y : Z. (y ε N ⇒ x + y ε N)
(9) a9 := ... use ⇒-in and ∀-in on a8 ... :
∀x : Z. (x ε N ⇒ ∀y : Z. (y ε N ⇒ x + y ε N))
x,y : Z | u : x ε N | v : y ε N
(10) plus-clos-nat := a9 x u y v : x + y ε N
†
parameters suppressed
Figure 14.15 Closure property of addition in N
We also give the fully formalised version, so without hints and with complete
parameter lists. This we do in Appendix C, Section C.1. Thus we enable the
reader to compare the complete and the shortened versions.326 Numbers and arithmetic in λD
There is a companion to the closure of the natural numbers under addition,
namely the closure of the negative numbers under addition. In order to prove
this, we ﬁrst give the following characterisation of negative numbers:
Lemma 14.7.2 (Characterisation of negative numbers)
∀x : Z. (neg(x) ⇔ ∃y : Z. (pos(y) ∧ x + y = 0)).
We give the proof below as an extra exercise with symmetric induction for
integer numbers (see Figure 14.4). Since it is a bit involved, we suﬃce with a
proof in words.
Proof (Part I: left to right) ∀x : Z. (neg(x) ⇒ ∃y : Z. (pos(y) ∧ x+y = 0))?
The induction predicate P is λx : Z. (neg(x) ⇒ ∃y : Z. (pos(y)∧x+y = 0)).
(1) P 0? Yes, since 0 ε N, hence ¬(neg(0)).
(2) ∀x : Z. (P x ⇒ (P(sx) ∧ P(px)))? Assume x : Z and P x.
(a) To prove: P(sx).
So assume neg(sx). Is there a z : Z such that pos(z) and sx + z = 0?
Since neg(sx), also neg(p(sx)) (Lemma 14.3.2(c)), so neg(x). From the
induction hypothesis P x then follows: there is y : Z such that pos(y) and
x + y = 0, hence sx + py = 0 by Lemma 14.6.3(b).
It follows that py = 0, since otherwise sx = 0, contradicting neg(sx).
Lemma 14.3.2(b) implies (take py for x) that from pos(y) and py = 0 we can
infer that pos(py).
Hence, py is a witness showing that ∃z : Z. (pos(z) ∧ sx + z = 0).
(b) To prove: P(px).
So assume neg(px). Is there a z : Z such that pos(z) and px + z = 0?
We can use Lemma 14.3.2(c) to derive x = 0 ∨ neg(x). We continue with
using ∨-el:
Case x = 0: then px + s0 = x + 0 = 0 by Lemma 14.6.3(a), and pos(s0),
so s0 is a witness for ∃z : Z. (pos(z) ∧ px + z = 0).
Case neg(x): then by induction hypothesis P x there is y : Z such that
pos(y) and x + y = 0. Hence, pos(sy) (Lemma 14.3.2(b)) and px + sy = 0
(Lemma 14.6.3(a)), so sy is a witness for ∃z : Z. (pos(z) ∧ px + z = 0).
So altogether, with ∨-el we obtain ∃z : Z. (pos(z) ∧ px + z = 0).
(Part II: right to left) ∀x : Z. ((∃y : Z. (pos(y) ∧ x + y = 0)) ⇒ neg(x))?
Left to the reader (Exercise 14.13).
As a consequence, we have the closure property for negative integers:
Lemma 14.7.3 (Closure for negative integers)
∀x,y : Z. (neg(x) ∧ neg(y) ⇒ neg(x + y)).14.8 Integer subtraction 327
Proof Let x and y be negative integers. Then by Lemma 14.7.2:
− there is z1 : Z such that pos(z1) and x + z1 = 0, and
− there is z2 : Z such that pos(z2) and y + z2 = 0.
Use commutativity and associativity of addition to get (x+y)+(z1+z2) = 0.
From pos(z1) and pos(z2) follows pz1 ε N (so s(pz1) = z1 ε N by clos-prop)
and pz2 ε N. Hence, by Lemma 14.7.1, z1 + pz2 ε N, so p(z1 + z2) ε N, i.e.
pos(z1 + z2). It follows that there is z : Z (namely z1 + z2) such that pos(z)
and (x + y) + z = 0. So neg(x + y) by Lemma 14.7.2.
## 14.8 Integer subtraction
After we have studied addition for integers, it is natural to consider its inverse:
subtraction. Note that subtraction is easier for integers than for natural num-
bers: each pair of integers has a diﬀerence in Z, but not every pair of natural
numbers has a diﬀerence in N.
The diﬀerence of x and y in Z is a unique number, namely the number z
such that when y is added to it, gives x:
x − y := ιz:Z(z + y = x).
Since the ι is part of our λD-syntax (see Section 12.6), we deﬁne subtraction
in this manner, but ﬁrst we have to prove the uniqueness of such a z:
Lemma 14.8.1 (Uniqueness of diﬀerence)
∀x,y : Z. ∃1z : Z. (z + y = x).
We prove this lemma below in the informal style to which we are now used. (It
can be transformed relatively easily into a formal λD-derivation.) As expected,
we split the proof of this lemma into two parts: ﬁrst we show existence, then
uniqueness of existence.
Proof (Part I: Existence) ∀x,y : Z. ∃z : Z. (z + y = x)?
Take x in Z ﬁxed; we proceed by symmetric induction on y. As a shorthand,
we write P for λy : Z. ∃z : Z. (z + y = x). To prove: ∀y : Z. (P y).
(1) P 0? Since x+0 = x, we have by ∃-in that ∃z : Z. (z +0 = x). Hence P 0.
(2) ∀y : Z. (P y ⇒ (P(sy)∧P(py)))? Assume y : Z and P y. To prove: P(sy)
(i.e. ∃z : Z. (z + sy = x)) and P(py) (i.e. ∃z : Z. (z + py = x)).
We assumed P y, which means ∃z : Z. (z + y = x). Use ∃-el, or in words:
take a z in Z with z + y = x.
Now pz+sy = z+y and sz+py = z+y (see Lemma 14.6.3(b) and (c)).
Hence we found the z such that z +sy = x (viz. z = pz) and the z such
that z + py = x (viz. z = sz). Consequently P(sy) and P(py) hold, as
desired.328 Numbers and arithmetic in λD
Hence, by symmetric induction, ∀y : Z. (P y).
Final conclusion: ∀x,y : Z. ∃z : Z. (z + y = x).
(Part II: Uniqueness of existence) ∀x,y : Z. ∃1z : Z. (z + y = x)?
Let x and y be in Z. Assume z1 and z2 in Z such that z1+y = x and z2+y = x.
Obviously, z1+y = z2+y, so (by Right Cancellation, Lemma 14.6.5(a)) z1 = z2.
This implies the uniqueness of the z such that z+y = x (cf. Section 12.6).
The corresponding λD-proof is straightforward, but slightly involved because
of the instances of ∃-in and ∃-el. We shall not give it here.
Since x − y is the z in Z such that z + y = x, it follows from ι-prop (cf.
Figure 12.16) that x − y satisﬁes the last-mentioned equation; hence we have:
Lemma 14.8.2 ∀x,y : Z. ((x − y) + y = x).
The following counterpart is an easy consequence:
Lemma 14.8.3 ∀x,y : Z. ((x + y) − y = x).
Proof Since ((x+y)−y)+y = x+y by Lemma 14.8.2, the result follows by
Right Cancellation.
In Figure 14.16 we record all this in λD-format.
x : Z
y : Z
(1) uni-dif (x,y) := ... see Lemma 14.8.1 ... : ∃1
z : Z. (z + y = x)
(2) minus(x,y) := ι
uni-dif (x,y)
z:Z (z + y = x) : Z
Notation : x − y for minus(x,y)
(3) subtr-prop1 (x,y) := ι-prop(Z,λz : Z. (z + y = x),uni-dif (x,y)) :
(x − y) + y = x
(4) subtr-prop2 (x,y) := ... see Lemma 14.8.3 ... : (x + y) − y = x
Figure 14.16 Subtraction of integers
It follows from Lemma 14.8.2 that, for every x in Z: (x − x) + x = x. And
since we also know that 0 + x = x (Lemma 14.6.1(a)), we may conclude that
∀x : Z. ((x − x) + x = 0 + x), by symmetry and transitivity of =. Hence, by
Right Cancellation:
Lemma 14.8.4 ∀x : Z. (x − x = 0).
Another consequence of Lemma 14.8.2 is:
Lemma 14.8.5 ∀x : Z. (x − 0 = x).14.8 Integer subtraction 329
The proof is easy: x − 0 = (x − 0) + 0 = x, by plus-i and Lemma 14.8.2.
The same Lemma 14.8.2 can also be used for proofs of the following coun-
terparts of plus-ii and plus-iii:
Lemma 14.8.6 (a) ∀x,y : Z. (x − sy = p(x − y)),
(b) ∀x,y : Z. (x − py = s(x − y)).
Proof of part (a):
− First consider the left-hand side: x − sy. It is a subtraction, so its charac-
teristic property (cf. Lemma 14.8.2) is that adding sy to it delivers x:
(x − sy) + sy = x.
− Adding sy to the right-hand side of the equation gives p(x−y)+sy, which
may be rewritten by Lemmas 14.6.3(a) and 14.8.2 to:
p(x − y) + sy = (x − y) + y = x.
Combining this, we get that (x − sy) + sy = p(x − y) + sy, so by Right
Cancellation: x − sy = p(x − y).
The proof of part (b) is similar.
Counterparts of plus-ii-alt and plus-iii-alt are:
Lemma 14.8.7 (a) ∀x,y : Z. (sx − y = s(x − y)),
(b) ∀x,y : Z. (px − y = p(x − y)).
Prove this lemma yourself.
As a consequence (Exercise 14.15(a)), we have the following facts, which
will not come as a surprise (recall from Figure 14.13 that 1 has been deﬁned
as s0):
Lemma 14.8.8 (a) ∀x : Z. (x + 1 = sx),
(b) ∀x : Z. (x − 1 = px).
There are many arithmetical lemmas concerning addition and subtraction,
which can be proved using our deﬁnitions. Each new lemma, once proved,
has the potential to simplify proofs of further lemmas and theorems. If one
desires to formally develop a substantial body of arithmetic in λD-style, it is
worthwhile to formulate and prove a considerable number of these arithmetical
laws. (See also some of the exercises at the end of the present chapter.) An
example are the Cancellation Laws for subtraction, which are similar to the
ones for addition (Lemma 14.6.5):
Lemma 14.8.9 (Cancellation Laws for subtraction)
(a) (Right Cancellation) ∀x,y,z : Z. (x − z = y − z ⇒ x = y),
(b) (Left Cancellation) ∀x,y,z : Z. (x − y = x − z ⇒ y = z).330 Numbers and arithmetic in λD
Proof The proof of part (a) is easy: if x − z = y − z, then by the congruence
property for plus: (x − z) + z = (y − z) + z, hence by Lemma 14.8.2 (twice):
x = y.
The proof of part (b) is more complicated; it is left to the reader (Exer-
cise 14.15(b)).
The following lemma contains variants of associativity (Lemma 14.6.4), but
now with subtraction involved. Prove it yourself (Exercise 14.16), following the
strategy employed in the proof of Lemma 14.8.6.
Lemma 14.8.10 (a) ∀x,y,z : Z. (x + (y − z) = (x + y) − z),
(b) ∀x,y,z : Z. (x − (y + z) = (x − y) − z),
(c) ∀x,y,z : Z. (x − (y − z) = (x − y) + z).
Finally, we mention and prove the following lemma, which we can use well
in the following section:
Lemma 14.8.11 ∀x,y : Z. (pos(x − y) ⇔ neg(y − x)).
Proof Let x,y : Z.
(Part I: left to right) Assume pos(x − y), so p(x − y) ε N.
Assume y − x ε N. Then by closure, p(x − y) + (y − x) ε N. After some
calculational steps, using the lemmas given earlier, we obtain from this: p0 ε N,
contradicting ax-int3. Hence neg(y − x).
(Part II: right to left) Assume neg(y − x).
Then by Lemma 14.7.2, there is z : Z such that pos(z) and (y − x) + z = 0.
Calculation (do it yourself) leads to z = x − y. Hence, pos(x − y).
## 14.9 The opposite of an integer
The minus-sign, employed for subtraction of two integers, is also used as a
sign for constructing the opposite of an integer: to make −m out of m. This is
clearly ‘overloading’ of the symbol ‘−’. In practice, however, this is no problem,
since the parsing of an arithmetical expression should make it clear whether an
occurrence of a minus-sign is meant as a binary symbol (denoting subtraction)
or a unary one (for ‘taking-the-opposite’).
A standard deﬁnition for the opposite is: −x is the number that, when added
to x, delivers 0. (It is not hard to show that there always is such a number, and
that it is unique; Exercise 14.17.) Another approach is to deﬁne the opposite as
a special case of subtraction, namely: −x is 0−x. We follow the latter option,
which is easier to implement in λD (see Figure 14.17).
Again, there are many basic arithmetical laws that can be proved now, about
(a combination of) addition, subtraction and opposites of integers. We only14.9 The opposite of an integer 331
discuss a few of them in Lemma 14.9.1, but a useful ‘library’ of arithmetical
facts should contain many more. (See again the exercises for some other laws
of arithmetic.) Proofs are only sketched; the details and λD-versions of the
proofs are left to the reader.
Lemma 14.9.1 (a) ∀x : Z. ((−x) + x = 0),
(b) ∀x,y : Z. (x + (−y) = x − y),
(c) ∀x,y : Z. (−(x + y) = (−x) − y).
Proof sketch
(a) (−x) + x = (0 − x) + x = 0 by subtr-prop1 (see Figure 14.16).
(b) (x+(−y))+y = x+((−y)+y) = x+0 = x by associativity and part (a),
and (x − y) + y = x by subtr-prop1; use Right Cancellation.
(c) (−(x+y))+(x+y) = 0, and ((−x)−y)+(x+y) = ((−x)−y)+(y+x) =
(((−x) − y) + y) + x = (−x) + x = 0 by subtr-prop1 and part (a); use Right
Cancellation.
The equalities mentioned in Lemma 14.9.1 are entered in Figure 14.17.
x : Z
(1) opp(x) := 0 − x : Z
Notation : −x for opp(x)
(2) a2(x) := ... : (−x) + x = 0
y : Z
(3) a3(x,y) := ... : x + (−y) = x − y
(4) a4(x,y) := ... : −(x + y) = (−x) − y
Figure 14.17 The opposite of an integer number and some lemmas
It will turn out in the following chapter that when dealing with an exam-
ple of a mathematical theorem of importance (‘Bézout’s Lemma’), we need
more properties concerning the opposite of an integer. Therefore, we list some
fundamental properties of opposites in the following lemmas.
Informal proofs of these lemmas, and formal proofs in λD, are left to the
reader (cf. Exercise 14.19).
Lemma 14.9.2 (a) −0 = 0,
(b) ∀x : Z. (−(−x) = x),
(c) ∀x : Z. (x = 0 ⇔ −x = 0).
Lemma 14.9.3 (a) ∀x : Z. (−(sx) = p(−x)),
(b) ∀x : Z. (−(px) = s(−x)).332 Numbers and arithmetic in λD
We conclude this section with a number of useful lemmas. In the ﬁrst lemma,
we make good use of Lemma 14.8.11.
Lemma 14.9.4 (a) ∀x : Z. (pos(x) ⇔ neg(−x)),
(b) ∀x : Z. (neg(x) ⇔ pos(−x)).
Proof of part (b): neg(x) if and only if neg(x−0) by Lemma 14.8.5, if and only
if pos(0 − x) by Lemma 14.8.11, if and only if pos(−x) by deﬁnition of −x.
Part (a) is an easy consequence (use Lemma 14.9.2(b)).
From trip (Figure 14.9) we may now infer:
Lemma 14.9.5 (a) ∀x : Z. (pos(x) ∨ pos(−x) ∨ x = 0),
(b) ∀x : Z. (neg(x) ∨ neg(−x) ∨ x = 0).
The following lemma describes a characterising condition, in terms of earlier
sections, for the opposite of x to be a natural number.
Lemma 14.9.6 ∀x : Z. (−x ε N ⇔ (neg(x) ∨ x = 0)).
Proof Let x : Z.
(Part I: left to right) Assume −x ε N.
Assume x = 0. Then −x = 0 (see Lemma 14.9.2(a)), hence p(−x) ε N by
Lemma 14.3.1. So pos(−x), hence neg(x) by Lemma 14.9.4.
So neg(x) ∨ x = 0 by ∨-in-alt2.
(Part II: right to left) Assume neg(x) ∨ x = 0.
(1) Case neg(x): then by Lemma 14.9.4(b): pos(−x), i.e. p(−x) ε N. Hence,
also s(p(−x)) = −x ε N.
(2) Case x = 0: then −x = 0 by Lemma 14.9.2(a), so −x ε N.
So altogether we obtain −x ε N by ∨-el.
Consequences are (Exercise 14.19(c)):
Lemma 14.9.7 (a) ∀x : Z. (x ε N ∨ −x ε N),
(b) ∀x : Z. ((x ε N ∧ −x ε N) ⇒ x = 0).
Notice that this brings along that Z consists of all natural numbers together
with their opposites, where −0 is the only opposite of a natural number that
remains a natural number; just as we had in mind when setting out the for-
malisation of integers in λD.
## 14.10 Inequality relations on Z
We now consider the inequality relations ≤ and < and how to include them
in the λD-version of Z. A standard approach is to deﬁne ≤ in the following
manner:14.10 Inequality relations on Z 333
x ≤Z y := ∃z : Z. (z ε N ∧ x + z = y).
An easier way of deﬁning inequalities, without the ∃-quantiﬁer, is by making
a direct use of subtraction and the natural numbers (see Figure 14.18).
(1) ≤Z := λx : Z. λy : Z. (y − x ε N) : Z → Z → ∗p
Notation : x ≤Z y or x ≤ y for ≤Z xy
(2) <Z := λx : Z. λy : Z. (x ≤Z y ∧ x=y) : Z → Z → ∗p
Notation : x <Z y or x < y for <Z xy
Figure 14.18 Inequalities between integer numbers in λD
Again, there are many lemmas about inequalities, containing addition, sub-
traction and opposites. We restrict ourselves to some examples.
Lemma 14.10.1 (a) ∀x : Z. (x ≤ x),
(b) ∀x,y,z : Z. ((x ≤ y ∧ y ≤ z) ⇒ (x ≤ z)),
(c) ∀x,y,z : Z. ((x + z ≤ y + z) ⇔ (x ≤ y)),
(d) ∀x,y,z : Z. ((x < y ∧ y ≤ z) ⇒ (x < z)),
(e) ∀x,y,z : Z. ((x + z < y + z) ⇔ (x < y)).
In order to demonstrate how inequalities work in the present setting, we give
informal proofs of the ﬁrst three parts; these proofs can be transposed without
too much eﬀort into formal λD-proofs.
Proof (a) Let x : Z. Then x ≤ x if and only if x − x ε N, and Lemma 14.8.4
implies that x − x = 0 ε N.
(b) Let x,y,z : Z, with x ≤ y and y ≤ z. This means that y − x ε N
and z − y ε N, so by the closure of N under addition (Figure 14.15) also
(y −x)+(z −y) ε N. It is not hard to show that (y −x)+(z −y) = z −x (use
e.g. Lemmas 14.6.2, 14.8.10 and 14.8.2). Hence, x ≤ z.
(c) Let x,y,z : Z, with x + z ≤ y + z. Then (y + z) − (x + z) ε N.
We can prove that (y + z) − (x + z) = y − x, for example in the following
manner: add x + z to both sides, then:
− ((y + z) − (x + z)) + (x + z) is equal to y + z;
− and (y − x) + (x + z) = ((y − x) + x) + z by Lemma 14.6.4, which is equal
to y + z by Lemma 14.8.2.
Hence, Right Cancellation gives the desired equality, hence also y − x ε N.
This proves (x + z ≤ y + z) ⇒ (x ≤ y).
A proof of the reverse, (x ≤ y) ⇒ (x + z ≤ y + z), follows immediately.
(d), (e) Proofs are left to the reader (Exercise 14.26).334 Numbers and arithmetic in λD
It is now straightforward to show that ≤ is a partial order (see Figure 8.2)
and that < is a strict partial order (see Section 2.5), both on Z. We leave this
to the reader.
We can deﬁne the related notions ≥ and > directly as the reverses of ≤
and < (see Figure 14.19).
(1) ≥Z := λx : Z. λy : Z. (y ≤Z x) : Z → Z → ∗p
Notation : x ≥Z y or x ≥ y for ≥Z xy
(2) >Z := λx : Z. λy : Z. (y <Z x) : Z → Z → ∗p
Notation : x >Z y or x > y for >Z xy
Figure 14.19 More inequalities between integers
The following lemma is a consequence (Exercise 14.27):
Lemma 14.10.2 (a) ∀x : Z. (pos(x) ⇔ x > 0),
(b) ∀x : Z. (neg(x) ⇔ x < 0),
(c) ∀x : Z. (x < 0 ∨ x = 0 ∨ x > 0).
Finally, we give two examples of the interplay between the inequality relation
and the opposites of integers:
Lemma 14.10.3 (a) ∀x,y : Z. (x < y ⇔ −y < −x),
(b) ∀x : Z. (x < 0 ⇔ −x > 0).
Again, we give informal proofs in order to demonstrate what the relevant
proof steps are (see also Exercise 14.28).
Proof (a) On the one hand, x < y is equivalent to (y−x ε N)∧(x = y), and
on the other hand, −y < −x is equivalent to (−x − (−y) ε N) ∧ (−y = −x).
Now it is not hard to show that y − x = −x − (−y) (use a3 of Figure 14.17,
and Lemma 14.9.2(b)).
Moreover, x = y ⇔ −y = −x.
(b) This is an easy consequence of part (a).
As an application, we give the deﬁnition of lower bound for a subset of a
set S relative to a relation R on S. Often we take Z for S and ≤ for R. We
introduce a separate name for the lower bound in this special case, in order
to shorten the parameter list. We also prove that 0 is a lower bound for every
subset of Z that consists of natural numbers only (see Figure 14.20).14.11 Multiplication of integers 335
S : ∗s | R : S → S → ∗p | T : ps(S) | l : S
(1) lw-bnd(S,R,T,l) := ∀t : S . (t ε T ⇒ Rlt) : ∗p
T : ps(Z) | l : Z
(2) lw-bndZ(T,l) := lw-bnd(Z,≤Z,T,l) : ∗p
T : ps(Z) | u : T ⊆ N
t : Z | w : t ε T
(3) a3(T,u,t,w) := utw : t ε N
(4) a4(T,u,t,w) := ... use Lemma 14.8.5 ... : 0 ≤ t
(5) a5(T,u) := ... use ⇒-in and ∀-in ... : lw-bndZ(T,0)
Figure 14.20 The number 0 is lower bound of every subset of N
## 14.11 Multiplication of integers
We also consider multiplication of integers, in a similar manner as we have
done in Section 14.4 for addition. This is the basic recursion scheme for mul-
tiplication:
(i) m · 0 = 0,
(ii) m · s(n) = (m · n) + m.
Obviously, the recursion takes place in the second operand of m · n, again,
so taking m constant we obtain for integers m and n:
(i) ×m(0) = 0,
(ii) ×m(s(n)) = ×m(n) + m.
The same question arises as with addition: is this ‘upward’ deﬁnition of
multiplication suﬃcient to also cover the negative numbers? Otherwise said:
do we need a third recursive equation, to the eﬀect that:
(iii) m · p(n) = (m · n) − m ?
The answer is no, again, just as in the addition case (cf. Section 14.4). We
leave a proof of this to the reader (Exercise 14.30).
We can deﬁne multiplication for integers similarly to what we have done for
addition in Section 14.4. In Figure 14.21 we give the relevant lines, in which
we refer to the Recursion Theorem 14.4.5 (for Z). In line (1), we deﬁne f as
λv : Z. (v+m), which is a bijective function (prove it yourself; the inverse of f
is λv : Z. (v − m)).
In Figure 14.22 we deﬁne the binary multiplication operation and we list the
most important properties of multiplication.336 Numbers and arithmetic in λD
m : Z
(1) f := λv : Z. (v + m) : Z → Z
(2) a2 := ... : bijective(Z,Z,f)
(3) rec-mult-prop(m) := λg : Z → Z. (g 0 = 0 ∧ ∀x : Z. (g(sx) = f(g x))) :
(Z → Z) → ∗p
(4) rec-mult-lem(m) := ... use Theorem 14.4.5... :
∃1
g : Z → Z. (rec-mult-prop(m) g)
(5) times(m) := ι(Z → Z,rec-mult-prop(m),rec-mult-lem(m)) : Z → Z
Notation : ×m for times(m)
Figure 14.21 Multiplication ×m : Z → Z in λD
(1) × := λx : Z. λy : Z. (×x y) : Z → Z → Z
Notation : x · y for × xy
x : Z
(2) times-i(x) := ... : x · 0 = 0
y : Z
(3) times-ii(x,y) := ... : x · sy = (x · y) + x
(4) times-iii(x,y) := ... : x · py = (x · y) − x
Figure 14.22 Properties of multiplication in Z
Again, we may consider the ‘reversals’ of (2), (3) and (4) in Figure 14.22 (cf.
Lemma 14.6.1):
Lemma 14.11.1 (a) ∀x : Z. (0 · x = 0),
(b) ∀x,y : Z. (sx · y = (x · y) + y),
(c) ∀x,y : Z. (px · y = (x · y) − y).
The proofs are left to the reader (Exercise 14.31).
There is an important lemma that considers the combining of addition and
multiplication in Z. This lemma is called Distributivity. It tells us how mul-
tiplication distributes over addition; this means that the x together with the
multiplication symbol ‘·’ in the left-hand side of the following equation may be
distributed over both operands of the ‘+’-symbol: x · (y + z) = (x · y) + (x · z).
Multiplication also distributes over subtraction. Both facts are expressed in
the following lemma.
Lemma 14.11.2 (Right Distributivity Laws for multiplication)
(a) ∀x,y,z : Z. (x · (y + z) = (x · y) + (x · z)),
(b) ∀x,y,z : Z. (x · (y − z) = (x · y) − (x · z)).14.11 Multiplication of integers 337
There are, of course, also Left Distributivity Laws. All proofs are left to the
reader again (cf. Exercise 14.32).
Consequences of Lemmas 14.11.1 and 14.11.2 are the commutativity and
associativity of multiplication:
Lemma 14.11.3 (a) ∀x,y : Z. (x · y = y · x),
(b) ∀x,y,z : Z. ((x · y) · z = x · (y · z)).
Again, the proofs are omitted (Exercise 14.33).
Various other lemmas about multiplication in combination with addition,
subtraction, opposites and inequality relations can be formulated. Some of
them you may ﬁnd in the exercises at the end of this chapter.
We conclude with a selection of interesting examples of such lemmas, with
instructive (informal) proofs. We start with a lemma about the interplay be-
tween multiplication and the opposite of an integer:
Lemma 14.11.4 ∀x,y : Z. (x · (−y) = −(x · y)).
Proof On the one hand, x · (−y) + x · y = x · ((−y) + y) = x · 0 = 0 (by
Lemma 14.11.2(a), a2 of Figure 14.17 and times-i). On the other hand, also
−(x · y) + x · y = 0 (by a2 of Figure 14.17, again). So x · (−y) = −(x · y) by
Right Cancellation.
We prove that N is closed under multiplication (cf. Lemma 14.7.1), and some
related matters:
Lemma 14.11.5 (a) ∀x,y : Z. ((x ε N ∧ y ε N) ⇒ x · y ε N),
(b) ∀x,y : Z. ((x > 0 ∧ y > 0) ⇒ x · y > 0),
(c) ∀x,y : Z. ((x > 0 ∧ y < 0) ⇒ x · y < 0),
(d) ∀x,y : Z. ((x < 0 ∧ y < 0) ⇒ x · y > 0).
Proof (a) The proof can be given by induction, similarly to the proof of
closure under addition (cf. Figure 14.15). Do it yourself (Exercise 14.36; you
can use the addition-closure property in the multiplication-closure proof).
(b) Let x,y : Z. Assume x > 0 and y > 0. The latter implies that py ε N
by Lemma 14.10.2(a). Hence (use Lemma 14.10.1(e)): x · y = x · s(py) =
x · (py) + x > x · (py) + 0 = x · (py). Since both x and py are in N, we have
by part (a) that x·py ε N, so x·py ≥ 0. Using Lemma 14.10.1(d), we obtain
that x · y > 0.
(c) Let x,y : Z. Assume x > 0 and y < 0. Then Lemma 14.10.3(b) implies
that −y > 0, hence x · (−y) > 0 by part (b). But x · (−y) = −(x · y) by
Lemma 14.11.4, hence −(x·y) > 0, so x·y < 0 (use Lemma 14.10.3(b), again).
(d) Prove it yourself. (Hint: use Lemma 14.10.3(b) and part (b).)338 Numbers and arithmetic in λD
The following lemma says that a product is zero if and only if one of the
factors is zero:
Lemma 14.11.6 ∀x,y : Z. (x · y = 0 ⇒ (x = 0 ∨ y = 0)).
Prove it yourself (Exercise 14.37).
There are also Cancellation Laws for multiplication. They have an extra
condition compared to the Cancellation Laws for addition (Lemma 14.6.5),
namely that the ‘cancelled’ argument should not be zero:
Lemma 14.11.7 (Right Cancellation Law for multiplication)
∀x,y,z : Z. ((x · z = y · z ∧ z = 0) ⇒ x = y).
A counterpart is, of course, the Left Cancellation Law for multiplication.
These laws can be proved using Lemma 14.11.6 (cf. Exercise 14.38).
## 14.12 Divisibility
Another relation between integers is divisibility: m divides n (or m is a divisor
of n) if there exists q in Z such that m · q = n. The relation, called div(m,n),
can easily be deﬁned in λD, as demonstrated in Figure 14.23, line (1). We
employ the usual notation m|n for this.
Note that this deﬁnition concerns all integer numbers, including 0. Check
the following properties for divisibility in relation with the number zero:
Lemma 14.12.1 (a) ∀m : Z. (m|0),
(b) In particular: 0|0,
(c) ∀n : Z. (0|n ⇒ n = 0).
So all integers divide 0, whereas 0 divides no integer number except itself.
It is also worthwhile to derive some more basic lemmas about divisibility,
such as the following ones:
Lemma 14.12.2 (a) ∀l,m : Z. (l|m ⇔ −l|m),
(b) ∀m : Z. (1|m).
The following lemma implies that | is a partial order (see Figure 12.7) on
the naturals.
Lemma 14.12.3 (a) ∀m : Z. (m|m),
(b) ∀l,m,n : Z. ((l|m ∧ m|n) ⇒ l|n),
(c) ∀m,n : Z. ((m ε N ∧ n ε N) ⇒ ((m|n ∧ n|m) ⇒ m = n)).
Remark 14.12.4 Parts (a) and (b) of Lemma 14.12.3 hold for arbitrary
integers, but the integer variant for part (c) is:14.12 Divisibility 339
∀m,n : Z. ((m|n ∧ n|m) ⇒ (m = n ∨ m = −n)).
Hence, the relation | is not a partial order on the integers.
A proof of Lemma 14.12.3 is left to the reader (cf. Exercise 14.42).
We can deﬁne several notions related to divisibility, and prove lemmas about
them. In Figure 14.23 we deﬁne the common divisor property (line (2)), co-
primality (see Section 8.7; line (4)) and the greatest common divisor (‘gcd’)
of two numbers (line (7)). We restrict the deﬁnition of gcd to positive natural
numbers m and n, as is usual in mathematics. (It is possible to extend the
gcd-notion to integers, but we shall not do that here.)
m,n : Z
(1) div(m,n) := ∃q : Z. (m · q = n) : ∗p
Notation : m|n for div(m,n)
k,m,n : Z
(2) com-div(k,m,n) := k|m ∧ k|n : ∗p
(3) gcd-prop(k,m,n) := com-div(k,m,n) ∧
∀l : Z. (com-div(l,m,n) ⇒ l ≤ k) : ∗p
m,n : Z
(4) coprime(m,n) := ∀k : Z. ((com-div(k,m,n) ∧ k > 0) ⇒ k = 1) : ∗p
s : m > 0|t : n > 0
(5) gcd-unq(m,n,s,t) := ... : ∃1
k : Z. gcd-prop(k,m,n)
(6) gcd(m,n,s,t) := ι(Z,λk : Z. gcd-prop(k,m,n),gcd-unq(m,n,s,t)) : Z
(7) gcd-pos(m,n,s,t) := ... : gcd(m,n,s,t) > 0
Figure 14.23 Notions related to divisibility
The deﬁnition we use is the most commonly used: a gcd of two positive
naturals m and n is a common divisor that is larger than all other common
divisors. Such a number is unique (see line (6)), according to a fact about
integers that we mention without proof: each non-empty subset of Z that has
an upper bound also has a (unique) maximum. (This theorem and its mirror
image, the Minimum Theorem, are discussed and proved in λD-style in the
following chapter.) The set that we consider here is the set of all common
divisors of m and n, which is non-empty because it always contains 1, and
bounded above by m (or n) (Exercise 14.44). Its maximum is the unique gcd
that we are looking for.
We note, again without proof (Exercise 14.45), that the gcd of (positive) m
and n is positive.340 Numbers and arithmetic in λD
## 14.13 Irrelevance of proof
We have argued that proofs-as-terms (one of the two meanings of ‘PAT’) is
an important feature for the formalisation of mathematics. With proofs-as-
terms, proofs become ‘ﬁrst-class citizens’ of the system, which can be studied,
manipulated and checked. This also means that when we deﬁne an object that
depends on a property (e.g. the deﬁnition of 1/x, which depends on the fact
that x = 0), then we make this dependency explicit by carrying a proof of
x = 0 into the deﬁnition of 1/x. But of course, the number 1/x should not
really depend on that proof.
We have also encountered such a situation in the previous section (Fig-
ure 14.23, line (6)), when deﬁning the greatest common divisor: we have intro-
duced gcd(m,n,s,t) as an integer number that depends on integers m and n
which are positive, s and t being proofs of the positivity of m and n, respec-
tively. Now it is undesirable that the value of the gcd can be inﬂuenced by the
nature of the proofs s and t: even if s1 and t1 are ‘essentially diﬀerent’ (i.e.
not βΔ-convertible) proofs of the positivity of m and n, then we do not want
that gcd(m,n,s1,t1) diﬀers from gcd(m,n,s,t). The only thing that matters for
such proofs s and t should be that they exist. It should be irrelevant what these
proofs exactly look like: one must be free to trade one proof for another, without
external eﬀects. For the gcd, this is the case: gcd(m,n,s1,t1) = gcd(m,n,s2,t2)
for any s1,s2 : m > 0 and t1,t2 : n > 0.
That gcd is proof-irrelevant is a consequence of a similar observation we
have made in Section 12.7: in Remark 12.7.2 we have shown that ι(S,P,u) (the
unique object of type S satisfying P, where u is a proof of the uniqueness) does
not depend on the nature of the proof u: for proofs u1 and u2 we can formally
prove that ι(S,P,u1) =S ι(S,P,u2). This is a general phenomenon in this case:
if we always use the ι-operator to deﬁne an object that depends on a proof,
there is never a real dependency on a proof. This conforms with mathematical
practice: we only allow ourselves to talk about ‘the object x that satisﬁes P’
if we have ﬁrst shown that there is a unique object satisfying P.
The fact that objects can depend on proofs is a consequence of the use of
type theory for formalising mathematics and is often considered unnatural and
even undesirable from a mathematical perspective. Therefore, one sometimes
introduces a principle of proof-irrelevance in type theory to avoid an eﬀective
dependency of objects on proofs. In all our examples, we use the ι-operator (of
unique existence) in cases where we deﬁne an object (or function) that depends
on a proof (see Section 12.7). Therefore, these objects are proof-irrelevant and
we don’t need to add a separate principle.
In more complicated circumstances it may well happen that ‘irrelevance of
proof’ is not a natural consequence of the theory being developed in λD. In14.14 Conclusions 341
such cases, it should be handled with care and – if necessary – proof irrelevance
may be explicitly stipulated, for example by means of an axiom. It may also
happen that one encounters a situation where the dependency of an object on
a proof is desired, and one doesn’t want irrelevance of proofs. Therefore we
don’t wish to add proof irrelevance as a general principle to λD.
Remark 14.13.1 The terminology irrelevance of proof was introduced by
N.G. de Bruijn in the 1970s. More about ‘irrelevance of proof’ can be found
in Nederpelt et al. (1994); see for example the following reprints in that book:
Zucker, 1977, Section 3; de Bruijn, 1980, Section 24; van Benthem Jutting,
1977, Sections 4.0.1 and 4.0.2.
## 14.14 Conclusions
In the present section we have formally constructed a set-up for arithmetic,
right from the ground. One of the most fundamental concepts in mathematics is
that of number, so we have ﬁrst investigated how to represent natural numbers
in λD. The standard approach of Peano apparently provides a good foundation,
including the important method of induction.
We soon abandoned this view, however, and changed the focus to integer
numbers, being the basis of many mathematical disciplines. For integers there
also exists a Peano-like set-up, which we have discussed in detail before for-
malising it in λD. This axiomatisation of the integers was inspired by Margaris
(1961) and elaborated by the authors, with valuable help from A. Visser and
R. Iemhoﬀ (Visser and Iemhoﬀ, 2009). The idea is to introduce the operation
predecessor on a par with the successor of a number. In this formalisation,
every integer has exactly one successor and exactly one predecessor. A core
notion in this approach, mathematical induction for the integers, turns out to
have the form of a ‘symmetric’ axiom, expanding to both sides on the number
line. The natural numbers (N) can now be deﬁned as a subset of the integers
(Z). It turns out that Z and N only have the desired behaviour if we add one
more axiom, stating that the predecessor of 0 is not a natural number.
The given axiomatisation possesses the relevant basic properties. It enables,
for example, suitable translations of the original Peano-axioms for natural
numbers (including induction for N) into provable theorems. We have also
mentioned the tripartition property of the integers.
Altogether, this test case for our earlier chosen manner to formalise sets and
subsets works out well, with satisfactory results.
But there is more to say about numbers as operational objects in math-
ematics. The ﬁrst thing is the wish to compute with integer (and natural)
numbers. Therefore one needs the usual operations addition and multiplica-342 Numbers and arithmetic in λD
tion. The usual recursive deﬁnitions of these operations cannot immediately
be translated to λD, since λD does not have recursion in its deﬁnition appa-
ratus. However, by appealing to (a special form of) the Recursion Theorem,
derivable in λD (albeit with a proof too complex for the present book), we
have succeeded in incorporating both arithmetical operations in a smooth and
convincing manner.
An example computation shows that proofs of even the simplest facts of
arithmetic (‘1 + 2 = 3’) require quite some eﬀort in this approach. This is
unpleasant, but does not come as a surprise: we know that every single step
must be accounted for in λD. It is good to realise that this is intentionally
so, being a consequence of our starting point. We recall that our original plan
was to build a formal system with a limited number of built-in principles, that
gives a maximal guarantee of correctness for everything expressible in it. So it
is almost unavoidable to encounter a number of obstacles.
We have also explored the formalisation of some other basic notions concern-
ing integers, such as subtraction, taking the opposite, inequalities and divis-
ibility. We have accompanied the deﬁnitions with helpful lemmas, often with
informal proofs and sometimes with (a sketch of) a λD-derivation. Induction,
of course, plays a central role in the deﬁnitions and proofs concerning these
operations.
We ﬁnally discussed the notion ‘irrelevance of proof’, which has consequences
for type theory in general, but not for the investigations of λD that we en-
counter in this book. This is due to our introduction of the descriptor ι, which
prevents many of the diﬃculties connected with the possible dependency of
objects on proofs.
The general lemmas and theorems that have been discussed in this chapter
are useful in a wider mathematical environment, as we shall show in Chap-
ter 15.
On several occasions we have decided in this chapter not to give all the
precise, formal details. The reason is deﬁnitely not that this is insurmountable
or not feasible. On the contrary, it is precisely the deﬁnition mechanism that
enables the user of λD to provide a complete formalisation and yet stay in
control of the mathematical material being formalised, concentrating on the
overall picture.
It is, however, no more than honest to realise that the gains of formalisation
also have a counterpart. Therefore we have decided to sometimes adapt the
formal presentation of a derivation by omitting proof objects or by restricting
ourselves to only give hints concerning the holes in the derivations.
In the present chapter we went even further by often not giving the λD-
proofs, but only informal proofs, assuming that the reader is by now capable
of transforming these into real λD-proofs. The reason is that we want to protect14.15 Further reading 343
readers from an overdose of formal information, keeping their attention focused
on the things that really matter. In the following chapter, however, we will turn
back to formal λD-proofs (albeit with hints and holes).
This is not the place for a deeper examination of the advantages or disadvan-
tages for humans confronted with proofs that have been presented in λD. Nor
do we try to ﬁnd solutions at this moment, in order to alleviate the negative
eﬀects of a λD-translation on ‘understanding’. We come back to these matters
in the conclusive chapter of this book (Chapter 16), without pretending to
have the ﬁnal say in the matter.
## 14.15 Further reading
The formal treatment of natural numbers goes back to G. Peano in 1889 (a
translation of the original paper of Peano can be found in van Heijenoort,
1967). This description is axiomatic, so it does not describe functions as pro-
grams or algorithms, but as symbols that satisfy certain equations. In the
beginning of the twentieth century, the issues of computability and decidability
came up, when D. Hilbert asked the question whether there exists a procedure
to mechanically decide whether a formula is true or not. Later this was further
reﬁned by diﬀerentiating between the question whether a formula A is true (in
all models or in some speciﬁc model) and the question whether a formula A
is derivable in a certain formal system. It was shown by A.M. Turing (Turing,
1936) and A. Church (Church, 1936b) that these questions are undecidable:
there is no machine (computer program) that will decide on input A whether
it is true, respectively derivable (unless one restricts to a logic of limited ex-
pressivity, like proposition calculus). With respect to ‘truth’ the situation is
even more subtle: the famous incompleteness theorem of K.F. Gödel (Gödel,
1932) shows that there is no derivation system that can capture all formulas
that are true in N.
This also gave rise to a characterisation of the computable functions, ﬁrst
by Turing (Turing, 1936), as the class of functions that can be computed via
(what later became known as) a Turing machine. After Turing, various ‘models’
of computation have been deﬁned with the remarkable property that they all
capture the same class of computable functions. This led Turing and Church to
formulate the thesis that any function that can be computed by a mechanical
device can be computed by a Turing machine. See e.g. Lewis & Papadimitriou
(1981) or Sudkamp (2006) for an introduction.
The class of computable functions can be deﬁned in various ways. A popular
way that abstracts from a ‘machine model’ is to deﬁne it as the class of μ-
recursive functions. This is the class of functions that contains the zero function
and the successor and is closed under the operations of function composition,344 Numbers and arithmetic in λD
primitive recursion and minimisation. Again, see Sudkamp (2006). The scheme
of primitive recursion basically states that a function f that has a value for
input 0, and for input n + 1 only uses its output on input n (i.e. f(n)), is
computable.
Our text is not about computability of functions but merely about well-
deﬁnedness. We use recursive deﬁnitions as a mechanism to deﬁne a function,
e.g. addition. To make sure that such a recursive deﬁnition actually deﬁnes
something meaningful, we have to ensure that recursive calls in the deﬁnitions
have ‘smaller’ arguments. Therefore we use a simple instance of the scheme for
primitive recursion to have a proper mechanism for deﬁning functions by recur-
sion. Our Recursion Theorem for Z (Theorem 14.4.3) states that an instance
of the scheme for primitive recursion yields a well-deﬁned function. In the text
of Section 14.4, we have argued this in detail for the example of addition.
In real mathematics, and notably in number theory, one works more often
with the integers than with the natural numbers. However, the natural numbers
are a nice inductively deﬁned set, which gives rise to proofs by induction and
deﬁnitions by well-founded recursion. In the present chapter we use the work
of A. Margaris (Margaris, 1961) to axiomatically introduce the integers, an
induction principle over the integers and also a scheme for deﬁning functions
by recursion over the integers. As a matter of fact, the approach of Margaris
is very close in style to Peano’s original one for the natural numbers.
A possible alternative is to deﬁne the set of integers Z as a quotient of the
set of pairs of natural numbers N × N. This approach can be found in e.g.
van Dalen et al., 1978, Chapter 11. We repeat the essential points: one deﬁnes
the equivalence relation ∼ over N × N by (k,l) ∼ (m,n) if k + n = l + m.
(Intuitively: the diﬀerence between k and l is the same as between m and n.)
Now one deﬁnes Z as the set of equivalence classes of N × N modulo ∼. In
abstract mathematics, this works ﬁne, but if one really needs to use this in
type theory, it is cumbersome. First of all, this needs the notion ‘equivalence
class’. This can be introduced (see Section 13.4), but we prefer not to do it if
it isn’t needed. A second disadvantage is that one has to deﬁne all functions
‘modulo the equivalence relation’ ∼ : a function from N × N to N × N only
gives rise to a function from Z to Z if it respects ∼ and this is a property to
check every time.
Exercises
14.1 (a) See Section 14.2. Prove in λD: ∀x : Z. (¬(x ε N) ⇒ ¬(px ε N)).
(b) Give an informal proof of the following: if x = p(...(p0)...), with at
least one occurrence of p in the right-hand side, then ¬(x ε N).Exercises 345
Just as in the exercises for the previous chapter, you may conﬁne your-
self in these exercises to only mentioning the logical rules you use in λD-
derivations (cf. Section 13.2). This also applies to instances of equality-
rules, such as eq-subs, eq-cong1 and eq-subs. In proving a numbered
lemma from the book text, you may appeal to earlier lemmas, but not
to later ones.
## 14.2 See Figure 14.5. Derive proof terms corresponding to:
(a) zero-prop,
(b) clos-prop.
(You may add intermediate judgements.)
## 14.3 See Figure 14.5. Prove in λD that N is the smallest subset satisfying
nat-cond, by ﬁnding an inhabitant of
ΠQ : Z → ∗p . (nat-cond(Q) ⇒ N ⊆ Q).
14.4 If Z has been formalised as in Section 14.2, including ax-int3, then all
models for Z are inﬁnite. Give an informal proof for this.
## 14.5 Give a λD-proof of Lemma 14.3.1.
14.6 Give a λD-proof of: ∀x : Z. (neg(px) ∨ pos(sx)).
## 14.7 Give λD-proofs of all parts of Lemma 14.3.2.
14.8 Give a λD-proof of Lemma 14.3.3(a).
## 14.9 See Remark 14.4.2. A relation R : S → S → ∗p is called well-founded if
there exists no inﬁnite ‘descending’ sequence x0,x1,x2,... of elements of
S such that xi+1Rxi for all i.
(a) Give an informal description of a well-founded relation on Z that
corresponds to the recursion scheme in Theorem 14.4.3.
(b) Explain why the relation deﬁned in part (a) is no longer well-founded
when we delete the conditions ‘pos(sx)’ and ‘neg(px)’ from the re-
cursion scheme in Theorem 14.4.3.
14.10 (a) Let A be a type, f : A → A a bijection and g : Z → A. Consider the
following statements:
(1) ∀x : Z. [(pos(sx) ⇒ g(sx) =A f(g x)) ∧
(neg(px) ⇒ g(px) =A f−1(g x))],
(2) ∀x : Z. (g(sx) =A f(g x)).
Prove (1)⇔(2) (hint for (1)⇒(2): see Exercise 14.6, Lemma 14.3.2(c)
and Exercise 13.14).
(b) Prove informally that Theorem 14.4.5 is a consequence of the Recur-
sion Theorem for Z, i.e. Theorem 14.4.3.
14.11 Fill the holes in lines (2) to (4) of Figure 14.12.346 Numbers and arithmetic in λD
## 14.12 Give informal proofs of the following properties of addition:
(a) Commutativity (Lemma 14.6.2) (hint: take x ﬁxed, and apply sym-
metric induction on y; use Lemma 14.6.1),
(b) Associativity (Lemma 14.6.4) (hint: take x and y ﬁxed, and apply
symmetric induction on z),
(c) the Right Cancellation Law (Lemma 14.6.5(a)).
## 14.13 Give a proof in λD-format of part II of Lemma 14.7.2.
14.14 Represent the proof of Lemma 14.8.6(b) in λD-format.
## 14.15 Give informal proofs of:
(a) Lemma 14.8.8(a) and (b),
(b) the Left Cancellation Law for subtraction (Lemma 14.8.9(b)) (hint:
start with using Lemma 14.8.2 twice).
14.16 Give informal proofs of Lemma 14.8.10(a) and (c).
## 14.17 Prove in λD that for each x in Z, there exists exactly one y in Z such
that x + y = 0.
14.18 See Remark 14.2.1. Prove in λD that ax-int2 implies the following vari-
ant of induction for Z, with an arbitrary P l instead of P 0:
((∃l : Z. P l) ∧ ∀x : Z. (P x⇒(P(sx) ∧ P(px)))) ⇒ ∀x : Z. P x.
## 14.19 Give informal proofs and sketches of the λD-versions for:
(a) the three parts of Lemma 14.9.2,
(b) the two parts of Lemma 14.9.3,
(c) the two parts of Lemma 14.9.7.
## 14.20 Give proof sketches in λD-style of the following lemmas:
(a) ∀x,y : Z. (x − (−y) = x + y),
(b) ∀x,y : Z. (−(x − y) = (−x) + y),
(c) ∀x,y : Z. (x − y = −(y − x)).
## 14.21 See Remark 14.4.4.
(a) Deﬁne the absolute-value-function abs : Z → Z by the aid of the
Recursion Theorem for Z.
(b) Prove in λD that ∀x : Z. (x ε N ⇒ abs x = x).
(c) Prove in λD that ∀x : Z. (x ε N ⇒ abs(−x) = x).
## 14.22 Give a proof sketch of the following lemma:
∀x,y : Z. (abs(x − y) = abs(y − x)).
(Hint: see Exercise 14.20(c) and Lemma 14.8.11).
## 14.23 Prove in λD:
(a) ∀x : Z. (x < sx),
(b) ∀x : Z. (x > px).Exercises 347
## 14.24 Prove in λD:
(a) ∀x,y : Z. (x < y ⇔ sx < sy),
(b) ∀x,y : Z. (x < y ⇔ px < py).
## 14.25 Give proof sketches in λD-style of the following lemmas:
(a) ∀x,y : Z. ((x ε N ∧ x ≤ y) ⇒ y ε N),
(b) ∀x,y : Z. ((neg(y) ∧ x ≤ y) ⇒ neg(x)).
14.26 Give proof sketches of Lemma 14.10.1(d) and (e).
14.27 Give proof sketches of Lemma 14.10.2(a) and (b).
14.28 Convert the informal proofs of Lemma 14.10.3(a) and (b) into λD-
proofs.
## 14.29 Give proof sketches in λD-style of the following lemmas:
(a) ∀x,y : Z. ((x ≤ y ∧ y ≤ x) ⇒ x = y),
(b) ∀x,y : Z. (x < y ⇒ sx ≤ y).
## 14.30 In the beginning of Section 14.11 we claimed that the recursive equation
(ii) m · s(n) = (m · n) + m
implies the equation
(iii) m · p(n) = (m · n) − m.
Show this.
## 14.31 Give informal proofs and give sketches of the λD-versions for the three
parts of Lemma 14.11.1.
## 14.32 Give informal proofs of the two parts of Lemma 14.11.2.
## 14.33 Give informal proofs of the two parts of Lemma 14.11.3.
## 14.34 Give sketches of λD-proofs for:
(a) 1 · 1 = 1,
(b) 2 · 2 = 4,
(c) (−1) · (−1) = 1.
## 14.35 Give derivations in λD of the following lemmas:
(a) ∀x : Z. (x · 1 = x),
(b) ∀x : Z. (x · (−1) = −x).
## 14.36 Give an informal proof and a proof sketch in λD for the statement that
N is closed under multiplication (Lemma 14.11.5(a)).
14.37 Give an informal proof of Lemma 14.11.6 (hint: use Lemmas 14.10.2(c)
and 14.11.5).
## 14.38 Give an informal proof of Lemma 14.11.7.
## 14.39 Give informal proofs of the following lemmas:
(a) ∀x,y,z : Z. ((x ≤ y ∧ z ε N) ⇒ x · z ≤ y · z),
(b) ∀x,y,z : Z. ((x · z ≤ y · z ∧ pos(z)) ⇒ x ≤ y),
(c) ∀x,y,z : Z. ((x · z ≤ y · z ∧ neg(z)) ⇒ x ≥ y).348 Numbers and arithmetic in λD
## 14.40 Give informal proofs of:
(a) Lemma 14.12.1(a) and (c),
(b) Lemma 14.12.2(a).
## 14.41 Give informal proofs of the following lemmas:
(a) ∀x : Z. (x ε N ⇒ (x = 0 ∨ x ≥ 1)),
(b) ∀x,y : Z. (x ε N ⇒ (x · y = 1 ⇒ x = 1)) (hint: use part (a)).
14.42 Give an informal proof of Lemma 14.12.3(c).
(Hint:useExercise 14.41(b).)
## 14.43 Prove the following in λD:
∀m,n : Z. (coprime(m,n) ⇒ coprime(n,m)).
14.44 Let k,m : Z be such that k > 0, m > 0 and k|m. Prove that k ≤ m.
(Hint: use Exercises 14.41(a) and 14.39(a).)
14.45 Give an informal proof of the lemma expressed in Figure 14.23, line (7).15
An elaborated example
## 15.1 Formalising a proof of Bézout’s Lemma
In Section 8.7, we considered a well-known theorem from number theory, and
we have given a mathematical proof of it in Section 8.8. We now revisit this
theorem and its proof, which are reproduced below, and translate it into the
formal λD-format.
A thorough inspection of what we need for the formalisation of the proof in
its entirety will take up the space of a full chapter: the present one. It acts as
a ﬁnal exercise, showing several important aspects of λD.
In the process, we will encounter various questions and problems. We’ll try
to foresee some of these questions and solve them before we start the actual
proof. Other problems we solve ‘on the ﬂy’. On some occasions, we come across
situations of missing foreknowledge that is either too laborious or too uninspir-
ing to be dealt with in this book; in those cases we resort to only summarising
what is lacking. Hence, we decide neither to ﬁll every gap, nor to always supply
the relevant details.
The mentioned theorem reads as follows:
‘Theorem (“Bézout’s Lemma”, restricted version)
Let m,n ∈ N+ be coprime. Then ∃x,y∈Z(mx + ny = 1).’
Remark 15.1.1 The lemma has been attributed to the French mathematician
É. Bézout (1730–1783), although it already appeared in earlier work of others.
Actually, in order to make our example less complicated, we have chosen a
special case of Bézout’s Lemma, by adding the restriction that m and n be
coprime, i.e. their greatest common divisor is 1. The original version applies
to all pairs of positive natural numbers m and n, and expresses that there exist
integer numbers x and y such that mx + ny = gcd(m,n).
The general version with the gcd is only seemingly more general: in fact, it350 An elaborated example
easily follows from the restricted version that we consider in this chapter (see
Exercise 15.1).
There is a well-known constructive manner (i.e. a procedure) to ﬁnd such
x and y for given positive numbers m and n. This procedure works for both
the restricted and the general version of the lemma. It is called the Euclidean
algorithm, based on a method attributed to Euclid, a mathematician who lived
around 300 BC in Alexandria (Egypt).
Euclid became famous for his standard work ‘The Elements’, which is a
bundle of 13 books on geometry and number theory. The theorem-and-proof
approach he employed is now a standard in the mathematical world, as is also
demonstrated in the present book. Another notion that Euclid introduced, is
that of axiom, which corresponds to our notion of ‘primitive deﬁnition’ (see
Section 10.2).
We restate the proof of Bézout’s Lemma (restricted version) as given in
Figure 8.6:
Proof Let m and n be positive natural numbers that have no other
positive common divisor than 1.
Consider the set of all integers mx + ny, where x ∈ Z and y ∈ Z.
Call this set S.
Deﬁne S+
as S ∩ N+
. This S+
has a minimum, call it d.
Since d ∈ S+
, also d ∈ S, hence (i) d = mx0 + ny0 for certain
x0,y0 ∈ Z. Moreover, d > 0 since d ∈ N+
.
Divide m by d. This gives q and r such that (ii) m = qd + r, with
0 ≤ r < d.
By inserting d of (i) into (ii) we get m = q(mx0 + ny0) + r, from
which follows that r = m(1 − qx0) − n(qy0). Hence r ∈ S.
Suppose r > 0. Then r ∈ S+
, so r ≥ d since d = min(S+
). But
r < d: contradiction. Hence, r = 0.
From (ii) now follows that m = qd, hence d|m.
In a similar manner we can prove that d|n.
Since m and n are coprime, d must be 1, implying that 1 ∈ S.
Hence there exist x,y ∈ Z such that mx + ny = 1.
Browsing through this proof with a view to a λD-formalisation, there are
certain things that catch the eye. First of all, we observe that there are two
number systems involved in this proof: we encounter integers (elements of Z)
and positive natural numbers (elements of N+).
Since N+ is a subset of Z, and also the other sets deﬁned in the proof (S, S+),
our choice in Chapter 14 to take Z as our basic set appears to be appropriate.
We shall consider these subsets as predicates on Z (cf. Section 13.1).
We recall that Chapter 14 contains a number of notions connected with inte-15.1 Formalising a proof of Bézout’s Lemma 351
ger numbers, many of which are used in this proof, such as the basic operations
addition, subtraction and multiplication, and the inequality relations.
By observing the above proof somewhat closer, we notice the following de-
tails. Some of these appear to be problematic and should preferably be solved
before we give a formalisation in λD:
− For the notions common divisor, coprime and the divisibility operator ‘|’,
see Section 14.12.
− The notion intersection (∩) of subsets was dealt with in Figure 13.2.
− The proof mentions a minimum d of subset S+. We have dealt with minimum
values before (Section 12.7), but only for a type ∗s, not for a subset of type
Z → ∗p. So we have to adapt this notion to the new situation.
− In order to be able to speak about the minimum d, we have to prove its ex-
istence and uniqueness. This requires a piece of ‘foreknowledge’, in the form
of the so-called Minimum Theorem, stating that each non-empty subset of
Z that is bounded from below, has a (unique) minimum. These two require-
ments (non-emptiness, being bounded from below) are neither mentioned
nor explicitly veriﬁed in the informal proof text. In the λD-formalisation,
however, this is indispensable.
− For the Minimum Theorem we need the notion of ‘non-emptiness’. But empty
sets were discussed in Section 13.3, so non-emptiness appears to be no prob-
lem.
− Another property of numbers was used when dividing m by d (both in N+):
there exist (unique) q and r such that m = q · d + r, where 0 ≤ r < d.
This amounts, again, to an important theorem (the Division Theorem) that
belongs to the necessary foreknowledge.
− Finally, several computations are executed, based on properties of arithmetic.
It appears instructive to unravel what these properties are, and how they
can be proved; the lemmas developed in Chapter 14 may be convenient.
We treat the mentioned points of interest that we miss as foreknowledge, in
the preparatory Section 15.2:
− We ﬁrst redeﬁne the minimum operator, this time for subsets.
− Next, we formulate the Minimum Theorem and the Division Theorem in λD,
in order to be able to use them in the proof of Bézout’s Lemma; we do not
(yet) give formal proofs of these theorems: this we postpone to Sections 15.7
and 15.8, respectively. (A full proof of the Minimum Theorem will be given
in Appendix C, Section C.2.)
The remainder of the chapter will be devoted to a λD-formalisation of the
proof of Bézout’s Lemma and related subjects:
(1) We provide a thorough description of the full λD-proof of Bézout’s352 An elaborated example
Lemma in Sections 15.3 to 15.5. For many subjects in these sections, we refer
to earlier chapters, in particular to Chapter 14 for a number of arithmetical
laws.
(2) We reserve Section 15.6 for discussing a variety of ‘loose ends’ concerning
computational laws and other special subjects that we encounter in the proof
of Bézout’s Lemma, and which have not yet been covered by earlier chapters.
## 15.2 Preparatory work
I. The minimum operator for subsets
The minimum operator Min developed in Section 12.7 (see Figure 12.18) does
not suﬃce for our present purposes: it denotes a global minimum operator for
the ≤-ordered type S; it is not immediately transferable to subsets of S.
Hence, we start by reformulating the notion ‘minimum’ for subsets of S. We
assume a type S : ∗s that is partially ordered by a relation R : S → S → ∗p.
(The letter R we use instead of the symbol ≤ in order to emphasise the general
character of this relation; for the notion ‘partial order’, see Figure 12.7.)
Now we express for subset T : ps(S) what it means to have a minimum;
this is done by deﬁning when m is a least element of T with respect to R, or
formally: least(S,R,T,m). This is the case if m belongs to subset T and is a
lower bound of T (see Figure 14.20 for the notion ‘lower bound’). We express
this in Figure 15.1, line (1); compare this with the proposition Least(S,≤,m) in
Figure 12.13. In line (2) we introduce constant leastZ with a shorter parameter
list, for the special case that S is Z and R is ≤ on Z (compare this with lw-bndZ
in Figure 14.20).
Next, we can prove that there is at most one least element of T. Conse-
quently, if we also assume that there is at least one such element of T, then
there is exactly one such element, and we can baptise this unique element ‘the
minimum of the subset’, min(S,R,T,r,w), by the aid of the descriptor ι in-
troduced in Section 12.7. This is done quite similarly to what we have done in
Figures 12.15 and 12.18.
Summarising this, we obtain Figure 15.1; as in Figure 12.15, we leave the
proof objects in lines (3) and (4) to the reader (Exercise 15.2).
II. Formulation of the Minimum Theorem
The Minimum Theorem says that every non-empty set of integers that is
bounded from below has a (unique) minimum. The theorem can be expressed
in λD as in Figure 15.2. We use the ≤-relation as deﬁned in Figure 14.18. For
lw-bndZ, see Figure 14.20; for leastZ and min, see Figure 15.1.
The existence of a minimum is the Minimum Theorem; it is expressed in15.2 Preparatory work 353
S : ∗s | R : S → S → ∗p | T : ps(S) | m : S
(1) least(S,R,T,m) := m ε T ∧ lw-bnd(S,R,T,m) : ∗p
T : ps(Z) | m : Z
(2) leastZ(T,m) := least(Z,≤,T,m) : ∗p
S : ∗s | R : S → S → ∗p | T : ps(S) | r : part-ord(S,R)
(3) a3(S,R,T,r) := ... : ∃≤1
m : S . least(S,R,T,m)
w : ∃m : S . least(S,R,T,m)
(4) a4(S,R,T,r,w) := ... : ∃1
m : S . least(S,R,T,m)
(5) min(S,R,T,r,w) := ι(S,λm : S.least(S,R,T,m),a4(S,R,T,r,w)) : S
Figure 15.1 The minimum of a subset of a partially ordered set
line (1) of Figure 15.2 and will be proved in Section 15.7. The uniqueness of
such a minimum (line (2)) is stated in Figure 15.1, hence we can name that
minimum (line (3)). A proof that ≤ is a partial order on Z is left open in the
proof objects of lines (2) and (3); we call it hole #1 and come back to it in
Section 15.6. In line (4) we derive a decisive property of the minimum. Check
yourself that this derivation is correct, assuming that the omitted parts have
been properly ﬁlled.
Note again that constant names such as min-the and min-uni-the are some-
what deceiving, since they are inhabitants (proofs) of the two theorems, not
the theorems themselves.
T : ps(Z) | u : T = ∅Z | v : ∃x : Z. lw-bndZ(T,x)
(1) min-the(T,u,v) := ... see Figure 15.18, line (29) ... :
∃m : Z. leastZ(T,m)
(2) min-uni-the(T,u,v) := a4[Fig.15.1](Z,≤,T,hole #1,min-the(T,u,v)) :
∃1
m : Z. leastZ(T,m)
(3) minimum(T,u,v) := min(Z,≤,T,hole #1,min-the(T,u,v)) : Z
(4) min-prop(T,u,v) :=
ι-prop(Z,λm : Z. leastZ(T,m),min-uni-the(T,u,v)) :
minimum(T,u,v) ε T ∧ lw-bndZ(T,minimum(T,u,v))
Figure 15.2 Formulation of the Minimum Theorem, and some consequences
III. Formulation of the Division Theorem
It is obvious how to formulate the Division Theorem in λD; see Figure 15.3.
For ‘addition’ and ‘multiplication’ we refer to Sections 14.4 and 14.11.354 An elaborated example
The expression 0 ≤ r < d is obviously an abbreviation of (0 ≤ r) ∧ (r < d).
The Division Theorem expresses the possibility to divide a positive m by
a positive d in such a manner that the ‘remainder’ after division is a natural
number smaller than this d. Otherwise said, when inspecting the inﬁnite series
0·d, 1·d, 2·d..., from left to right, and comparing each entry with m, there
comes a point where q · d is smaller than or equal to m, whereas (q + 1) · d
is greater than m. That q is called the quotient. It has the property that the
diﬀerence m−q ·d (which is the remainder r) is a natural number that is less
than d itself.
Note that the Division Theorem holds for all integer numbers m and positive
naturals d. We restrict it here to m > 0, since that is what we need in Bézout’s
Lemma.
The proof of this theorem is postponed to Section 15.8.
m,d : Z | u : m > 0 | v : d > 0
div-the(m,d,u,v) := ... see Section 15.8 ... :
∃q,r : Z. (m = q · d + r ∧ 0 ≤ r < d)
Figure 15.3 Formulation of the Division Theorem
Remark 15.2.1 The Division Theorem only expresses the existence of q and
r with the mentioned properties; it does not state that both are unique (for
given m,d ∈ N+). This uniqueness can be shown to hold. (Try yourself to give
a proof sketch.) So we may speak about the quotient q and the remainder r. But
the proof of the uniqueness is not particularly useful for our present purposes:
in the proof of Bézout’s Lemma, the pure existence of q and r is enough.
## 15.3 Part I of the proof of Bézout’s Lemma
The proof of Bézout’s Lemma (see Section 15.1) starts quite naturally, with
the introduction of two variables and an assumption:
‘Let m and n be positive natural numbers that have no other
positive common divisors than 1.’
Hence, the overall context consists of two numbers m and n, both positive
and being coprime (see Figure 14.23, line (4)). Since Z is our basic set, we
take m,n : Z. We express the positiveness of a number x as ‘x > 0’, which is
permitted by Lemma 14.10.2(a).
Hence, we commence our formal version as follows:15.3 Part I of the proof of Bézout’s Lemma 355
m,n : Z | ass1 : m > 0 | ass2 : n > 0 | ass3 : coprime(m,n)
. . .
Figure 15.4 Start of the proof of Bézout’s Lemma
Remark 15.3.1 The assumption coprime(m,n) is not used in the proof of
Figure 8.6 until the second but last sentence. Hence, in order to save on pa-
rameters, we could decide to postpone the corresponding ﬂag until the ﬁnal part
of the formalisation (Section 15.5). Since we want to keep close to the proof
text, we do not choose this option.
It is clear that an important part of the proof-to-come will depend on the
parameter list (m,n,ass1,ass2,ass3) containing the ﬁve parameters of the
overall context of Bézout’s Lemma, although they will never be instantiated
in the proof. Since we have adopted the parameter list convention (see Sec-
tion 11.7), this is no problem: we simply write S, for example, instead of
S(m,n,ass1,ass2,ass3) (see Figure 15.5).
The proof continues with the deﬁnition of the subset S of Z consisting of all
so-called linear combinations of m and n:
‘Consider the set of all integers mx + ny, where x ∈ Z and
y ∈ Z. Call this set S.’
The corresponding subset S coincides with the predicate ‘being a linear
combination of m and n’. For the subset-notation, {...|...}, see Figure 13.2.
. . .
(1) S†
:= {k : Z | ∃x,y : Z. (k = m · x + n · y)} : ps(Z)
†
parameters suppressed
Figure 15.5 Step 1 of the proof
Remark 15.3.2 Since S depends on m and n only, we could have restricted
ourselves to a shorter context. However, we have decided to follow the proof
text as closely as possible. The longer parameter list does not bother us because
of the parameter list convention.
The following paragraph of the proof of Bézout’s Lemma starts by deﬁning
the subset S+, containing the positive elements of S. It is constructed as the
intersection of S and N+:356 An elaborated example
‘Deﬁne S+ as S ∩ N+.’
So another well-known subset of Z is required, next to N, namely the set
of positive naturals, N+. This set has obviously been ‘imported’ in the proof,
so we may assume that it was deﬁned earlier, outside the context. In order
to record this, we temporarily suppress the ﬂagpole started in Figure 15.4; see
Figure 15.6, line (2). After that, we reopen the ﬂagpole and deﬁne S+, with the
help of the formal intersection operator ∩ introduced in Figure 13.2. (These
manipulations of the ﬂag poles are permitted; cf. Sections 2.5 and 11.1.)
. . .
(2) N+
:= {k : Z | k > 0}
(3) S+
:= S ∩ N+
: ps(Z)
Figure 15.6 Step 2 of the proof
Recall that S ∩N+ is an abbreviation of ∩(Z,S,N+), being of type ps(Z) by
the (inst)-rule.
The next sentence in the proof is only a short observation followed by a
deﬁnition:
‘This S+ has a minimum, call it d.’
This proof step requires the Minimum Theorem, as we have explained in the
previous sections (S+ has a minimum because it is a non-empty subset of Z
being bounded from below). So we try to use Figure 15.2, line (3), and deﬁne
d as minimum(S+,?1,?2), where ?1 must be of type S+ = ∅Z and ?2 of type
∃x : Z. lw-bndZ(S+,x).
For the ﬁrst proof object, ?1, it suﬃces to provide a positive element of S.
This set is, as we recall, the collection of all linear combinations of m and n.
Now m itself is such a linear combination, since m = m · 1 + n · 0, and m is
positive by the assumption named ass1, so m is a witness for the non-emptiness
of S+. We do not spell out here the arithmetical proof of m = m · 1 + n · 0,
since this is an easy consequence of what we discussed in the previous chapter.
We leave it open in line (4) of Figure 15.7, marking it as hole #2.
The second required proof object, ?2, is not hard to ﬁnd, since 1 acts as a
lower bound of S+. We decide to also leave this proof open, since the derivation
is straightforward. We therefore register it as hole #3. We come back to all open
‘holes’ in Section 15.6.
As a result of all this, we can formalise the above proof sentence and many
of the needed details as in Figure 15.7.15.4 Part II of the proof 357
. . .
(4) a4 := hole #2 : m = m · 1 + n · 0
(5) a5 := ... use ∃-in (twice) on a4 and use that 1 : Z and 0 : Z ... :
∃x,y : Z. (m = m · x + n · y)
(6) a6 := a5 : m ε S
(7) a7 := ass1 : m ε N+
(8) a8 := ... use ∧-in on a6 and a7 ... : m ε S+
(9) a9 := ... use ∃-in on m and a8 ... : ∃k : Z. (k ε S+
)
(10) a10 := a13[Fig.13.8](Z,S+
) a9 : S+
= ∅Z
(11) a11 := hole #3 : ∃x : Z. lw-bndZ(S+
,x)
(12) d := minimum(S+
,a10,a11) : Z
Figure 15.7 Step 3 of the proof
## 15.4 Part II of the proof
The proof of Bézout’s Lemma continues with a number of observations con-
cerning the minimum d deﬁned just now:
‘Since d ∈ S+, also d ∈ S, hence (i) d = mx0 +ny0 for certain
x0,y0 ∈ Z. Moreover, d > 0 since d ∈ N+.’
Proofs of these things are formalised in Figure 15.8, in a straightforward
manner. For min-prop, see Figure 15.2. In line (18) we add a simple conse-
quence of line (13) that we need later (line (29)).
. . .
(13) a13 := min-prop(S+
,a10,a11) : d ε S+
∧ lw-bndZ(S+
,d)
(14) a14 := ... use ∧-el1 on a13 ... : d ε S ∧ d ε N+
(15) a15 := ... use ∧-el1 on a14 ... : d ε S
(16) a16 := a15 : ∃x0,y0 : Z. (d = m · x0 + n · y0)
(17) a17 := ... use ∧-el2 on a14 ... : d > 0
(18) a18 := ... use ∧-el2 on a13 ... : ∀x : Z. (x ε S+
⇒ d ≤ x)
Figure 15.8 Step 4 of the proof
Next, the informal proof appeals to the Division Theorem:
‘Divide m by d. This gives q and r such that (ii) m = qd + r,
with 0 ≤ r < d.’
This is an easy application of Figure 15.3; see Figure 15.9. Recall that ass1
is the assumption that m > 0.358 An elaborated example
. . .
(19) a19 := div-the(m,d,ass1,a17) :
∃q,r : Z. (m = q · d + r ∧ (0 ≤ r ∧ r < d))
Figure 15.9 Step 5 of the proof
The informal proof goes on with a computation, leading to the result that
the remainder r must be in S:
‘By inserting d of (i) into (ii) we get m = q(mx0 + ny0) + r,
from which follows that r = m(1−qx0)−n(qy0). Hence r ∈ S. ’
This part of the proof is formally expressed in Figure 15.10.
Remember that the mentioned equation (i) was formalised in the type of
line (16), stating that ∃x0,y0 : Z. (d = m · x0 + n · y0). So we have a double
existential quantiﬁer. Moreover, equation (ii), expressing that m = q · d + r,
is part of the type of line (19), within the scope of another double existence
quantiﬁer: ∃q,r : Z. Hence, we have four ∃-quantiﬁers and hence we have to
employ the structure of ∃-el four times in order to be able to ‘work’ with the
mentioned x0, y0, q and r. Therefore we start with extra ﬂags introducing these
variables and their properties (see Figure 15.10).
Remark 15.4.1 The statement ∃x0,y0 : Z. (d = m·x0 +n·y0) in line (16)
should actually read ∃x0 : Z. (∃y0 : Z. ...). Hence, a proper usage of the ∃-el
procedure obliges us to introduce four ﬂags, two for the ﬁrst ∃-quantiﬁer:
− x0 : Z,
− v0 : ∃y0 : Z. (d = m · x0 + n · y0),
and subsequently, two for the second ∃-quantiﬁer:
− y0 : Z,
− v : d = m · x0 + n · y0.
This is one more ﬂag (with variable v0) than we give in Figure 15.10. We
expect, however, that the reader can deal with this omission (Exercise 15.4(b)).
A similar observation holds for the double ∃-proposition in line (19).
The equality m = q(mx0 + ny0) + r obtained in the informal proof can be
formally derived by the aid of substitutivity, as described in Section 12.2 (see
Figure 12.4). This is done in line (23).
For the other equality, r = m(1 − qx0) − n(qy0), we need arithmetical (or
computational) laws. For the time being, we denote the relevant proof term as
a hole; see line (24). In line (25) we slightly modify the result of line (24) in
order to make it ready for line (26). Again, we mark the proof term in line (25)
as a hole.15.4 Part II of the proof 359
. . .
x0,y0 : Z | v : (d = m · x0 + n · y0)
q,r : Z | w : (m = q · d + r ∧ (0 ≤ r ∧ r < d))
(20) a20 := ... use ∧-el1 on w ... : m = q · d + r
(21) a21 := ... use ∧-el2 and ∧-el1 on w ... : 0 ≤ r
(22) a22 := ... use ∧-el2, twice, on w ... : r < d
(23) a23 := eq-subs(Z, λz : Z. m = q · z + r, d, m · x0 + n · y0, v, a20) :
m = q · (m · x0 + n · y0) + r
(24) a24 := hole#4 : r = m · (1 − q · x0) − n · (q · y0)
(25) a25 := hole#5 : r = m · (1 − q · x0) + n · (−(q · y0))
(26) a26 := ... use ∃-in (twice) on a25 ... :
∃x,y : Z. (r = m · x + n · y)
(27) a27 := a26 : r ε S
Figure 15.10 Step 6 of the proof
The proof continues with the following text:
‘Suppose r > 0. Then r ∈ S+, so r ≥ d since d = min(S+).
But r < d: contradiction. Hence, r = 0.’
It is not hard to formalise this piece of text; see Figure 15.11. The holes in
Step 7 of the proof are:
− hole#6: a proof that r < d and d ≤ r entail ⊥;
− hole#7: a proof that 0 ≤ r and ¬(r > 0) result in r = 0.
. . .
z : r > 0
(28) a28 := ... use ∧-in on a27 and z ... : r ε S+
(29) a29 := ... use ∀-el and ⇒-el on a18, r and a28 ... : d ≤ r
(30) a30 := hole#6 (math on a22 and a29) : ⊥
(31) a31 := ... use ¬-in on a30 ... : ¬(r > 0)
(32) a32 := hole#7 (math on a21 and a31) : r = 0
Figure 15.11 Step 7 of the proof360 An elaborated example
## 15.5 Part III of the proof
The informal proof goes on with the sentence:
‘From (ii) now follows that m = q · d, hence d|m.’
This can be formalised in the λD-format as illustrated in Figure 15.12 (see
Figure 14.23 for the divisibility operator ‘|’).
. . .
(33) a33 := hole#8 (math on a20 and a32) : d · q = m
(34) a34 := ... use ∃-in on a33 ... : ∃x : Z. (d · x = m)
(35) a35 := a34 : d|m
(36) a36 := ... use ∃-el on a19 ... : d|m
(37) a37 := ... use ∃-el on a16 ... : d|m
Figure 15.12 Step 8 of the proof
The informal proof continues with:
‘In a similar manner we can prove that d|n.’
This statement is not accompanied by an explanation. Clearly, the proof
author supposes that the reader can easily see that a proof of d|n is very
similar to the one of d|m, given in line (37).
And this is indeed the case, if we realise that interchanging m and n delivers
the result desired. For example, n = n · 1 + m · 0 is the ‘mirror image’ of the
equation m = m · 1 + n · 0 stated in line (4), and proceeding with copying the
derivation above with a swap of m and n eventually gives what we want.
This is, however, a long way to go, and it neglects one of the powerful aspects
of λD: the deﬁnitional structure, and the use of parameter lists. Recall that a37
is actually accompanied by a parameter list, marked by the ﬂag pole preceding
it: it should read a37(m,n,ass1,ass2,ass3). Now all we have to do is to swap
m and n in this parameter list and perform appropriate substitutions for ass1,
ass2 and ass3); so we have to solve the question marks in a37(n,m,?1,?2,?3).
Check that the derivation rule (inst) (see Section 9.8) requires that ?1 must
be of type n > 0 and ?2 of type m > 0. Hence, we may simply take ?1 ≡ ass2
and ?2 ≡ ass1 (hence, ass1 and ass2 are swapped, as well). Finally, ?3 must
be of type coprime(n,m). But we already have the assumption ass3 of type
coprime(m,n). From this easily follows coprime(n,m), which we denote as a
hole in line (38) of Figure 15.13.
This solves all our problems and we are ready in no time (see Figure 15.13).15.5 Part III of the proof 361
. . .
(38) a38 := hole#9 : coprime(n,m)
(39) a39 := a37(n,m,ass2,ass1,a38) : d|n
Figure 15.13 Step 9 of the proof
The remainder of the informal proof is:
‘Since m and n are coprime, d must be 1, implying that 1 ∈ S.
Hence there exist x,y ∈ Z such that mx + ny = 1. ’
The formalisation of this ﬁnal part of the proof is given in Figure 15.14. It
is an easy consequence of the assumption ass3 that m and n are coprime, and
the fact that d ε S (line (15)). (For com-div and coprime, see Figure 14.23.)
. . .
(40) a40 := ... use ∧-in on a37 and a39, and again on a17 ... :
com-div(d,m,n) ∧ d > 0
(41) a41 := ass3 d a40 : d = 1
(42) a42 := ... use eq-subs on a15 and a41 ... : 1 ε S
(43) a43 := a42 : ∃x,y : Z. (1 = m · x + n · y)
(44) a44 := ... use symmetry of = on a43 ... :
∃x,y : Z. (m · x + n · y = 1)
Figure 15.14 Step 10 of the proof of Bézout’s Lemma
So we have brought the formalisation of Bézout’s Lemma to a conclusion: the
informal proof reproduced in Section 15.1 has (almost) completely been for-
malised in λD. By following the text as a guideline, we succeeded in expressing
the details of the proof in a formalised setting.
The formal proof is not yet ready for computer veriﬁcation, for two reasons:
− The many shortcuts we made by inserting ‘hints’, introduced by the phrase
‘use...’, must be adjusted by providing the intended formal expressions.
This can be done straightforwardly; it just requires a certain amount of
precise administrative work.
− There are a number of speciﬁc holes in the described formalisation. Most
of these are due to the absence of a suﬃcient amount of arithmetical fore-
knowledge. In Section 15.6 we discuss these holes one by one and suggest
how they may be ﬁlled.362 An elaborated example
We conclude this section with a number of general remarks.
It is good to realise that the simple expression a44(m,n,ass1,ass2,ass3) in
the ﬁnal line is a condensed version of the full (and completely formalised)
proof of Bézout’s Lemma. Hence, an extremely short answer to the assignment
‘prove Bézout’s Lemma’ could consist of one judgement only, composed of an
appropriate environment Δ, the ﬁve relevant declarations (corresponding to
the ﬁve parameters), plus the statement
a44(m,n,ass1,ass2,ass3) : ∃x,y : Z. (m · x + n · y = 1).
By repeatedly unfolding the visible constants, starting with a44 itself, we
obtain more and more details of the proof as it has been presented in this
chapter. In principle, we may proceed this unfolding until all of a4 to a44,
plus S, N+, S+ and d, have disappeared. As a ﬁnal result of such a complete
unfolding, we obtain one (very long) expression containing all the details that
were reviewed in this chapter. This, of course, is the other extreme.
Both extremes themselves are not very revealing: they are either too com-
pact or too detailed to convey what the essential elements of the proof are.
Somewhere in between these extremes is the full ﬂag-style proof represented
in Figures 15.4 up to 15.14. We hope that the reader agrees with the authors
that the presented derivation, albeit rather elaborate, contains a clear and
instructive formal exposition of the proof.
Another interesting observation is that the ﬁnal result in line (44), named
a44(m,n,ass1,ass2,ass3), may be instantiated in accordance with the deriva-
tion rules of λD. For example, we may take 55 for m and 28 for n. Next, we
need proofs for the positivity of 55 and 28, plus a proof for coprime(55,28).
When we have these proofs, we can extend the 44 lines of the proof above
with the four lines given in Figure 15.15, which can be derived in the empty
context.
(45) a45 := ... : 55 > 0
(46) a46 := ... : 28 > 0
(47) a47 := ... : coprime(55,28)
(48) a48 := a44(55,28,a45,a46,a47) : ∃x,y : Z. (55 · x + 28 · y = 1)
Figure 15.15 Specialising the proof of Bézout’s Lemma
So as a consequence of Bézout’s Lemma, we have obtained the proof object
a48(55,28,a45,a46,a47), coding a proof of
∃x,y∈Z(55 · x + 28 · y = 1).
Note that a48 (with empty parameter list) stands for the specialised proof15.6 The holes in the proof of Bézout’s Lemma 363
described in Figure 8.7, just as a44(m,n,ass1,ass2,ass3), together with the
accompanying context, abbreviates the general proof of Bézout’s Lemma as
expressed in Figure 8.6. A suitable unfolding of a44(m,n,ass1,ass2,ass3) gives
us all details described in Figure 8.6; the corresponding unfolding of a48 gives
us the content of Figure 8.7.
So now our attempts to fully formalise the proof of Bézout’s Lemma have
come to an end. As already said, there remain a number of promises that
we must hold: in particular, to deal with several loose ends that have to be
tied together, and to give proofs of the Minimum Theorem and the Division
Theorem. These will be the subjects of the remaining sections of the present
chapter.
## 15.6 The holes in the proof of Bézout’s Lemma
In the previous four sections we have given a formal λD-proof of Bézout’s
Lemma, in which we have skipped a number of details, called holes. We now
come back to these holes in order to ﬁll them.
Altogether, we have recorded nine holes. They all have the status of proof
objects that still have to be found. The propositions they prove are of diﬀerent
character, but none of them is really diﬃcult to prove, as we show below.
We list the propositions-to-prove one by one and discuss what the λD-proofs
of these (mostly small) problems look like by describing them informally. These
proofs should be inserted in the respective holes.
All variables mentioned below (m,n,x,y,q,r...) have type Z.
I. Hole #1 (line (2), Figure 15.2): Z is partially ordered by ≤
For the notion of partial order: see Figure 12.7, line (5). Informal proofs of
reﬂexivity and transitivity of ≤ are given in Section 14.10 (Lemma 14.10.1(a)
and (b)). Antisymmetry of (Z,≤) was dealt with in Exercise 14.29(a).
II. Hole #2 (line (4), Figure 15.7): m = m · 1 + n · 0
This follows directly from (1) m · 1 = m, (2) n · 0 = 0 and (3) m + 0 = m.
For the proof of equation (1): note that m · s0 = (m · 0) + m = 0 + m = m
(use times-ii, times-i (Figure 14.22) and plus-i-alt (Figure 14.14)).
For (2): use times-i, again; and for (3): plus-i (Figure 14.12).
III. Hole #3 (line (11), Figure 15.7): ∃x : Z. lw-bndZ(S+,x)
See Exercise 15.3.
IV. Hole #4 (line (24), Figure 15.10): m = q · (m · x0 + n · y0) + r implies
r = m · (1 − q · x0) − n · (q · y0)
This is the result of simple computation steps. It is good to realise that the364 An elaborated example
number of basic steps involved is larger than one might expect. To illustrate
this, we give some of the intermediate results below:
(1) m = q · (m · x0 + n · y0) + r,
(2) m = (q · (m · x0) + q · (n · y0)) + r,
(3) (m − m · (q · x0)) − n · (q · y0) = r,
(4) r = m · (1 − q · x0) − n · (q · y0).
We have left out several easy steps, in particular all necessary calls to asso-
ciativity and commutativity of both multiplication and addition. When writing
out the full proof, these calls would add about ten more steps to the chain of
computations.
V. Hole #5 (line (25), Figure 15.10): r = m · (1 − q · x0) − n · (q · y0) implies
r = m · (1 − q · x0) + n · (−(q · y0))
This is a consequence of x − y · z = x + (y · (−z)). Informal proof, based on
Figure 14.17, line (3) and Lemma 14.11.4:
x − y · z = x + (−(y · z)) = x + (y · (−z)).
VI. Hole #6 (line (30), Figure 15.11): r < d and d ≤ r imply ⊥
See Exercise 15.4(a).
VII. Hole #7 (line (32), Figure 15.11): 0 ≤ r and ¬(r > 0) imply r = 0
See Exercise 15.4(a).
VIII. Hole #8 (line (33), Figure 15.12): m = q·d+r and r = 0 imply d·q = m
See Exercise 15.4(b).
IX. Hole #9 (line (38), Figure 15.13): coprime(m,n) ⇒ coprime(n,m)
See Exercise 14.43.
## 15.7 The Minimum Theorem for Z
In Section 15.1 we noticed that the proof of Bézout’s Lemma uses a form of the
Minimum Theorem, a basic theorem in integer arithmetic. We gave a formal
version of this theorem, but without a proof, in Figure 15.2. Note that this
Minimum Theorem has a complementary Maximum Theorem for non-empty
subsets of Z being bounded from above (Exercise 15.7).
We consider it instructive to investigate the Minimum Theorem more thor-
oughly and give a formal proof, independently from the rest of this chapter.
So we have to convince ourselves by means of a λD-proof that each non-empty
subset of Z, if bounded from below, has a minimum with respect to the relation
≤ (deﬁned in Figure 14.18). We recall that ≤ is a partial order on Z, as we
already mentioned in Section 14.10. See also Hole #1 discussed in Section 15.6.15.7 The Minimum Theorem for Z 365
So let T be a non-empty subset of Z, bounded from below. Then it’s intu-
itively clear that it must have a minimum value. But why? We have to ground
our argument on the formal version of Z as given in Chapter 14 (in particular,
Section 14.2), together with the fact that the relation ≤ on Z is a partial order.
Let’s start with a sketch of the situation in λD-format (see Figure 15.16).
We have subset T of Z, a proof that T is non-empty and the assumption
that T is bounded from below. By the aid of Figure 13.8, we may rewrite the
non-emptiness of T as in line (1).
Assumption v and conclusion a1 both have ∃-expressions as types. Hence,
the ∃-el-rule suggests to add two pairs of new ﬂags, as depicted below.
T : ps(Z) | u : T = ∅Z | v : ∃x : Z. lw-bndZ(T,x)
(1) a†
1 := ... use a6[Fig.13.8] on u... : ∃n : Z. n ε T
l : Z | ass1 : lw-bndZ(T,l)
n : Z | ass2 : n ε T
. . .
†
parameters suppressed
Figure 15.16 Start of the proof of the Minimum Theorem
Our goal is to ﬁnd a least element of T in this setting.
There are several ways to achieve this. One possibility is to prove this by
contradiction: assume that T does not have a least element and derive ⊥. This
approach works well and was elaborated in Exercise 15.5.
In order to demonstrate the ﬂexibility of the λD-format, we follow another
strategy for the continuation of our proof attempt, which goes as follows. In
order to ﬁnd the minimum of T, we start with the lower bound l of T, which
is ‘below’ (to be precise: ≤) all elements of T. Now we climb upwards through
the integer numbers, one by one, until we strike upon a member of T. This
element must be the minimum of T.
Another way of expressing this method is that we browse upward, from l,
through other lower bounds of T, until we meet an element of T. This is a
lower bound which belongs to T, and consequently is the desired minimum of
T (cf. Figures 15.1 and 15.2). Note that all integers greater than this minimum
are no longer lower bounds of T. So, we can also phrase our strategy in terms
of lower bounds only: we look for a lower bound of T such that its successor is
not a lower bound of T.
Hence our upward search may be expressed as follows: we try to prove that
(i) ∃y : Z. (lw-bndZ(T,y) ∧ ¬lw-bndZ(T,sy)).366 An elaborated example
We prove this by contradiction: we assume that such a y does not exist, and
derive ⊥. The negation of (i) can be rewritten by means of logical equivalences
to:
(ii) ∀y : Z. (lw-bndZ(T,y) ⇒ lw-bndZ(T,sy)).
So (ii) is our assumption and our goal is to prove ⊥. We derive a contradic-
tion by showing that from (ii) we can derive that every x : Z is a lower bound
of T, i.e. ∀x : Z. lw-bndZ(T,x); and this can be easily refuted.
So we take the predicate
P := λx : Z. lw-bndZ(T,x),
and ﬁrst prove from assumption (ii) by (symmetric) induction over Z, that
∀x : Z. P x.
Clearly, P holds for the lower bound l introduced above, so ∃x : Z. P x by
∃-in. To make a good use of that fact, we take the variant of induction for Z
as mentioned in Remark 14.2.1, with l as the ‘start value’ for P. Then left to
prove is
(iii) ∀x : Z. (P x ⇒ (P(sx) ∧ P(px))).
Now (ii), our extra assumption, is ∀x : Z. (P x ⇒ P(sx)). So in order to
obtain (iii) we only have to prove ∀x : Z. (P x ⇒ P(px)). The proof of the
latter expression is not diﬃcult: if x is a lower bound of T, then a predecessor
of x must clearly also be a lower bound of T.
The conclusion by induction is ∀x : Z. P x. This conﬂicts with the non-
emptiness of T: we have n ε T (see ass2 of Figure 15.16) and albeit that n
itself may happen to be a lower bound of T, this is certainly not the case for
sn, which is greater than n ε T and hence not a lower bound of T.
This argumentation was formalised in Figure 15.17, which is a continuation
of Figure 15.16.
So now our proof has reached an important point: we have shown that there
exists an integer z such that z itself is a lower bound of T, but its successor sz
is not. Hence, this z is a good candidate for being the minimum of T. We prove
this conjecture in Figure 15.18, which we shall discuss in more detail below.
Recall (see Figure 15.2, line (1)) that we have to ﬁnd a proof for the expres-
sion
∃m : Z. leastZ(T,m),
where leastZ has been deﬁned in Figure 15.1, line (2).
Triggered by the ∃-quantiﬁer in the type of line (14) of Figure 15.17, we ﬁrst
raise ﬂags for assumptions with variables z and ass6, in order to be able to
appeal to ∃-el with respect to line (14) (what we shall do in line (27)).
It suﬃces to show that z satisﬁes the predicate of being a minimum of T, so15.7 The Minimum Theorem for Z 367
. . .
(2) P := λx : Z. lw-bndZ(T,x) : Z → ∗p
(3) a3 := ... use ∃-in on l and ass1 ... : ∃x : Z. P x
ass3 : ∀x : Z. (P x ⇒ P(sx))
x : Z | ass4 : P x
(4) a4 := ... use Exercise 14.23(b) ... : px ≤ x
t : Z | ass5 : t ε T
(5) a5 := ... use ∀-el and ⇒-el on ass4, t and ass5 ... : x ≤ t
(6) a6 := ... use Lemma 14.10.1(b) on a4 and a5 ... : px ≤ t
(7) a7 := ... use ⇒-in and ∀-in on a6 ... : P(px)
(8) a8 := ... use ⇒-in and ∀-in on a7 ... : ∀x : Z. (P x ⇒ P(px))
(9) a9 := ... use logical laws on ass3 and a8 ... :
∀x : Z. (P x ⇒ (P(sx) ∧ P(px)))
(10) a10 := ... use variant of induction for Z on a3 and a9 ... :
∀x : Z. P x
(11) a11 := ... use ∀-el on a10 and sn ... : P(sn)
(12) a12 := ... use ∀-el and ⇒-el on a11, n and ass2 ... : sn ≤ n
(13) a13 := ... use arithmetic on a12 ... : ⊥
(14) a14 := ... use ¬-in and logic on a13 ... :
∃z : Z. (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz))
Figure 15.17 The existence of a maximal lower bound of T
leastZ(T,z) (see line (25)), because from this follows line (26) via ∃-in. A triple
use of ∃-el then permits us to let the type of line (26) ‘descend’ to the original
context consisting of T, u and v, and we have proved the Minimum Theorem:
see the concluding line (29).
But how can we obtain leastZ(T,z), being the proof obligation in line (25)?
Let’s unfold it:
z ε T ∧ ∀t : Z. (t ε T ⇒ z ≤ t).
The part behind the ∧ in the last-mentioned expression is δ-equivalent to
lw-bndZ(T,z), which is the left-hand side of the assumption called ass6. So all
that’s left to prove is z ε T (see line (24)). This we prove by contradiction:
if ¬(z ε T), then we can show that not only z, but also sz is a lower bound
of T (line (22)); and this contradicts the right-hand side of the assumption
called ass6.368 An elaborated example
(A more complete proof of the Minimum Theorem, with the ‘hints’ worked
out, can be found in Appendix C, Section C.2.)
. . .
z : Z | ass6 : (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz))
(15) a15 := ... use ∧-el1 on ass6 ... : lw-bndZ(T,z)
(16) a16 := ... use ∧-el2 on ass6 ... : ¬lw-bndZ(T,sz)
ass7 : ¬(z ε T)
y : Z | ass8 : y ε T
(17) a17 := ... use ∀-el and ⇒-el on a15, y and ass8 ... :
z ≤ y
ass9 : z = y
(18) a18 := ... use ass9, ass7 and ass8 ... : ⊥
(19) a19 := ... use ¬-in on a18 ... : ¬(z = y)
(20) a20 := ... use ∧ -in on a17 and a19 ... : z < y
(21) a21 := ... use Exercise 14.29(b) on a20 ... : sz ≤ y
(22) a22 := ... use ⇒-in and ∀-in on a21 ... : lw-bndZ(T,sz)
(23) a23 := use ¬-el on a16 and a22 ... : ⊥
(24) a24 := ... use ¬-in and ¬¬-el on a23 ... : z ε T
(25) a25 := ... use ∧-in on a24 and a15 ... : leastZ(T,z)
(26) a26 := ... use ∃-in on z and a25 ... : ∃m : Z. leastZ(T,m)
(27) a27 := ... use ∃-el on a14 ... : ...
(28) a28 := ... use ∃-el on a1 ... : ...
(29) min-the(T,u,v) := ... use ∃-el on v ... : ∃m : Z. leastZ(T,m)
Figure 15.18 The remaining part of the proof of the Minimum Theorem
The proof as described in Figures 15.16 to 15.18 is not diﬃcult to follow.
The reader is invited to study it in detail and compare it with the full proof
in Appendix C.
We recall from Figure 15.2 that the existence of the minimum of T implies its
uniqueness (line (2)), so that we can give it a name, viz. minimum(T,u,v) (see
line (3)). Moreover, this minimum has some obvious characteristic properties,
which are also accounted for in the same ﬁgure (line (4)).15.8 The Division Theorem 369
## 15.8 The Division Theorem
In Section 15.1 we also mentioned a second fundamental theorem from arith-
metic needed in the proof of Bézout’s Lemma, namely the Division Theorem.
For a formal version, see Figure 15.3. It expresses that, for integers m and d
both greater than 0, there exist integers q and r such that m = q · d + r and
0 ≤ r < d. It can also be shown that such a q must be non-negative and that
the numbers q and r are unique.
Otherwise said: when dividing the so-called dividend m by divisor d, we
obtain the quotient q ≥ 0 and the remainder r. The quotient q is such that q·d
is the greatest multiple of d that is ≤ m. This implies that r, the diﬀerence
between m and q · d, is ≥ 0 but < d.
How can we formally prove this theorem? We have to show the existence of
q and r with the desired properties.
A promising approach is to consider multiples of d: start with 0 · d, which
is 0 so less than m, and continue with 1 · d, 2 · d, and so on. Since d > 0, we
must have 0 · d < 1 · d < 2 · d < ..., so somewhere these multiples must cross
the ‘border’ m: then (k+1)·d exceeds m, whereas k·d did not yet do so. This
k is then the quotient desired, and m − k · d is the remainder of the division.
This process recalls what we did in the previous section, when searching
for the minimum of a non-empty subset T of N. There we also looked for a
maximal element with a certain property (namely: to be a lower bound of T).
Obviously, we might give a proof of the Division Theorem by copying the
ideas described in the previous section. But we prefer not to redo the work we
already have done before. It appears more proﬁtable, and more in the line of
type theory, to apply the results of the previous section.
One way of doing this is to appeal to the mirror-image of the Minimum
Theorem, called the Maximum Theorem (which we have mentioned already in
the beginning of the previous section):
Each non-empty subset of Z that is bounded from above, has a maximum.
The theorem can be proven by the aid of the Minimum Theorem; see Exer-
cise 15.7.
In order to be able to refer formally to the Maximum Theorem and its
consequences, we list the relevant notions, without proofs, in Figure 15.19.
Note that an upper bound for T ⊆ Z with respect to relation ‘≤’ can be deﬁned
as a lower bound for T with respect to the reverse relation ‘≥’. Similarly, a
greatest element of T with respect to ≤ is a least element for ≥.
The Maximum Theorem implies that the set of all multiples l · d that are
smaller than or equal to m, has a maximum. And this, with a view to our
discussion above, suﬃces for the proof of the Division Theorem.370 An elaborated example
T : ps(Z)
l : Z
(1) up-bndZ(T,l) := lw-bnd(Z,≥,T,l) : ∗p
(2) grtstZ(T,l) := least(Z,≥,T,l) : ∗p
u : T = ∅Z | v : ∃x : Z. up-bndZ(T,x)
(3) max-the(T,u,v) := ... : ∃m : Z. grtstZ(T,m)
(4) max-uni-the(T,u,v) := ... : ∃1
m : Z. grtstZ(T,m)
(5) maximum(T,u,v) := ... : Z
(6) max-prop(T,u,v) := ... :
maximum(T,u,v) ε T ∧ up-bndZ(T,maximum(T,u,v))
Figure 15.19 The Maximum Theorem, related notions and consequences
We limit ourselves, again, to an elaborate sketch of the formalised proof
in λD, leaving a full formalisation to the reader. We start the proof of the
Division Theorem with a context consisting of two positive integers, m and d,
and divide the proof into three parts:
I. We deﬁne the set D of all multiples of d that are ≤ m
This subset D of Z is: D := {x : Z|(∃k : Z. (x = k · d)) ∧ x ≤ m}.
See Figure 15.20 for a formalisation. We also prove that D is non-empty and
bounded from above: we show that 0 ε D (line (5)), so D = ∅ (line (7)), and
that there is an upper bound of D, namely m (lines (9) and (10)).
m,d : Z | u : m > 0 | v : d > 0
(1) D†
:= {x : Z | (∃k : Z. (x = k · d)) ∧ x ≤ m} : ps(Z)
(2) a2 := ... use Lemma 14.11.1(a) ... : 0 = 0 · d
(3) a3 := ... use ∃-in ... : ∃k : Z. (0 = k · d)
(4) a4 := ... use ∧ -el1 on u ... : 0 ≤ m
(5) a5 := ... use ∧ -in on a3 and a4 ... : 0 ε D
(6) a6 := ... use ∃-in on a5 ... : ∃z : Z. (z ε D)
(7) a7 := a12[Fig. 13.8](Z,D,a6) : D = ∅Z
x : Z | w : x ε D
(8) a8 := ... use ∧ -el2 on w ... : x ≤ m
(9) a9 := ... use ⇒-in and ∀-in on a8 ... : up-bndZ(D,m)
(10) a10 := ... use ∃-in on a9 ... : ∃x : Z. up-bndZ(D,x)
†
parameters suppressed
Figure 15.20 The set D and some of its properties15.9 Conclusions 371
II. We deﬁne the maximum l of D and deﬁne the quotient q
The Maximum Theorem implies that D has a unique maximum, say l. We list
some relevant properties of l; among other things, l belongs to D, hence there
is a k such that l = k · d. We prove that this k is unique and call it q (see
Figure 15.21).
. . .
(11) l := maximum(D,a7,a10) : Z
(12) a12 := max-prop(D,a7,a10) : l ε D ∧ up-bndZ(D,l)
(13) a13 := ... use ∧ -el1 on a12 ... : (∃k : Z. (l = k · d)) ∧ l ≤ m
(14) a14 := ... use ∧ -el2 on a12 ... : ∀t : Z. (t ε D ⇒ t ≤ l)
(15) a15 := ... use ∧ -el1 on a13 ... : ∃k : Z. (l = k · d)
(16) a16 := ... use ∧ -el2 on a13 ... : l ≤ m
k1,k2 : Z | w1 : l = k1 · d | w2 : l = k2 · d
(17) a17 := ... use properties of = on w1 and w2 : k1 · d = k2 · d
(18) a18 := ... use ∧ -el2 on v ... : d = 0
(19) a19 := ... use Lemma 14.11.7 on a17 and a18 ... : k1 = k2
(20) a20 := ... use ⇒-in and ∀-in ... : ∃≤1
k : Z. (l = k · d)
(21) a21 := ... use ∧ -in on a15 and a20 ... : ∃1
k : Z. (l = k · d)
(22) q := ι(Z,λx : Z. (l = x · d),a21) : Z
Figure 15.21 The maximum l of D and its properties
III. We deﬁne the remainder r and prove that 0 ≤ r < d
We deﬁne r as the diﬀerence m−q ·d. Since q ·d is equal to the maximum l of
D, which is ≤ m, we conclude that r ≥ 0. What is left, is to prove that r < d.
We show this by contradiction: if r ≥ d, then (q + 1) · d would also be in D,
implying that q · d is not the maximum of D (see Figure 15.22).
Hence our investigation of how to prove the Division Theorem in λD-style
has come to an end. The transformation of the presented proof into a complete
λD-proof is not diﬃcult.
## 15.9 Conclusions
In the present chapter we have put system λD to the test, by trying to formalise
a substantial piece of mathematics, namely Bézout’s Lemma; to be more pre-
cise: a proof of it. The proof itself is not very sizeable; but it involves a number
of implicit notions that require a more explicit treatment, prior to the formali-
sation of the lemma itself. Altogether, this has accumulated into a challenging372 An elaborated example
. . .
(23) a23 := ι-prop(Z,λx : Z. (l = x · d),a21) : l = q · d
(24) a24 := ... use eq-subs on a16 and a23 ... : q · d ≤ m
(25) r := m − q · d : Z
(26) a26 := ... use arithm. on a24 and r ... : r ≥ 0
(27) a27 := ... use arithm. on the definition of r ... : m = q · d + r
w : d ≤ r
(28) a28 := ... use arithm. on w and a27 ... : q · d + d ≤ m
(29) a29 := ... use arithm. on a28 ... : (q + 1) · d ≤ m
(30) a30 := ... use eq-reﬂ ... : (q + 1) · d = (q + 1) · d
(31) a31 := ... use ∃-in on a30 ... : ∃k : Z. ((q + 1) · d = k · d)
(32) a32 := ... use ∧-in on a31 and a29 ... : (q + 1) · d ε D
(33) a33 := a14 ((q + 1) · d) a32 : (q + 1) · d ≤ l
(34) a34 := ... use eq-subs on a33 and a23 ... : (q + 1) · d ≤ q · d
(35) a35 := ... use arithm. on a34 ... : d ≤ 0
(36) a36 := ... use arithm. on v and a35 ... : ⊥
(37) a37 := ... use ¬-in and arithm. ... : r < d
(38) a38 := ... use ∧ -in (twice) on a27, a26 and a37 ... :
(m = q · d + r) ∧ (r ≥ 0 ∧ r < d)
(39) div-the(m,d,n,v) := use ∃-in (twice) on a38 :
∃q,r : Z. ((m = q · d + r) ∧ (r ≥ 0 ∧ r < d))
Figure 15.22 The completion of the proof of the Division Theorem
exercise, in which various aspects of the formalisation process have come to the
surface. Hence, the task we have set ourselves has appeared to be a good test
case; and now, in retrospect, it is sensible to conclude that we have succeeded
in this investigation concerning the useability of λD.
We may well conclude, albeit provisionally due to the restricted test set-
ting, that λD has suﬃcient power to formalise large amounts of mathematical
content. What convinces us still more is that previous endeavours with the λD-
like system Automath have shown that a large corpus of mathematical texts
could eﬀectively and successfully be translated into formal form, without in-
surmountable problems (see also de Bruijn, 1968, 1970; van Benthem Jutting,
1977). Hence, such formal translations are not only theoretically possible, but
also practically feasible.
We have started the ‘real work’ in this chapter with the formal deﬁnition
of a general minimum operator for certain subsets. We continued with λD-15.10 Further reading 373
formulations (provisionally without proofs) of the Minimum Theorem and the
Division Theorem, to be used in the proof of Bézout’s Lemma.
Then we embarked upon the proof of Bézout’s Lemma, which we have split
into three parts: Sections 15.3 to 15.5. In the process of developing the proof,
we took the liberty to introduce several shortcuts, for reasons of economy and
readability:
− We have applied the parameter list convention (Notation 11.7.1).
− As in previous chapters, we did not write out proof terms based on logical
(natural deduction) rules, but instead we only gave hints about the relevant
rules.
− We introduced ‘holes’, being omitted proof terms, to be constructed at a later
stage; many of these holes are based on mathematical (or computational)
lemmas being more or less out of scope for the progress of the proof, or too
complex to be ﬁlled in on the spot.
At the end of Section 15.5 it turned out that our formalisation task had
come to a successful end. We could immediately use this to derive a formal
proof of the instantiated Bézout Lemma, in which we have chosen speciﬁc m
and n. This shows all the more how powerful the parameter system of λD is
when it comes to ‘specialising’ a theorem or a lemma.
We have also seen in which manner the holes in the proof may be ﬁlled; this
was the subject of Section 15.6. Many small tasks of a varying nature have
been reviewed, with satisfactory results.
In Section 15.7 we considered the Minimum Theorem and how to prove it. A
formal approach by the aid of symmetric induction has delivered a viable solu-
tion, which could be formalised in λD, as required. The notion ‘lower bound’
played a prominent role in the process.
The Division Theorem was the focus in Section 15.8. It turned out that
a formal proof of this theorem could be built on the Maximum Theorem, a
‘mirror image’ of the Minimum Theorem, by choosing the proper perspective
on the mathematical content of the theorem. The proof, presented in three
parts, turned out to be, again, a fruitful exercise in formalisation.
## 15.10 Further reading
This chapter shows that a real mathematical proof of a real mathematical result
can be fully formalised in λD. An early successful attempt of a formalisation
of a serious piece of mathematics into a λD-like setting was made by L.S. van
Benthem Jutting and is described in his PhD thesis (van Benthem Jutting,
1977).
In today’s proof assistants there are a number of formalisations of Bézout’s374 An elaborated example
Lemma, which is often called Bézout’s Theorem or occurs without being ex-
plicitly named. F. Wiedijk has a web-page called Formalizing 100 Theorems,
(Wiedijk, 2013), where he keeps a list of the ‘top 100’ mathematical theorems
and the systems in which they have been formalised. Bézout’s Theorem is num-
ber 60 in the list, so we can see that it has been formalised (status of November
2013) in
− HOL Light, by J. Harrison,
− Mizar, by R. Kwiatek,
− Isabelle, by A. Chaieb,
− Coq, in the standard library,
− ProofPower, by R.D. Arthan.
The precise statement varies in the various systems, so it is interesting to
see what exactly has been formalised. We ﬁrst recall that in our setting (see
Figure 14.23) we deﬁne, for m,n : Z with m > 0 and n > 0, the gcd(m,n) to
be the unique k : Z for which
k|m ∧ k|n ∧ ∀l : Z. (l|m ∧ l|n ⇒ l ≤ k)
and we have introduced the name gcd-prop in the same ﬁgure for this deter-
mining property of the gcd.
In various proof assistants (e.g. Mizar) the notion of gcd that is used is
diﬀerent from ours. (Ours seems to be the standard one and can be found
in various textbooks.) The alternative deﬁnition, which we denote for clarity
as gcd (m,n), is that, given m,n : Z, gcd (m,n) is deﬁned to be the unique
natural number k for which
k|m ∧ k|n ∧ ∀l : Z. (l|m ∧ l|n ⇒ l|k).
So, gcd (m,n) is again the ‘greatest’ common divisor of m and n, but now
greatest in the ordering of ‘divisibility’. (Note that, if we allow k to be an
integer instead of a natural number, then the uniqueness is lost.) Let us use
gcd-prop (k,m,n) for the alternative gcd property displayed above.
It can be proved that, for m,n > 0, the deﬁnitions of gcd and gcd  coincide.
The nice thing about gcd  is that it also works for m = n = 0: we have
gcd (0,0) = 0, because 0 is the ‘greatest’ factor of 0 in the ‘divides’ relation.
The general form of Bézout’s Theorem states that for m,n : Z with m > 0
and n > 0,
∃x,y : Z. (mx + ny = gcd(m,n)).
In the present chapter we prove the ‘restricted form’, which states that for
m,n : Z with m > 0 and n > 0 and coprime(m,n),
∃x,y : Z. (mx + ny = 1),
where coprime(m,n) is deﬁned as ∀k : Z. ((k|m ∧ k|n ∧ k > 0) ⇒ k = 1) (see15.10 Further reading 375
Figure 14.23, again). (It can be proved that coprime(m,n) ⇔ gcd(m,n) = 1
for either one of the deﬁnitions of gcd.) So we prove Bézout’s Theorem for the
case where gcd(m,n) = 1.
Let’s now look at the formalisations of the theorem in the various proof
assistants.
HOL Light The theorem is called INT GCD EXISTS POS, and it states in
mathematical terms:
∀ab∃d(0 ≤ d ∧ d|a ∧ d|b ∧ ∃xy (d = ax + by)).
Here, a,b,d,x,y range over the integers. The theorem does not explicitly refer
to the notion of gcd, but states that there exists a positive d that is a linear
combination of a and b.
It can be proven that, if 0 ≤ d ∧ d|a ∧ d|b ∧ ∃ xy (d = ax + by), then d
satisﬁes gcd-prop (d,a,b) (and also the other way around), which implies the
uniqueness of the d in the theorem.
Mizar The theorem is called NEWTON:67 and occurs in Kwiatek (1990). It
states in mathematical terms:
∀m,n : nat (m > 0 ∨ n > 0 ⇒ ∃i,i1 : Z(im + i1n = gcd (m,n))).
Note that m,n range over nat and i,i1 range over Z and that the theorem is
proved under the hypothesis that m > 0 or n > 0, which is a bit more liberal
than in our case (m > 0 and n > 0). The general form of Bézout’s Theorem is
proved, for the natural numbers.
The notion of greatest common divisor in Mizar is the one that we called gcd 
above, so we have used that notation in the mathematical statement (where
Mizar of course writes gcd).
Isabelle The Isabelle system has its own list of the 100 formalised theorems
(Klein, 2013). Bézout’s Theorem states in mathematical terms:
∀a,b∃d,x,y (d|a ∧ d|b ∧ (ax − by = d ∨ bx − ay = d)),
where a,b,d,x,y range over nat. So, just like in HOL Light, the theorem does
not use the notion of gcd explicitly. The Isabelle formalisation circumvents hav-
ing to deal with integers (instead of the naturals) by making a case distinction:
either ax ≥ by or bx ≥ ay.
Coq The Coq system also has its own list of the 100 formalised theorems
(Madiot, 2013). Bézout’s Theorem is part of the standard library, and it is
formalised using inductive types. We translate it in standard mathematical
terms:
∀a,b,d : Z(gcd-prop (d,a,b) ⇒ ∃u,v : Z(ua + vb = d)),
where gcd-prop (d,a,b) denotes the alternative gcd property discussed above376 An elaborated example
(uniqueness is not explicitly proven). So, Coq has the same deﬁnition of gcd
as Mizar, using the ‘divisibility’ ordering.
ProofPower The ProofPower system (Arthan, 2013) by R.D. Arthan also
maintains a web-page (Jones, 2013) of the theorems from the ‘famous 100 the-
orems’ list that have been formalised in it. Bézout’s Theorem in mathematical
form reads
∀m,n(0 < m ∧ 0 < n ⇒
∃a,b(bn ≤ am ∧ gcd(m,n) = am − bn) ∨
∃a,b(am ≤ bn ∧ gcd(m,n) = bn − am)).
The variables m,n,a,b range over nat, and just like in Isabelle, the integers
are circumvented by making a case distinction in the conclusion.
Exercises
15.1 Let m,n ∈ N+ and deﬁne d as gcd(m,n).
(a) Prove in λD that d|m and d|n.
(b) Let m = k · d and n = l · d. Give an informal proof of gcd(k,l) = 1.
(c) Give an informal proof to show that the restricted version of Bézout’s
Lemma entails the general version (cf. Remark 15.1.1).
## 15.2 Find the proof objects in lines (3) and (4) of Figure 15.1.
## 15.3 See Section 15.6. Give a λD-proof leading to the missing proof object in
Hole #3.
## 15.4 Give a complete λD-version of the following derivations, by elaborating
the hints and ﬁlling the holes:
(a) Figure 15.11,
(b) Figure 15.12. (Apply ∃-el two times to obtain line (36), and two times
for line (37), in accordance with Remark 15.4.1.)
## 15.5 Consider the Minimum Theorem, as stated in Section 15.2, part II.
(a) Show that the following biimplication holds:
¬∃x : Z. leastZ(T,x) ⇔ ∀x : Z. (x ε T ⇒ ∃t : Z. (t ε T ∧ t < x)),
by ‘rewriting’ the left-hand side in a number of steps to the right-hand
side, using deﬁnition unfolding and logical and arithmetical lemmas.
(b) Extend Figure 15.16 with the assumption ¬∃x : Z. leastZ(T,x).
Give a λD-proof of ∀x : Z. ∃y : Z. (y ε T ∧ y < k) in this setting.
(Hint: use part (a) and the variant of induction for Z as described in
Remark 14.2.1.)
(c) Prove the Minimum Theorem by taking Figure 15.16 as the proof
setting, and showing that the assumption ¬∃x : Z. leastZ(T,x) then
leads to a contradiction.Exercises 377
## 15.6 Give a proof sketch for the uniqueness of the quotient and the remainder
in the Division Theorem.
## 15.7 Give a proof sketch of the Maximum Theorem, by making use of the
Minimum Theorem. (Hint: for subset T of Z, deﬁne T as the set of all
opposites of elements of T, i.e. T ≡ {x : Z|−x ε T}.)
## 15.8 Replace all hints in Figure 15.20 by proof objects in λD-style.
## 15.9 Give a full description of the arithmetical lemmas used in the hints of
Figure 15.22 and give informal proofs for each of them.16
Further perspectives
## 16.1 Useful applications of λD
The type theory λD provides a system in which mathematical deﬁnitions,
statements and proofs can be completely spelled out in a very structured way
that is still close to ordinary mathematical practice. This enables and facilitates
the formalisation of mathematics and the checking of its correctness. Below,
we summarise the main features of type theory, and in particular λD, as a
system for formalising mathematics.
Formalisation of mathematics via type theory In λD-like type theory, a
mathematical notion can be deﬁned precisely in full detail and the deﬁnition
can be reasoned with in a logically sound way. The type system enforces a very
high level of precision, which gives additional insight into mathematical and
logical constructs. Nevertheless, formalising mathematics in λD is still very
close to what is standard in mathematics.
Checking of mathematics The high level of precision of type theory greatly
improves the level of correctness of the formalised mathematics: incomplete
proofs, or proofs using illegal logical steps, are not accepted and a deﬁnition
has to be syntactically correct. The soundness of course still depends on the
axioms that one has assumed: if the axioms do not correspond to what one
wants to formalise, or if they are inconsistent, the derived results are still
useless. This already applies to informal mathematics, so the formalisation in
type theory is separate from the question of whether the axioms are sound. So
in general, one should use axioms sparingly.
Also the relevance of the results is up to the user, that is: do the deﬁ-
nitions and theorems correspond to notions that are considered interesting?
Here again, the fact that the formalised mathematics in λD is close to stan-
dard mathematics makes it easier to verify the correspondence between the
formalised notions and the intended ones. In summary, type theory shifts atten-
tion from correctness (which is dealt with by the system and therefore doesn’t380 Further perspectives
have to be discussed anymore) to relevance. Once formalised, the correctness
of a piece of mathematics can be left to λD.
Proof development The precision of λD guides the proof development. The
context structure (that we have depicted using ﬂags) clearly indicates the hy-
potheses and the variables that are ‘in scope’ and clariﬁes and guides the
thought process. This is particularly helpful for students that start to learn
logic or mathematics: at any time in the proof development it is clear what
has already been done (the deﬁnitions that are in scope), what is still left to
do (the open goals) and what is available to proceed (the previous theorems
and lemmas plus the assumptions that are in scope). The context structure of
proofs with ﬂags to indicate the scope of variables and assumptions provides
a partial proof, which is ready to be completed in a step-wise process.
Libraries In mathematics, the basic activities are doing proofs and giving
deﬁnitions. Both should be stored for reuse and it should be possible to refer
to them. The system λD provides these facilities: both deﬁnitions and the-
orems are stored in a perspicuous way, for easy access and referral. In λD,
deﬁnitions can depend on a context of parameters that are instantiated when
the deﬁnition is used. A crucial point of type theory is that giving proofs and
introducing deﬁnitions is very much the same type of activity: when proving,
one creates a ‘proof-term’ of a certain type, and then a name is introduced
for that proof-term. This name is what is being referred to later when using
the proved result. The speciﬁc situation in which a result is used is reﬂected
by the instantiations of the parameter list. (A diﬀerence between deﬁning a
proof and deﬁning a mathematical notion is that in the latter case one wants
to be able to unfold the deﬁnition, whereas in the case of a proof, one hardly
ever wants to do that.) Due to the naming of deﬁnitions and proofs, it is also
easy to ﬁnd the dependencies: which proof depends on which notion or other
result? All together, one obtains a large ‘environment’: a library of formalised
mathematics, consisting of deﬁnitions of mathematical concepts and theorems
with proofs.
## 16.2 Proof assistants based on type theory
We have shown that the type theory λD can be used to formalise mathematics.
The system includes various basic constructs to deﬁne mathematical notions
and also a mechanism to declare primitive notions that one wants to add. The
power of such a system does not just lie in doing formalisations on paper.
Its real strength lies in the fact that the theory can be cast into a computer
program that can serve as a proof assistant to interactively build up theorems16.2 Proof assistants based on type theory 381
and proofs, eventually leading to a computer-supported library of formalised
and computer-checked mathematics.
Computer-checked proofs A crucial aspect of λD (and type theory in general)
is that a term can be type-checked by a computer: there is a – not too diﬃcult –
algorithm that, given a term p, an environment Δ of deﬁnitions and a context Γ
of declarations, can compute the type of p in Γ, if it exists, and decide that p
is not typable in case no such type exists. This means that a user doesn’t have
to provide the type, but can leave that to the computer. So, λD is a system
that allows proof checking: an alleged proof (a term p) can be proposed and an
algorithm can check what formula it is a proof of (the type of p), if any.
Schematically we depict the proof checking situation as follows:
informal proof p informal statement A
? ?
formal proof p formal statement A
@
@
@
@
ﬁnd
type
@
@
@
@
ﬁnd
type
? ?
- - failure
report
failure
report
success success
p ok,
type is T
A ok
@
@
@
@
check
T=A
?
- failure
success
report
p has type A,
p proves A
Figure 16.1 Checking correctness by means of type theory
Figure 16.1 describes the following procedure. The informal proof p and the
statement it is supposed to prove, A, are translated to formal expressions p
and A. This step itself is not carried out by the computer – hence the dashed
arrows. (Of course, there can be computer support for this step, but at present
there are no computer programs that can fully translate a proof in natural382 Further perspectives
language to a formal proof term.) Then the type of p is computed, which
returns T. (If p is not typable, the computer will report that.) Also, A is
checked for well-formedness, which is also done by computing the type of A.
These steps are carried out by the computer. After this, we know that T and
A are well-formed types, and T is a type for p. The ﬁnal step, which is also
carried out by the computer, is to check whether T and A are equal; that is,
whether these types are βΔ-convertible. If so, then the computer has executed
proof checking successfully, which entails that p indeed proves A.
This was the basic idea behind the Automath project, started around 1970
by N.G. de Bruijn (de Bruijn, 1970, 1980; Nederpelt et al., 1994): develop
a computer program that can check mathematics and mathematical proofs
for their correctness. For an expression, this means checking whether it is
syntactically well-formed and what its type is. For a proof, this means checking
whether it is indeed a well-formed proof and what formula it is a proof of. The
system λD is a direct successor of the systems that were developed in the
Automath project of the 1970s.
Interactive proving In the meantime, computers have become more powerful,
and apart from letting the computer just check a given proof, one can let the
computer assist in constructing the proof. The technology of proof checking
has developed into interactive theorem proving and the systems used are called
proof assistants. Well-known proof assistants based on type theory are Coq
(Coq Development Team, 2012), Nuprl (Constable et al., 1986) and Agda (Bove
et al., 2009). These systems, which are based on diﬀerent variations of λD (that
we will not go into here) use the computer not just to check the type, but also to
construct a term. A basic concept in these systems is that of term reﬁnement.
One starts with a type A in a context Γ and an ‘open place’ (a ‘hole’), where
a term (of type A) has to be ﬁlled in. The system provides reﬁnement steps to
ﬁll a term in the hole in a sequence of steps. Basically, this provides computer
support for the formalisations we have done in the previous chapters, where we
have developed proofs of mathematical results in a step-wise manner. The idea
is that the computer does the administration, by providing the bookkeeping of
assumptions and variables that can be used, and by showing the open goals,
while the user tells it which step to take next.
In the Agda system, one is editing the term directly: one starts from just a
hole, which is then replaced by a part of a term, with still some holes left; then
one focuses on another hole and ﬁlls that in until there are no holes left. The
Agda system gives support for what can be ﬁlled in the hole (which depends
on the type of the hole) and checks the types of the unﬁnished proof terms
along the way. In the Coq system, one just looks at the holes themselves: these
are ﬁlled in by reﬁnement steps, but the user doesn’t see the term that is being16.2 Proof assistants based on type theory 383
constructed (in the background): the user only sees a sequence of holes with
their own context.
Automation and tactics In proof assistants based on type theory, the com-
puter is used to check the types and to store the terms, plus the environment of
deﬁnitions and the context of declarations. But maybe most importantly, the
system is used to construct terms. For example, the Coq system has powerful
tactics to reﬁne proof terms, and users are supported to write their own tac-
tics in a special ‘tactic language’ (or directly in the implementation language
of Coq). In this way, a signiﬁcant amount of automation can be (and has been)
added to the various proof assistants. A crucial aspect of a system like Coq is
that, no matter what (smart) tactic one writes to create proof terms, in the
end the completed term has to be typable in the type theory, with as type
the formula that one claims to prove. So, in the end everything is checked by
the kernel, which is just the type-checking algorithm for the type theory of
Coq. This feature, that a proof assistant generates proof terms that can be
checked for correctness by a small kernel, was named the ‘de Bruijn criterion’
by H.P. Barendregt (Barendregt & Geuvers, 2001), in honour of the pioneering
work of Automath, whose systems all satisfy this property.
Technical assistance The computer can provide various additional features
for theorem-proving support. An obvious desire is to enable sugared notation,
such as, for example, inﬁx notation for deﬁned binary operation and relation
symbols. Current proof assistants provide that. They also provide shorthand fa-
cilities for invoking standard techniques for deﬁnitions or proofs and sometimes
pull-down menus to select applicable tactics. Basically, these are all interface
features that are important for enhancing the proof process, but do not aﬀect
the underlying type theory and the formalised mathematics that is stored. The
primitives of the type theory already provide the mechanisms for type check-
ing and deﬁnition look-up, so one can always ask for the type of a term and
of the deﬁniens of a deﬁned notion. Slightly more advanced proof assistants
also provide ‘search’ mechanisms, e.g. to search for a lemma about a certain
relation, or a lemma of a certain shape.
Additional type-theoretic features The type theory of λD is simpler than that
of Coq, which also has a scheme for inductive types (see Bertot & Castéran,
2004). These are important for deﬁning e.g. data types from computer science,
but also mathematical notions like the closure of a property, or ‘the smallest
set X satisfying property Φ’. For mathematical applications, this is not crucial,
because in λD one can deﬁne ‘closure’ or ‘smallest set satisfying ...’ using the
higher order predicate logic that is included. Data types can be encoded using
higher order logic as well, but one doesn’t get the full computation rules for
these data types as term-conversion. To be more precise: in the presence of an384 Further perspectives
inductive type for the natural numbers with an associated scheme for structural
recursion, one has a (small) programming language, and the evaluation of
programs is part of the term-reduction, just like β-reduction in λD. In λD
we can specify recursive functions using equations, but these do not compute
within λD: computation is done using equational reasoning. Given our focus
on the formalisation of mathematics in this book, we don’t see that as a serious
limitation.
State of the art In recent times, proof assistants have become more mature
and the research and development of the systems have enabled various big
formalisations, both in mathematics and computer science. The topics range
from formalisations of pure mathematics to correctness of software or operating
systems. Usually, these are not isolated formalisation eﬀorts anymore, but part
of the building up of a large library of formalised mathematical results.
The practical work on implementing proof assistants based on type theory
has gone hand in hand with foundational studies of the underlying theory. Also,
results in computer science, concerning the variety of type notions present
in programming languages, have stimulated research in the essence and the
‘power’ of these type systems, and into the connections between the various
notions of type. The theoretical consequences for implementing mathematics
and logic, as sketched above, provide a ﬁrm backbone to these investigations.
## 16.3 Future of the ﬁeld
Various impressive computer formalisations of substantial bodies of mathemat-
ics have been done, which shows the maturity of this ﬁeld. We mention the for-
malisation of the Four Color Theorem in Coq by G. Gonthier (Gonthier, 2005,
2008). Another impressive result is the formalisation of the Feit-Thompson
Theorem in Coq by a team led by G. Gonthier (Gonthier et al., 2013). The
latter theorem, an important step in the classiﬁcation of ﬁnite simple groups,
is also known as the Odd-Order Theorem, and it states that every ﬁnite group
of odd order is solvable. Yet another major formalisation of mathematics is the
Flyspeck project led by T.C. Hales (Hales, 2006; Hales et al., 2010), in order
to formalise a proof of the Kepler Conjecture in the proof assistant HOL Light
(HOL system, 1988; Gordon & Melham, 1993; Gordon, 2000).
All older proof assistants have a basic ‘standard library’ of formalised math-
ematics and a number of larger ‘deep’ results based on that. Mizar (Mizar,
1989) is the system with the largest library of formalised mathematics.
An important application of proof assistants is in verifying computer sys-
tems: software and hardware. The ultimate level of correctness of a program
or a hardware design is obtained by proving it formally correct using a proof16.3 Future of the ﬁeld 385
assistant. In recent years we have seen a strong increase of computer-formalised
correctness proofs of artefacts from computer science.
Increasing use of proof assistants In the future, we expect an enormous
increase in the use of proof assistants. Our vision is that formalising a mathe-
matical proof may become as easy as writing mathematics in a mathematical
text editor such as L A TEX (Lamport, 1985) and that a mathematical proof will
only be accepted for publication when it has been formally checked. This means
that a large library of formalised mathematics will be built up, which allows
all results now appearing in journals and books to be accompanied by formal
proof code. Such formalised proofs can be inspected, experimented with and
be used in other proofs. This will vastly increase the use of formal (computer-
supported) veriﬁcation of computer science artefacts.
Right now, the above vision is far from a reality. There are some clear chal-
lenges ahead.
Automation All proof assistants provide a basic level of automation, but
this is not enough to let a large part of mathematical reasoning be done by
the machine. Proof steps that the average mathematician would skip and leave
unexplained are often not understood by the proof assistant and need further
elaboration. This is felt as a hindrance by users. Also, the proof assistant is
mostly unable to propose useful lemmas (from the library of known results).
We believe that these problems can be solved by a combination of powerful
automated theorem proving (using symbolic techniques) and machine learning
(using statistical inference). A considerable part of undergraduate mathematics
should be ‘known’ to the proof assistant, in the sense that it can use it instantly
without further assistance.
High-level explanation of formal proofs There is a considerable gap between
what a user of a proof assistant sees on the screen and what the mathematics
looks like on paper. This is to a great extent a direct consequence of the fact
that a proof assistant is a computer program that deals with formal syntax
(computer code), whereas mathematics on paper is informal text (in natural
language), with snippets of formal text (formulas) inside it. Some users can
easily relate the computer code to the informal mathematics, but in general
this turns out to be diﬃcult. So there is a need for better relating formalised
mathematics and formal proofs to their informal counterparts.
Also, fully detailed formal proofs and deﬁnitions contain so much detail that
the overview is lost and the ‘message’ of a proof (e.g. the crucial important
step) gets hidden. It is important that parts of proofs can be made invisible,
being available for further inspection on demand. So, one needs to be able to
fold and unfold sub-parts.386 Further perspectives
Step-wise proof development A mathematical proof is usually presented
(and also often found) by starting from a high-level argument and then ﬁlling
in the various details, which may take several iterations. This is close to a
step-wise reﬁnement method of programming. In type theory, this amounts
to constructing terms with holes which can later be selected to be ﬁlled in
further. In the proof assistant community this is known as a formal proof
sketch: an outline of a formal proof, with precise statements and deﬁnitions
that are formally veriﬁed for syntactic correctness by the proof assistant, with
a clear indication of which parts of the argument need to be ﬁlled in. A proof
assistant that provides this method of working is also easier for novice users
that currently experience a steep learning curve.
Export between proof assistants Mathematical research consists of develop-
ing new notions and results on top of existing ones, reusing and referring to
earlier work in the literature. With formalised mathematics, the situation is
diﬀerent. Various proof assistants have impressive libraries of formal mathe-
matics and proofs of deep mathematical theorems. However, it is not possible
to reuse results between diﬀerent proof assistants. It is even diﬃcult in prac-
tice to reuse an existing library in the same proof assistant. The latter issue is
related to the lack of high-level explanation of formal proofs, which we have
already addressed. The impossibility to reuse results between diﬀerent proof
assistants is more fundamental and due to the use of diﬀerent mathematical
foundations (set theory, higher order logic, type theory) and diﬀerent computer
representations (e.g. the language the proof assistant is programmed in). This
means that a proven theorem in one proof assistant cannot easily be transferred
to another; it may even be inconsistent to do so. The seamless combining of
results from diﬀerent proof assistants is a big challenge.
Didactics As we have already pointed out, for novices the learning curve
to use a proof assistant is very steep. One should know a bit of mathematics
and logic and quite a bit of the peculiarities of the system before one can start
using a proof assistant. In our ideal vision, that situation should be turned
around: a proof assistant should be easy to start using and would help to learn
logic and mathematics.
## 16.4 Conclusions
In this book, we have advocated the use of type theory as a vehicle for formal-
ising mathematics. In particular, we have introduced the system λD for that
purpose and we have shown how to do mathematics in it: logic, sets, arithmetic.
We highlight the main points that support the formalisation of mathematics
in λD.16.5 Further reading 387
− We have a relatively simple syntax that is built on the λ-calculus, and there-
fore well suited to the function-based approach underlying many mathemat-
ical topics.
− We use types that are appropriate for a natural translation of the set-and-
element ideas present in a great number of mathematical ﬁelds.
− We use propositions-as-types, proofs-as-terms and hence we incorporate the
usually informal notion of ‘proof’ into the formal system, so theorems and
proofs become ﬁrst-class citizens.
− We have decidability of type checking and, consequently, decidability of proof
checking; every well-typed term has a unique type that can be computed by
a relatively simple algorithm.
− Deﬁnitions are formally incorporated, so they are also ﬁrst-class citizens.
− We use explicit contexts to record assumptions and free variables.
− The economic display of contexts via ﬂags provides a feasible mechanism of
developing and representing proofs; this is close to the mathematical practice
using a natural deduction format.
In the present chapter we ﬁrst highlighted the further applications of λD,
starting by answering the questions: why formalise mathematics and why use
type theory for it? An important bonus of a formal system is that one can
develop a computer tool to actually work with the formal system. For type
theory, that has been one of the goals from the start: to implement the for-
mal system as a proof checker. This has developed into mature proof assistants
based on type theory. We have reviewed the developments in this ﬁeld. Then,
of course, we have asked the question of where this is all heading. Proof assis-
tants have not yet developed into a standard tool for mathematicians, but we
strongly believe they will in the future.
## 16.5 Further reading
Type theory appears in various forms in the literature and has a variety of
purposes, mostly related to programming languages, logic and proof theory,
or formalising mathematics. B. Russell and A.N. Whitehead were the ﬁrst to
use type theory as a language for mathematics in their Principia Mathematica
(Whitehead & Russell, 1910), but the Ramiﬁed Theory of Types of Russell
(Russell, 1908) is now seen as unnecessarily complicated. The introduction of
Russell and Whitehead’s book still provides a nice motivation and discussion
of the problems with paradoxes that were manifest at the time and that they
tried to circumvent with their system. A. Church’s simple theory of types is a
simpler system that uses type theory to deﬁne higher order logic; the article
(Church, 1940) is still very readable.388 Further perspectives
Interest in type theory has grown in the past decades, both in university
curricula and in circles of researchers (computer scientists, logicians, mathe-
maticians). In this section we make no attempt at giving a complete historic
overview. Instead we mention the important ideas and point to further litera-
ture in which these ideas are developed and discussed in more detail.
The Automath system by N.G. de Bruijn and his co-workers was the ﬁrst to
use type theory for formalising mathematics. The book (Nederpelt et al., 1994)
is an overview of the scientiﬁc work, including descriptions of formalisations.
See also the Automath Archive (2004). The article (Dechesne & Nederpelt,
2012) explores de Bruijn’s motivation for the development of Automath. The
paper (Geuvers & Nederpelt, 2013) gives a high-level introduction to the ideas
of de Bruijn and the concepts of Automath.
Around the same time as de Bruijn, P. Martin Löf developed his intuitionistic
theory of types, which was originally intended to give a constructive account of
the foundations of mathematics, in the style of L.E.J. Brouwer and A. Heyting
(see Troelstra & van Dalen, 1988), but it also turned out to serve as a logi-
cal framework that incorporates programming and proving. There have been
various implementations of Martin-Löf type theory (Martin-Löf, 1980) devel-
oped in Göteborg (Magnusson & Nordström, 1994), as ALF and Agda, and in
Ithaca (NY), as the Nuprl proof development system of R.L. Constable and
his team (Constable et al., 1986). The notes from Padova (Martin-Löf, 1980)
give a good introduction into the system, while Nordström et al. (1990) also
provide various examples from programming.
A third source of inﬂuential research in type theory is the work of J.-Y. Gi-
rard (Girard, 1972), from the beginning of the 1970s, who introduced the con-
cept of impredicativity into type theory, which enables various data types (like
the Church numerals) and logical connectives (like ∧ and ∨) to be deﬁnable
inside the type system. A good reference text is Proofs and Types (Girard et
al., 1989).
Research in type theory has gained momentum by the eﬀorts of various re-
search groups to build interactive proof assistants based on type theory. As we
have already remarked, λD has, as a type theory, most resemblances with the
Calculus of Constructions, ﬁrst implemented as a proof assistant by Th. Co-
quand and G. Huet (Coquand & Huet, 1988). The mentioned paper is still a
good reference and well readable. Later, the Calculus of Constructions was ex-
tended with inductive types, obtaining the Calculus of Inductive Constructions,
CIC, which is also implemented in the proof assistant Coq (Coq Development
Team, 2012). There is not really a standard reference for the rules of CIC,
but the introductory book to Coq (Bertot & Castéran, 2004) provides a very
comprehensible overview of Coq and CIC.16.5 Further reading 389
Another system is Lego (Pollack, 1994; Pollack et al., 2001), implemented
by R. Pollack (Edinburgh) and based on the so-called Extended Calculus of
Constructions of Z. Luo (Luo, 1990). Coq and Lego originate from the end of
the 1980s.
We also mention the Logical Framework implementation, based on the type
theory λP in Edinburgh (Harper et al., 1987; see also Pfenning, 2002).
In the last decades of the twentieth century, types have also obtained a
prominent role in programming language research, especially due to the pio-
neering work of R. Milner (Milner, 1978), J.R. Hindley (Hindley, 1969) and
J.C. Reynolds (Reynolds, 1974) in the 1970s, who ﬁrmly based functional pro-
gramming languages on typed λ-calculus. Milner also developed the so-called
LCF approach to theorem proving (Milner, 1972), which uses – basically – an
abstract data type approach: there is an abstract data type ‘theorem’ and the
only way to create an object of this type is by using the rules of logic. The
proof assistants from the HOL family (HOL system, 1988; Gordon & Melham,
1993; Gordon, 2000) and the interactive theorem prover Isabelle (Paulson,
1993; Nipkow et al., 2002) are based on this approach and also originate from
the 1980s.
There are various other proof assistants, some of them based purely on type
theory, others based on higher order logic (which uses type theory as its lan-
guage) and others based on set theory. Apart from Coq, the proof assistants
closest to using a type theory like λD are Agda (Bove et al., 2009), Matita
(Asperti et al., 2011) and Nuprl (Constable et al., 1986). For a more general
account of proof assistants (with a focus on the ones using dependent types),
presenting general ideas and comparison of approaches, see Barendregt & Geu-
vers (2001) and Geuvers (2009). Wiedijk (2006) also gives a nice comparison
of proof assistants by showing how the irrationality of
√
2 can be proved in 17
diﬀerent systems. Interesting overview papers can be found in the Special Issue
on Formal Proof published in the Notices of the American Mathematical So-
ciety (AMS, 2008), with contributions of T.C. Hales, G. Gonthier, J. Harrison
and F. Wiedijk.
Type theory is still developing, both within computer science (theory of
programming languages) and within mathematics. Also on the level of non-
dependent type theory, there is still a lot of research going on (see e.g. Baren-
dregt et al., 2013).
The focus of the present book is the formalisation of mathematics. A series
of papers on this matter can be found in the Journal of Automated Reasoning:
Special Issue on Formal Mathematics for Mathematicians (JAR, 2013). In this
direction, the latest development is ‘Homotopy Type Theory’, a ﬁeld founded
by V.A. Voevodsky, who interprets objects a,b : A as points in a space and a390 Further perspectives
proof of the identity a =A b as a path from a to b. This gives a new perspective
on formalising mathematics and on the foundations of mathematics, the so-
called ‘Univalent Foundations’. A good reference is the Univalent Foundations
Program (2013). See also the introductory lecture of Voevodsky (2014).
We observe that nowadays type theory is a mature and respected topic, and
that a lot of research is going on in the ﬁeld, ranging from foundational studies
to applications in computer science, proof assistants and mathematical logic.Appendix A
Logic in λD
A.1 Constructive propositional logic
Implication (cf. Figure 11.5)
A,B : ∗p
(1) ⇒ (A,B) := A → B : ∗p
Notation: A ⇒ B for ⇒ (A,B)
u : A → B
(2) ⇒-in(A,B,u) := u : A ⇒ B (see (2)∗)
u : A ⇒ B | v : A
(3) ⇒-el(A,B,u,v) := uv : B
(2)∗ Strategy for ⇒-introduction:
. . .
x : A
. . .
a(...,x) := ... : B
b(...) := λx : A. a(...,x) : A ⇒ B392 Logic in λD
Absurdity (cf. Figure 11.6)
(4) ⊥ := ΠA : ∗p . A : ∗
A : ∗p
u : A | v : A ⇒ ⊥
(5) ⊥-in(A,u,v) := v u : ⊥
u : ⊥
(6) ⊥-el(A,u) := uA : A
Negation (cf. Figure 11.7)
A : ∗p
(7) ¬(A) := A ⇒ ⊥ : ∗p
Notation: ¬A for ¬(A)
u : A → ⊥
(8) ¬-in(A,u) := u : ¬A
u : ¬A | v : A
(9) ¬-el(A,u,v) := uv : ⊥
Conjunction (cf. Figure 11.10)
A,B : ∗p
(10) ∧(A,B) := ΠC : ∗p . (A ⇒ B ⇒ C) ⇒ C : ∗p
Notation: A ∧ B for ∧ (A,B)
u : A | v : B
(11) ∧-in(A,B,u,v) := λC : ∗p . λw : A ⇒ B ⇒ C . wuv : A ∧ B
u : A ∧ B
(12) ∧-el1(A,B,u) := uA(λv : A. λw : B . v) : A
(13) ∧-el2(A,B,u) := uB (λv : A. λw : B . w) : BA.2 Classical propositional logic 393
Disjunction (cf. Figure 11.11)
A,B : ∗p
(14) ∨(A,B) := ΠC : ∗. (A ⇒ C) ⇒ (B ⇒ C) ⇒ C : ∗p
Notation: A ∨ B for ∨ (A,B)
u : A
(15) ∨-in1(A,B,u) := λC : ∗p .λv : A⇒C .λw : B⇒C . v u : A ∨ B
u : B
(16) ∨-in2(A,B,u) := λC : ∗p .λv : A⇒C .λw : B⇒C . wu : A ∨ B
C : ∗p
u : A ∨ B | v : A ⇒ C | w : B ⇒ C
(17) ∨-el(A,B,C,u,v,w) := uC v w : C
Biimplication (cf. Figure 11.12)
A,B : ∗p
(18) ⇔ (A,B) := (A ⇒ B) ∧ (B ⇒ A) : ∗p
Notation: A ⇔ B for ⇔ (A,B)
u : A ⇒ B | v : B ⇒ A
(19) ⇔-in(A,B,u,v) := ∧-in(A ⇒ B,B ⇒ A,u,v) : A ⇔ B
u : A ⇔ B
(20) ⇔-el1(A,B,u) := ∧-el1(A ⇒ B,B ⇒ A,u) : A ⇒ B
(21) ⇔-el2(A,B,u) := ∧-el2(A ⇒ B,B ⇒ A,u) : B ⇒ A
A.2 Classical propositional logic
Excluded Third axiom (cf. Figure 11.16)
A : ∗p
(22) exc-thrd(A) := ⊥ ⊥ : A ∨ ¬A394 Logic in λD
Double Negation (cf. Figure 11.17)
A : ∗p
u : A
(23) ¬¬-in(A,u) := λv : ¬A. v u : ¬¬A
(24) doub-neg(A) := ... see Figure 11.16 ... : ¬¬A ⇒ A
u : ¬¬A
(25) ¬¬-el(A,u) := doub-neg(A) u : A
Alternatives for Disjunction (cf. Figure 11.19)
A,B : ∗p
u : ¬A ⇒ B
(26) ∨-in-alt1(A,B,u) := a10[Fig. 11.18](A,B,u) : A ∨ B (see (26)∗)
v : ¬B ⇒ A
(27) ∨-in-alt2(A,B,v) := ... see Figure 11.19 ... : A ∨ B
u : A ∨ B
v : ¬A
(28) ∨-el-alt1(A,B,u,v) := a5[Fig. 11.13](A,B,u,v) : B
w : ¬B
(29) ∨-el-alt2(A,B,u,w) := ... see Figure 11.19 ... : A
(26)∗ Strategy for alternative ∨-introduction, first version:
. . .
x : ¬A
. . .
a(...,x) := ... : B
b(...) := ∨-in-alt1(A,B,λx : ¬A. a(...,x)) : A ∨ BA.3 Constructive predicate logic 395
A.3 Constructive predicate logic
Universal Quantiﬁcation (cf. Figure 11.22)
S : ∗s | P : S → ∗p
(30) ∀(S,P) := Πx : S . P x : ∗p
Notation: ∀x : S . P x for ∀(S,P)
u : Πx : S . P x
(31) ∀-in(S,P,u) := u : ∀x : S . P x (see (31)∗)
u : ∀x : S . P x | v : S
(32) ∀-el(S,P,u,v) := uv : P v
(31)∗ Strategy for ∀-introduction:
. . .
x : S
. . .
a(...,x) := ... : P x
b(...) := λx : S . a(...,x) : ∀x : S . P x
Existential Quantiﬁcation (cf. Figure 11.23)
S : ∗s | P : S → ∗p
(33) ∃(S,P) := ΠA : ∗p . ((∀x : S . (P x ⇒ A)) ⇒ A) : ∗p
Notation: ∃x : S . P x for ∃(S,P)
u : S | v : P u
(34) ∃-in(S,P,u,v) := λA : ∗p . λw : (∀x : S . (P x ⇒ A)). wuv :
∃x : S . P x
u : ∃x : S . P x | A : ∗p | v : ∀x : S . (P x ⇒ A)
(35) ∃-el(S,P,u,A,v) := uAv : A (see (35)∗)396 Logic in λD
(35)∗ Strategy for ∃-elimination:
. . .
a(...) := ... : ∃x : S . P x
x : S
u : P x
. . .
b(...,x,u) := ... : A
c(...,x) := λu : P x. b(...,x,u) : P x ⇒ A
d(...) := λx : S . c(...,x) : ∀x : S . (P x ⇒ A)
e(...) := ∃-el(S,P,a(...),A,d(...)) : A
A.4 Classical predicate logic
Alternatives for Existential Quantiﬁcation (cf. Figure 11.28)
S : ∗s | P : S → ∗p
u : ¬∀x : S . ¬(P x)
(36) ∃-in-alt(S,P,u) := a4[Fig. 11.27](S,P,u) : ∃x : S . P x
u : ∃x : S . P x
(37) ∃-el-alt(S,P,u) := a2[Fig. 11.25](S,P,u) : ¬∀x : S . ¬(P x)Appendix B
Arithmetical axioms, deﬁnitions and lemmas
Below we list axioms, deﬁnitions and lemmas concerning arithmetic in Z and
its subset N, as stated in Chapter 14.
Axiom (Fig. 14.3)
s is a bijection (ax-int1).
Lemma (Fig. 14.3)
(a) s is an injection (inj-suc),
(b) s is a surjection (surj-suc).
Lemma (Fig. 14.3)
(a) ∀y : Z. (s(py) = y) (s-p-ann),
(b) ∀y : Z. (p(sy) = y) (p-s-ann).
Axiom (Fig. 14.4)
For all P : Z → ∗p, [P 0∧∀x : Z. (P x⇒(P(sx)∧P(px)))] ⇒ ∀x : Z. P x
(ax-int2, symmetric induction over Z).
Deﬁnition (Fig. 14.5)
(a) For P : Z → ∗p, nat-cond(P) := P 0 ∧ ∀x : Z. (P x ⇒ P(sx)),
(b) N := λx : Z. ΠP : Z → ∗p . (nat-cond(P) ⇒ P x).
Lemma (Fig. 14.5)
(a) 0 ε N (zero-prop),
(b) ∀x : Z. (x ε N ⇒ sx ε N) (clos-prop),
(c) ΠQ : Z → ∗p . (nat-cond(Q) ⇒ (N ⊆ Q)) (nat-smallest).
Axiom (Fig. 14.6)
¬(p0 ε N) (ax-int3).
Lemma (Fig. 14.7)
(a) ∀x : Z. (x ε N ⇒ ¬(sx = 0)) (nat-prop1),
(b) ∀x,y : Z. (x ε N ⇒ (y ε N ⇒ (sx = sy ⇒ x = y))) (nat-prop2).398 Arithmetical axioms, deﬁnitions and lemmas
Lemma (Fig. 14.8)
For all P : Z → ∗p,
[P 0 ∧ ∀x : Z. (x ε N ⇒ (P x ⇒ P (sx)))] ⇒ ∀x : Z. (x ε N ⇒ P x)
(nat-ind, induction over N).
Lemma 14.3.1
∀x : Z. (x ε N ⇒ (x = 0 ∨ px ε N)).
Deﬁnition (Fig. 14.9) For x : Z:
(a) pos(x) := px ε N,
(b) neg(x) := ¬(x ∈ N).
Lemma (Fig. 14.9)
(a) ∀x : Z. (x ε N ⇒ (x = 0 ∨ px ε N)) (nat-split),
(b) ∀x : Z. (¬(x ε N) ∨ x = 0 ∨ px ε N) (nat-split-alt),
(c) ∀x : Z. (neg(x) ∨ x = 0 ∨ pos(x)) (trip).
Lemma 14.3.2
(a) ∀x : Z. (pos(sx) ⇔ x ε N),
(b) ∀x : Z. (pos(sx) ⇔ (x = 0 ∨ pos(x))),
(c) ∀x : Z. (neg(px) ⇔ (x = 0 ∨ neg(x))).
Lemma 14.3.3
(a) ∀x : Z. (pos(x) ⇔ x = 0 ∧ ¬neg(x)),
(b) ∀x : Z. (neg(x) ⇔ x = 0 ∧ ¬pos(x)),
(c) ∀x : Z. (x = 0 ⇔ ¬pos(x) ∧ ¬neg(x)).
Lemma (Fig. 14.12)
(a) ∀x : Z. (x + 0 = x) (plus-i),
(b) ∀x,y : Z. (x + sy = s(x + y)) (plus-ii),
(c) ∀x,y : Z. (x + py = p(x + y)) (plus-iii).
Lemma 14.6.1
(a) ∀x : Z. (0 + x = x) (plus-i-alt, Fig. 14.14),
(b) ∀x,y : Z. (sx + y = s(x + y)) (plus-ii-alt, Fig. 14.14),
(c) ∀x,y : Z. (px + y = p(x + y)) (plus-iii-alt, Fig. 14.14).
Lemma 14.6.2
∀x,y : Z. (x + y = y + x) (comm-add, Fig. 14.14).
Lemma 14.6.3
(a) ∀x,y : Z. (px + sy = x + y),
(b) ∀x,y : Z. (sx + py = x + y).
Lemma 14.6.4
∀x,y,z : Z. (x + (y + z) = (x + y) + z) (assoc-add, Fig. 14.14).
Lemma 14.6.5 (Cancellation Laws for addition)
(a) ∀x,y,z : Z. (x + z = y + z ⇒ x = y) (right-canc-add, Fig. 14.14),
(b) ∀x,y,z : Z. (x + y = x + z ⇒ y = z) (left-canc-add, Fig. 14.14).Arithmetical axioms, deﬁnitions and lemmas 399
Lemma 14.7.1 (Closure of N under addition)
∀x,y : Z. ((x ε N ∧ y ε N) ⇒ x + y ε N) (plus-clos-nat, Fig. 14.15).
Lemma 14.7.2 (Characterisation of negative numbers)
∀x : Z. (neg(x) ⇔ ∃y : Z. (pos(y) ∧ x + y = 0)).
Lemma 14.7.3 (Closure for negative integers)
∀x,y : Z. (neg(x) ∧ neg(y) ⇒ neg(x + y)).
Lemma 14.8.1 (Uniqueness of diﬀerence)
∀x,y : Z. ∃1z : Z. (z + y = x) (uni-dif , Fig. 14.16).
Lemma 14.8.2
∀x,y : Z. ((x − y) + y = x) (subtr-prop1, Fig. 14.16).
Lemma 14.8.3
∀x,y : Z. ((x + y) − y = x) (subtr-prop2, Fig. 14.16).
Lemma 14.8.4
∀x : Z. (x − x = 0).
Lemma 14.8.5
∀x : Z. (x − 0 = x).
Lemma 14.8.6
(a) ∀x,y : Z. (x − sy = p(x − y)),
(b) ∀x,y : Z. (x − py = s(x − y)).
Lemma 14.8.7
(a) ∀x,y : Z. (sx − y = s(x − y)),
(b) ∀x,y : Z. (px − y = p(x − y)).
Lemma 14.8.8
(a) ∀x : Z. (x + 1 = sx),
(b) ∀x : Z. (x − 1 = px).
Lemma 14.8.9 (Cancellation Laws for subtraction)
(a) ∀x,y,z : Z. (x − z = y − z ⇒ x = y),
(b) ∀x,y,z : Z. (x − y = x − z ⇒ y = z).
Lemma 14.8.10
(a) ∀x,y,z : Z. (x + (y − z) = (x + y) − z),
(b) ∀x,y,z : Z. (x − (y + z) = (x − y) − z),
(c) ∀x,y,z : Z. (x − (y − z) = (x − y) + z).
Lemma 14.8.11
∀x,y : Z. (pos(x − y) ⇔ neg(y − x)).
Lemma 14.9.1
(a) ∀x : Z. ((−x) + x = 0),
(b) ∀x,y : Z. (x + (−y) = x − y),
(c) ∀x,y : Z. (−(x + y) = (−x) − y).400 Arithmetical axioms, deﬁnitions and lemmas
Lemma 14.9.2
(a) −0 = 0,
(b) ∀x : Z. (−(−x) = x),
(c) ∀x : Z. (x = 0 ⇔ −x = 0).
Lemma 14.9.3
(a) ∀x : Z. (−(sx) = p(−x)),
(b) ∀x : Z. (−(px) = s(−x)).
Lemma 14.9.4
(a) ∀x : Z. (pos(x) ⇔ neg(−x)),
(b) ∀x : Z. (neg(x) ⇔ pos(−x)).
Lemma 14.9.5
(a) ∀x : Z. (pos(x) ∨ pos(−x) ∨ x = 0),
(b) ∀x : Z. (neg(x) ∨ neg(−x) ∨ x = 0).
Lemma 14.9.6
∀x : Z. (−x ε N ⇔ (neg(x) ∨ x = 0)).
Lemma 14.9.7
(a) ∀x : Z. (x ε N ∨ −x ε N),
(b) ∀x : Z. ((x ε N ∧ −x ε N) ⇒ x = 0).
Deﬁnition (Fig. 14.18)
(a) ≤Z := λx : Z. λy : Z. (y − x ε N),
(b) <Z := λx : Z. λy : Z. (x ≤Z y ∧ x=y).
Deﬁnition (Fig. 14.19)
(a) ≥Z := λx : Z. λy : Z. (y ≤Z x),
(b) >Z := λx : Z. λy : Z. (y <Z x).
Lemma 14.10.1
(a) ∀x : Z. (x ≤ x),
(b) ∀x,y,z : Z. ((x ≤ y ∧ y ≤ z) ⇒ (x ≤ z)),
(c) ∀x,y,z : Z. ((x + z ≤ y + z) ⇔ (x ≤ y)),
(d) ∀x,y,z : Z. ((x < y ∧ y ≤ z) ⇒ (x < z)),
(e) ∀x,y,z : Z. ((x + z < y + z) ⇔ (x < y)).
Lemma 14.10.2
(a) ∀x : Z. (pos(x) ⇔ x > 0),
(b) ∀x : Z. (neg(x) ⇔ x < 0),
(c) ∀x : Z. (x < 0 ∨ x = 0 ∨ x > 0).
Lemma 14.10.3
(a) ∀x,y : Z. (x < y ⇔ −y < −x),
(b) ∀x : Z. (x < 0 ⇔ −x > 0).Arithmetical axioms, deﬁnitions and lemmas 401
Lemma (Fig. 14.22)
(a) ∀x : Z. (x · 0 = 0) (times-i),
(b) ∀x,y : Z. (x · sy = (x · y) + x) (times-ii),
(c) ∀x,y : Z. (x · py = (x · y) − x) (times-iii).
Lemma 14.11.1
(a) ∀x : Z. (0 · x = 0),
(b) ∀x,y : Z. (sx · y = (x · y) + y),
(c) ∀x,y : Z. (px · y = (x · y) − y).
Lemma 14.11.2 (Right Distributivity Laws for multiplication)
(a) ∀x,y,z : Z. (x · (y + z) = (x · y) + (x · z)),
(b) ∀x,y,z : Z. (x · (y − z) = (x · y) − (x · z)).
Lemma 14.11.3
(a) ∀x,y : Z. (x · y = y · x),
(b) ∀x,y,z : Z. ((x · y) · z = x · (y · z)).
Lemma 14.11.4
∀x,y : Z. (x · (−y) = −(x · y)).
Lemma 14.11.5
(a) ∀x,y : Z. ((x ε N ∧ y ε N) ⇒ x · y ε N),
(b) ∀x,y : Z. ((x > 0 ∧ y > 0) ⇒ x · y > 0),
(c) ∀x,y : Z. ((x > 0 ∧ y < 0) ⇒ x · y < 0),
(d) ∀x,y : Z. ((x < 0 ∧ y < 0) ⇒ x · y > 0).
Lemma 14.11.6
∀x,y : Z. (x · y = 0 ⇒ (x = 0 ∨ y = 0)).
Lemma 14.11.7 (Right Cancellation Law for multiplication)
∀x,y,z : Z. ((x · z = y · z ∧ z = 0) ⇒ x = y).
Deﬁnition (Fig. 14.23)
For m,n : Z,
div(m,n) := ∃q : Z. (m · q = n) (Notation: m|n).
Lemma 14.12.1
(a) ∀m : Z. (m|0),
(b) 0|0,
(c) ∀n : Z. (0|n ⇒ n = 0).
Lemma 14.12.2
(a) ∀l,m : Z. (l|m ⇔ −l|m),
(b) ∀m : Z. (1|m).
Lemma 14.12.3
(a) ∀m : Z. (m|m),
(b) ∀l,m,n : Z. ((l|m ∧ m|n) ⇒ l|n),
(c) ∀m,n : Z. ((m ε N ∧ n ε N) ⇒ ((m|n ∧ n|m) ⇒ m = n)).402 Arithmetical axioms, deﬁnitions and lemmas
Deﬁnition (Fig. 14.23)
For k,m,n : Z,
(a) com-div(k,m,n) := k|m ∧ k|n,
(b) gcd-prop(k,m,n) :=
com-div(k,m,n) ∧ ∀l : Z. (com-div(l,m,n) ⇒ l ≤ k),
(c) coprime(m,n) := ∀k : Z. ((com-div(k,m,n) ∧ k > 0) ⇒ k = 1).
Lemma (Fig. 14.23)
For m,n : Z, s : m > 0, t : n > 0,
∃1k : Z. gcd-prop(k,m,n) (gcd-unq).
Deﬁnition (Fig. 14.23)
For m,n : Z, s : m > 0, t : n > 0,
gcd(m,n,s,t) := ι(Z,λk : Z. gcd-prop(k,m,n),gcd-unq(m,n,s,t)).
Lemma (Fig. 14.23)
For m,n : Z, s : m > 0, t : n > 0,
gcd(m,n,s,t) > 0 (gcd-pos).Appendix C
Two complete example proofs in λD
In this appendix we repeat two λD-derivations, but now with the ‘hints’ having
been worked out. The examples give an impression of what one might come
across in this process.
C.1 Closure under addition in N
We start with a full proof of the Closure property of addition in N, correspond-
ing to Figure 14.15. In the logical steps, we apply the rules for natural deduction
in λD-format as summarised in Appendix A. We do not use the short versions
of the proof objects as explained in Sections 11.5 and 11.10. Notational con-
ventions such as inﬁx notation are maintained in the λD-derivation, in order
to keep a good view on the mathematical background.
x : Z
(1) P(x) := λy : Z. (x + y ε N) : Z → ∗p
u : x ε N
(2) a2(x,u) := eq-sym(Z,x + 0,x,plus-i(x)) : x = x + 0
(3) a3(x,u) := eq-subs(Z,N,x,x + 0,a2(x,u),u) : P(x)0
y : Z
v : y ε N
w : P(x)y
(4) a4(x,u,y,v,w) := clos-prop (x + y)w : s(x + y) ε N
(5) a5(x,u,y,v,w) := eq-sym(Z,x + sy,s(x + y),plus-ii(x,y)) :
s(x + y) = x + sy404 Two complete example proofs in λD
. . .
(6) a6(x,u,y,v,w) := eq-subs(Z,N,s(x + y),x + sy,
a5(x,u,y,v,w),a4(x,u,y,v,w)) :
P(x)(sy)
(6a) a6a(x,u,y,v) := ⇒-in(P(x)y,P(x)(sy),
λw : P(x)y . a6(x,u,y,v,w)) :
P(x)y ⇒ P(x)(sy)
(6b) a6b(x,u,y) := ⇒-in(y ε N,P(x)y ⇒ P(x)(sy),
λv : y ε N. a6a(x,u,y,v)) :
y ε N ⇒ (P(x)y ⇒ P(x)(sy))
(7) a7(x,u) := ∀-in(Z,λy : Z. (y ε N ⇒ (P(x)y ⇒ P(x)(sy))),
λy : Z. a6b(x,u,y)) :
∀y : Z. (y ε N ⇒ (P(x)y ⇒ P(x)(sy)))
(7a) a7a(x,u) := ∧-in(P(x)0,∀y : Z. (y ε N ⇒ (P(x)y ⇒ P(x)(sy))),
a3(x,u),a7(x,u)) :
P(x)0 ∧ ∀y : Z. (y ε N ⇒ (P(x)y ⇒ P(x)(sy)))
(8) a8(x,u) := nat-ind(P(x))a7a(x,u) :
∀y : Z. (y ε N ⇒ x + y ε N)
(8a) a8a(x) := ⇒-in(x ε N,∀y : Z. (y ε N ⇒ x + y ε N),
λu : x ε N. a8(x,u)) :
x ε N ⇒ ∀y : Z. (y ε N ⇒ x + y ε N)
(9) a9 := ∀-in(Z,λx : Z. (x ε N ⇒ ∀y : Z. (y ε N ⇒ x + y ε N)),
λx : Z. a8a(x)) :
∀x : Z. (x ε N ⇒ ∀y : Z. (y ε N ⇒ x + y ε N))C.2 The Minimum Theorem 405
C.2 The Minimum Theorem
We now give a full proof of the Minimum Theorem (see Section 15.7). The
only incompletions that we tolerate are the justiﬁcations of ‘foreknowledge’
that were dealt with earlier in this book: we regard these results as proven
facts.
We start with a list in λD-format of the lemmas and exercises that are used
in the proof, leaving out the proof objects. Then we give an elaborated proof
of the Minimum Theorem, as a completion of Figures 15.16–15.18.
We use the notational conventions that we described and employed earlier,
for example in making free use of inﬁx notations (cf. Chapter 12, in particu-
lar Remark 12.4.1) and by omitting unaltered parameter lists in part II (cf.
Section 11.7).
In the logical steps, we apply the rules for natural deduction in λD-format
as described in Chapter 11 and summarised in Appendix A. In order to save on
space, we often employ the ‘shorter’ version of the proof terms accompanying
these rules, as mentioned in Sections 11.5 and 11.10.
I. Foreknowledge: lemmas and exercises
A,B : ∗p
(1) Exerc-7.5.(b)(A,B) := ... : ¬(A ⇒ B) ⇒ (A ∧ ¬B)
S : ∗s
P,Q,R : S → ∗p
(2) Exerc-7.10(S,P,Q,R) := ... : (∀x : S . (P x ⇒ Qx)) ⇒
(∀y : S . (P y ⇒ Ry)) ⇒ ∀z : S . (P z ⇒ (Qz ∧ Rz))
P,Q : S → ∗p
(3) Exerc-7.13(S,P,Q) := ... :
(∃x : S . P x) ⇒ (∀y : S . (P y ⇒ Qy)) ⇒ ∃z : S . Qz
P : S → ∗p
(4) Fig-11.29(S,P) := ... : (¬∀x : S . P x) ⇒ (∃y : S . ¬(P y))
(5) Lem-14.8.4 := ... : ∀x : Z. (x − x = 0)
(6) Lem-14.8.6.(a) := ... : ∀x,y : Z. (x − sy = p(x − y))
(7) Lem-14.10.1.(b) := ... : ∀x,y,z : Z. ((x ≤ y ∧ y ≤ z) ⇒ x ≤ z)
P : Z → ∗p
(8) Exerc-14.18(P) := ... :
((∃l : Z. P l) ∧ ∀x : Z. (P x ⇒ (P(sx) ∧ P(px)))) ⇒ ∀x : Z. P x
(9) Exerc-14.23.(b) := ... : ∀x : Z. (x > px)
(10) Exerc-14.29.(b) := ... : ∀x,y : Z. (x < y ⇒ sx ≤ y)406 Two complete example proofs in λD
II. A full proof of the Minimum Theorem
T : ps(Z) | u : T = ∅Z | v : ∃x : Z. lw-bndZ(T,x)
(1) a1 := a6[Fig.13.8](Z,T,u) : ∃n : Z. n ε T
l : Z | ass1 : lw-bndZ(T,l)
n : Z | ass2 : n ε T
(2) P := λx : Z. lw-bndZ(T,x) : Z → ∗p
(3) a3 := ∃-in(Z,P,l,ass1) : ∃x : Z. P x
ass3 : ∀x : Z. (P x ⇒ P(sx))
x : Z | ass4 : P x
(4) a4 := ∧-el1(px ≤ x,px = x,Exerc-14.23.(b) x) : px ≤ x
t : Z | ass5 : t ε T
(5) a5 := ass4 tass5 : x ≤ t
(5a) a5a := ∧-in(px ≤ x,x ≤ t,a4,a5) := px ≤ x ∧ x ≤ t
(6) a6 := Lem-14.10.1.(b) (px) x t a5a : px ≤ t
(7) a7 := λt : Z. λass5 : (t ε T). a6 : P(px)
(8) a8 := λx : Z. λass4 : P x. a7 : ∀x : Z. (P x ⇒ P(px))
(9) a9 := Exerc-7.10(Z,P,λx : Z. P(sx),λx : Z. P(px)) ass3 a8 :
∀x : Z. (P x ⇒ (P(sx) ∧ P(px)))
(9a) a9a := ∧-in(∃x : Z. P x,
∀x : Z. (P x ⇒ (P(sx) ∧ P(px))),a3,a9) :
(∃x : Z. P x) ∧ ∀x : Z. (P x ⇒ (P(sx) ∧ P(px)))
(10) a10 := Exerc-14.18(P) a9a : ∀x : Z. P x
(11) a11 := a10 (sn) : P(sn)
(12) a12 := a11 nass2 : sn ≤ n
(12a) a12a := eq-subs(Z,λx : Z. (x ε N),n − sn,p(n − n),
Lem-14.8.6.(a) nn,a12) : p(n − n) ε N
(12b) a12b := eq-subs(Z,λx : Z. (px ε N),n − n,0,
Lem-14.8.4 n,a12a) : p0 ε N
(13) a13 := ax-int3 a12b : ⊥
(13a) a13a := λass3 : (∀x : Z. (P x ⇒ P(sx))). a13 :
¬∀x : Z. (P x ⇒ P(sx))C.2 The Minimum Theorem 407
(13b) a13b := Fig-11.29(Z,λy : Z. (P y ⇒ P(sy))) a13a :
∃x : Z. ¬(P x ⇒ P(sx))
(13c) a13c := λy : Z. Exerc-7.5.(b)(P y,P(sy)) :
∀y : Z. (¬(P y ⇒ P(sy)) ⇒ (P y ∧ ¬P(sy)))
(14) a14 := Exerc-7.13(Z,λx : Z. ¬(P x ⇒ P(sx)),
λz : Z. (P z ∧ ¬P(sz))) a13b a13c :
∃z : Z. (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz))
z : Z | ass6 : (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz))
(15) a15 := ∧-el1(lw-bndZ(T,z),¬lw-bndZ(T,sz),ass6) :
lw-bndZ(T,z)
(16) a16 := ∧-el2(lw-bndZ(T,z),¬lw-bndZ(T,sz),ass6) :
¬lw-bndZ(T,sz)
ass7 : ¬(z ε T)
y : Z | ass8 : y ε T
(17) a17 := a15 y ass8 : z ≤ y
ass9 : z = y
(18) a18 := eq-subs(Z,λx : Z. ¬(x ε T),z,y,ass9,ass7)ass8 :
⊥
(19) a19 := λass9 : (z = y). a18 : ¬(z = y)
(20) a20 := ∧-in(z ≤ y,¬(z = y),a17,a19) : z < y
(21) a21 := Exerc-14.29.(b) z y a20 : sz ≤ y
(22) a22 := λy : Z. λass8 : (y ε T). a21 : lw-bndZ(T,sz)
(23) a23 := a16 a22 : ⊥
(24) a24 := ¬¬-el(z ε T,λass7 : ¬(z ε T). a23) : z ε T
(25) a25 := ∧-in(z ε T,lw-bndZ(T,z),a24,a15) : leastZ(T,z)
(26) a26 := ∃-in(Z,λy : Z. leastZ(T,y),z,a25) :
∃m : Z. leastZ(T,m)
(27) a27 := ∃-el(Z,λx : Z. (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz)),a14,
∃m : Z. leastZ(T,m),
λz : Z. λass6 : (lw-bndZ(T,z) ∧ ¬lw-bndZ(T,sz)). a26) :
∃m : Z. leastZ(T,m)408 Two complete example proofs in λD
(28) a28 := ∃-el(Z,λx : Z. (x ε T),a1,∃m : Z. leastZ(T,m),
λn : Z. λass2 : (n ε T). a27) :
∃m : Z. leastZ(T,m)
(29) min-the(T,u,v) := ∃-el(Z,λx : Z. lw-bndZ(T,x),v,
∃m : Z. leastZ(T,m),λl : Z. λass1 : lw-bndZ(T,l). a28) :
∃m : Z. leastZ(T,m)Appendix D
Derivation rules for λD
(sort) ∅ ; ∅  ∗ : 
(var)
Δ ; Γ  A : s
Δ ; Γ, x : A  x : A
if x ∈ Γ
(weak)
Δ ; Γ  A : B Δ ; Γ  C : s
Δ ; Γ, x : C  A : B
if x ∈ Γ
(form)
Δ ; Γ  A : s1 Δ ; Γ, x : A  B : s2
Δ ; Γ  Πx : A. B : s2
(appl)
Δ ; Γ  M : Πx : A. B Δ ; Γ  N : A
Δ ; Γ  MN : B[x := N]
(abst)
Δ ; Γ, x : A  M : B Δ ; Γ  Πx : A. B : s
Δ ; Γ  λx : A. M : Πx : A. B
(conv)
Δ ; Γ  A : B Δ ; Γ  B
: s
Δ ; Γ  A : B if B
Δ
=β B
(def )
Δ ; Γ  K : L Δ ; x : A  M : N
Δ , x : A  a(x) := M : N ; Γ  K : L
if a ∈ Δ
(def -prim)
Δ ; Γ  K : L Δ ; x : A  N : s
Δ , x : A  a(x) := ⊥ ⊥ : N ; Γ  K : L
if a ∈ Δ
(inst)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x) := M : N ∈ Δ
(inst-prim)
Δ; Γ  ∗ :  Δ; Γ  U : A[x := U]
Δ ; Γ  a(U) : N[x := U]
if x : A  a(x):=⊥ ⊥:N ∈ Δ
Derived rule:
(par)
Δ ; x : A  M : N
Δ,D ; x : A  a(x) : N
if D ≡ x : A  a(x) := M : N and a ∈ ΔReferences
AMS, 2008: Notices of the American Mathematical Society, 55 (11).
Arthan, R.D., 2013: ProofPower,
www.lemma-one.com/ProofPower/index/index.html.
Asperti, A., Ricciotti, W., Sacerdoti Coen, C. and Tassi, E., 2011: The Matita
Interactive Theorem Prover. In Bjørner, N. and Sofronie-Stokkermans, V., eds,
Automated Deduction: CADE 23, 23rd International Conference on Automated
Deduction, Wroclaw, Poland, 31 July – 5 August 2011, pp. 64–69, Springer. See
also matita.cs.unibo.it/.
Automath Archive, 2004: Home Page, www.win.tue.nl/automath/.
Barendregt, H.P., 1981: The Lambda Calculus: Its Syntax and Semantics,
North-Holland Publishing Company.
Barendregt, H.P., 1992: Lambda calculi with types. In Abramski, S., Gabbay, D. and
Maibaum, T., eds, Handbook of Logic in Computer Science, pp. 117–309,
Oxford University Press.
Barendregt, H. and Geuvers, H., 2001: Proof assistants using dependent type
systems. In Robinson, A. and Voronkov, A., eds, Handbook of Automated
Reasoning, Vol. 2, pp. 1149–1238, Elsevier.
Barendregt, H.P., Dekkers, W. and Statman, R., eds, 2013: Lambda Calculus with
Types, Cambridge University Press.
van Benthem Jutting, L.S., 1977: Checking Landau’s ‘Grundlagen’ in the
AUTOMATH system, PhD thesis, Eindhoven University of Technology. See also
Nederpelt et al., 1994, pp. 763–780.
van Benthem Jutting, L.S., 1993: Typing in Pure Type Systems, Information and
Computation, 105 (1), pp. 30–41.
van Benthem Jutting, L.S., McKinna, J. and Pollack, R., 1994: Checking algorithms
for Pure Type Systems. In Barendregt, H.P. and Nipkow, T., eds, Types for
Proofs and Programs, International Workshop TYPES’93, Nijmegen, The
Netherlands, pp. 19–61, Springer.
Bertot, Y. and Castéran, P., 2004: Interactive Theorem Proving and Program
Development: Coq’Art: the Calculus of Inductive Constructions, Springer.
Böhm, C. and Berarducci, A., 1985: Automatic synthesis of typed Λ-programs on
term algebras, Theoretical Computer Science, 39, pp. 135–154.
Bove, A., Dybjer, P. and Norell, U., 2009: A brief overview of Agda: a functional
language with dependent types. In Ierghofer, S., Nipkow, T., Irban, C. and
Wenzel, M., eds, Proceedings of the 22nd International Conference on Theorem412 References
Proving in Higher Order Logics, TPHOLs 2009, Munich, Germany, 17–20
August 2009, pp. 73–78, Springer. See also wiki.portal.chalmers.se/agda/.
de Bruijn, N.G., 1968: Example of a text written in Automath. In Nederpelt et al.,
1994, pp. 687–700.
de Bruijn, N.G., 1970: The mathematical language AUTOMATH, its usage and
some of its extensions. In Laudet, M., Lacombe, D., Nolin, L. and
Schützenberger, M., eds, Symposium on Automatic Demonstration, Versailles,
pp. 29–61, Springer. Reprinted in Nederpelt et al., 1994, pp. 73–100.
de Bruijn, N.G., 1972: Lambda calculus notation with nameless dummies, a tool for
automatic formula manipulation, with application to the Church–Rosser
Theorem, Indagationes Mathematicae, 34 (5), pp. 381–392, Elsevier.
de Bruijn, N.G., 1980: A survey of the project AUTOMATH. In Seldin & Hindley,
1980, pp. 579–606.
Cantor, G., 1874: Über eine Eigenschaft des Inbegriﬀes aller reellen algebraischen
Zahlen, Journal für die Reine und Angewandte Mathematik, 77, pp. 258–262,
Georg Reimer Verlag. English translation in Ewald, W., ed., From Kant to
Hilbert: A Source Book in the Foundations of Mathematics, 1996, pp. 840–843,
Clarendon Press.
Cardone, F. and Hindley, J.R., 2009: Lambda-calculus and combinators in the 20th
century. In Gabbay, D.M. and Woods, J., eds, Handbook of the History of Logic,
Vol. 5, pp. 723–817, Elsevier.
Church, A., 1933: A set of postulates for the foundation of logic, Annals of
Mathematics, 33, pp. 346–366, and 34, pp. 839–864.
Church, A., 1935: An unsolvable problem of elementary number theory, preliminary
report (abstract), Bulletin of the American Mathematical Society, 41,
pp. 332–333.
Church, A., 1936a: A note on the Entscheidungsproblem, Journal of Symbolic Logic,
1, pp. 40–41.
Church, A., 1936b: An unsolvable problem of elementary number theory, American
Journal of Mathematics, 58, pp. 345–363.
Church, A., 1940: A formulation of the simple theory of types, Journal of Symbolic
Logic, 5, pp. 56–68.
Constable, R.L., Allen, S.F., Bromley, H.M., Cleaveland, W.R., Cremer, J.F.,
Harper, R.W., Howe, D.J., Knoblock, T.B., Mendler, N.P., Panangaden, P.,
Sasaki, J.T. and Smith, S.F., 1986: Implementing Mathematics with the Nuprl
Development System, Prentice-Hall.
Coq Development Team, 2012: The Coq Proof Assistant, Reference Manual, Version
8.4. See coq.inria.fr/refman/.
Coquand, Th., 1985: Une théorie des constructions, PhD thesis, University of Paris
VII.
Coquand, Th. and Huet, G., 1988: The Calculus of Constructions, Information and
Computation, 76, pp. 95–120.
Curry, H.B., 1930: Grundlagen der Kombinatorischen Logik, American Journal of
Mathematics, 52 (3), pp. 509–536, and (4), pp. 789–834.
Curry, H.B., 1969: Modiﬁed basic functionality in combinatory logic, Dialectica, 23,
pp. 83–92.
Curry, H.B. and Feys, R., 1958: Combinatory Logic, Vol. 1, North-Holland
Publishing Company.
van Daalen, D.T., 1973: A description of AUTOMATH and some aspects of its
language theory. In Braﬀort, P., ed., Proceedings of the Symposium APLASM,
Orsay, France. Reprinted in Nederpelt et al., 1994, pp. 101–126.References 413
van Dalen, D., 1994: Logic and Structure, 3rd augmented edition, Springer.
van Dalen, D., Doets, H.C. and de Swart, H., 1978: Sets: Naive, Axiomatic and
Applied, Pergamon Press.
Damas, L. and Milner, R., 1982: Principal type-schemes for functional programs. In
DeMillo, R.A., ed., POPL ’82: Proceedings of the 9th ACM SIGPLAN-SIGACT
Symposium on Principles of Programming Languages, pp. 207–212, ACM.
Davis, M., ed., 1965: The Undecidable, Basic Papers on Undecidable Propositions,
Unsolvable Problems and Computable Functions, Raven Press.
Dechesne, F. and Nederpelt, R.P., 2012: N.G. de Bruijn (1918–2012) and his road to
Automath, the earliest proof checker, The Mathematical Intelligencer, 34 (4),
pp. 4–11.
Fitch, F., 1952: Symbolic Logic, An Introduction, The Ronald Press Company.
Frege, F.L.G., 1893: Grundgesetze der Arithmetik, Verlag Hermann Pohle. Facsimile
reprints in 1962 and 1998, Georg Olms Verlag.
Gandy, R.O., 1980: An early proof of normalization by A.M. Turing. In Seldin &
Hindley, 1980, pp. 453–455, Academic Press.
Gentzen, G., 1934/5: Untersuchungen über das logische Schliessen, I, Mathematische
Zeitschrift, 39 (2).
Geuvers, J.H., 1995: A short and ﬂexible proof of Strong Normalization for the
Calculus of Constructions. In Dybjer, P., Nordström, B. and Smith, J., eds,
Types for Proofs and Programs, International Workshop TYPES ’94, Bastad,
Sweden, pp. 14–38, Springer.
Geuvers, J.H., 2001: Induction is not derivable in second order dependent type
theory. In Abramsky, S., ed., Proceedings of Typed Lambda Calculus and
Applications, TLCA 2001, Krakow, Poland, May 2001, pp. 166–181, Springer.
Geuvers, J.H., 2009: Proof assistants: history, ideas and future, Sadahana Journal,
Academy Proceedings in Engineering Sciences, Indian Academy of Sciences, 34
(1), Special Issue on Interactive Theorem Proving and Proof Checking, pp. 3–25.
Geuvers, J.H., 2013: Inconsistency of ‘Automath powersets’ in impredicative type
theory, Short note, www.cs.ru.nl/∼herman/PUBS/InconsAutSetTh.pdf.
Geuvers, J.H., 2014a: Properties of a lambda calculus with deﬁnitions, Short note,
www.cs.ru.nl/∼herman/PUBS/PropLamCDef.pdf.
Geuvers, J.H., 2014b: A formalization of the integers, Short note,
www.cs.ru.nl/∼herman/PUBS/FormInt.pdf.
Geuvers, J.H. and Nederpelt, R.P., 1994: Typed λ-calculus. In de Swart, H.C.M.,
Logic: Mathematics, Language, Computer Science and Philosophy, Vol. 2,
Section 33, pp. 168–199, Peter Lang GmbH.
Geuvers, J.H. and Nederpelt, R.P., 2004: Rewriting for Fitch style natural
deductions. In van Oostrom, V., ed., Proceedings of RTA 2004, 15th
International Conference on Rewriting Techniques and Applications, Aachen,
Germany, pp. 134–154, Springer.
Geuvers, J.H. and Nederpelt, R.P., 2013: N.G. de Bruijn’s contribution to the
formalization of mathematics, Indagationes Mathematicae, 24, pp. 1034–1049.
Girard, J.-Y., 1971: Une extension de l’interprétation de Gödel à l’analyse et son
application à l’élimination des coupures dans l’analyse et la théorie des types.
In Fenstad, J.E., ed., Proceedings of the Second Scandinavian Logic Symposium,
pp. 63–92, North-Holland Publishing Company.
Girard, J.-Y., 1972: Interprétation fonctionelle et élimination des coupures dans
l’arithmétique d’ordre supérieur, PhD thesis, Université Paris VII.
Girard, J.-Y., 1986: The system F of variable types, ﬁfteen years later, Theoretical
Computer Science, 45, pp. 159–192.414 References
Girard, J.-Y., Lafont, Y. and Taylor, P., 1989: Proofs and Types, Cambridge
University Press.
Gödel, K., 1932: Über formal unentscheidbare Sätze der Principia Mathematica und
verwandter Systeme, I, Monatshefte für Mathematik und Physik, 38,
pp. 173–198. Also in van Heijenoort, 1967.
Gonthier, G., 2005: A Computer-checked Proof of the Four Colour Theorem,
research.microsoft.com/en-us/people/gonthier/4colproof.pdf.
Gonthier, G., 2008: Formal proof: the Four Color Theorem, Notices of the American
Mathematical Society, 55 (11), pp. 1370–1381.
Gonthier, G., Asperti, A., Avigad, J., Bertot, Y., Cohen, C., Garillot, F., Le
Roux, S., Mahboubi, A., O’Connor, R., Ould Biha, S., Pasca, I., Rideau, L.,
Solovyev, A., Tassi, E. and Théry, L., 2013: A machine-checked proof of the odd
order theorem. In Blazy, S., Paulin-Mohring, C. and Pichardie, D., eds,
Interactive Theorem Proving: 4th International Conference, ITP 2013, 22–26
July 2013, Rennes, France, pp. 163–179, Springer.
Gordon, M.J.C., 2000: From LCF to HOL: a short history. In Plotkin, G., Stirling,
C.P. and Tofte, M., eds, Proof, Language, and Interaction, Essays in Honour of
Robin Milner (Foundations of Computing), pp. 169–185, MIT Press.
Gordon, M.J.C. and Melham, T.F., eds, 1993: Introduction to HOL: A
Theorem-Proving Environment for Higher-Order Logic, Cambridge University
Press.
Gupta, A., 2014: Deﬁnitions. In Zalta, E.N., ed., The Stanford Encyclopedia of
Philosophy,
plato.stanford.edu/archives/spr2014/entries/definitions/.
Hales, T.C., 2006: Introduction to the Flyspeck Project, Dagstuhl Seminar
Proceedings 05021, Mathematics, Algorithms, Proofs,
pdf.aminer.org/000/137/477/
introduction to the flyspeck project.pdf.
Hales, T.C., Harrison, J., McLaughlin, S., Nipkow, T., Obua, S. and Zumkeller, R.,
2010: A revision of the proof of the Kepler conjecture, Discrete &
Computational Geometry, 44 (1), pp. 1–34.
Harper, R., Honsell, F. and Plotkin, G., 1987: A framework for deﬁning logics. In
Proceedings of the Second Annual Symposium on Logic in Computer Science,
Ithaca, NY, pp. 194–204, IEEE.
van Heijenoort, J., 1967: From Frege to Gödel: A Source Book in Mathematical
Logic, 1879–1931, Harvard University Press.
Hilbert, D., 1927: The Foundations of Mathematics. Reproduced in van Heijenoort,
1967.
Hilbert, D. and Bernays, P., 1939: Grundlagen der Mathematik, Vol. 2, Springer.
Hindley, J.R., 1969: The principal type-scheme of an object in combinatory logic,
Transactions of the American Mathematical Society, 146, pp. 29–60.
Hindley, J.R., 1997: Basic Simple Type Theory, Cambridge University Press.
Hindley, J.R. and Seldin, J.P., 2008: Lambda-Calculus and Combinators, an
Introduction, Cambridge University Press.
HOL system, 1988: www.cl.cam.ac.uk/research/hvg/HOL/.
Howard, W., 1980: The formulas-as-types notion of construction. In Seldin &
Hindley, 1980, pp. 479–490.
JAR, 2013: Journal of Automated Reasoning, 50 (2), Special Issue: Formal
Mathematics for Mathematicians.References 415
Jaśkowski, S., 1934: On the rules of suppositions in formal logic, Studia Logica, 1,
pp. 5–32. Reprinted in McCall, S., ed., Polish Logic 1920–1939, Oxford
University Press, 1967, pp. 232–258.
Jech, Th., 2003: Set Theory: The Third Millennium Edition, revised and expanded
edition, Springer.
Jones, R.B., 2013: 42 Famous Theorems in ProofPower,
www.rbjones.com/rbjpub/pp/rda001.html.
Kamareddine, F.D., Laan, T.D.L. and Nederpelt, R.P., 2002: Types in logic and
mathematics before 1940, The Bulletin of Symbolic Logic, 8 (2), pp. 185–245.
Reprinted as ‘A history of types’ in Gabbay, D.M., Pelletier, F.J. and Woods,
J., eds, Handbook of the History of Logic, Vol. 11, pp. 451–511, Elsevier, 2012.
Kamareddine, F.D., Laan, T.D.L. and Nederpelt, R.P., 2003: De Bruijn’s Automath
and Pure Type Systems. In Kamareddine, F.D., ed., Thirty Five Years of
Automating Mathematics, pp. 71–123, Kluwer.
Kamareddine, F.D., Laan, T.D.L. and Nederpelt, R.P., 2004: A Modern Perspective
on Type Theory, From its Origins until Today, Kluwer.
Klein, G., 2013: Isabelle Top 100, www.cse.unsw.edu.au/∼kleing/top100/.
Kneale, W. and Kneale, M., 1962: The Development of Logic, Clarendon Press.
Kwiatek, R., 1990: Factorial and Newton coeﬃcients, Journal of Formalized
Mathematics, 1 (5), pp. 887–890.
Lamport, L., 1985: L A TEX: A Document Preparation System, Addison-Wesley
Publishing Company.
Landau, E., 1930: Grundlagen der Analysis, Akademische Verlagsgesellschaft; 3rd
edition, 1960, Chelsea Publishing Company.
Lewis, H. and Papadimitriou, C.H., 1981: Elements of the Theory of Computation,
Prentice-Hall.
Luo, Z., 1990: An Extended Calculus of Constructions, PhD thesis, University of
Edinburgh.
Luo, Z., 1994: Computation and Reasoning: A Type Theory for Computer Science,
Oxford University Press.
Madiot, J.-M., 2013: Formalizing 100 theorems in Coq,
perso.ens-lyon.fr/jeanmarie.madiot/coq100/.
Magnusson, L. and Nordström, B., 1994: The ALF proof editor and its proof engine.
In Barendregt, H. and Nipkow, T., eds, Types for Proofs and Programs,
International Workshop TYPES’93, Nijmegen, The Netherlands, pp. 213–237,
Springer.
Margaris, A., 1961: Axioms for the integers, American Mathematical Monthly, 68
(5), pp. 441–444.
Martin-Löf, P., 1980: Intuitionistic Type Theory, Bibliopolis.
McCarthy, J., Abrahams, P.W., Edwards, D.J., Hart, T.P. and Levin, M.I., 1985:
LISP 1.5 Programmer’s Manual, MIT Press.
Mendelson, E., 2009: Introduction to Mathematical Logic, 5th edition, Chapman and
Hall/CRC.
Milner, R., 1972: Logic for Computable Functions: Description of a Machine
Implementation, Technical Report, Stanford University.
Milner, R., 1978: A theory of type polymorphism in programming, Journal of
Computer and System Sciences, 17, pp. 348–375.
Mizar, 1989: Home Page, www.mizar.org.
Nederpelt, R.P., 1987: De Taal van de Wiskunde (The Language of Mathematics),
Versluys.416 References
Nederpelt, R.P., Geuvers, J.H. and de Vrijer, R.C., eds, 1994: Selected Papers on
Automath, North-Holland, Elsevier.
Nederpelt, R.P. and Kamareddine, F.D., 2011: Logical Reasoning: A First Course,
2nd revised edition, College Publications.
Nipkow, T., Paulson, L.C. and Wenzel, M., 2002: Isabelle/HOL – A Proof Assistant
for Higher-Order Logic, Springer.
Nordström, B., Petersson, K. and Smith, J., 1990: Programming in Martin-Löf’s
Type Theory, An Introduction, Oxford University Press.
Paulson, L.C., 1993: The Isabelle Reference Manual, Computer Laboratory,
University of Cambridge.
Peano, G., 1889: The Principles of Arithmetic, Presented by a New Method.
Reproduced in van Heijenoort, 1967, pp. 83–97.
Pelletier, F.J., 1999: A brief history of natural deduction, History and Philosophy of
Logic, 20, pp. 1–31.
Peyton Jones, S. et al., eds, 1998: Revised Report on Haskell 98,
haskell.org/onlinereport/.
Pfenning, F., 2002: Logical frameworks: a brief introduction. In Schwichtenberg, H.
and Steinbrüggen, R., eds, Proof and System-Reliability, Kluwer.
Pierce, B.C., 2002: Types and Programming Languages, MIT Press.
Pierce, B.C., 2004: Advanced Topics in Types and Programming Languages, MIT
Press.
Plotkin, G., 1977: LCF considered as a programming language, Theoretical
Computer Science, 5, pp. 223–255.
Pollack, R., 1994: The Theory of LEGO: A Proof Checker for the Extended Calculus
of Constructions, PhD thesis, University of Edinburgh.
Pollack, R. et al., 2001: The LEGO Proof Assistant,
www.dcs.ed.ac.uk/home/lego/.
Prawitz, D., 1965: Natural Deduction, A Proof-Theoretic Study, Almqvist & Wiksell.
PVS, 1992: pvs-wiki.csl.sri.com/index.php/Main Page.
Ramsey, F.P., 1926: The foundations of mathematics, Proceedings of the London
Mathematical Society, 2nd series, 25, pp. 338–384.
Reynolds, J.C., 1974: Towards a theory of type structure. In Robinet, B., ed.,
Programming Symposium, Proceedings Colloque sur la Programmation, Paris,
France, 9–11 April 1974, pp. 408–423, Springer.
Reynolds, J.C., 1984: Polymorphism is not set-theoretic. In Kahn, G., MacQueen,
D.B. and Plotkin, G., eds, Semantics of Data Types, International Symposium,
Sophia-Antipolis, France, 27–29 June 1984, pp. 145–156, Springer.
Robinson, J.A., 1965: A machine-oriented logic based on the resolution principle,
Journal of the ACM, 12 (1), pp. 23–41.
Russell, B., 1903: The Principles of Mathematics, Cambridge University Press.
Russell, B., 1905: On Denoting, Mind, 14, pp. 479–493.
Russell, B., 1908: Mathematical logic as based on the theory of types, American
Journal of Mathematics, 30, pp. 222–262.
Sanchis, L.E., 1967: Functionals deﬁned by recursion, Notre Dame Journal of Formal
Logic, 8, pp. 161–174.
Schönﬁnkel, M., 1924: Über die Bausteine der mathematischen Logik. Translated as
‘On the building blocks of mathematical logic’ in van Heijenoort, 1967.
Schwichtenberg, H., 1976: Deﬁnierbare Funktionen im λ-Kalkül mit Typen, Archiv
für Mathematische Logik und Grundlagenforschung, 17, pp. 113–114.
Seldin, J.P., 1979: Progress report on generalized functionality, Annals of
Mathematical Logic, 17, pp. 29–59.References 417
Seldin, J.P. and Hindley, J.R., eds, 1980: To H.B. Curry: Essays on Combinatory
Logic, Lambda-Calculus and Formalism, Academic Press.
Severi, P.G. and Poll, E., 1994: Pure Type Systems with deﬁnitions. In Nerode, A.
and Matiyasevich, Yu. V., eds, Proceedings of the Symposium on Logical
Foundations of Computer Science, LFCS ’94, pp. 316–328, Springer.
Simmons, H., 2000: Derivation and Computation: Taking the Curry–Howard
Correspondence Seriously, Cambridge University Press.
Sørensen, M.H. and Urzyczyn, P., 2006: Lectures on the Curry–Howard
Isomorphism, Elsevier.
Sudkamp, Th., 2006: Languages and Machines: An Introduction to the Theory of
Computer Science, 3rd edition, Addison-Wesley Publishing Company.
Tait, W.W., 1967: Intensional interpretation of functionals of ﬁnite type, Journal of
Symbolic Logic, 32 (2), pp. 187–199.
Takahashi, M., 1995: Parallel reductions in lambda calculus, Information and
Computation, 118 (1), pp. 120–127.
Terese (Bezem, M.A., Klop, J.W. and de Vrijer, R.C., eds), 2003: Term Rewriting
Systems, Cambridge University Press.
Troelstra, A.S. and van Dalen, D., 1988: Constructivism in Mathematics: An
Introduction, 2 vols, Elsevier.
Turing, A.M., 1936: On computable numbers, with an application to the
Entscheidungsproblem, Proceedings of the London Mathematical Society, 42 (2),
pp. 230–265; a correction, 43 (1937), pp. 544–546.
Twelf Project, 1999: twelf.plparty.org/wiki/Main Page.
Univalent Foundations Program, 2013: Homotopy Type Theory, Univalent
Foundations of Mathematics, Institute for Advanced Study,
homotopytypetheory.org/book/.
Visser, A. and Iemhoﬀ, R., 2009: personal communication.
Voevodsky, V.A., 2014: Univalent Foundations: New Foundations of Mathematics,
video lecture, Institute for Advanced Study, Princeton,
video.ias.edu/node/6395.
Wand, M., 1987: A simple algorithm and proof for type inference, Fundamenta
Informaticae, X, pp. 115–122.
Wells, J.B., 1994: Typability and type-checking in the second-order λ-calculus are
equivalent and undecidable, Proceedings of the 9th Annual Symposium on Logic
in Computer Science, Paris, France, pp. 176–185, IEEE Computer Society
Press.
Whitehead, A.N. and Russell, B., 1910: Principia Mathematica, 3 vols, Cambridge
University Press, 1910, 1912 and 1913. 2nd edition, 1925 (Vol. 1), 1927
(Vols 2, 3).
Wiedijk, F., 1999: Automath, Home Page: www.cs.ru.nl/∼freek/aut/.
Wiedijk, F., ed., 2006: The Seventeen Provers of the World, Springer.
Wiedijk, F., 2013: Formalizing 100 Theorems,
www.cs.ru.nl/∼freek/100/index.html.
Zermelo, E., 1908: Untersuchungen über die Grundlagen der Mengenlehre, I,
Mathematische Annalen, 65, pp. 261–281.
Zucker, J., 1977: Formalization of classical mathematics in Automath. In Colloque
International de Logique, Colloques Internationaux du Centre National de la
Recherche Scientiﬁque, 249. Reprinted in Nederpelt et al., 1994, pp. 127–139.Index of names
Arthan, R.D., 374, 376
Barendregt, H.P., xvi, xviii, 5, 15, 21, 28, 125,
383
van Benthem Jutting, L.S., xxii, 301, 373
Berardi, S., 124
Berarducci, A., 80
Bézout, É., 349
Böhm, C., 80
Brouwer, L.E.J., 388
de Bruijn, N.G., xvi, 28, 119, 126, 133, 189, 207,
231, 341, 382, 388
Burali-Forti, C., 297
Cantor, G., 297
Chaieb, A., 374
Church, A., xvi, xviii, 5, 21, 27, 34, 36, 65, 131,
133, 275, 298, 343, 387
Constable, R.L., 388
Coquand, Th., 123, 207, 388
Curry, H.B., xviii, 4, 16, 31, 36, 65, 119
Fitch, F., 161, 254
Fraenkel, A.H., 298
Frege, F.L.G., xv, 272
Gandy, R.O., 66
Gentzen, G., 159
Geuvers, J.H., 300
Girard, J.-Y., xvi, 80, 81, 100, 133, 388
Gödel, K.F., 343
Gonthier, G., 384, 389
Hales, T.C., 384, 389
Harrison, J., 374, 389
Heyting, A., 388
Hilbert, D., xv, 159, 276, 343
Hindley, J.R., 5, 65, 389
Howard, W., 119
Huet, G., 207, 388
Iemhoﬀ, R., 309, 341
Jaśkowski, S., 159
Kwiatek, R., 374
Landau, E., xxii, 299
Leibniz, G.W., 259
Luo, Z., 133, 389
Margaris, A., 309
Martin-Löf, P., xvi, 120, 133, 388
McCarthy, J., 28
Milner, R., 65, 82, 389
Peano, G., 306, 343
Pierce, B.C., 65
Plotkin, G., 66
Poll, E., 184
Pollack, R., 389
Prawitz, D., 161
Ramsey, F.P., 298
Reynolds, J.C., 81, 82, 389
Robinson, J.A., 65
Rosser, J.B., 21
Russell, B., xv, 65, 80, 297, 387
Sanchis, L.E., 66
Schönﬁnkel, M., 4, 27
Seldin, J.P., 5, 119
Severi, P.G., 184
Sørensen, M.H., 120
Tait, W.W., 66, 82
Terlouw, J., 124
Turing, A.M., 27, 31, 66, 131, 343
Urzyczyn, P., 120
Visser, A., 309, 341
Voevodsky, V.A., 389
Wand, M., 65
Wells, J.B., 82
Whitehead, A.N., 80, 298, 387
Wiedijk, F., 374, 389
Zermelo, E.F.F., 298Index of deﬁnitions
+, Fig.14.12, 320
×, Fig.14.22, 336
−, Fig.14.16/14.17, 328, 331
|, Fig.14.23, 339
0, Fig.14.1/14.3, 307, 310
1, Fig.14.13, 321
2, Fig.14.13, 321
3, Fig.14.13, 321
∩, Fig.13.2, 283
∪, Fig.13.2, 283
\, Fig.13.2, 283
...c, Fig.13.2, 283
∅, Fig.13.6, 287
∅S, Fig.13.6, 287
⊆, Fig.13.2, 283
=, Fig.13.2, 283
[...]R, Fig.13.10, 290
ε, Fig.13.1, 282
εS, Fig.13.1, 282
ε-el, Fig.13.3, 284
ε-in, Fig.13.3, 284
≤, Fig.14.18, 333
≤Z, Fig.14.18, 333
<, Fig.14.18, 333
≥, Fig.14.19, 334
≥Z, Fig.14.19, 334
>, Fig.14.19, 334
⇒, Fig.11.5, 234
⇒-el, Fig.11.5, 234
⇒-in, Fig.11.5, 234
⊥, Fig.11.6, 235
⊥-el, Fig.11.6, 235
⊥-in, Fig.11.6, 235
¬, Fig.11.7, 235
¬-el, Fig.11.7, 235
¬-in, Fig.11.7, 235
¬¬-el, Fig.11.17, 242
¬¬-in, Fig.11.17, 242
∧, Fig.11.10, 236
∧-el1, Fig.11.10, 236
∧-el2, Fig.11.10, 236
∧-in, Fig.11.10, 236
∨, Fig.11.11, 237
∨-el, Fig.11.11, 237
∨-el-alt1, Fig.11.19, 244
∨-el-alt2, Fig.11.19, 244
∨-in1, Fig.11.11, 237
∨-in2, Fig.11.11, 237
∨-in-alt1, Fig.11.19, 244
∨-in-alt2, Fig.11.19, 244
⇔, Fig.11.12, 237
⇔ -el1, Fig.11.12, 237
⇔ -el2, Fig.11.12, 237
⇔ -in, Fig.11.12, 237
∀, Fig.11.22, 246
∀-el, Fig.11.22, 246
∀-in, Fig.11.22, 246
∃, Fig.11.23/12.14, 247, 270
∃1, Fig.12.14, 270
∃≥1, Fig.12.14, 270
∃≤1, Fig.12.14, 270
∃-el, Fig.11.23, 247
∃-el-alt, Fig.11.28, 251
∃-in, Fig.11.23, 247
∃-in-alt, Fig.11.28, 251
antisymm, Fig.12.7, 264
antisymmetric, Fig.8.2, 173
assoc-add, Fig.14.14, 324
ax-int1, Fig.14.3, 310
ax-int2, Fig.14.4, 311
ax-int3, Fig.14.6, 312
ax-nat1, Fig.14.1, 307
ax-nat2, Fig.14.1, 307
ax-nat3, Fig.14.1, 307
bijective, Fig.13.13, 293
class, Fig.13.10, 290
clos-prop, Fig.14.5, 312
com-div, Fig.14.23, 339
comm-add, Fig.14.14, 324
coprime, Fig.14.23, 339
d, Fig.15.7, 357
D, Fig.8.1/15.20, 169, 370
div, Fig.14.23, 339422 Index of deﬁnitions
div-the, Fig.15.3/15.22, 354, 372
doub-neg, Fig.11.16, 241
element, Fig.13.1, 282
eq, Fig.12.3, 261
eq-cong1, Fig.12.5, 263
eq-cong2, Fig.12.6, 263
eq-reﬂ, Fig.12.3, 261
eq-subs, Fig.12.4, 262
eq-subset, Fig.13.5, 286
eq-sym, Fig.12.10, 267
eq-sym, Fig.12.11, 268
eq-trans, Fig.12.12, 268
equivalence-relation, Fig.13.9, 289
exc-thrd, Fig.11.16, 241
full-set, Fig.13.6, 287
gcd, Fig.14.23, 339
gcd-pos, Fig.14.23, 339
gcd-prop, Fig.14.23, 339
gcd-unq, Fig.14.23, 339
grtstZ, Fig.15.19, 370
ι, Fig.12.16, 272
ι-prop, Fig.12.16, 272
image, Fig.13.15, 294
increasing, Fig.8.1, 169
injective, Fig.13.13, 293
inj-subset, Fig.13.14, 293
inj-suc, Fig.14.3, 310
inv, Fig.13.13, 293
inverse, Fig.8.8, 181
Id, Fig.8.8, 181
IS, Fig.13.2, 283
IS-prop, Fig.13.5, 286
least, Fig.15.1, 353
Least, Fig.12.13, 269
leastZ, Fig.15.1, 353
left-canc-add, Fig.14.14, 324
lw-bnd, Fig.14.20, 335
lw-bndZ, Fig.14.20, 335
max-prop, Fig.15.19, 370
max-the, Fig.15.19, 370
max-uni-the, Fig.15.19, 370
maximum, Fig.15.19, 370
min, Fig.15.1, 353
Min, Fig.12.18, 274
min-prop, Fig.15.2, 353
min-the, Fig.15.2/15.18, 353, 368
min-uni-the, Fig.15.2, 353
minimal-element, Fig.8.3, 175
minimum, Fig.15.2, 353
minus, Fig.14.16, 328
N, Fig.14.1/14.5, 307, 312
N+, Fig.15.5, 356
nat-cond, Fig.14.5, 312
nat-ind, Fig.14.8, 314
nat-prop1, Fig.14.7, 313
nat-prop2, Fig.14.7, 313
nat-smallest, Fig.14.5, 312
nat-split, Fig.14.9, 315
nat-split-alt, Fig.14.9, 315
neg, Fig.14.9, 315
opp, Fig.14.17, 331
origin, Fig.13.15, 294
p, Fig.14.3, 310
part-ord, Fig.12.7, 264
partially-ordered, Fig.8.2, 173
plus, Fig.14.11, 320
plus-clos-nat, Fig.14.15, 325
plus-i, Fig.14.12, 320
plus-i-alt, Fig.14.14, 324
plus-ii, Fig.14.12, 320
plus-ii-alt, Fig.14.14, 324
plus-iii, Fig.14.12, 320
plus-iii-alt, Fig.14.14, 324
pos, Fig.14.9, 315
pre-ord, Fig.12.7, 264
ps, Fig.13.1, 282
p-s-ann, Fig.14.3, 310
q, Fig.15.21, 371
r, Fig.15.22, 372
rec-add-lem, Fig.14.11, 320
rec-add-prop, Fig.14.11, 320
rec-mult-lem, Fig.14.21, 336
rec-mult-prop, Fig.14.21, 336
reﬂ, Fig.12.7, 264
reﬂexive, Fig.8.2/13.9, 173, 289
right-canc-add, Fig.14.14, 324
s, Fig.14.1/14.3, 307, 310
S, Fig.15.5, 355
S+, Fig.15.5, 356
s-p-ann, Fig.14.3, 310
spec-rec-th, Fig.14.10, 319
subtr-prop1, Fig.14.16, 328
subtr-prop2, Fig.14.16, 328
surjective, Fig.13.13, 293
surj-suc, Fig.14.3, 310
sym-∨, Fig.11.14, 239
symmetric, Fig.13.9, 289
times, Fig.14.21, 336
times-i, Fig.14.22, 336
times-ii, Fig.14.22, 336
times-iii, Fig.14.22, 336
total, Fig.8.1/8.8, 169, 181
trans, Fig.12.7, 264
transitive, Fig.8.2/13.9, 173, 289
trip, Fig.14.9, 315
uni-dif , Fig.14.16, 328
up-bndZ, Fig.15.19, 370
Z, Fig.14.3, 310
zero-prop, Fig.14.5, 312Index of symbols
=, 261, 283
=α, 9, 10
=β, 18, 61, 202
Δ
=, 199
Δ
=β, 203
≡, 6
→, 42
→β, 16, 61, 79, 202
β, 17, 61, 202
Δ
→, 198, 219
∗, 70, 189
∗p, 175
∗s, 175
, 87, 189
, 38
⊥ ⊥, 213
◦, 71, 303
∈, 114, 280
∼, 344
, 53
+, 320
+m, 317
×, 336
×m, 336
− (binary), 328
− (unary), 331
|, 339
0, 307, 310
1, 321
2, 321
3, 321
∩, 283
∪, 283
\, 283
...c, 283
∅, 287
∅S, 287
⊆, 283
[...]R, 290
≤, 333
≤Z, 333
<, 333
≥, 334
≥Z, 334
>, 334
⇒, 43, 111, 114, 144, 234
⊥, 82, 137, 144, 225, 235
¬, 144, 225, 235
¬¬, 241, 242
∧, 144, 226, 236
∨, 144, 237
⇔, 144, 237
∀, 112, 114, 150, 246
∃, 150, 247, 270
∃1, 270
∃≥1, 270
∃≤1, 270
β-nf, 19
δ-nf, 200
ε, 276, 282
εS, 282
ι, 271, 275, 292
λ, 1, 5
λ→, 40, 125
λ2, 69, 73, 125
λC, 123, 125, 232
λD, 165, 211, 212, 215
λD0, 189, 192, 204, 211
λP, 103, 105, 125
λP2, 125
λω, 125
λω, 86, 125
Δ, 190
Λ, 5
Λ0, 9
ΛT, 39
ΛT2, 74
Π, 72
Σ, 72
Ω, 20424 Index of symbols
d, 357
iET , 147
q, 371
r, 372
s, 71, 87, 306, 309
s1, 124
s2, 124
s3, 124
D, 169, 370
Mx→y, 9
S, 355
S+, 356
V , 5
Y , 25, 31
Yσ, 66
Z, 31
K, 86
L, 35
N, 33, 306, 307, 311, 312
N+, 356
T, 34
T2, 73
V, 34, 73
Z, 308, 309
B, 30
I, 30
K, 28, 30, 66, 83
List, 101
S, 28, 30, 66, 83
D, 190, 192
E, 128
EλD, 190
P, 80, 281
A, 160, 172
x, 172
x : A, 172
U : V , 195
[x := U], 194
conclusion, 40
dom, 53, 75
premiss, 40
Sub, 6
add, 30
false, 31
gcd, 339, 340
gcd , 374
if -then-else, 31
iszero, 31
mult, 30
not, 31
one, 30
suc, 30
true, 31
two, 30
zero, 30
Add, 83
Bool, 84
False, 84
FV, 8
Iszero, 84
Mult, 83
Nat, 83
Neg, 84
One, 83
Suc, 83
Tree, 84
True, 84
Two, 83
Zero, 83
(abst), 40, 94, 111, 203
(abst2), 72
(appl), 40, 94, 111, 203
(appl2), 73
(βδ-conv), 203
(conv), 97, 203
(δ-conv), 202
(def ), 193
(def -prim), 214
(form), 76, 93, 123, 203
(func-abst), 42
(func-appl), 42
(inst), 197
(inst-pos), 195
(inst-prim), 215
(inst-zero), 196
(par), 206
(sort), 88, 203
(var), 40, 75, 89, 203
(weak), 90, 203
(⇒-elim), 43, 114
(⇒-intro), 43, 114
(⊥-elim), 138
(⊥-intro), 138
(¬-elim), 139
(¬-intro), 139
(∧-elim-left), 140
(∧-elim-left-sec), 140
(∧-elim-right), 140
(∧-elim-right-sec), 140
(∧-intro), 140
(∧-intro-sec), 140
(∨-elim), 142
(∨-elim-sec), 143
(∨-intro-left), 142
(∨-intro-left-sec), 143
(∨-intro-right), 142
(∨-intro-right-sec), 143
(∀-elim), 112, 114
(∀-intro), 113, 114
(∃-elim), 151
(∃-elim-sec), 152
(∃-intro), 153
(∃-intro-sec), 153Index of subjects
α-conversion, 9, 10
extended, 78
α-convertible, 11
α-equivalence, 9, 10
extended, 78
α-equivalent, 11
α-variant, 11
abbreviation, 183
abbreviation mechanism, 207
absolute value, 318
abstract data type, 389
abstract syntax, 5
abstraction, 2, 5, 35
ﬁrst order, 69, 74
second order, 70, 72, 74
type-, 69, 71
absurdity, 137, 225, 392
AC, 297
accumulated dependency, 191
adding a deﬁnition, 192
addition, 80, 305
associativity of, 323
commutativity of, 323
integer, 316
left cancellation for, 323
right cancellation for, 323
addition in N
closure under, 324, 403
addition of axiom, 147
Agda, 120, 382, 388, 389
ALF, 120, 388
algebraic data type, 80
Algol 60, 63
algorithm
Euclidean, 350
type checking, 222
typing, 82
alpha-conversion, 9, 10
extended, 78
alpha-convertible, 11
alpha-equivalence, 9, 10
extended, 78
alpha-equivalent, 11
alpha-variant, 11
alphabet
Greek, xxviii
alternative rules for ∨, 243
alternatives for disjunction, 394
alternatives for existential quantiﬁcation, 396
antisymmetric, 258
application, 2, 4, 5, 35
second order, 70, 73
twofold, 264
type-, 69
argument, 1, 16
arithmetic, 305
integer, 308
arithmetical laws for addition, 322
arithmetical operation, 316
arrow type, 34
associativity of addition, 323
associativity of multiplication, 337
assumption, 174
overall, 213
asymmetric, 45
at least one, 269
at most one, 269
AUT-68, 119
AUT-QE, 119
Automath, xvi, 119, 126, 231, 372, 382, 383, 388
Automath project, 207, 221
automatic veriﬁcation, 296
axiom, 147, 211, 212, 221, 350
addition of, 147
parameterised, 221
Axiom of Choice, 276, 297
axiom of induction for N, 307
axiom of induction for Z, 311
axiom scheme, 160
axiomatic method, 161
axiomatic notion, 211, 212, 222
axiomatic set theory, 297
axiomatic system, 159
axiomatisation of integers, 309426 Index of subjects
axioms
Peano-, 306, 307, 309
axioms for N, 313
β-conversion, 18, 97
β-convertible, 18
β-equality, 18
β-normal form, 19, 63
β-normalising, 19
β-reduction, 3, 5, 16, 59, 61, 97, 220
extended, 78
one-step, 16, 61, 79
zero-or-more-step, 17, 61
β-reduction for λD0
one-step, 202
β-reduction step, 16
βδ-conﬂuence, 220
βδ-conversion, 203
backward rule, 139
Barendregt convention, 15
Barendregt cube, 125, 133
base, 57
basic type, 34
basis, 16, 38, 61
beta-conversion, 18
beta-convertible, 18
beta-delta-conﬂuence, 220
beta-delta-conversion, 203
beta-equality, 18
beta-nf, 19
beta-normal form, 19, 63
beta-reduction, 3, 16, 59, 61, 220
one-step, 16, 61, 79
zero-or-more-step, 17, 61
beta-reduction for λD0
one-step, 202
beta-reduction step, 16
Bézout’s Theorem, 374
Bézout’s Lemma, 176, 349
proof of, 350, 354
biimplication, 393
bijective map, 292
binary minus-operator for Z, 327
binary plus-operation, 320
binary predicate, 115, 289
binary relation, 288, 295
binder
Π-, 72
type-, 72
binding occurrence, 8
body, 16
body of deﬁnition, 190, 216
book, 120, 222, 231
bound occurrence, 8
bound variable, 8
Brouwer–Heyting–Kolmogorov, 120
de Bruijn criterion, 383
de Bruijn index, 28
calculus
λ-, 1
Calculus of Constructions, 100, 123, 133, 232,
388
Calculus of Inductive Constructions, 120, 133,
388
call-by-name, 66
call-by-value, 66
cancel, 310
cancellation for addition
left, 323
right, 323
cancellation for multiplication, 338
cancellation for subtraction
left, 329
right, 329
capture, 120
Cartesian product, 107, 115, 280
case distinction, 142
CC, 133
choice function, 276
choice operator, 276
Church-computability, 27
Church numerals, 27, 65, 305
polymorphic, 80, 305
Church–Rosser for βδ in λD, 220
Church–Rosser Theorem, 21, 61, 79, 130
Church’s λ→, 40
Church’s thesis, 27
Church–Turing thesis, 27, 343
Church–Turing Undecidability Theorem, 131
Church-typing, 36, 65
CIC, 133, 167, 388
class
equivalence, 289
classical logic, 146, 233
classical predicate logic, 249, 396
classical propositional logic, 240, 393
closed λ-term, 9
closure under addition in N, 324, 403
closure under multiplication in N, 337
combination
legal, 217
combination of ﬂags, 234
combinator, 9
ﬁxed point, 25, 31, 66
combinatory logic, 27
common divisor, 176, 339, 351
greatest, 176, 339, 340
commutativity of ∨, 239
commutativity of addition, 323
commutativity of multiplication, 337
compatibility, 10, 16, 61
compatibility rule, 3
complement, 280, 283
composite unary predicate, 289
composition, 67, 70, 303
function, 71, 303, 343
computability, 343
Church-, 27
eﬀective, 27Index of subjects 427
Herbrand–Gödel-, 27
Turing-, 27
computable function, 343
computation, 351
model of, 343
compute, 316
computer program
correctness of, 132
conclusion, 40, 160
condensed derivation, 229
Condensing Lemma, 56, 79, 129, 218
condition, 174
side, 35
conﬂuence, 19, 21, 61, 130, 220, 222
congruence property, 262
conjunction, 139, 226, 392
conservative extension, 275
consistency
logical, 81, 222, 223
consistent, 81, 298
constant, 168, 172, 189
deﬁned, 168
introduction of, 172
primitive, 211, 216
proper, 216
reuse of, 238
use of, 172
construction scheme for typing problems, 53
constructive logic, 146, 211, 225
constructive predicate logic, 246, 395
constructive propositional logic, 234, 391
constructor, 87
proper, 87
type, 85, 101
context, 38, 39, 57
empty, 39, 170
λ2-, 75
legal, 217
well-formed, 129
context of deﬁnition, 169, 190, 216
contractum, 16
contradiction, 137
convention
Barendregt, 15
parameter list, 239, 240
conversion, 61, 98
α-, 9, 10
β-, 18, 97
βδ-, 203
δ-, 197, 199
conversion rule, 97, 202
convertible
α-, 11
β-, 18
δ-, 200
coprime, 176, 339, 351, 354
Coq, 120, 134, 161, 374, 375, 382–384, 388
correct instantiation, 201
correctness of computer program, 132
CR, 21, 61, 130, 220
cube
Barendregt 121, 123, 125, 133
cumulativity, 133
Curry ﬁxed point operator, 31
Curry–Howard interpretation, 119
Curry–Howard isomorphism, 119
Curry–Howard–de Bruijn embedding, 119
Currying, 115, 289, 291
Curry-typing, 36, 65
cut elimination, 161
δ-conﬂuence in (λD,
Δ
→), 220
δ-conversion, 197, 199
δ-convertible, 200
δ-normal form, 200
δ-reduction, 199
one-step, 198
zero-or-more-step, 199
data type, 80, 120, 388
abstract, 389
algebraic, 80
polymorphic, 133
decidability, 59, 65, 279, 280, 296, 343
Decidability of Term Finding, 59
Decidability of Type Assignment, 59
Decidability of Type Checking, 59
decidability of typing, 280
Decidability of Well-Typedness, 59
decidable, 47
declaration, 39, 74
deduction
natural, 43, 157, 208
deﬁnability
lambda-, 27
deﬁned constant, 168
deﬁned constant of deﬁnition, 190, 216
deﬁned name, 166, 168
deﬁniendum, 168, 172, 190, 216
deﬁniens, 168, 172, 216
deﬁniens of deﬁnition, 190, 216
deﬁnite description, 275
deﬁnite description operator, 275
deﬁnition, 126, 165, 189, 213
adding of, 192
body of, 190, 216
context of, 169, 190, 216
deﬁned constant of, 190, 216
deﬁniens of, 190, 216
descriptive, 189, 190, 211, 212, 216
element of, 190, 216
format for, 168
inductive, xx, 5, 55, 167
instantiation of, 170, 193
linguistic, 184
local, 185
mathematical, 184
parameterised, 207
primitive, 211–214, 216
proper, 216428 Index of subjects
recursive, 167, 192, 316, 344
statement of, 190, 216
type of, 190, 216
well-formed, 183
deﬁnition format, 231
deﬁnition in a context, 169
deﬁnition of a primitive entity, 213
deﬁnition unfolding, 197, 220
one-step, 198
deﬁnitional equivalence, 198
delta-conﬂuence in (λD,
Δ
→), 220
delta-conversion, 197, 199
delta-normal form, 200
delta-reduction, 199
one-step, 198
zero-or-more-step, 199
dependency, 45
accumulated, 191
ﬁrst order, 69
second order, 69
dependent product, 106, 120
dependent type, 121, 124
deramiﬁcation, 298
derivability, 38
derivable, 343
derivable rule, 140
derivation, 41, 44
condensed, 229
shortened, 95, 96, 98, 116
state of, 230
derivation in λD, 225
derivation in natural deduction, 238
derivation rule, 40, 160
derivation rules for Church’s λ→, 40
derivation rules for λ2, 76
derivation rules for λD, 409
derivation rules for λD0, 204
derivation rules for λP, 105
derivation rules for the λ-cube, 127
derivation scheme, 40
derivation system, 39
derivation tree, 161
descending sequence, 345
description
deﬁnite, 275
description operator, 275
deﬁnite, 275
descriptive deﬁnition, 189, 190, 211, 212, 216
descriptor, 271
diagram, 45
diﬀerence, 280, 283, 327
uniqueness of, 327
disjunction, 139, 142, 393
alternatives for, 394
distributivity
left, 337
right, 336
divide, 338
dividend, 369
divisibility, 338
divisibility operator, 351
division, 351, 354
Division Theorem, 351, 353, 369
divisor, 338, 369
common, 176, 339, 351
DN, 213, 240, 249
domain, 53, 75
double negation, 213, 233, 240, 394
double negation law, 146
ε-operator, 276
ECC, 133
Edinburgh LF, 120
eﬀective computability, 27
element, 110, 280
least, 258, 269, 352
minimal, 174
element of deﬁnition, 190
element of deﬁnition in λD, 216
element of subset, 281
elementhood, 280
Elements, 350
elimination rule, 160, 232
elimination rule for ⇒, 43, 111
elimination rule for ⊥, 138
embedding, 301
empty context, 39, 170
empty parameter list, 196
empty type, 81
environment, 190
legal, 217
equality, 259, 275
β-, 18
Leibniz, 275, 286
parameterised, 259
reﬂexivity of, 260
transitivity of, 268
equality checker, 222
equality of subsets, 283
equality relation, 259
equivalence
α-, 9, 10
deﬁnitional, 198
equivalence class, 289
equivalence relation, 10, 289
equivalent
α-, 11
ET, 213, 240, 249
Euclidean algorithm, 350
evaluation rule, 2
evaluation strategy, 28
ex falso, 137
exactly one, 269, 272
excluded third, 213, 233, 240, 393
excluded third law, 146
existence, 251
existence quantiﬁer
unique, 269
existential quantiﬁcation, 395Index of subjects 429
alternatives for, 396
existential quantiﬁer, 269
second order encoding of, 150
explicit typing, 36, 65
expression, 189
legal, 130, 217
expressions of λC, 128
expressions of λD, 190
expressions of λD0, 190
extended α-conversion, 78
extended α-equivalence, 78
extended β-reduction, 78
Extended Calculus of Constructions, 133, 389
extended judgement, 191
extensional type theory, 120
F, 100
Fω, 100
factorial, 26
family of types, 104
feasibility, 296
ﬁnite reduction path, 20
ﬁrst order abstraction, 69, 74
ﬁrst order dependency, 69
Fitch style, 208
Fitch style natural deduction, 161
ﬁxed point, 24, 63
ﬁxed point combinator, 25, 31, 66
Curry, 31
Turing, 31
Fixed Point Theorem, 24
ﬁxpoint, 24
ﬂag, 43, 45
ﬂag format, 45
ﬂag notation, 45
ﬂag pole, 43, 45
ﬂag style, 208
ﬂag-style λD0, 228
ﬂag-style natural deduction, 161, 225
ﬂag-style proof, 229
ﬂags
combination of, 234
Flyspeck project, 384
folding, 199
foreknowledge, 259, 274
formal λD0, 228
formal logic, xv
formal mathematics, xv
format
ﬂag, 45
linear, 44
tree, 44
format for deﬁnition, 168
formation rule, 76, 93, 107, 123
forward rule, 139
free occurrence, 8
free variable, 8
Free Variables and Constants Lemma, 217
Free Variables Lemma, 54, 79, 128
fresh, 193
function, 1, 42, 292, 295
computable, 343
general recursive, 27
identity, 36, 69
injective, 306
μ-recursive, 343
polymorphic, 71
proposition-valued, 104
recursive, xxii, 27
set-valued, 103
successor, 24, 71, 167, 212, 306
surjective, 306
two-place, 4
two-valued, 295
type-valued, 103
function composition, 71, 303, 343
function evaluation, 3
function of two variables, 4
function space, 295
function type, 34, 35, 111
functional language, 100
functional program, 120
functional programming language, 28, 65, 81
functional relation, 292
general recursive function, 27
generalised polynomial, 66
generalised term, 85
generalised type, 85, 124
Generation Lemma, 58, 79, 129, 218
Gentzen style natural deduction, 161
grammar, 5
greatest common divisor, 176, 339, 340
Greek alphabet, xxviii
Haskell, 100
Herbrand–Gödel-computability, 27
high level programming language, 63
higher order predicate logic, 133
Hilbert style system, 159
Hilbert’s Program, 276
hint, 284, 361
HOL, 389
HOL Light, 374, 375, 384
hole, 260, 361, 363, 382
Homotopy Type Theory, 389
hypothesis, 160
induction, 55
ι-operator, 272, 276
ideal element, 276
identity
syntactical, 6
identity function, 36, 69
polymorphic, 70
identity instantiation, 173
illative logic, 119
image, 293
implication, 43, 109, 111, 295, 391
implicit typing, 36, 65, 81
impredicative Σ-type, 133
impredicativity, 80, 388430 Index of subjects
inclusion, 283
inclusion of λC in λD0, 216
inclusion of λD0 in λD, 216
incompleteness theorem, 343
inconsistent, 80, 133, 297
index
de Bruijn, 28
indexed type, 104
indirect proof, 243
indiscernibility, 259
induction, 213
mathematical, 307
structural, 55
symmetric, 310
induction for N, 213, 313
induction for Z, 311
variant of, 311, 346, 366
induction hypothesis, 55
induction on the generation, 62
induction property, 213
inductive deﬁnition, xxii, 5, 55, 167
inductive type, 120, 133, 161, 167, 383
inequality in Z, 332
inference
type, 81, 82
inﬁnite reduction path, 20, 219
inhabitant, 51
Inhabitation, 47
initialisation rules, 126
injective function, 306
injective map, 292
input value, 1
instance, 40
instantiate, 183
instantiation
correct, 201
identity, 173
instantiation of parameter, 170
instantiation of deﬁnition, 170, 193
integer
opposite of, 330
integer addition, 316
integer arithmetic, 308
integer multiplication, 335
integer number, 308
integer subtraction, 327
integers
axiomatisation of, 309
negative, 312
intensional type theory, 120
interpretation
Brouwer–Heyting–Kolmogorov, 120
intersection, 280, 283, 351
introduction of constant, 172
introduction rule, 160, 232
introduction rule for ⇒, 43, 111
introduction rule for ⊥, 138
intuitionistic logic, 146
intuitionistic type theory, 120, 388
inverse map, 293
irreﬂexive, 45
irrelevance of proof, 273, 340, 341
Isabelle, 374, 375, 389
iteration, 70
judgement, 38, 39, 160, 190
extended, 191
typing, 190
judgement chain, 87
judgement with deﬁnitions, 190
junk, 56
kernel, 383
kind, 86, 87
λ-abstraction
second order, 71
λ-calculus, 1
simply typed, 33, 121
untyped, 1, 2, 5
λ-Coquand, 123
λ-cube, 121, 123, 125, 133
λ-deﬁnability, 27
λ-term, 5
closed, 9
pre-typed, 39
λ→
properties of, 53
λ→-term
legal, 43
λ2-context, 75
λ2-term, 74
legal, 76
lambda calculus, 1
polymorphic, 81
simply typed, 33, 121
untyped, 1, 2, 5
lambda-cube, 121, 123, 125, 133
lambda-deﬁnability, 27
lambda-term, 4, 5
closed, 9
pre-typed, 39
law
arithmetical, 322
double negation, 146
excluded third, 146
LCF, 389
leaf, 7, 9
least element, 258, 269, 352
least-element-predicate, 270
left-associative, 8, 34, 36
left cancellation for addition, 323
left cancellation for multiplication, 338
left cancellation for subtraction, 329
left distributivity, 337
left-most redex, 28
legal, 217
legal λ→-term, 43
legal λ2-term, 76
legal combination, 217
legal context, 217Index of subjects 431
legal environment, 217
Legal Environment Lemma, 217
legal expression, 130, 217
legal term, 43, 58
Legality Lemma, 217
Lego, 389
Leibniz’s law, 259
Leibniz-equality, 275, 286
lemma, 271
Lemma
Bézout’s, 176, 349
Condensing, 56, 79, 129, 218
Free Variables, 54, 79, 128
Generation, 58, 79, 129, 218
Permutation, 56, 79, 129
Subject Reduction, 61, 79, 98, 130, 219
Substitution, 59, 79, 130, 219
Subterm, 58, 79
Thinning, 56, 79, 129, 218
Uniqueness of Types, 59, 79, 99, 130, 218, 280
level, 87
LF, 120
library, 380
line, 120, 222
linear combination, 355
linear format, 44
linguistic deﬁnition, 184
Lisp, 28
list, 80
local deﬁnition, 185
log-book, 231
logic
classical, 146, 233
combinatory, 27
constructive, 146, 211, 225
formal, xv
illative, 119
intuitionistic, 146
predicate, 150
propositional, 144
logic in λC, 137
logic in λD, 232
logical consistency, 81, 222, 223
logical framework, 119, 388, 389
logical operation, 111
logicist approach, 298
μ-recursive function, 343
many-to-one map, 295
map, 291, 292
bijective, 292
injective, 292
inverse, 293
many-to-one, 295
partial, 292
surjective, 292
total, 292
Martin-Löf type theory, 388
mathematical deﬁnition, 184
mathematical induction, 307
mathematical statement, 180
mathematics
formal, xv
mathematics in λD, 257
Matita, 389
maximum, 339, 371
Maximum Theorem, 364, 369, 377
meta-level abbreviation, 183
meta-notation, 12
mini reduction, 185
minimal element, 174
minimal predicate logic, 109, 114
minimal propositional logic, 137
minimisation, 344
minimum, 272, 273, 351, 364, 368
minimum operator, 274, 351, 352
Minimum Theorem, 351, 352, 356, 364, 376, 405
minus-operator
binary, 327
unary, 330
Mizar, xvi, 374, 375, 384
mnemonic, 167
model, 29
model of computation, 343
modulo α-equivalence, 15
modus ponens, 43, 161
most general type, 81
most general uniﬁer, 65
multiplication, 80, 305
associativity of, 337
commutativity of, 337
integer, 335
left cancellation for, 338
right cancellation for, 338
multiplication in N
closure under, 337
multiset, 6
Naive Set Theory, 80
name, 9
deﬁned, 166, 168
temporary, 166
name of proof, 176, 178
naming of a unique element, 272
natural deduction, 43, 157, 208
derivation in, 238
Fitch style, 161
ﬂag-style, 161, 225
Gentzen style, 161
tree-style, 161
natural deduction system, 159
natural number, 305, 311
negation, 137, 138, 225, 392
negative integers, 312
nf, 19
node, 7
non-emptiness, 351
normal form, 19
β-, 19, 63
δ-, 200432 Index of subjects
normal forms in (λD,
Δ
→)
uniqueness of, 220
normalisation, 222
strong, 21, 66, 131, 219
weak, 21, 66, 219
normalising
β-, 19
notation convention, 234
notion
axiomatic, 211, 212, 222
primitive, 211, 221
number, 305
integer, 308
natural, 305, 311
number theory, 308
numerals
Church, 27, 65, 305
polymorphic, 305
Nuprl, 120, 382, 388, 389
occurrence, 6
binding, 8
bound, 8
free, 8
one
at least, 269
at most, 269
exactly, 269, 272
one-step β-reduction, 16, 61, 79
one-step β-reduction for Λ2, 79
one-step β-reduction for λD0, 202
one-step δ-reduction, 198
one-step deﬁnition unfolding, 198
one-step folding, 199
one-step unfolding, 199
operation
arithmetical, 316
operator
choice, 276
description, 275
ε-, 276
ι-, 272, 276
opposite of an integer, 330
order, 264
partial, 257, 264, 334, 363
pre-, 264
order between deﬁnitions, 174
origin, 293
outcome, 19, 63, 317
output value, 1
overall assumption, 213
overlap, 290
overloading, 81, 174
Π-binder, 72
Π-type, 71, 106
pair, 115
pair of types, 291
paradox
Russell’s, 298
parameter, 169
instantiation of, 170
parameter list, 169, 172
empty, 196
parameter list convention, 239, 240
parameterised axiom, 221
parameterised deﬁnition, 207
parameterised equality, 259
parameters
suppressed, 240
parametricity, 81
parenthesis, 7, 74
partial map, 292
partial order, 257, 264, 334, 363
strict, 45, 334
PAT, 53, 81, 104, 340
PAT-interpretation, 53, 104, 110
path
reduction, 20
PCF, 66
Peano arithmetic, 212
Peano-axioms, 306, 307, 309
permutation, 53
Permutation Lemma, 56, 79, 129
plus-operation
binary, 320
unary, 317
PN, 221
polymorphic, 70
polymorphic Church numerals, 80, 305
polymorphic data type, 133
polymorphic function, 71
polymorphic identity function, 70
polymorphic lambda calculus, 81
polynomial
generalised, 66
postulated concept, 212
powerset, 80, 280, 281
powersets-as-types, 299
preamble, 227
pre-context, 213
predecessor, 306, 310
predicate, 104, 110, 114, 295
binary, 115, 289
composite unary, 289
predicate logic, 150
classical, 249, 396
constructive, 246, 395
higher order, 133
minimal, 109
quantiﬁer free, 276
premiss, 40
preorder, 264
pre-typed λ-term, 39
second order, 74
primitive constant, 211, 216
primitive deﬁnition, 211–214, 216
primitive entity, 212
deﬁnition of, 213
primitive notion, 211, 221Index of subjects 433
primitive recursion, 344
principal type, 65
principal type algorithm, 65
Principia Mathematica, xv, 80, 298, 387
product, 72
Cartesian, 107, 115, 280
dependent, 106, 120
product rule, 107
product type, 72
program
functional, 120
programming language, 63
functional, 28, 65, 81
high level, 63
projection, 53
proof, 53, 110, 114, 271
ﬂag-style, 229
irrelevance of, 273, 340, 341
name of, 176, 178
skeleton, 265
specialised, 362
proof assistance, 158
proof assistant, 131, 133, 158, 161, 207, 222,
380, 388
proof by contradiction, 242, 243, 250
proof by induction, 55
proof checker, 133, 222
proof checking, 158, 280, 381
proof development, 380
proof irrelevance, 340
proof object, 110, 117, 363
proof of a proposition, 52
proof of Bézout’s Lemma, 350, 354
proof term, 161
proof theory, 161
ProofPower, 374, 376
proofs-as-terms, 53, 110
proper constant, 216
proper constructor, 87
proper deﬁnition, 216
proper subterm, 7
properties of λ→, 53
properties of λ2, 78
properties of λC, 128
proposition, 51, 110, 114
proof of, 52
proposition-valued function, 104
propositional logic, 144
classical, 240, 393
constructive, 234, 391
minimal, 137
propositions-as-types, 53, 81, 104, 110
provable correctness, 132
PTS, 124, 207
Pure Type System, x, 124, 207
PVS, 301
quantiﬁcation
existential, 395, 396
universal, 109, 112, 395
quantiﬁer
existential, 269
unique existence, 269
quantiﬁer free predicate logic, 276
quotient, 344, 354, 369, 371
Ramiﬁed Type Theory, 65, 298, 299, 387
recursion, 317
primitive, 344
well-founded, 120, 317
recursion scheme, 167
Recursion Theorem for Z, 318, 344
restricted, 319
recursive call, 344
recursive deﬁnition, 167, 192, 316, 344
recursive function, xxii, 27
redex, 16
reduction, 5, 59
β-, 3, 5, 16, 59, 61, 97, 220
mini, 185
one-step δ-, 198
zero-or-more-step δ-, 199
reduction path, 20
ﬁnite, 20
inﬁnite, 20, 219
reduction strategy, 28
reﬁnement step, 382
reﬂexive, 6, 10, 257, 289
reﬂexivity of equality, 260
relation, 288
binary, 288, 295
equality, 259
equivalence, 10, 289
functional, 292
well-founded, 345
remainder, 354, 369, 371
renaming, 9, 10, 78
representation
tree, 7
restricted Recursion Theorem for Z, 319
reuse of constant, 238
rewriting in logic, 252
right-associative, 8, 34, 36
right cancellation for addition, 323
right cancellation for multiplication, 338
right cancellation for subtraction, 329
right distributivity, 336
root, 9
root path, 9
RTT, 65, 299
rule
derivable, 140
derivation, 40, 160
elimination, 160, 232
introduction, 160, 232
Russell’s paradox, 298
Σ-type, 120, 133, 300
Σ-type
impredicative, 133
second order abstraction, 70, 72, 74434 Index of subjects
second order application, 70, 73
second order dependency, 69
second order encoding of conjunction, 140
second order encoding of disjunction, 142
second order encoding of ∃, 150
second order λ-abstraction, 71
second order pre-typed λ-term, 74
second order typed lambda calculus, 69
self-application, 27, 63, 81
separation marker, 38
sequent calculus, 121, 159
sequential substitution, 13
set, 110, 114, 279
set building, 281
set comprehension, 281
set of all sets, 80
set theory
axiomatic, 297
Zermelo–Fraenkel, 213, 297, 299
set-valued function, 103
shortened derivation, 95, 96, 98, 116
side condition, 35
simple theory of types, xvi, 275, 387
simple type, 34
simply typed λ-calculus, 33, 121
simultaneous substitution, 194
skeleton proof, 265
SN, 220
sort, 87
specialised proof, 362
Start Lemma for declarations and deﬁnitions,
218
state of a derivation, 230
statement, 35, 39, 74, 231
mathematical, 180
typing, 35
universal, 295
statement of deﬁnition, 190, 216
step
β-reduction, 16
strict partial order, 45, 334
strong normalisation, 21, 66, 131, 219
strong normalisation of
Δ
→, 219
strong normalisation for βδ in λD, 221
Strong Normalisation Theorem, 79, 131
Strong Normalisation Theorem for λ→, 62
structural induction, 55
subcontext, 53
Subexpression Lemma, 130
subject, 39
Subject Reduction, 61, 79, 98, 130, 219
subset, 279, 280, 295, 350
element of, 281
subset-as-predicate, 281
subset-equality, 283, 286
subsets via embedding, 301
substitution, 3, 11, 12, 59
sequential, 13
simultaneous, 194
Substitution Lemma, 59, 79, 130, 219
substitutivity, 261
subterm, 6
proper, 7
Subterm Lemma, 58, 79
subtraction
integer, 327
left cancellation for, 329
right cancellation for, 329
subtree, 7
successor, 30, 309
successor function, 24, 71, 167, 212, 306
sum, 72, 316
super-kind, 133
super-super-type, 87
super-type, 85
suppressed parameters, 240
surjective function, 306
surjective map, 292
symmetric, 10, 289
symmetric induction, 310, 313
syntactical identity, 6
syntax
abstract, 5
syntax-directed, 58
system F, 80, 100
system Fω, 100
tactic, 162, 383
tautology, 52
temporary name, 166
term
generalised, 85
λ2-, 74
legal, 43, 58, 76
typable, 36, 58, 81
Term Construction, 47
term depending on term, 69, 124
term depending on type, 69, 124
Term Finding, 47, 51, 59, 131
term variable
renaming of, 78
termination, 219
Termination Theorem, 131
Termination Theorem for λ→, 62
theorem, 271
Theorem
Division, 351, 353, 369
Maximum, 364, 369, 377
Minimum, 351, 352, 356, 364, 376, 405
Undecidability, 131
theory of types
intuitionistic, 120, 388
simple, xvi, 275, 387
thinning, 91
Thinning Lemma, 56, 79, 129, 218
total map, 292
transitive, 6, 10, 45, 258, 289
transitivity of equality, 268
tree, 80Index of subjects 435
tree format, 44
tree representation, 7
tree-style natural deduction, 161
tripartition property, 315
true, 343
Turing-complete, 26–28
Turing-computability, 27
Turing ﬁxed point operator, 31
Turing machine, 27, 343
Twelf, 120
twofold application, 264
two-place function, 4
two-valued function, 295
Typability, 46
typable term, 36, 58, 81
type, 33, 39
arrow, 34
basic, 34
data, 80, 120, 388
dependent, 121, 124
empty, 81
function, 34, 35, 111
generalised, 85, 124
indexed, 104
inductive, 120, 133, 161, 167, 383
most general, 81
Π-, 71, 106
principal, 65
Σ-, 120, 133, 300
simple, 34
super-, 85
super-super-, 87
type-abstraction, 69, 71
type-application, 69
Type Assignment, 46, 59
Type Checking, 47, 50, 59, 131
type checking, 158, 222, 280
type checking algorithm, 222
type constructor, 85, 101
type depending on term, 103, 124
type depending on type, 85, 86, 124
type inference, 81, 82
type of all kinds, 87
type of all types, 70
type of deﬁnition, 190, 216
Type Reduction, 98
Type System
Pure, xvi, 124, 207
type theory, xv
extensional, 120
intensional, 120
intuitionistic, 120, 388
Martin-Löf, 388
ramiﬁed, 65, 298, 299, 387
simple, xvi, 275, 387
type-valued function, 103
type variable, 34
renaming of, 78
type-binder, 72
typed lambda calculus
second order, 69
simply, 33, 121
types
family of, 104
typing
Church-, 36, 65
Curry-, 36, 65
explicit, 36, 65
implicit, 36, 65, 81
typing à la Church, 36
typing à la Curry, 36
typing algorithm, 82
typing judgement, 190
typing problems, 53
typing statement, 35
unary minus-operator for Z, 330
unary plus-operation, 317
unary predicate
composite, 289
Undecidability Theorem, 131
undecidable, 47, 343
unfold, 183
unfoldable, 200
unfolding, 220
deﬁnition, 197, 220
one-step, 198, 199
uniﬁcation, 65
uniﬁcation algorithm, 65
union, 280, 283
unique element, 272
naming of, 272
unique existence, 268
unique existence quantiﬁer, 269
Uniqueness of βδ-normal form, 220
uniqueness of δ-normal forms in (λD,
Δ
→), 220
uniqueness of diﬀerence, 327
Uniqueness of Types, 59, 79, 280
Uniqueness of Types up to βδ-conversion, 218
Uniqueness of Types up to Conversion, 99, 130
Univalent Foundations, 390
universal quantiﬁcation, 109, 112, 395
universal statement, 295
universe, 133
untyped λ-calculus, 1, 2, 5
use of constant, 172
variable, 1, 5, 34, 167
bound, 8
free, 8
type, 34
variant of induction for Z, 311, 346, 366
vector, 104
veriﬁcation
automatic, 296
weak normalisation, 21, 66, 219
weak normalisation for βδ in λD, 221
weak normalisation of
Δ
→, 219
weaken, 90436 Index of subjects
weakening, 90, 91
well-deﬁnedness, 344
well-formed context, 129
well-formed deﬁnition, 183
well-formedness, 222
well-founded, 318
well-founded recursion, 120, 317
well-founded relation, 345
Well-typedness, 46, 47, 59, 131
witness, 251
WN, 220
Zermelo–Fraenkel set theory, 213, 297, 299
zero element, 306
zero-or-more-step β-reduction, 17, 61
zero-or-more-step δ-reduction, 199
zero-test, 26
ZF, 297, 298