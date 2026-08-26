---
sha256: fa522a14f9b1631232ff6b34bc092686803b71cc8154cbf31c7ac523a75108dc
pdftotext_version: 26.06.0
extractor_version: 1
body_bytes: 416797
---
generatingfunctionology
Herbert S. Wilf
Department of Mathematics
University of Pennsylvania
Philadelphia, Pennsylvania
Copyright 1990 and 1994 by Academic Press, Inc. All rights re-
served. This Internet Edition may be reproduced for any valid educational
purpose of an institution of higher learning, in which case only the reason-
able costs of reproduction may be charged. Reproduction for profit or for
any commercial purposes is strictly prohibited.
viPreface
This book is about generating functions and some of their uses in
discrete mathematics. The subject is so vast that I have not attempted to
give a comprehensive discussion. Instead I have tried only to communicate
some of the main ideas.
Generating functions are a bridge between discrete mathematics, on
the one hand, and continuous analysis (particularly complex variable the-
ory) on the other. It is possible to study them solely as tools for solving
discrete problems. As such there is much that is powerful and magical in
the way generating functions give unified methods for handling such prob-
lems. The reader who wished to omit the analytical parts of the subject
would skip chapter 5 and portions of the earlier material.
To omit those parts of the subject, however, is like listening to a stereo
broadcast of, say, Beethoven’s Ninth Symphony, using only the left audio
channel.
The full beauty of the subject of generating functions emerges only
from tuning in on both channels: the discrete and the continuous. See
how they make the solution of difference equations into child’s play. Then
see how the theory of functions of a complex variable gives, virtually by
inspection, the approximate size of the solution. The interplay between the
two channels is vitally important for the appreciation of the music.
In recent years there has been a vigorous trend in the direction of
finding bijective proofs of combinatorial theorems. That is, if we want to
prove that two sets have the same cardinality then we should be able to
do it by exhibiting an explicit bijection between the sets. In many cases
the fact that the two sets have the same cardinality was discovered in the
first place by generating function arguments. Also, even though bijective
arguments may be known, the generating function proofs may be shorter
or more elegant.
The bijective proofs give one a certain satisfying feeling that one ‘re-
ally’ understands why the theorem is true. The generating function argu-
ments often give satisfying feelings of naturalness, and ‘oh, I could have
thought of that,’ as well as usually offering the best route to finding exact
or approximate formulas for the numbers in question.
This book was tested in a senior course in discrete mathematics at the
University of Pennsylvania. My thanks go to the students in that course for
helping me at least partially to debug the manuscript, and to a number of
my colleagues who have made many helpful suggestions. Any reader who
is kind enough to send me a correction will receive a then-current complete
errata sheet and many thanks.
Herbert S. Wilf
Philadelphia, PA
September 1, 1989
viiPreface to the Second Edition
This edition contains several new areas of application, in chapter 4,
many new problems and solutions, a number of improvements in the pre-
sentation, and corrections. It also contains an Appendix that describes
some of the features of computer algebra programs that are of particular
importance in the study of generating functions.
I am indebted to many people for helping to make this a better book.
Bruce Sagan, in particular, made many helpful suggestions as a result of
a test run in his classroom. Many readers took up my offer (which is now
repeated) to supply a current errata sheet and my thanks in return for any
errors discovered.
Herbert S. Wilf
Philadelphia, PA
May 21, 1992
viiiCONTENTS
Chapter 1: Introductory Ideas and Examples
1.1 An easy two term recurrence . . . . . . . . . . . . . . . . . 3
1.2 A slightly harder two term recurrence . . . . . . . . . . . . . 5
1.3 A three term recurrence . . . . . . . . . . . . . . . . . . . 8
1.4 A three term boundary value problem . . . . . . . . . . . . 10
## 1.5 Two independent variables . . . . . . . . . . . . . . . . . 11
## 1.6 Another 2-variable case . . . . . . . . . . . . . . . . . . 16
Exercises . . . . . . . . . . . . . . . . . . . . . . . . . 24
Chapter 2: Series
## 2.1 Formal power series . . . . . . . . . . . . . . . . . . . . 30
## 2.2 The calculus of formal ordinary power series generating functions 33
## 2.3 The calculus of formal exponential generating functions . . . . 39
## 2.4 Power series, analytic theory . . . . . . . . . . . . . . . . 46
## 2.5 Some useful power series . . . . . . . . . . . . . . . . . . 52
## 2.6 Dirichlet series, formal theory . . . . . . . . . . . . . . . 56
Exercises . . . . . . . . . . . . . . . . . . . . . . . . . 65
Chapter 3: Cards, Decks, and Hands: The Exponential Formula
## 3.1 Introduction . . . . . . . . . . . . . . . . . . . . . . . 73
## 3.2 Definitions and a question . . . . . . . . . . . . . . . . . 74
## 3.3 Examples of exponential families . . . . . . . . . . . . . . 76
## 3.4 The main counting theorems . . . . . . . . . . . . . . . . 78
## 3.5 Permutations and their cycles . . . . . . . . . . . . . . . 81
## 3.6 Set partitions . . . . . . . . . . . . . . . . . . . . . . . 83
3.7 A subclass of permutations . . . . . . . . . . . . . . . . . 84
## 3.8 Involutions, etc. . . . . . . . . . . . . . . . . . . . . . 84
3.9 2-regular graphs . . . . . . . . . . . . . . . . . . . . . 85
## 3.10 Counting connected graphs . . . . . . . . . . . . . . . . . 86
## 3.11 Counting labeled bipartite graphs . . . . . . . . . . . . . . 87
## 3.12 Counting labeled trees . . . . . . . . . . . . . . . . . . . 89
## 3.13 Exponential families and polynomials of ‘binomial type.’ . . . . 91
## 3.14 Unlabeled cards and hands . . . . . . . . . . . . . . . . . 92
## 3.15 The money changing problem . . . . . . . . . . . . . . . 96
## 3.16 Partitions of integers . . . . . . . . . . . . . . . . . . . 100
## 3.17 Rooted trees and forests . . . . . . . . . . . . . . . . . . 102
## 3.18 Historical notes . . . . . . . . . . . . . . . . . . . . . . 103
Exercises . . . . . . . . . . . . . . . . . . . . . . . . . 104
viiChapter 4: Applications of generating functions
## 4.1 Generating functions find averages, etc. . . . . . . . . . . . 108
4.2 A generatingfunctionological view of the sieve method . . . . . 110
## 4.3 The ‘Snake Oil’ method for easier combinatorial identities . . . 118
4.4 WZ pairs prove harder identities . . . . . . . . . . . . . . 130
## 4.5 Generating functions and unimodality, convexity, etc. . . . . . 136
## 4.6 Generating functions prove congruences . . . . . . . . . . . 140
## 4.7 The cycle index of the symmetric group . . . . . . . . . . . 141
## 4.8 How many permutations have square roots? . . . . . . . . . 146
## 4.9 Counting polyominoes . . . . . . . . . . . . . . . . . . . 150
## 4.10 Exact covering sequences . . . . . . . . . . . . . . . . . . 154
Exercises . . . . . . . . . . . . . . . . . . . . . . . . . 157
Chapter 5: Analytic and asymptotic methods
## 5.1 The Lagrange Inversion Formula . . . . . . . . . . . . . . 167
## 5.2 Analyticity and asymptotics (I): Poles . . . . . . . . . . . . 171
## 5.3 Analyticity and asymptotics (II): Algebraic singularities . . . . 177
## 5.4 Analyticity and asymptotics (III): Hayman’s method . . . . . 181
Exercises . . . . . . . . . . . . . . . . . . . . . . . . . 188
Appendix: Using MapleTM
and MathematicaTM
. . . . . . . . 192
Solutions . . . . . . . . . . . . . . . . . . . . . . . . 197
References . . . . . . . . . . . . . . . . . . . . . . . 224
viiiChapter 1
Introductory ideas and examples
A generating function is a clothesline on which we hang up a sequence
of numbers for display.
What that means is this: suppose we have a problem whose answer is
a sequence of numbers, a0,a1,a2,.... We want to ‘know’ what the sequence
is. What kind of an answer might we expect?
A simple formula for an would be the best that could be hoped for. If
we find that an = n2
+3 for each n = 0,1,2,..., then there’s no doubt that
we have ‘answered’ the question.
But what if there isn’t any simple formula for the members of the
unknown sequence? After all, some sequences are complicated. To take
just one hair-raising example, suppose the unknown sequence is 2, 3, 5, 7,
11, 13, 17, 19, ..., where an is the nth prime number. Well then, it would
be just plain unreasonable to expect any kind of a simple formula.
Generating functions add another string to your bow. Although giv-
ing a simple formula for the members of the sequence may be out of the
question, we might be able to give a simple formula for the sum of a power
series, whose coefficients are the sequence that we’re looking for.
For instance, suppose we want the Fibonacci numbers F0,F1,F2,...,
and what we know about them is that they satisfy the recurrence relation
Fn+1 = Fn + Fn−1 (n ≥ 1;F0 = 0; F1 = 1).
The sequence begins with 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... There are
exact, not-very-complicated formulas for Fn, as we will see later, in example
2 of this chapter. But, just to get across the idea of a generating function,
here is how a generatingfunctionologist might answer the question: the
nth Fibonacci number, Fn, is the coefficient of xn
in the expansion of the
function x/(1 − x − x2
) as a power series about the origin.
You may concede that this is a kind of answer, but it leaves a certain
unsatisfied feeling. It isn’t really an answer, you might say, because we
don’t have that explicit formula. Is it a good answer?
In this book we hope to convince you that answers like this one are
often spectacularly good, in that they are themselves elegant, they allow
you to do almost anything you’d like to do with your sequence, and gener-
ating functions can be simple and easy to handle even in cases where exact
formulas might be stupendously complicated.
Here are some of the things that you’ll often be able to do with gener-
ating function answers:
(a) Find an exact formula for the members of your sequence.
Not always. Not always in a pleasant way, if your sequence is
12 1 Introductory ideas and examples
complicated. But at least you’ll have a good shot at finding such
a formula.
(b) Find a recurrence formula. Most often generating functions
arise from recurrence formulas. Sometimes, however, from the
generating function you will find a new recurrence formula, not
the one you started with, that gives new insights into the nature
of your sequence.
(c) Find averages and other statistical properties of your se-
quence. Generating functions can give stunningly quick deriva-
tions of various probabilistic aspects of the problem that is repre-
sented by your unknown sequence.
(d) Find asymptotic formulas for your sequence. Some of the
deepest and most powerful applications of the theory lie here.
Typically, one is dealing with a very difficult sequence, and instead
of looking for an exact formula, which might be out of the question,
we look for an approximate formula. While we would not expect,
for example, to find an exact formula for the nth prime number,
it is a beautiful fact (the ‘Prime Number Theorem’) that the nth
prime is approximately nlogn when n is large, in a certain precise
sense. In chapter 5 we will discuss asymptotic problems.
(e) Prove unimodality, convexity, etc. A sequence is called uni-
modal if it increases steadily at first, and then decreases steadily.
Many combinatorial sequences are unimodal, and a variety of
methods are available for proving such theorems. Generating func-
tions can help. There are methods by which the analytic proper-
ties of the generating function can be translated into conclusions
about the rises and falls of the sequence of coefficients. When
the method of generating functions works, it is often the simplest
method known.
(f) Prove identities. Many, many identities are known, in combina-
torics and elsewhere in mathematics. The identities that we refer
to are those in which a certain formula is asserted to be equal
to another formula for stated values of the free variable(s). For
example, it is well known that
n X
j=0
µ
n
j
¶2
=
µ
2n
n
¶
(n = 0,1,2,...).
One way to prove such identities is to consider the generating
function whose coefficients are the sequence shown on the left side
of the claimed identity, and to consider the generating function
formed from the sequence on the right side of the claimed identity,
and to show that these are the same function. This may sound1.1 An easy two term recurrence 3
obvious, but it is quite remarkable how much simpler and more
transparent many of the derivations become when seen from the
point of view of the black belt generatingfunctionologist. The
‘Snake Oil’ method that we present in section 4.3, below, explores
some of these vistas. The method of rational functions, in section
4.4, is new, and does more and harder problems of this kind.
(g) Other. Is there something else you would like to know about
your sequence? A generating function may offer hope. One ex-
ample might be the discovery of congruence relations. Another
possibility is that your generating function may bear a striking
resemblance to some other known generating function, and that
may lead you to the discovery that your problem is closely related
to another one, which you never suspected before. It is noteworthy
that in this way you may find out that the answer to your prob-
lem is simply related to the answer to another problem, without
knowing formulas for the answers to either one of the problems!
In the rest of this chapter we are going to give a number of examples
of problems that can be profitably thought about from the point of view
of generating functions. We hope that after studying these examples the
reader will be at least partly convinced of the power of the method, as well
as of the beauty of the unified approach.
## 1.1 An easy two term recurrence
A certain sequence of numbers a0,a1,... satisfies the conditions
an+1 = 2an + 1 (n ≥ 0;a0 = 0). (1.1.1)
Find the sequence.
First try computing a few members of the sequence to see what they
look like. It begins with 0, 1, 3, 7, 15, 31, ... These numbers look sus-
piciously like 1 less than the powers of 2. So we could conjecture that
an = 2n
− 1 (n ≥ 0), and prove it quickly, by induction based on the
recurrence (1.1.1).
But this is a book about generating functions, so let’s forget all of
that, pretend we didn’t spot the formula, and use the generating function
method. Hence, instead of finding the sequence {an}, let’s find the gener-
ating function A(x) =
P
n≥0 anxn
. Once we know what that function is,
we will be able to read off the explicit formula for the an’s by expanding
A(x) in a series.
To find A(x), multiply both sides of the recurrence relation (1.1.1) by
xn
and sum over the values of n for which the recurrence is valid, namely,
over n ≥ 0. Then try to relate these sums to the unknown generating
function A(x).4 1 Introductory ideas and examples
If we do this first to the left side of (1.1.1), there results
P
n≥0 an+1xn
.
How can we relate this to A(x)? It is almost the same as A(x). But the
subscript of the ‘a’ in each term is 1 unit larger than the power of x. But,
clearly,
X
n≥0
an+1xn
= a1 + a2x + a3x2
+ a4x3
+ ···
= {(a0 + a1x + a2x2
+ a3x3
+ ···) − a0}/x
= A(x)/x
since a0 = 0 in this problem. Hence the result of so operating on the left
side of (1.1.1) is A(x)/x.
Next do the right side of (1.1.1). Multiply it by xn
and sum over all
n ≥ 0. The result is
X
n≥0
(2an + 1)xn
= 2A(x) +
X
n≥0
xn
= 2A(x) +
1
1 − x
,
wherein we have used the familiar geometric series evaluation
P
n≥0 xn
=
1/(1 − x), which is valid for |x| < 1.
If we equate the results of operating on the two sides of (1.1.1), we find
that
A(x)
x
= 2A(x) +
1
1 − x
,
which is trivial to solve for the unknown generating function A(x), in the
form
A(x) =
x
(1 − x)(1 − 2x)
.
This is the generating function for the problem. The unknown numbers
an are arranged neatly on this clothesline: an is the coefficient of xn
in the
series expansion of the above A(x).
Suppose we want to find an explicit formula for the an’s. Then we
would have to expand A(x) in a series. That isn’t hard in this example,
since the partial fraction expansion is
x
(1 − x)(1 − 2x)
= x
½
2
1 − 2x
−
1
1 − x
¾
= {2x + 22
x2
+ 23
x3
+ 24
x4
+ ···}
− {x + x2
+ x3
+ x4
+ ···}
= (2 − 1)x + (22
− 1)x2
+ (23
− 1)x3
+ (24
− 1)x4
+ ···
It is now clear that the coefficient of xn
, i.e. an, is equal to 2n
−1, for each
n ≥ 0.1.2 A slightly harder two term recurrence 5
In this example, the heavy machinery wasn’t needed because we knew
the answer almost immediately, by inspection. The impressive thing about
generatingfunctionology is that even though the problems can get a lot
harder than this one, the method stays very much the same as it was here,
so the same heavy machinery may produce answers in cases where answers
are not a bit obvious.
1.2 A slightly harder two term recurrence
A certain sequence of numbers a0,a1,... satisfies the conditions
an+1 = 2an + n (n ≥ 0;a0 = 1). (1.2.1)
Find the sequence.
As before, we might calculate the first several members of the sequence,
to get 1, 2, 5, 12, 27, 58, 121, ... A general formula does not seem to be
immediately in evidence in this case, so we use the method of generating
functions. That means that instead of looking for the sequence a0,a1,...,
we will look for the function A(x) =
P
j≥0 ajxj
. Once we have found the
function, the sequence will be identifiable as the sequence of power series
coefficients of the function.*
As in example 1, the first step is to make sure that the recurrence
relation that we are trying to solve comes equipped with a clear indication
of the range of values of the subscript for which it is valid. In this case, the
recurrence (1.2.1) is clearly labeled in the parenthetical comment as being
valid for n = 0,1,2,... Don’t settle for a recurrence that has an unqualified
free variable.
The next step is to define the generating function that you will look for.
In this case, since we are looking for a sequence a0,a1,a2,... one natural
choice would be the function A(x) =
P
j≥0 ajxj
that we mentioned above.
Next, take the recurrence relation (1.2.1), multiply both sides of it by
xn
, and sum over all the values of n for which the relation is valid, which,
in this case, means sum from n = 0 to ∞. Try to express the result of doing
that in terms of the function A(x) that you have just defined.
If we do that to the left side of (1.2.1), the result is
a1 + a2x + a3x2
+ a4x3
+ ··· = (A(x) − a0)/x
= (A(x) − 1)/x.
So much for the left side. What happens if we multiply the right side
of (1.2.1) by xn
and sum over nonnegative integers n? Evidently the result
is 2A(x) +
P
n≥0 nxn
. We need to identify the series
X
n≥0
nxn
= x + 2x2
+ 3x3
+ 4x4
+ ···
* If you are feeling rusty in the power series department, see chapter 2,
which contains a review of that subject.6 1 Introductory ideas and examples
There are two ways to proceed: (a) look it up (b) work it out. To work it
out we use the following stunt, which seems artificial if you haven’t seen it
before, but after using it 4993 times it will seem quite routine:
X
n≥0
nxn
=
X
n≥0
x(
d
dx
)xn
= x(
d
dx
)
X
n≥0
xn
= x(
d
dx
)
1
1 − x
=
x
(1 − x)2
.
(1.2.2)
In other words, the series that we are interested in is essentially the
derivative of the geometric series, so its sum is essentially the derivative
of the sum of the geometric series. This raises some nettlesome questions,
which we will mention here and deal with later. For what values of x is
(1.2.2) valid? The geometric series converges only for |x| < 1, so the ana-
lytic manipulation of functions in (1.2.2) is legal only for those x. However,
often the analytic nature of the generating function doesn’t interest us; we
love it only for its role as a clothesline on which our sequence is hanging
out to dry. In such cases we can think of a generating function as only a
formal power series, i.e., as an algebraic object rather than as an analytic
one. Then (1.2.2) would be valid as an identity in the ring of formal power
series, which we will discuss later, and the variable x wouldn’t need to be
qualified at all.
Anyway, the result of multiplying the right hand side of (1.2.1) by xn
and summing over n ≥ 0 is 2A(x) + x/(1 − x)2
, and if we equate this with
our earlier result from the left side of (1.2.1), we find that
(A(x) − 1)
x
= 2A(x) +
x
(1 − x)2
, (1.2.3)
and we’re ready for the easy part, which is to solve (1.2.3) for the unknown
A(x), getting
A(x) =
1 − 2x + 2x2
(1 − x)2(1 − 2x)
. (1.2.4)
Exactly what have we learned? The original problem was to ‘find’ the
numbers {an} that are determined by the recurrence (1.2.1). We have, in
a certain sense, ‘found’ them: the number an is the coefficient of xn
in the
power series expansion of the function (1.2.4).
This is the end of the ‘find-the-generating-function’ part of the method.
We have it. What we do with it depends on exactly why we wanted to know
the solution of (1.2.1) in the first place.
Suppose, for example, that we want an exact, simple formula for the
members an of the unknown sequence. Then the method of partial fractions
will work here, just as it did in the first example, but its application is now
a little bit trickier. Let’s try it and see.
The first step is to expand the right side of (1.2.4) in partial fractions.
Such a fraction is guaranteed to be expandable in partial fractions in the1.2 A slightly harder two term recurrence 7
form
1 − 2x + 2x2
(1 − x)2(1 − 2x)
=
A
(1 − x)2
+
B
1 − x
+
C
1 − 2x
, (1.2.5)
and the only problem is how to find the constants A,B,C.
Here’s the quick way. First multiply both sides of (1.2.5) by (1 − x)2
,
and then let x = 1. The instant result is that A = −1 (don’t take my word
for it, try it for yourself!). Next multiply (1.2.5) through by 1 − 2x and
let x = 1/2. The instant result is that C = 2. The hard one to find is B,
so let’s do that one by cheating. Since we know that (1.2.5) is an identity,
i.e., is true for all values of x, let’s choose an easy value of x, say x = 0,
and substitute that value of x into (1.2.5). Since we now know A and C,
we find at once that B = 0.
We return now to (1.2.5) and insert the values of A,B,C that we just
found. The result is the relation
A(x) =
1 − 2x + 2x2
(1 − x)2(1 − 2x)
=
(−1)
(1 − x)2
+
2
1 − 2x
. (1.2.6)
What we are trying to do is to find an explicit formula for the coefficient
of xn
in the left side of (1.2.6). We are trading that in for two easier
problems, namely finding the coefficient of xn
in each of the summands on
the right side of (1.2.6). Why are they easier? The term 2/(1 − 2x), for
instance, expands as a geometric series. The coefficient of xn
there is just
2 · 2n
= 2n+1
. The series (−1)/(1 − x)2
was handled in (1.2.2) above, and
its coefficient of xn
is −(n+1). If we combine these results we see that our
unknown sequence is
an = 2n+1
− n − 1 (n = 0,1,2,...).
Having done all of that work, it’s time to confess that there are better
ways to deal with recurrences of the type (1.2.1), without using generating
functions.* However, the problem remains a good example of how gener-
ating functions can be used, and it underlines the fact that a single unified
method can replace a lot of individual special techniques in problems about
sequences. Anyway, it won’t be long before we’re into some problems that
essentially cannot be handled without generating functions.
It’s time to introduce some notation that will save a lot of words in
the sequel.
Definition. Let f(x) be a series in powers of x. Then by the symbol
[xn
]f(x) we will mean the coefficient of xn
in the series f(x).
Here are some examples of the use of this notation.
[xn
]ex
= 1/n!; [tr
]{1/(1 − 3t)} = 3r
; [um
](1 + u)s
=
µ
s
m
¶
.
* See, for instance, chapter 1 of my book [Wi2].8 1 Introductory ideas and examples
A perfectly obvious property of this symbol, that we will use repeatedly, is
[xn
]{xa
f(x)} = [xn−a
]f(x). (1.2.7)
Another property of this symbol is the convention that if β is any real
number, then
[βxn
]f(x) = (1/β)[xn
]f(x), (1.2.8)
so, for instance, [xn
/n!]ex
= 1 for all n ≥ 0.
Before we move on to the next example, here is a summary of the
method of generating functions as we have used it so far.
THE METHOD
Given: a recurrence formula that is to be solved by the method of
generating functions.
1. Make sure that the set of values of the free variable (say n) for
which the given recurrence relation is true, is clearly delineated.
2. Give a name to the generating function that you will look for, and
write out that function in terms of the unknown sequence (e.g.,
call it A(x), and define it to be
P
n≥0 anxn
).
3. Multiply both sides of the recurrence by xn
, and sum over all
values of n for which the recurrence holds.
4. Express both sides of the resulting equation explicitly in terms of
your generating function A(x).
5. Solve the resulting equation for the unknown generating function
A(x).
6. If you want an exact formula for the sequence that is defined by
the given recurrence relation, then attempt to get such a formula
by expanding A(x) into a power series by any method you can
think of. In particular, if A(x) is a rational function (quotient
of two polynomials), then success will result from expanding in
partial fractions and then handling each of the resulting terms
separately.
1.3 A three term recurrence
Now let’s do the Fibonacci recurrence
Fn+1 = Fn + Fn−1. (n ≥ 1;F0 = 0; F1 = 1). (1.3.1)
Following ‘The Method,’ we will solve for the generating function
F(x) =
X
n≥0
Fnxn
.1.3 A three term recurrence 9
To do that, multiply (1.3.1) by xn
, and sum over n ≥ 1. We find on the
left side
F2x + F3x2
+ F4x3
+ ··· =
F(x) − x
x
,
and on the right side we find
{F1x+F2x2
+F3x3
+···}+{F0x+F1x2
+F2x3
+···} = {F(x)}+{xF(x)}.
(Important: Try to do the above yourself, without peeking, and see if you
get the same answer.) It follows that (F − x)/x = F + xF, and therefore
that the unknown generating function is now known, and it is
F(x) =
x
1 − x − x2
.
Now we will find some formulas for the Fibonacci numbers by expand-
ing x/(1 − x − x2
) in partial fractions. The success of the partial fraction
method is greatly enhanced by having only linear (first degree) factors in
the denominator, whereas what we now have is a quadratic factor. So let’s
factor it further. We find that
1 − x − x2
= (1 − xr+)(1 − xr−) (r± = (1 ±
√
5)/2)
and so
x
1 − x − x2
=
x
(1 − xr+)(1 − xr−)
=
1
(r+ − r−)
µ
1
1 − xr+
−
1
1 − xr−
¶
=
1
√
5
½X
j≥0
rj
+xj
−
X
j≥0
rj
−xj
¾
,
thanks to the magic of the geometric series. It is easy to pick out the
coefficient of xn
and find
Fn =
1
√
5
(rn
+ − rn
−) (n = 0,1,2,...) (1.3.3)
as an explicit formula for the Fibonacci numbers Fn.
This example offers us a chance to edge a little further into what gen-
erating functions can tell us about sequences, in that we can get not only
the exact answer, but also an approximate answer, valid when n is large.
Indeed, when n is large, since r+ > 1 and |r−| < 1, the second term in
(1.3.3) will be minuscule compared to the first, so an extremely good ap-
proximation to Fn will be
Fn ∼
1
√
5
Ã
1 +
√
5
2
!n
. (1.3.4)10 1 Introductory ideas and examples
But, you may ask, why would anyone want an approximate formula
when an exact one is available? One answer, of course, is that sometimes
exact answers are fearfully complicated, and approximate ones are more
revealing. Even in this case, where the exact answer isn’t very complex, we
can still learn something from the approximation. The reader should take
a few moments to verify that, by neglecting the second term in (1.3.3), we
neglect a quantity that is never as large as 0.5 in magnitude, and conse-
quently not only is Fn approximately given by (1.3.4), it is exactly equal
to the integer nearest to the right side of (1.3.4). Thus consideration of an
approximate formula has found us a simpler exact formula!
1.4 A three term boundary value problem
This example will differ from the previous ones in that the recurrence
relation involved does not permit the direct calculation of the members
of the sequence, although it does determine the sequence uniquely. The
situation is similar to the following: suppose we imagine the Fibonacci re-
currence, together with the additional data F0 = 1 and F735 = 1. Well then,
the sequence {Fn} would be uniquely determined, but you wouldn’t be able
to compute it directly by recurrence because you would not be in possession
of the two consecutive values that are needed to get the recurrence started.
We will consider a slightly more general situation. It consists of the
recurrence
aun+1 + bun + cun−1 = dn (n = 1,2,...,N − 1;u0 = uN = 0) (1.4.1)
where the positive integer N, the constants a, b, c and the sequence {dn}N−1
n=1
are given in advance. The equations (1.4.1) determine the sequence {ui}N
0
uniquely, as we will see, and the method of generating functions gives us a
powerful way to attack such boundary value problems as this, which arise
in numerous applications, such as the theory of interpolation by spline func-
tions.
To begin with, we will define two generating functions. One of them is
our unknown U(x) =
PN
j=0 ujxj
, and the second one is D(x) =
PN−1
j=1 djxj
,
and it is regarded as a known function (did we omit any given values of the
dj’s, like d0? or dN? Why?).
Next, following the usual recipe, we multiply the recurrence (1.4.1) by
xn
and sum over the values of n for which the recurrence is true, which in
this case means that we sum from n = 1 to N − 1. This yields
a
N−1 X
n=1
un+1xn
+ b
N−1 X
n=1
unxn
+ c
N−1 X
n=1
un−1xn
=
N−1 X
n=1
dnxn
.
If we now express this equation in terms of our previously defined generating
functions, it takes the form
a
x
{U(x) − u1x} + bU(x) + cx{U(x) − uN−1xN−1
} = D(x). (1.4.2)1.4 A three term boundary value problem 11
Next, with only a nagging doubt because u1 and uN−1 are unknown, we
press on with the recipe, whose next step asks us to solve (1.4.2) for the
unknown generating function U(x). Now that isn’t too hard, and we find
at once that
{a + bx + cx2
}U(x) = x{D(x) + au1 + cuN−1xN
}. (1.4.3)
The unknown generating function U(x) is now known except for the
two still-unknown constants u1 and uN−1, but (1.4.3) suggests a way to find
them, too. There are two values of x, call them r+ and r−, at which the
quadratic polynomial on the left side of (1.4.3) vanishes. Let us suppose
that rN
+ 6= rN
− , for the moment. If we let x = r+ in (1.4.3), we obtain
one equation in the two unknowns u1, uN−1, and if we let x = r−, we get
another. The two equations are
au1 + (crN
+ )uN−1 = −D(r+)
au1 + (crN
− )uN−1 = −D(r−).
(1.4.4)
Once these have been solved for u1 and uN−1, equation (1.4.3) then gives
U(x) quite explicitly and completely. We leave the exceptional case where
rN
+ = rN
− to the reader.
Here is an application∗
of these results to the theory of spline interpo-
lation.
Suppose we are given a table of values y0,y1,...,yn of some function
y(x), at a set of equally spaced points ti = t0 +ih (0 ≤ i ≤ n). We want to
construct a smooth function S(x) that fits the data, subject to the following
conditions:
(i) Within each interval (ti,ti+1) (i = 0,...,n−1) our function S(x) is
to be a cubic polynomial (a different one in each interval!);
(ii) The functions S(x), S0
(x) and S00
(x) are to be continuous on the
whole interval [t0,tn];
(iii) S(ti) = yi for i = 0,...,n.
A function S(x) that satisfies these conditions is called a cubic spline.
Suppose our unknown spline S(x) is given by S0(x), if x ∈ [t0,t1], S1(x), if
x ∈ [t1,t2],..., Sn−1(x), if x ∈ [tn−1,tn], and we want now to determine all
of the cubic polynomials S0,...,Sn−1. To do this we have 2n interpolatory
conditions
Si−1(ti) = yi = Si(ti) (i = 1,...,n − 1); S0(t0) = y0; Sn−1(tn) = yn
(1.4.5)
along with 2n − 2 continuity conditions
S0
i−1(ti) = S0
i(ti); S00
i−1(ti) = S00
i (ti) (i = 1,...,n − 1). (1.4.6)
∗
This application is somewhat specialized, and may be omitted at a first
reading.12 1 Introductory ideas and examples
There are altogether 4n−2 conditions to satisfy. We have n cubic polyno-
mials to be determined, each of which has 4 coefficients, for a total of 4n
unknown parameters. Since the conditions are linear, such a spline S(x)
surely exists and we can expect it to have two free parameters. It is con-
ventional to choose these so that S(x) has a point of inflection at t0 and at
tn.
Now here is the solution. The functions Si(x) are given by
Si(x) =
1
6h
¡
zi(ti+1 − x)3
+ zi+1(x − ti)3
+ (6yi+1 − h2
zi+1)(x − ti)
+ (6yi − h2
zi)(ti+1 − x)
¢
(i = 0,1,...,n − 1),
(1.4.7)
provided that the numbers z1,...,zn−1 satisfy the simultaneous equations
zi−1 + 4zi + zi+1 =
6
h2
(yi+1 − 2yi + yi−1) (i = 1,2,...,n − 1) (1.4.8)
in which z0 = zn = 0. It is easy to check this, by substituting x = ti and
x = ti+1 into (1.4.7) to verify that (1.4.5) and (1.4.6) are satisfied. Hence
it remains only to solve the equations (1.4.8).
The system of equations (1.4.8) is of the form (1.4.1), hence we can
find the solutions from (1.4.3), (1.4.4). To do this, begin with the given set
of points {(ti,yi)}n
i=0, through which we wish to interpolate. Use them to
write down
D(x) =
6
h2
n−1 X
i=1
(yi+1 − 2yi + yi−1)xi
. (1.4.9)
Since (a,b,c) = (1,4,1) in this example, we have r± = −2 ±
√
3. Now our
unknown generating function U(x) is given by (1.4.3), which reads as
U(x) =
x(D(x) + z1 + zn−1xn
)
(1 + 4x + x2)
, (1.4.10)
in which the unknown numbers z1,zn−1 are determined by the requirement
that the right side of (1.4.10) be a polynomial, or equivalently by the two
equations (1.4.4), which become
z1 + (
√
3 − 2)n
zn−1 = −D(
√
3 − 2)
z1 + (−
√
3 − 2)n
zn−1 = −D(−
√
3 − 2).
(1.4.11)
When we know U(x), which is, after all,
Pn−1
i=1 zixi
, we can read off its
coefficients to find the z’s, and use them in (1.4.7) to find the interpolating
spline.1.4 A three term boundary value problem 13
Example.
Now let’s try an example with real live numbers in it. Suppose we are
trying to fit the powers of 2 by a cubic spline on the interval [0,5]. Our
input data are yi = 2i
for i = 0,1,...,5, h = 1, and n = 5. From (1.4.9)
we find that D(x) = 6x(1+2x+4x2
+8x3
). Then we solve (1.4.11) to find
that z1 = 204/209 and z4 = 2370/209. Next (1.4.10) tells us that
U(x) =
204x
209
+
438x2
209
+
552x3
209
+
2370x4
209
,
and now we know all of the zi’s. Finally, (1.4.7) tells us the exact cubic
polynomials that form the spline. For example, S0(x), which lives on the
subinterval [0,1], is
S0(x) = 1 +
175
209
x +
34
209
x3
.
Note that S0(0) = 1 and S0(1) = 2, so it correctly fits the data at the
endpoints of its subinterval, and that S00
0 (0) = 0, so the fit will have an
inflection point at the origin. The reader is invited to find all of the Si(x)
(i = 0,1,...,5), in this example, and check that they smoothly fit into each
other at the points 1,2,3,4, in the sense that the functions and their first
two derivatives are continuous.
One reason why you might like to fit some numerical data with a
spline is because you want to integrate the function that the data represent.
Integration of (1.4.7) from ti = ih to ti+1 = (i + 1)h shows that
Z ti+1
ti
Si(x)dx =
h
2
(yi + yi+1) −
h3
24
(zi + zi+1). (1.4.12)
Thus, fitting some data by a spline and integrating the spline amounts to
numerical integration by the trapezoidal rule with a third order correction
term. If we sum (1.4.12) over i = 0,...,n−1 we get for the overall integral,
Z nh
0
S(x)dx = trap −
h
12
(y0 − y1 − yn−1 + yn) −
h3
72
(z1 + zn−1) (1.4.13)
in which ‘trap’ is the trapezoidal rule, and z1,zn−1 satisfy (1.4.11).
Interpolation by spline functions is an important subject. It occurs in
the storage of computer fonts, such as the one that you are now reading.
Did you ever wonder how the shapes of the letters in the fonts are actually
stored in a computer? One way is by storing the parameters of spline
functions that fit the contours of the letters in the font.14 1 Introductory ideas and examples
## 1.5 Two independent variables
In this section we will see how generating functions can be helpful in
problems that involve functions of two discrete variables. We will use the
opportunity also to introduce the binomial coefficients, since they are surely
one of the most important combinatorial counting sequences.
Let n and k be integers such that 0 ≤ k ≤ n. In how many ways can
we choose a subset of k objects from the set {1,2,...,n}? Let’s pretend
that we don’t know how this will turn out, and allow generating functions
to help us find the answer.
Suppose f(n,k) is the answer to the question. We imagine that the
collection of all possible subsets of k of these n objects are in front of us,
and we will divide them into two piles. In the first pile we put all of those
subsets that do contain the object ‘n’, and into the second pile we put all
subsets that do not contain ‘n’. The first of these piles obviously contains
f(n − 1,k − 1) subsets. The second pile contains f(n − 1,k) subsets. The
two piles together originally contained f(n,k) subsets. So it must be that
our unknown numbers f(n,k) satisfy the recurrence
f(n,k) = f(n − 1,k) + f(n − 1,k − 1) (f(n,0) = 1). (1.5.1)
To find formulas for these numbers we use (what else?) generating
functions. For each n = 0,1,2,... define the generating function
Bn(x) =
X
k≥0
f(n,k)xk
.
Now multiply (1.5.1) throughout by xk
and sum over k ≥ 1. The result is
that Bn(x) − 1 = (Bn−1(x) − 1) + xBn−1(x), for n ≥ 1, with B0(x) = 1.
Hence
Bn(x) = (1 + x)Bn−1(x) (n ≥ 1; B0(x) = 1). (1.5.2)
Thus Bn(x) = (1 + x)n
, for all n ≥ 0. Our unknown number f(n,k)
is revealed to be the coefficient of xk
in the polynomial (1 + x)n
. To find
a formula for f(n,k) we might, for example, use Taylor’s formula, which
would tell us that f(n,k) is the kth derivative of (1 + x)n
, evaluated at
x = 0, all divided by k!. The differentiation is simple to do. Indeed, the
kth derivative of (1 + x)n
is n(n − 1)···(n − k + 1)(1 + x)n−k
. If we put
x = 0 and divide by k! we quickly discover that f(n,k), the number of
k-subsets of n things, is given by

n
k

=
n!
k!(n − k)!
=
n(n − 1)(n − 2)···(n − k + 1)
k!
(1.5.3)
for integers n,k with 0 ≤ k ≤ n.1.5 Two independent variables 15
That pretty well takes care of the binomial coefficients
¡n
k
¢
when 0 ≤
k ≤ n and n,k are integers. When k is a negative integer the binomial
coefficient
¡n
k
¢
= 0.
Although the second member of equation (1.5.3) is difficult to decipher
if n is not a nonnegative integer, the third member isn’t a bit hard to
understand, even if n is a complex number, so long as k is a nonnegative
integer. So that gives us an extension of the definition of the binomial
coefficients to arbitrary complex numbers n, namely,
µ
n
k
¶
=
n(n − 1)(n − 2)···(n − k + 1)
k!
(integer k ≥ 0). (1.5.4)
Thus
¡−3
3
¢
= (−3)(−4)(−5)/6 = −10, and
¡i
2
¢
= i(i − 1)/2 = (−1 − i)/2,
etc. The generating function
Bn(x) = (1 + x)n
=
X
k≥0
µ
n
k
¶
xk
= 1 + nx +
n(n − 1)
2
x2
+ ···
remains valid for all complex numbers n: the series terminates if n is a
nonnegative integer, and it converges for |x| < 1 in any case.
What is the support of
¡n
k
¢
? That is, for which values of n,k is it
true that
¡n
k
¢
6= 0? First, k must be a nonnegative integer. If n is not
a nonnegative integer then
¡n
k
¢
is surely nonzero, by (1.5.4). If n is a
nonnegative integer then (1.5.4) shows that
¡n
k
¢
6= 0 iff 0 ≤ k ≤ n (in
accordance with the combinatorial definition!).
A very important consequence of these facts is that if n is a nonnegative
integer, instead of writing something like
Pn
k=0
¡n
k
¢
xk
, we can equally well
write
P∞
k=−∞
¡n
k
¢
xk
, because the binomial coefficients vanish on all of the
seemingly extra values of k that appear in the second form of the sum. The
binomial coefficients “cut off” the sum by themselves, so there is no need
to do it again with the range of summation.
That being the case, we introduce two conventions that we will adhere
to throughout the book.
Convention 1. When the range of a variable that is being summed over
is not specified, it is to be understood that the range of summation is from
−∞ to +∞.
Convention 2. When the range of a free variable in an equation is not
specified, it is to be understood that the equation holds for all integer values
of that variable.
For example, we will write
P
k
¡n
k
¢
xk
= (1 + x)n
. These conventions
will save us an enormous amount of work in the sequel, mainly in that
we won’t have to worry about changing the limits of summation when we
change the variable of summation by a constant shift.16 1 Introductory ideas and examples
Let’s look at generating functions of some other kinds. If we multiply
Bn(x) by yn
and sum only over n ≥ 0, we find that
X
n≥0
Bn(x)yn
=
X
n≥0
X
k
µ
n
k
¶
xk
yn
=
X
n≥0
(1 + x)n
yn
=
1
1 − y(1 + x)
.
Thus for integer n ≥ 0,
¡n
k
¢
= [xk
yn
](1 − y(1 + x))−1
.
For another exercise, let’s evaluate, for nonnegative integer k, the sum P
n
¡n
k
¢
yn
. Note that the index n runs over all integers, but that the sum-
mand vanishes unless n ≥ k. That sum is clearly
[xk
]
X
n≥0
X
k
µ
n
k
¶
xk
yn
= [xk
]
1
1 − y(1 + x)
=
1
1 − y
[xk
]
1
1 − ( y
1−y)x
=
1
1 − y
¡ y
1 − y
¢k
=
yk
(1 − y)k+1
.
For future reference we will place side-by-side these two power series gen-
erating functions of the binomial coefficients:
X
k
µ
n
k
¶
xk
= (1 + x)n
;
X
n
µ
n
k
¶
yn
=
yk
(1 − y)k+1
. (1.5.5)
## 1.6 Another 2-variable case.
This example will have a stronger combinatorial flavor than the pre-
ceding ones. It concerns the partitions of a set. By a partition of a set S
we will mean a collection of nonempty, pairwise disjoint sets whose union is
S. Another name for a partition of S is an equivalence relation on S. The
sets into which S is partitioned are called the classes of the partition.
For instance, we can partition [5]∗
in several ways. One of them is as
{123}{4}{5}. In this partition there are three classes, one of which contains
1 and 2 and 3, another of which contains only 4, while the other contains
only 5. No significance attaches to the order of the elements within the
classes, nor to the order of the classes. All that matters is ‘who is together
and who is apart.’
Here is a list of all of the partitions of [4] into 2 classes:
{12}{34}; {13}{24}; {14}{23}; {123}{4}; {124}{3}; {134}{2}; {1}{234}.
(1.6.1)
There are exactly 7 partitions of [4] into 2 classes.
The problem that we will address in this example is to discover how
many partitions of [n] into k classes there are. Let
©n
k
ª
denote this number.
∗
Recall that [n] is the set {1,2,...,n}1.6 Another 2-variable case. 17
It is called the Stirling number of the second kind. Our list above shows
that
©4
2
ª
= 7.
To find out more about these numbers we will follow the method of
generating functions. First we will find a recurrence relation, then a few
generating functions, then some exact formulas, etc.
We begin with a recurrence formula for
©n
k
ª
, and the derivation will
be quite similar to the one used in the previous example.
Let positive integers n, k be given. Imagine that in front of you is the
collection of all possible partitions of [n] into k classes. There are exactly ©n
k
ª
of them. As in the binomial coefficient example, we will carve up this
collection into two piles; into the first pile go all of those partitions of [n]
into k classes in which the letter n lives in a class all by itself. Into the
second pile go all other partitions, i.e., those in which the highest letter n
lives in a class with other letters.
The question is, how many partitions are there in each of these two
piles (expressed in terms of the Stirling numbers)?
Consider the first pile. There, every partition has n living alone. Imag-
ine marching through that pile and erasing the class ‘(n)’ that appears in
every single partition in the pile. If that were done, then what would re-
main after the erasures is exactly the complete collection of all partitions
of [n − 1] into k − 1 classes. There are
©n−1
k−1
ª
of these, so there must have
been
©n−1
k−1
ª
partitions in the first pile.
That was the easy one, but now consider the second pile. There the
letter n always lives in a class with other letters. Therefore, if we march
through that pile and erase the letter n wherever it appears, we won’t affect
the numbers of classes; we’ll still be looking at partitions with k classes.
After erasing the letter n from everything, our pile now contains partitions
of n−1 letters into k classes. However, each one of these partitions appears
not just once, but several times.
For example, in the list (1.6.1), the second pile contains the partitions
{12}{34}; {13}{24}; {14}{23}; {124}{3}; {134}{2}; {1}{234}, (1.6.2)
and after we delete ‘4’ from every one of them we get the list
{12}{3}; {13}{2}; {1}{23}; {12}{3}; {13}{2}; {1}{23}.
What we are looking at is the list of all partitions of [3] into 2 classes,
where each partition has been written down twice. Hence this list contains
exactly 2
©3
2
ª
partitions.
In the general case, after erasing n from everything in the second pile,
we will be looking at the list of all partitions of [n−1] into k classes, where
every such partition will have been written down k times. Hence that list
will contain exactly k
©n−1
k
ª
partitions.18 1 Introductory ideas and examples
Therefore the second pile must have also contained k
©n−1
k
ª
partitions
before the erasure of n.
The original list of
©n
k
ª
partitions was therefore split into two piles, the
first of which contained
©n−1
k−1
ª
partitions and the second of which contained
k
©n−1
k
ª
partitions.
It must therefore be true that
½
n
k
¾
=
½
n − 1
k − 1
¾
+ k
½
n − 1
k
¾
((n,k) =????).
To determine the range of n and k, let’s extend the definition of
©n
k
ª
to all
pairs of integers. We put
©n
k
ª
= 0 if k > n or n < 0 or k < 0. Further,
©n
0
ª
= 0 if n 6= 0, and we will take
©0
0
ª
= 1. With those conventions, the
recurrence above is valid for all (n,k) other than (0,0), and we have
½
n
k
¾
=
½
n − 1
k − 1
¾
+ k
½
n − 1
k
¾
((n,k) 6= (0,0);
½
0
0
¾
= 1). (1.6.3)
The stage is now set for finding the generating functions. Again there
are three natural candidates for generating functions that might be find-
able, namely
An(y) =
X
k
½
n
k
¾
yk
Bk(x) =
X
n
½
n
k
¾
xn
C(x,y) =
X
n,k
½
n
k
¾
xn
yk
.
(1.6.4)
Before we plunge into the calculations, let’s pause for a moment to
develop some intuition about which of these choices is likely to succeed. To
find An(y) will involve multiplying (1.6.3) by yk
and summing over k. Do
you see any problems with that? Well, there are some, and they arise from
the factor of k in the second term on the right. Indeed, after multiplying by
yk
and summing over k we will have to deal with something like
P
k k
©n
k
ª
yk
.
This is certainly possible to think about, since it is related to the derivative
of An(y), but we do have a complication here.
If instead we choose to find Bk(x), we multiply (1.6.3) by xn
and sum
on n. Then the factor of k that seemed to be troublesome is not involved
in the sum, and we can take that k outside of the sum as a multiplicative
factor.
Comparing these, let’s vote for the latter approach, and try to find the
functions Bk(x) (k ≥ 0). Hence, multiply (1.6.3) by xn
and sum over n,
to get
Bk(x) = xBk−1(x) + kxBk(x) (k ≥ 1;B0(x) = 1).1.6 Another 2-variable case. 19
This leads to
Bk(x) =
x
1 − kx
Bk−1(x) (k ≥ 1;B0(x) = 1)
and finally to the evaluation
Bk(x) =
X
n
½
n
k
¾
xn
=
xk
(1 − x)(1 − 2x)(1 − 3x)···(1 − kx)
(k ≥ 0).
(1.6.5)
The problem of finding an explicit formula for the Stirling numbers
could therefore be solved if we could find the power series expansion of the
function that appears in (1.6.5). That, in turn, calls for a dose of partial
fractions, not of Taylor’s formula!
The partial fraction expansion in question has the form
1
(1 − x)(1 − 2x)···(1 − kx)
=
k X
j=1
αj
(1 − jx)
.
To find the α’s, fix r, 1 ≤ r ≤ k, multiply both sides by 1 − rx, and let
x = 1/r. The result is that
αr =
1
(1 − 1/r)(1 − 2/r)···(1 − (r − 1)/r)(1 − (r + 1)/r)···(1 − k/r)
= (−1)k−r rk−1
(r − 1)!(k − r)!
(1 ≤ r ≤ k).
(1.6.6)
From (1.6.5) and (1.6.6) we obtain, for n ≥ k,
½
n
k
¾
= [xn
]
½
xk
(1 − x)(1 − 2x)···(1 − kx)
¾
= [xn−k
]
½
1
(1 − x)(1 − 2x)···(1 − kx)
¾
= [xn−k
]
k X
r=1
αr
1 − rx
(k ≥ 1)
=
k X
r=1
αr[xn−k
]
1
1 − rx
=
k X
r=1
αrrn−k
=
k X
r=1
(−1)k−r rk−1
(r − 1)!(k − r)!
rn−k
=
k X
r=1
(−1)k−r rn
r!(k − r)!
(n,k ≥ 0),
(1.6.7)20 1 Introductory ideas and examples
which is just what we wanted: an explicit formula for
©n
k
ª
. Do check that
this formula yields
©4
2
ª
= 7, which we knew already. At the same time,
note that the formula says that
©n
2
ª
= 2n−1
− 1 (n > 0). Can you give an
independent proof of that fact?
Next, we’re going to try one of the other approaches to solving the
recurrence for the Stirling numbers, namely that of studying the functions
An(y) in (1.6.4). This method is much harder to carry out to completion
than the one we just used, but it turns out that these generating functions
have other uses that are quite important from a theoretical point of view.
Therefore, let’s fix n > 0, multiply (1.6.3) by yk
and sum over k. The
result is
An(y) =
X
k
½
n − 1
k − 1
¾
yk
+
X
k
k
½
n − 1
k
¾
yk
= yAn−1(y) + (y
d
dy
)An−1(y)
= {y(1 + Dy)}An−1(y) (n > 0;A0(y) = 1).
(1.6.8)
The novel feature is the appearance of the differentiation operator d/dy
that was necessitated by the factor k in the recurrence relation.
Hence each function An is obtained from its predecessor by applying
the operator y(1 + Dy). Beginning with A0 = 1, we obtain successively
y,y+y2
,y+3y2
+y3
,..., but as far as an explicit formula is concerned, we
find only that
An(y) = {y + yDy}n
1 (n ≥ 0) (1.6.9)
by this approach.
There are, however, one or two things that can be seen more clearly
from these generating functions than from the Bn(x)’s. One of these will
be discussed in section 4.5, and concerns the shape of the sequence
©n
k
ª
for
fixed n, as k runs from 1 to n. It turns out that the sequence increases for
a while and then it decreases. That is, it has just one maximum. Many
combinatorial sequences are unimodal, like this one, but in some cases it
can be very hard to prove such things. In this case, thanks to the formula
(1.6.9), we will see that it’s not hard at all.
For an application of (1.6.7), recall that the Stirling number
©n
k
ª
is the
number of ways of partitioning a set of n elements into k classes. Suppose
we don’t particularly care how many classes there are, but we want to know
the number of ways to partition a set of n elements. Let these numbers
be {b(n)}∞
0 . They are called the Bell numbers. It is conventional to take
b(0) = 1. The sequence of Bell numbers begins 1, 1, 2, 5, 15, 52, ...
Can we find an explicit formula for the Bell numbers? Nothing to it.
In (1.6.7) we have an explicit formula for
©n
k
ª
. If we sum that formula from
k = 1 to n we will have an explicit formula for b(n). However, there’s one1.6 Another 2-variable case. 21
more thing that it is quite profitable to notice. The formula (1.6.7) is valid
for all positive integer values of n and k. In particular, it is valid if k > n.
But
©n
k
ª
= 0 if k > n. This means that the formula (1.6.7) doesn’t have to
be told that
©13
19
ª
= 0; it knows it; i.e., if we blissfully insert n = 13, k = 19
into the monster sum and work it all out, we will get 0.
Hence, to calculate the Bell numbers, we can sum the last member of
(1.6.7) from k = 1 to M, where M is any number you please that is ≥ n.
Let’s do it. The result is that
b(n) =
M X
k=1
k X
r=1
(−1)k−r rn−1
(r − 1)!(k − r)!
=
M X
r=1
rn−1
(r − 1)!
M X
k=r
(−1)k−r
(k − r)!
=
M X
r=1
rn−1
(r − 1)!
(M−r X
s=0
(−1)s
s!
)
.
But now the number M is arbitrary, except that M ≥ n. Since the partial
sum of the exponential series in the curly braces above is so inviting, let’s
keep n and r fixed, and let M → ∞. This gives the following remarkable
formula for the Bell numbers (check it yourself for n = 1):
b(n) =
1
e
X
r≥0
rn
r!
(n ≥ 0). (1.6.10)
This formula for the Bell numbers, although it has a certain charm,
doesn’t lend itself to computation. From it, however, we can derive a
generating function for the Bell numbers that is unexpectedly simple and
elegant. We will look for the generating function in the form
B(x) =
X
n≥0
b(n)
n!
xn
. (1.6.11)
This is the first time we have found it necessary to introduce an extra
factor of 1/n! into the coefficients of a generating function. That kind of
thing happens frequently, however, and we will discuss in chapter 2 how to
recognize when extra factors like these will be useful. A generating function
of the form (1.6.11), with the 1/n!’s thrown into the coefficients, is called
an exponential generating function. We would say, for instance, that ‘B(x)
is the exponential generating function of the Bell numbers.’
When we wish to distinguish the various kinds of generating functions,
we may use the phrase the ordinary power series generating function of
the sequence {an} is
P
n anxn
or the exponential generating function of the
sequence {an} is
P
n anxn
/n!.22 1 Introductory ideas and examples
To find B(x) explicitly, take the formula (1.6.10), which is valid for
n ≥ 1, multiply it by xn
/n! (don’t forget the n!), and sum over all n ≥ 1.
This gives
B(x) − 1 = (
1
e
)
X
n≥1
xn
n!
X
r≥1
rn−1
(r − 1)!
= (
1
e
)
X
r≥1
1
r!
X
n≥1
(rx)n
n!
= (
1
e
)
X
r≥1
1
r!
(erx
− 1)
= (
1
e
){eex
− e}
= eex
−1
− 1.
We have therefore shown
Theorem 1.6.1. The exponential generating function of the Bell numbers
is eex
−1
, i.e., the coefficient of xn
/n! in the power series expansion of eex
−1
is the number of partitions of a set of n elements.
This result is surely an outstanding example of the power of the gen-
erating function approach. The Bell numbers themselves are complicated,
but the generating function is simple and easy to remember.
The next novel element of this story is the fact that we can go from
generating functions to recurrence formulas, although in all our examples
to date the motion has been in the other direction. We propose now to
derive from Theorem 1.6.1 a recurrence formula for the Bell numbers, one
that will make it easy to compute as many of them as we might wish to
look at.
First, the theorem tells us that
X
n≥0
b(n)
n!
xn
= eex
−1
. (1.6.12)
We are going to carry out a very standard operation on this equation, but
the first time this operation appears it seems to be anything but standard.
The x(d/dx)log operation
(1) Take the logarithm of both sides of the equation.
(2) Differentiate both sides and multiply through by x.
(3) Clear the equation of fractions.
(4) For each n, find the coefficients of xn
on both sides of the equation
and equate them.
Although the best motivation for the above program is the fact that
it works, let’s pause for a moment before doing it, to see why it is likely to1.6 Another 2-variable case. 23
work. The point of taking logarithms is to simplify the function eex
−1
,
whose power series coefficients are quite mysterious before taking loga-
rithms, and are quite obvious after doing so. The price for that simpli-
fication is that on the left side we have the log of a sum, which is an
awesome thing to have. The next step, the differentiation, changes the log
of the sum into a ratio of two sums, which is much nicer. The reason for
multiplying through by x is that the differentiation dropped the power of x
by 1 and it’s handy to restore it. After clearing of fractions we will simply
be looking at two sums that are equal to each other, and the work will be
over.
In this case, after step 1 is applied to (1.6.12), we have
log
½X
n≥0
b(n)
n!
xn
¾
= ex
− 1.
Step 2 gives
P
n
nb(n)xn
n!
P
n
b(n)xn
n!
= xex
.
To clear of fractions, multiply both sides by the denominator on the left,
obtaining
X
n
nb(n)xn
n!
= (xex
)
X
n
b(n)xn
n!
.
Finally, we have to identify the coefficients of xn
on both sides of this
equation. On the left it’s easy. On the right we have to multiply two power
series together first, and then identify the coefficient. Since in chapter 2 we
will work out a general and quite easy-to-use rule for doing things like this,
let’s postpone this calculation until then, and merely quote the result here.
It is that the Bell numbers satisfy the recurrence
b(n) =
X
k
µ
n − 1
k
¶
b(k) (n ≥ 1;b(0) = 1). (1.6.13)
We have now seen several examples of how generating functions can
be used to find recurrence relations. It often happens that the method of
generating functions finds a recurrence, and only later are we able to give
a direct, combinatorial interpretation of the recurrence. In some cases, re-
currences are known that look like they ought to have simple combinatorial
explanations, but none have yet been found.24 1 Introductory ideas and examples
Exercises
1. Find the ordinary power series generating functions of each of the follow-
ing sequences, in simple, closed form. In each case the sequence is defined
for all n ≥ 0.
(a) an = n
(b) an = αn + β
(c) an = n2
(d) an = αn2
+ βn + γ
(e) an = P(n), where P is a given polynomial, of degree m.
(f) an = 3n
(g) an = 5 · 7n
− 3 · 4n
2. For each of the sequences given in part 1, find the exponential generating
function of the sequence in simple, closed form.
3. If f(x) is the ordinary power series generating function of the sequence
{an}n≥0, then express simply, in terms of f(x), the ordinary power series
generating functions of the following sequences. In each case the range of
n is 0,1,2,...
(a) {an + c}
(b) {αan + c}
(c) {nan}
(d) {P(n)an}, where P is a given polynomial.
(e) 0,a1,a2,a3,...
(f) 0,0,1,a3,a4,a5,...
(g) a0,0,a2,0,a4,0,a6,0,a8,0,...
(h) a1,a2,a3,...
(i) {an+h} (h a given constant)
(j) {an+2 + 3an+1 + an}
(k) {an+2 − an+1 − an}
4. Let f(x) be the exponential generating function of a sequence {an}. For
each of the sequences in exercise 3, find the exponential generating function
simply, in terms of f(x).Exercises 25
5. Find
(a) [xn
]e2x
(b) [xn
/n!]eαx
(c) [xn
/n!]sinx
(d) [xn
]{1/((1 − ax)(1 − bx))} (a 6= b)
(e) [xn
](1 + x2
)m
6. In each part, a sequence {an}n≥0 satisfies the given recurrence relation.
Find the ordinary power series generating function of the sequence.
(a) an+1 = 3an + 2 (n ≥ 0;a0 = 0)
(b) an+1 = αan + β (n ≥ 0;a0 = 0)
(c) an+2 = 2an+1 − an (n ≥ 0;a0 = 0;a1 = 1)
(d) an+1 = an/3 + 1 (n ≥ 0;a0 = 0)
7. Give a direct combinatorial proof of the recurrence (1.6.13), as follows:
given n; consider the collection of all partitions of the set [n]. There are
b(n) of them. Sort out this collection into piles numbered k = 0,1,...,n−1,
where the kth pile consists of all partitions of [n] in which the class that
contains the letter ‘n’ contains exactly k other letters. Count the partitions
in the kth pile, and you’ll be all finished.
8. In each part of problem 6, find the exponential generating function of
the sequence (you may have to solve a differential equation to do so!).
9. A function f is defined for all n ≥ 1 by the relations (a) f(1) = 1 and
(b) f(2n) = f(n) and (c) f(2n + 1) = f(n) + f(n + 1). Let
F(x) =
X
n≥1
f(n)xn−1
be the generating function of the sequence. Show that
F(x) = (1 + x + x2
)F(x2
),
and therefore that
F(x) =
∞ Y
j≥0
n
1 + x2j
+ x2j+1
o
.
10. Let X be a random variable that takes the values 0,1,2,... with re-
spective probabilities p0,p1,p2,..., where the p’s are given nonnegative real
numbers whose sum is 1. Let P(x) be the opsgf of {pn}.
(a) Express the mean µ and standard deviation σ of X directly in terms
of P(x).26 1 Introductory ideas and examples
(b) Two values of X are sampled independently. What is the probability
p
(2)
n that their sum is n? Express the opsgf P2(x) of {p
(2)
n } in terms
of P(x).
(c) k values of X are sampled independently. Let p
(k)
n be the probability
that their sum is equal to n. Express the opsgf Pk(x) of {p
(k)
n }n≥0
in terms of P(x).
(d) Use the results of parts (a) and (c) to find the mean and standard
deviation of the sum of k independently chosen values of X, in terms
of µ and σ.
(e) Let A(x) be a power series with A(0) = 1, and let B(x) = A(x)k
. It
is desired to compute the coefficients of B(x), without raising A(x)
to any powers at all. Use the ‘xDlog’ method to derive a recurrence
formula that is satisfied by the coefficients of B(x).
(f) A loaded die has probabilities .1, .2, .1, .2, .2, .2 of turning up
with, respectively, 1, 2, 3, 4, 5, or 6 spots showing. The die is then
thrown 100 times, and we want to calculate the probability p∗
that
the total number of spots on all 100 throws is ≤ 300. Identify p∗
as the coefficient of x300
in the power series expansion of a certain
function. Say exactly what the function is (you are not being asked
to calculate p∗
). Use the result of part (e) to say exactly how you
would calculate p∗
if you had to.
(g) A random variable X assumes each of the values 1,2,...,m with
probability 1/m. Let Sn be the result of sampling n values of X
independently and summing them. Show that for n = 1,2,...,
Prob{Sn ≤ j} =
1
mn
X
r
(−1)r
µ
n
r
¶µ
j − mr
n
¶
.
11. Let f(n) be the number of subsets of [n] that contain no two consecu-
tive elements, for integer n. Find the recurrence that is satisfied by these
numbers, and then ‘find’ the numbers themselves.
12. For given integers n,k, let f(n,k) be the number of k-subsets of [n] that
contain no two consecutive elements. Find the recurrence that is satisfied
by these numbers, find a suitable generating function and find the num-
bers themselves. Show the numerical values of f(n,k) in a Pascal triangle
arrangement, for n ≤ 6.
13. By comparing the results of the above two problems, deduce an identity.
Draw a picture of the elements of Pascal’s triangle that are involved in this
identity.
14. Let the integers 1,2,...,n be arranged consecutively around a circle,
and let g(n) be the number of ways of choosing a subset of these, no twoExercises 27
consecutive on the circle. That is, g differs from the f of problem 11 in
that n and 1 are now regarded as consecutive. Find g(n).
15. As in the previous problem, find, analogously to problem 12 above, the
number g(n,k) of ways of choosing k elements from n arranged on a circle,
such that no two chosen elements are adjacent on the circle.
16. Find the coefficient of xn
in the power series for
f(x) =
1
(1 − x2)2
,
first by the method of partial fractions, and second, give a much simpler
derivation by being sneaky.
17. An inversion of a permutation σ of [n] is a pair of letters i,j such that
i < j and σ(i) > σ(j). In the 2-line form of writing the permutation, an
inversion shows up as a pair that is ‘in the wrong order’ in the second line.
The permutation
σ =
µ
1 2 3 4 5 6 7 8 9
4 9 2 5 8 1 6 7 3
¶
of [9] has 19 inversions, namely the pairs (4,2), (4,1), ..., (7,3). Let b(n,k)
be the number of permutations of n letters that have exactly k inversions.
Find a ‘simple’ formula for the generating function Bn(x) =
P
k b(n,k)xk
.
Make a table of values of b(n,k) for n ≤ 5.
18.
(a) Given n, k. For how many of the permutations of n letters is
it true that their first k values decrease?
(b) What is the average length of the decreasing sequence with
which the values of a random n-permutation begin?
(c) If f(n,k) is the number of permutations that have exactly k
ascending runs, find the Pascal-triangle-type recurrence sat-
isfied by f(n,k). They are called the Euler numbers. As an
example, the permutation
µ
1 2 3 4 5 6 7 8 9
4 1 6 9 2 5 8 3 7
¶
has 4 such runs, namely 4, 1 6 9, 2 5 8, and 3 7.
19. Consider the 256 possible sums of the form
²1 + ²2 + 2²3 + 5²4 + 10²5 + 10²6 + 20²7 + 50²8 (1)
where each ² is 0 or 1.28 1 Introductory ideas and examples
(a) For each integer n, let Cn be the number of different sums that
represent n. Write the generating polynomial
C0 + C1x + C2x2
+ C3x3
+ ··· + C99x99
as a product.
(b) Next, consider all of the possible sums that are formed as in (1),
where now the ²’s can have any of the three values −1,0,1. For each
integer n, let Dn be the number of different sums that represent n.
Show that some integer n is representable in at least 33 different
ways. Then write the generating function
99 X
n=−99
Dnxn
as a product.
(c) Generalize the results of parts (a) and (b) of this problem by re-
placing the particular set of weights by a general set. Factor the
polynomial that occurs.
(d) In the general case of part (d) of this problem, state precisely what
all of the zeros of the generating polynomial are, and state precisely
what the multiplicity of each of the zeros is, in terms of the set of
weights.
20. Let f(n,m,k) be the number of strings of n 0’s and 1’s that contain
exactly m 1’s, no k of which are consecutive.
(a) Find a recurrence formula for f. It should have f(n,m,k)
on the left side, and exactly three terms on the right.
(b) Find, in simple closed form, the generating functions
Fk(x,y) =
X
n,m≥0
f(n,m,k)xn
ym
(k = 1,2,...).
(c) Find an explicit formula for f(n,m,k) from the generat-
ing function (this should involve only a single summation,
of an expression that involves a few factorials).
21.
(a) We want to find a formula for the nth derivative of the function
eex
. Differentiate it a few times, study the pattern, and conjecture
the form of the answer for general n, including some constants to
be determined. Then find a recurrence formula for the constants
in question, and identify them as some ‘famous’ numbers that we
have studied.1.6 Another 2-variable case. 29
(b) Next let f(x1,...,xn) be some function of n variables. Find a
formula for the mixed partial derivative
∂n
∂x1∂x2 ···∂xn
ef
that expresses it in terms of various partial derivatives of f itself.30 2 Series
Chapter 2
Series
This chapter is devoted to a study of the different kinds of series that
are widely used as generating functions.
## 2.1 Formal power series
To discuss the formal theory of power series, as opposed to their an-
alytic theory, is to discuss these series as purely algebraic objects, in their
roles as clotheslines, without using any of the function-theoretic properties
of the function that may be represented by the series or, indeed, without
knowing whether such a function exists.
We study formal series because it often happens in the theory of gen-
erating functions that we are trying to solve a recurrence relation, so we
introduce a generating function, and then we go through the various ma-
nipulations that follow, but with a guilty conscience because we aren’t sure
whether the various series that we’re working with will converge. Also, we
might find ourselves working with the derivatives of a generating function,
still without having any idea if the series converges to a function at all.
The point of this section is that there’s no need for the guilt, because
the various manipulations can be carried out in the ring of formal power
series, where questions of convergence are nonexistent. We may execute
the whole method and end up with the generating series, and only then
discover whether it converges and thereby represents a real honest function
or not. If not, we may still get lots of information from the formal series,
but maybe we won’t be able to get analytic information, such as asymptotic
formulas for the sizes of the coefficients. Exact formulas for the sequences
in question, however, might very well still result, even though the method
rests, in those cases, on a purely algebraic, formal foundation.
The series
f = 1 + x + 2x2
+ 6x3
+ 24x4
+ 120x5
+ ··· + n!xn
+ ···, (2.1.1)
for instance, has a perfectly fine existence as a formal power series, despite
the fact that it converges for no value of x other than x = 0, and therefore
offers no possibilities for investigation by analytic methods. Not only that,
but this series plays an important role in some natural counting problems.
A formal power series is an expression of the form
a0 + a1x + a2x2
+ ···
where the sequence {an}∞
0 is called the sequence of coefficients. To say that
two series are equal is to say that their coefficient sequences are the same.2.1 Formal power series 31
We can do certain kinds of operations with formal power series. We
can add or subtract them, for example. This is done according to the rules
X
n
anxn
±
X
n
bnxn
=
X
n
(an ± bn)xn
.
Power series can be multiplied by the usual Cauchy product rule,
X
n
anxn
X
n
bnxn
=
X
n
cnxn
(cn =
X
k
akbn−k). (2.1.2)
It is certainly this product rule that accounts for the wide applicability of
series methods in combinatorial problems. This is because frequently we
can construct all an of the objects of type n in some family by choosing an
object of type k and an object of type n − k and stitching them together
to make the object of type n. The number of ways of doing that will be
akan−k, and if we sum on k we find that the Cauchy product of two formal
series is directly relevant to the problem that we are studying.
If we follow the multiplication rule we obtain, for instance,
(1 − x)(1 + x + x2
+ x3
+ ···) = 1.
Thus we can say that the series (1−x) has a reciprocal, and that reciprocal
is 1 + x + x2
+ ··· (and the other way around, too).
Proposition. A formal power series f =
P
n≥0 anxn
has a reciprocal if
and only if a0 6= 0. In that case the reciprocal is unique.
Proof. Let f have a reciprocal, namely 1/f =
P
n≥0 bnxn
. Then f·(1/f) =
1 and according to (2.1.2), c0 = 1 = a0b0, so a0 6= 0. Further, in this case
(2.1.2) tells us that for n ≥ 1, cn = 0 =
P
k akbn−k, from which we find
bn = (−1/a0)
X
k≥1
akbn−k (n ≥ 1). (2.1.3)
This determines b1,b2,... uniquely, as claimed.
Conversely, suppose a0 6= 0. Then we can determine b0,b1,... from
(2.1.3), and the resulting series
P
n bnxn
is the reciprocal of f.
The collection of formal power series under the rules of arithmetic that
we have just described forms a ring, in which the invertible elements are
the series with nonvanishing constant term.
The above idea of a reciprocal of a formal power series is not to be
confused with the subtler notion of the inverse of such a series. The inverse
of a series f, if it exists, is a series g such that f(g(x)) = g(f(x)) = x.
When can such an inverse exist? First we need to be able to define the
symbol f(g(x)), then we can worry about whether or not it is equal to x.32 2 Series
If f =
P
n anxn
, then f(g(x)) means
f(g(x)) =
X
n
ang(x)n
. (2.1.4)
If the series g(x) has a nonzero constant term, g0, then every term of the
series (2.1.4) may contribute to the coefficient of each power of x. On the
other hand, if g0 = 0, then we will be able to compute the coefficient of,
say, x57
in (2.1.4) from just the first 58 terms of the series shown. Indeed,
notice that every single term
ang(x)n
= an(g1x + g2x2
+ ...)n
= anxn
(g1 + g2x + ...)n
with n > 57 will contain only powers of x higher than the 57th, and there-
fore we won’t need to look at those terms to find the coefficient of x57
.
Thus if g0 = 0 then the computation of each one of the coefficients of
the series f(g(x)) is a finite process, and therefore all of those coefficients
are well defined, and so is the series. If g0 6= 0, though, the computation
of each coefficient of f(g(x)) is an infinite process unless f is a polynomial,
and therefore it will make sense only if the series ‘converge.’ In a formal,
algebraic theory, however, ideas of convergence have no place. Thus the
composition f(g(x)) of two formal power series is defined if and only if
g0 = 0 or f is a polynomial.
For instance, the series eex
−1
is a well defined formal series, whereas the
series eex
is not defined, at least from the general definition of composition
of functions.
To return to the question of finding a series inverse of a given series f,
we see that if such an inverse series g exists, then
f(g(x)) = g(f(x)) = x (2.1.5)
must both make sense and be true. We claim that if f(0) = 0 the inverse
series exists if and only if the coefficient of x is nonzero in the series f.
Proposition. Let the formal power series f, g satisfy (2.1.5) and f(0) = 0.
Then f = f1x + f2x2
+ ··· (f1 6= 0), and g = g1x + g2x2
+ ··· (g1 6= 0).
Proof. Suppose that f = frxr
+··· and g = gsxs
+···, where r,s ≥ 0 and
frgs 6= 0. Then f(g(x)) = x = frgr
sxrs
+···, whence rs = 1, and r = s = 1,
as claimed.
In the ring of formal power series there are other operations defined,
which mirror the corresponding operations of function calculus, but which
make no use of limiting operations.
The derivative of the formal power series f =
P
n anxn
is the series
f0
=
P
n nanxn−1
. Differentiation follows the usual rules of calculus, such
as the sum, product, and quotient rules. Many of these properties are even
easier to prove for formal series than they are for the functions of calculus.
For example:2.2 The calculus of formal ordinary power series generating functions 33
Proposition. If f0
= 0 then f = a0 is constant.
Proof. Take another look at the ‘=’ sign in the hypothesis f0
= 0. It means
that the formal power series f0
is identical to the formal power series 0, and
that means that each and every coefficient of the formal series f0
is 0. But
the coefficients of f0
are a1,2a2,3a3,..., so each of these is 0, and therefore
aj = 0 for all j ≥ 1, which is to say that f is constant.
Next, try this one:
Proposition. If f0
= f then f = cex
.
Proof. Since f0
= f, the coefficient of xn
must be the same in f as
in f0
, for all n ≥ 0. Hence (n + 1)an+1 = an for all n ≥ 0, whence
an+1 = an/(n + 1) (n ≥ 0). By induction on n, an = a0/n! for all n ≥ 0,
and so f = a0ex
.
## 2.2 The calculus of formal ordinary power series generating func-
tions
Operations on formal series involve corresponding operations on their
coefficients. If the series actually converge and represent functions, then
operations on those functions correspond to certain operations on the power
series coefficients of the expansions of those functions. In this section we
will explore some of these relationships. They are of great importance in
helping to spot which kind of generating function is appropriate for which
kind of recurrence relation or other combinatorial situation.
Definition. The symbol f ops
← → {an}∞
0 means that the series f is the ordi-
nary power series (‘ops’) generating function for the sequence {an}∞
0 . That
is, it means that f =
P
n anxn
.
Suppose f ops
← → {an}∞
0 . Then what generates {an+1}∞
0 ? To answer
that we do a little calculation:
X
n≥0
an+1xn
=
1
x
X
m≥1
amxm
=
(f(x) − f(0))
x
.
Therefore
f ops
← → {an}∞
0 ⇒ ((f − a0)/x) ops
← → {an+1}∞
0 . (2.2.1)
Thus a shift of the subscript by 1 unit changes the series represented
to the difference quotient (f − a0)/x. If we shift by 2 units, of course, we
just iterate the difference quotient operation, and find that
{an+2}∞
0
ops
← →
((f − a0)/x) − a1
x
=
f − a0 − a1x
x2
.34 2 Series
Note how this point of view allows us to see ‘at a glance’ that the
Fibonacci recurrence relation Fn+2 = Fn+1 + Fn (n ≥ 0;F0 = 0;F1 =
1) translates directly into the ordinary power series generating function
relation
f − x
x2
=
f
x
+ f.
Indeed, the purpose of this section is to develop this facility for passing
from sequence relations to series relations quickly and conveniently.
Rule 1. If f ops
← → {an}∞
0 , then, for integer h > 0,
{an+h}∞
0
ops
← →
f − a0 − ··· − ah−1xh−1
xh
.
Next let’s look into the effect of multiplying the sequence by powers of
n. Again, suppose that f ops
← → {an}∞
0 . Then what generates the sequence
{nan}∞
0 ? The question means this: can we express the series
P
n nanxn
in some simple way in terms of the series f =
P
n anxn
? The answer is
easy, because the former series is exactly xf0
. Therefore, to multiply the
nth member of a sequence by n causes its ops generating function to be
‘multiplied’ by x(d/dx), which we will write as xD. In symbols:
f ops
← → {an}∞
0 ⇒ (xDf) ops
← → {nan}∞
0 . (2.2.2)
As an example, consider the recurrence
(n + 1)an+1 = 3an + 1 (n ≥ 0;a0 = 1).
If f is the opsgf of the sequence {an}∞
0 , then from Rule 1 and (2.2.2),
f0
= 3f +
1
1 − x
,
which is a first order differential equation in the unknown generating func-
tion, and it can be solved by standard methods.
Next suppose f ops
← → {an}∞
0 . Then what generates the sequence
{n2
an}∞
0 ?
Obviously we re-apply the multiply-by-n operator xD, so the answer is
(xD)2
f. In general,
(xD)k
f ops
← → {nk
an}n≥0.
OK, what generates {(3 − 7n2
)an}n≥0? Again obviously, we do the
same thing to xD that is done to n, i.e., (3−7(xD)2
)f is the answer. The
general prescription is:2.2 The calculus of formal ordinary power series generating functions 35
Rule 2. If f ops
← → {an}∞
0 , and P is a polynomial, then
P(xD)f ops
← → {P(n)an}n≥0.
Example 1.
Find a closed formula for the sum of the series
P
n≥0(n2
+4n+5)/n!.
According to the rule, the answer is the value at x = 1 of the series
{(xD)2
+ 4(xD) + 5}ex
= {x2
+ x}ex
+ 4xex
+ 5ex
= (x2
+ 5x + 5)ex
.
Therefore the answer to the question is 11e.
But we cheated. Did you catch the illegal move? We took our gen-
erating function and evaluated it at x = 1, didn’t we? Such an operation
doesn’t exist in the ring of formal series. There, series don’t have ‘values’
at particular values of x. The letter x is purely a formal symbol whose
powers mark the clothespins on the line.
What can be evaluated at a particular numerical value of x is a power
series that converges at that x, which is an analytic idea rather than a formal
one. The way we make peace with our consciences in such situations, which
occur frequently, is this: if, after writing out the recurrence relation and
solving it by means of a formal power series generating function, we find
that the series so obtained converges to an analytic function inside a certain
disk in the complex plane, then the whole derivation that we did formally
is actually valid analytically for all complex x in that disk. Therefore we
can shift gears and regard the series as a convergent analytic creature if it
pleases us to do so.
Example 2.
Find a closed formula for the sum of the squares of the first N positive
integers.
To do that, begin with the fact that
N X
n=0
xn
=
xN+1
− 1
x − 1
,
and notice that if we apply (xD)2
to both sides of this relation and then
set x = 1, the left side will be the sum of squares that we seek, and the
right side will be the answer! Hence
N X
n=1
n2
= (xD)2
½
xN+1
− 1
x − 1
¾¯
¯
¯
¯
x=1
.36 2 Series
After doing the two differentiations and lots of algebra, the answer emerges
as
N X
n=1
n2
=
N(N + 1)(2N + 1)
6
(N = 1,2,...),
which you no doubt knew already. Do notice, however, that the generating
function machine is capable of doing, quite mechanically, many formidable-
looking problems involving sums.
Our third rule will be a restatement of the way that two opsgf’s are
multiplied.
Rule 3. If f ops
← → {an}∞
0 and g ops
← → {bn}∞
0 , then
fg ops
← →
½ n X
r=0
arbn−r
¾∞
n=0
. (2.2.3)
Now consider the product of more than two series. For instance, in the
case of three series, if f,g,h are the series, and if they generate sequences
a, b and c, respectively, then a brief computation shows that fgh generates
the sequence ½ X
r+s+t=n
arbsct
¾∞
n=0
. (2.2.4)
A comparison with Rule 3 above will suggest the general formulas that
apply to products of any number of power series. One case of this is worth
writing down, namely the expressions for the kth power of a series.
Rule 4. Let f ops
← → {an}∞
0 , and let k be a positive integer. Then
fk ops
← →
(
X
n1+n2+···+nk=n
an1
an2
···ank
)∞
n=0
. (2.2.5)
Example 3.
Let f(n,k) denote the number of ways that the nonnegative integer n
can be written as an ordered sum of k nonnegative integers. Find f(n,k).
For instance, f(4,2) = 5 because 4=4+0=3+1=2+2=1+3=0+4.
To find f, consider the power series 1/(1−x)k
. Since 1/(1−x) ops
← → {1},
by (2.2.5) we have
1/(1 − x)k ops
← → {f(n,k)}∞
n=0.
By (1.5.5), f(n,k) =
¡n+k−1
n
¢
, and we are finished.
Next consider the effect of multiplying a power series by 1/(1 − x).
Suppose f ops
← → {an}∞
0 . Then what sequence does f(x)/(1 − x) generate?2.2 The calculus of formal ordinary power series generating functions 37
To find out, we have
f(x)
(1 − x)
= (a0 + a1x + a2x2
+ ···)(1 + x + x2
+ ···)
= a0 + (a0 + a1)x + (a0 + a1 + a2)x2
+ (a0 + a1 + a2 + a3)x3
+ ···
which clearly leads us to:
Rule 5. If f ops
← → {an}∞
0 then
f
(1 − x)
ops
← →
½ n X
j=0
aj
¾
n≥0
.
That is, the effect of dividing an opsgf by (1−x) is to replace the sequence
that is generated by the sequence of its partial sums.
Example 4.
Here is another derivation of the formula for the sum of the squares of
the first n whole numbers. Since 1/(1−x) ops
← → {1}n≥0, we have by Rule 2,
(xD)2
(1/(1 − x)) ops
← → {n2
}n≥0, and by Rule 5,
1
1 − x
(xD)2 1
1 − x
ops
← →
½ n X
j=0
j2
¾
n≥0
.
That is, the sum of the squares of the first n positive integers is the coeffi-
cient of xn
in the series
1
1 − x
(xD)2 1
1 − x
=
x(1 + x)
(1 − x)4
.
However, by (1.5.5) with m = 3,
[xn
]
µ
1
(1 − x)4
¶
=
µ
n + 3
3
¶
.
Hence, by (1.2.7),
[xn
]
x(1 + x)
(1 − x)4
=
µ
n + 2
3
¶
+
µ
n + 1
3
¶
=
n(n + 1)(2n + 1)
6
,
so this must be the sum of the squares of the first n positive integers.38 2 Series
Example 5.
The harmonic numbers {Hn}∞
1 are defined by
Hn = 1 +
1
2
+
1
3
+ ··· +
1
n
(n ≥ 1).
How can we find their ops generating function? By Rule 5, that function
is 1/(1 − x) times the opsgf of the sequence {1/n}∞
1 of reciprocals of the
positive integers. So what is f =
P
n≥1 xn
/n? Well, its derivative is 1/(1−
x), so it must be −log(1 − x). That means that the opsgf of the harmonic
numbers is ∞ X
n=1
Hnxn
=
1
1 − x
log
µ
1
1 − x
¶
.
Example 6.
Prove that the Fibonacci numbers satisfy
F0 + F1 + F2 + ··· + Fn = Fn+2 − 1 (n ≥ 0).
By Rule 5, the opsgf of the sequence on the left side is F/(1−x), where F
is the opsgf of the Fibonacci numbers, which we found in section 1.3 to be
x/(1−x−x2
). By Rule 1, the opsgf of the sequence on the right hand side
is
F − x
x2
−
1
1 − x
,
and it is the work of just a moment to check that these are equal.
Example 7.
By a fountain of coins we mean an arrangement of n coins in rows such
that the coins in the first row form a single contiguous block, and that in
all higher rows each coin touches exactly two coins from the row beneath
it. If the first row contains k coins, we will speak of an (n,k)-fountain. In
Fig. 2.1 we show a (28,12) fountain.
Among all possible fountains we distinguish a special type: those in
which every row consists of just a single contiguous block of coins. Let’s
call these block fountains.
Fig. 2.1: A (28,12) fountain2.3 The calculus of formal exponential generating functions 39
The question here is this: how many block fountains have a first row
that consists of exactly k coins?
Let f(k) be that number, for k = 0,1,2,... If we strip off the first row
from such a block fountain, then we are looking at another block fountain
that has k fewer coins in it. Conversely, if we wish to form all possible block
fountains whose first row has k coins, then begin by laying down that row.
Then choose a number j, 0 ≤ j ≤ k − 1. Above the row of k coins we will
place a block fountain whose first row has j coins. If j = 0 there is just
one way to do that. Otherwise there are k − j ways to do it, depending on
how far in we indent the row of j over the row of k coins. It follows that
f(0) = 1 and
f(k) =
k X
j=1
(k − j)f(j) + 1 (k = 1,2,...). (2.2.6)
Define the opsgf F(x) =
P
j≥0 f(j)xj
. The appearance, under the
summation sign in (2.2.6), of a function of k−j times a function of j should
trigger a reflex reaction that Rule 3, above, applies, and that the product
of two ordinary power series generating functions is involved. The two
series in question are the opsgf’s of the integers {j}∞
1 and of the unknowns
{f(j)}∞
1 , respectively.
However the former opsgf is x/(1 − x)2
, and the latter is F(x) − 1.
Hence, after multiplying equation (2.2.6) by xk
and summing over k ≥ 1
we obtain
F(x) − 1 =
x
(1 − x)2
(F(x) − 1) +
x
1 − x
,
and therefore
F(x) =
1 − 2x
1 − 3x + x2
. (2.2.7)
The sequence {f(k)}∞
0 begins with 1, 1, 2, 5, 13, 34, 89,... If these num-
bers look suspiciously like Fibonacci numbers, then see exercise 19.
## 2.3 The calculus of formal exponential generating functions
In this section we will investigate the analogues of the rules in the
preceding section, which applied to ordinary power series, in the case of
exponential generating functions.
Definition. The symbol f egf
← → {an}∞
0 means that the series f is the ex-
ponential generating function of the sequence {an}∞
0 , i.e., that
f =
X
n≥0
an
n!
xn
.40 2 Series
Let’s ask the same questions as in the previous section. Suppose
f egf
← → {an}∞
0 . Then what is the egf of the sequence {an+1}∞
0 ? We claim
that the answer is f0
, because
f0
=
∞ X
n=1
nanxn−1
n!
=
∞ X
n=1
anxn−1
(n − 1)!
=
∞ X
n=0
an+1xn
n!
which is exactly equivalent to the assertion that f0 egf
← → {an+1}∞
0 .
Hence the situation with exponential generating functions is just a trifle
simpler, in this respect, than the corresponding situation for ordinary power
series. Displacement of the subscript by 1 unit in a sequence is equivalent
to action of the operator D on the generating function, as opposed to the
operator (f(x) − f(0))/x, in the case of opsgf’s. Therefore we have, by
induction:
Rule 10
. If f egf
← → {an}∞
0 then, for integer h ≥ 0,
{an+h}∞
0
egf
← → Dh
f. (2.3.1)
The reader is invited to compare this Rule 10
with Rule 1, stated above.
Example 1.
To get a hint of the strength of this point of view in problem solving,
let’s find the egf of the Fibonacci numbers. Now, with just a glance at the
recurrence
Fn+2 = Fn+1 + Fn (n ≥ 0)
we see from Rule 10
that the egf satisfies the differential equation
f00
= f0
+ f.
At the corresponding stage in the solution for the ops version of this prob-
lem, we had an equation to solve for f that did not involve any derivatives.
We solved it and then had to deal with a partial fraction expansion in or-
der to find an exact formula for the Fibonacci numbers. In this version, we
solve the differential equation, getting
f(x) = c1er+x
+ c2er−x
(r± = (1 ±
√
5)/2)
where c1 and c2 are to be determined by the initial conditions (which
haven’t been used yet!) f(0) = 0; f0
(0) = 1. After applying these two2.3 The calculus of formal exponential generating functions 41
conditions, we find that c1 = 1/
√
5 and c2 = −1/
√
5, from which the egf of
the Fibonacci sequence is
f = (er+x
− er−x
)/
√
5. (2.3.2)
Now it’s easier to get the exact formula, because no partial fraction expan-
sion is necessary. Just apply the operator [xn
/n!] to both sides of (2.3.2)
and the formula (1.3.3) materializes.
To compare, then, the ops method in this case involves an easier func-
tional equation to solve for the generating function: it’s algebraic instead
of differential. The egf method involves an easier trip from there to the
exact formula, because the partial fraction expansion is unnecessary. Both
methods work, which is, after all, the primary desideratum.
To continue, we discuss next the analogue of Rule 2 for egf’s, and that
one is easy: it’s the same. That is, multiplication of the members of a
sequence by a polynomial in n is equivalent to acting on the egf with the
same polynomial in the operator xD, and we have:
Rule 20
. If f egf
← → {an}∞
0 , and P is a given polynomial, then
P(xD)f egf
← → {P(n)an}n≥0.
Next let’s think about the analogue of Rule 3, i.e., about what happens
to sequences when their egf’s are multiplied together. Precisely, suppose
f egf
← → {an}∞
0 and g egf
← → {bn}∞
0 . The question is, of what sequence is fg the
egf?
This turns out to have a pretty, and uncommonly useful, answer. To
find it, we carry out the multiplication fg and try to identify the coefficient
of xn
/n!. We obtain
fg =
½ ∞ X
r=0
arxr
r!
¾½ ∞ X
s=0
bsxs
s!
¾
=
X
r,s≥0
arbs
r!s!
xr+s
=
X
n≥0
xn
½ X
r+s=n
arbs
r!s!
¾
.
The coefficient of xn
/n! is evidently
·
xn
n!
¸
(fg) =
X
r+s=n
n!arbs
r!s!
=
X
r
µ
n
r
¶
arbn−r.
We state this result as:42 2 Series
Rule 30
. If f egf
← → {an}∞
0 and g egf
← → {bn}∞
0 , then fg generates the sequence
(
X
r
µ
n
r
¶
arbn−r
)∞
n=0
. (2.3.3)
This rule should be contrasted with Rule 3, the corresponding rule for
multiplication of opsgf’s, the result of which is to generate the sequence
(
X
r
arbn−r
)∞
n=0
. (2.3.4)
We remarked earlier that the convolution of sequences that is shown in
(2.3.4) is useful in counting problems where structures of size n are ob-
tained by stitching together structures of sizes r and n − r in all possible
ways. Correspondingly, the convolution (2.3.3) is useful in combinatorial
situations where we not only stitch together two such structures, but we
also relabel the structures. For then, roughly speaking, there are
¡n
r
¢
ways
to choose the new labels of the elements of the structure of size r, as well
as ar ways to choose that structure and bn−r ways to choose the other one.
Since this no doubt all seems to be very abstract, let’s try to make it
concrete with a few examples.
Example 2.
In (1.6.13) we found the recurrence formula for the Bell numbers, which
we may write in the form
b(n + 1) =
X
k
µ
n
k
¶
b(k) (n ≥ 0;b(0) = 1). (2.3.5)
We will now apply the methods of this section to find the egf of the Bell
numbers. This will give an independent proof of Theorem 1.6.1, since (2.3.5)
can be derived directly, as described in exercise 7 of chapter 1.
Let B be the required egf. The egf of the left side of (2.3.5) is, by Rule
10
, B0
. If we compare the right side of (2.3.5) with (2.3.3) we see that the
egf of the sequence on the right of (2.3.5) is the product of B and the egf of
the sequence whose entries are all 1’s. This latter egf is evidently ex
, and
so we have
B0
= ex
B
as the equation that we must solve in order to find the unknown egf. But
obviously the solution is B = cexp(ex
), and since B(0) = 1, we must
have c = e−1
, from which B(x) = exp(ex
− 1), completing the re-proof of
Theorem 1.6.1.2.3 The calculus of formal exponential generating functions 43
Example 3.
In order to highlight the strengths of ordinary vs. exponential gen-
erating functions, let’s do a problem where the form of the convolution of
sequences that occurs suggests the ops form of generating function. We will
count the ways of arranging n pairs of parentheses, each pair consisting of a
left and a right parenthesis, into a legal string. A legal string of parentheses
is one with the property that, as we scan the string from left to right we
never will have seen more right parentheses than left.
There are exactly 5 legal strings of 3 pairs of parentheses, namely:
((())); (()()); (())(); ()()(); ()(()). (2.3.6)
Let f(n) be the number of legal strings of n pairs of parentheses (f(0) = 1),
for n ≥ 0.
With each legal string we associate a unique nonnegative integer k, as
follows: as we scan the string from left to right, certainly after we have
seen all n pairs of parentheses, the number of lefts will equal the number of
rights. However, these two numbers may be equal even earlier than that.
In the last string in (2.3.6), for instance, after just k = 1 pairs have been
scanned, we find that all parentheses that have been opened have also been
closed. In general, for any legal string, the integer k that we associate with
it is the smallest positive integer such that the first 2k characters of the
string do themselves form a legal string. The values of k that are associated
with each of the strings in (2.3.6) are 3, 3, 2, 1, 1. We will say that a legal
string of 2n parentheses is primitive if it has k = n. The first two strings
in (2.3.6) are primitive.
How many legal strings of 2n parentheses will have a given value of k?
Let w be such a string. The first 2k characters of w are a primitive string,
and the last 2n − 2k characters of w are an arbitrary legal string. There
are exactly f(n−k) ways to choose the last 2n−2k characters, but in how
many ways can we choose the first 2k? That is, how many primitive strings
of length 2k are there?
Lemma 2.3.1. If k ≥ 1 and g(k) is the number of primitive legal strings,
and f(k) is the number of all legal strings of 2k parentheses, then
g(k) = f(k − 1).
Proof. Given any legal string of k−1 pairs of parentheses, make a primitive
one of length 2k by adding an initial left parenthesis and a terminal right
parenthesis to it. Conversely, given a primitive string of length 2k, if its
initial left and terminal right parentheses are deleted, what remains is an
arbitrary legal string of length 2k − 2. Hence there are as many primitive
strings of length 2k as there are all legal strings of length 2k −2, i.e., there
are f(k − 1) of them.44 2 Series
Hence the number of legal strings of length 2n that have a given value
of k is f(k −1)f(n−k). Since every legal string has a unique value of k, it
must be that
f(n) =
X
k
f(k − 1)f(n − k) (n 6= 0;f(0) = 1) (2.3.7)
with the convention that f = 0 at all negative arguments.
The recurrence easily allows us to compute the values 1,1,2,5,14,...
Now let’s find a generating function for these numbers. The clue as to
which kind of generating function is appropriate comes from the form of
the recurrence (2.3.7). The sum on the right is obviously related to the
coefficients of the product of two ordinary power series generating functions,
so that is the species that we will use.
Let F =
P
k f(k)xk
be the opsgf of {f(n)}n≥0. Then the right side of
(2.3.7) is almost the coefficient of xn
in the series F2
. What is it exactly?
It is the coefficient of xn
in the product of the series F and the series P
k f(k − 1)xk
. How is this latter series related to F? It is just xF.
Therefore, if we multiply the right side of (2.3.7) by xn
and sum over n 6= 0,
we get xF2
. If we multiply the left side by xn
and sum over n 6= 0, we get
F − 1. Therefore our unknown generating function satisfies the equation
F(x) − 1 = xF(x)2
. (2.3.8)
Here we have a new wrinkle. We are accustomed to going from recur-
rence relations on a sequence to functional equations that have to be solved
for generating functions. In previous examples, those functional equations
have either been simple linear equations or differential equations. In (2.3.8)
we have a generating function that satisfies a quadratic equation. When
we solve it, we get
F(x) =
1 ±
√
1 − 4x
2x
.
Which sign do we want? If we choose the ‘+’ then the numerator
will approach 2 as x → 0, so the ratio will become infinite at 0. But our
generating function takes the value 1 at 0, so that can’t be right. If we
choose the ‘−’ sign, then a dose of L’Hospital’s rule shows that we will
indeed have F(0) = 1. Hence our generating function is
F(x) =
1 −
√
1 − 4x
2x
. (2.3.9)
This is surely one of the most celebrated generating functions in com-
binatorics. The numbers f(n) are the Catalan numbers, and in (2.5.10)
there is an explicit formula for them. For the moment, we declare that
this exercise, which was intended to show how the form of a recurrence can
guide the choice of generating function, is over.2.3 The calculus of formal exponential generating functions 45
Example 4.
By a derangement of n letters we mean a permutation of them that has
no fixed points. Let Dn denote the number of derangements of n letters,
and let D(x) egf
← → {Dn}∞
0 . We will find a recurrence for the sequence, then
D(x), then an explicit formula for the members of the sequence.
The number of permutations of n letters that have a particular set of
k ≤ n letters as their set of fixed points is clearly Dn−k. There are
¡n
k
¢
ways to choose the set of k fixed points, and so there are exactly
¡n
k
¢
Dn−k
permutations of n letters that have exactly k fixed points. Since every
permutation has some set of fixed points, it must be that
n! =
X
k
µ
n
k
¶
Dn−k (n ≥ 0).
If we take the egf of both sides we get, by Rule 30
,
1
1 − x
= ex
D(x)
(see how easy that was?), from which D(x) = e−x
/(1 − x). Next, by Rule
5, if we take [xn
] on both sides, we find that
Dn
n!
= 1 − 1 +
1
2!
−
1
3!
+ ··· + (−1)n 1
n!
,
and we are finished.
Just as in the case of ordinary power series generating functions, pleas-
ant and useful things happen when we consider products of more than two
exponential generating functions. For instance, if we multiply three of them,
f, g, and h, which generate a, b, and c, respectively, then we find that
fgh egf
← →
(
X
r+s+t=n
n!
r!s!t!
arbsct
)∞
n=0
, (2.3.10)
and therefore such operations can be expected to be helpful in dealing with
sums that involve multinomial coefficients.
If f egf
← → {an}∞
0 then
fk egf
← →
(
X
r1+···+rk=n
n!
r1!r2!···rk!
ar1
ar2
···ark
)∞
n=0
. (2.3.11)46 2 Series
## 2.4 Power series, analytic theory
The formal theory of power series shows us that we can manipulate
recurrences and solve functional equations, such as differential equations,
for power series without necessarily worrying about whether the resulting
series converge. If they do converge though, and they represent functions,
that’s a big advantage, for then we may be in a position to find analytic
information about the recurrence relation that might not otherwise be easily
obtainable.
In this section we will review the basic analytic properties of power
series and their coefficient sequences.
First, suppose we are given a power series
f =
X
n≥0
anzn
,
where we now use the letter z to encourage thinking about complex vari-
ables. Question: for exactly what set of complex values of z does the series
f converge? We want to give a fairly complete answer to this question, and
express it in terms of the coefficient sequence {an}∞
0 .
Theorem 2.4.1. There exists a number R, 0 ≤ R ≤ +∞, called the radius
of convergence of the series f, such that the series converges for all values
of z with |z| < R and diverges for all z such that |z| > R. The number R
is expressed in terms of the sequence {an}∞
0 of coefficients of the series by
means of
R =
1
limsupn→∞ |an|1/n
(1/0 = ∞;1/∞ = 0). (2.4.1)
Before proving the theorem, we recall the definition of the limit superior
of a sequence. Let {xn}∞
0 be a sequence of real numbers, and let L be a
real number (possibly = ±∞).
Definition. We say that L is the limit superior (‘upper limit’) of the
sequence {xn} if
(a) L is finite and
(i) for every ² > 0 all but finitely many members of the
sequence satisfy xn < L + ², and
(ii) for every ² > 0, infinitely many members of the sequence
satisfy xn > L − ², or
(b) L = +∞ and for every M > 0, there is an n such that xn > M,
or
(c) L = −∞ and for every x, there are only finitely many n such that
xn > x.
If L is the limit superior of the sequence {xn}∞
0 , then we write L =
limsupn→∞{xn}, or perhaps just L = limsup{xn}, if the context is clear
enough.2.4 Power series, analytic theory 47
The limit superior has the following properties:
• Every sequence of real numbers has one and only one limit superior
in the extended real number system (i.e., including ±∞).
• If a sequence has a limit L, then L is also the limit superior of the
sequence.
• If S is the set of cluster points of the sequence {xn}∞
0 , then
limsup{xn} is the least upper bound of the numbers in S.
Proof of theorem 2.4.1. Let R be the number shown in (2.4.1), and
suppose first that 0 < R < ∞. Choose z such that |z| < R. We will show
that the series converges at z.
For the given z, we can find ² > 0 such that
|z| <
R
1 + ²R
.
Now, by the definition of the limsup, there exists N such that for all n > N
we have
|an|1/n
<
1
R
+ ².
Hence, for these same n,
|an||z|n
<
½
|z|(
1
R
+ ²)
¾n
.
Let α denote the number in the curly brace. Then by our choice
of ², we have α < 1. Hence the series
P
anzn
converges absolutely, by
comparison with the terms of a convergent geometric series. Therefore our
series converges absolutely at z, and hence it does so for all |z| < R.
Next we claim the series diverges if |z| > R. Indeed, we will show
that for such z, the sequence of terms of the series does not approach zero.
Since |z| > R, we can choose ² > 0 such that if θ = |(z/R) − ²z|, then
θ > 1. By definition of the limsup, for infinitely many values of n we have
|an|1/n
> (1/R) − ². Hence, for those values of n,
|anzn
| >
¯
¯
¯
¯
µ
1
R
− ²
¶
z
¯
¯
¯
¯
n
= θn
which increases without bound since θ > 1. Hence, that subsequence of
terms of the power series does not approach zero and the series diverges.
This completes the proof of the theorem in the case that 0 < R < ∞. The
cases where R = 0 or R = +∞ are similar, and are left to the reader.
Theorem 2.4.2. Suppose the power series
P
anzn
converges for all z in
|z| < R, and let f(z) denote its sum. Then f(z) is an analytic function in48 2 Series
|z| < R. If furthermore the series diverges for |z| > R, then the function
f(z) must have at least one singularity on the circle of convergence |z| = R.
In other words: a power series keeps on converging until something
stops it, namely a singularity of the function that is being represented.
Proof. If f has no singularity on its circle of convergence |z| = R, then
about each point of that circle we can draw an open disk in which f remains
analytic. By the Heine-Borel theorem, a finite number of these disks cover
the circle |z| = R, and therefore f must remain analytic in some larger disk
|z| < R+². By Cauchy’s inequality, the Taylor coefficients of the series for
f satisfy |an| ≤ M/(R+²)n
, for all n, and so the series must converge in a
larger disk, a contradiction.
Example 1.
The series
P
zn
converges if |z| < 1 and diverges if |z| > 1. Hence the
function that is represented must have a singularity somewhere on the circle
|z| = 1. That function is 1/(1 − z), and sure enough it has a singularity at
z = 1.
Example 2.
Take the function f(z) = 1/(2 − ez
). Suppose we expand f(z) in a
power series about z = 0. What will be the radius of convergence of the
series?
According to the theorem, the series will converge in the largest disk
|z| < R in which f is analytic. The function fails to be analytic only at
the points z where ez
= 2. Those points are of the form z = log2 + 2kπi,
for integer k, and the nearest one to the origin is log2. Therefore f(z) is
analytic in the disk |z| < log2 and in no larger disk. Hence the radius of
convergence of the series will be R = log2.
Remember that, if f(z) is given, the best way to find the radius of
convergence of its power series expansion about the origin may well be to
look for its singularity that is nearest to the origin.
Example 3.
Take the function f(z) = z/(ez
−1) (f(0) = 1). Estimate the size of the
coefficients of its power series about the origin directly from the analyticity
properties of the function.
This is where things start getting more interesting. This f(z) is ana-
lytic except possibly at points z where ez
= 1, i.e., except possibly at the
points z = 2kπi for integer k. The nearest of these to the origin is the origin
itself (k = 0). However, f is not singular at z = 0 because even though the
denominator of f is 0 there, the numerator is also, and L’Hospital’s rule, or
whatever, reveals that the value f(0) = 1 removes the singularity. Hence
the singularity of this function that is nearest to the origin is at z = 2πi.2.4 Power series, analytic theory 49
The power series
z
ez − 1
=
∞ X
n=0
anzn
therefore has radius of convergence R = 2π.
The problem asks for estimates of the sizes of the coefficients {an}∞
0 .
But since the radius of convergence is 2π, we have, from theorem 2.4.1,
limsup|an|1/n
=
1
2π
.
It follows that, first of all, for all sufficiently large values of n we have
|an|1/n
<
1
2π
+ ²,
and for infinitely many values of n we have
|an|1/n
>
1
2π
− ².
Therefore, what we find out about the coefficients is that for each ² > 0,
there exists N such that
|an| <
µ
1
2π
+ ²
¶n
(n > N)
and further, for infinitely many values of n,
|an| >
µ
1
2π
− ²
¶n
.
Therefore the coefficients of this series decrease to zero exponentially fast,
at roughly the rate of 1/(2π)n
, for large n. This is quite a lot to have
found out about the sizes of the coefficients without having calculated any
of them!
We state, for future reference, a general proposition that summarizes
what we learned in this example.
Theorem 2.4.3. Let f(z) =
P
anzn
be analytic in some region containing
the origin, let a singularity of f(z) of smallest modulus be at a point z0 6= 0,
and let ² > 0 be given. Then there exists N such that for all n > N we
have
|an| <
µ
1
|z0|
+ ²
¶n
.
Further, for infinitely many n we have
|an| >
µ
1
|z0|
− ²
¶n
.50 2 Series
In chapter 5 we will learn how to make much more precise estimates of
the sizes of the coefficients of power series based on the analyticity, or lack
thereof, of the function that is represented by the series. For instance, the
method of Darboux (Theorem 5.3.1) is a powerful technique for asymptotic
analysis of coefficient sequences of generating functions. The existence of
such methods is an excellent reason why we should be knowledgeable about
the analytic, as well as the formal, side of the subject of generating func-
tions.
Another path to the asymptotic analysis of coefficient sequences flows
from Cauchy’s formula
an =
1
2πi
Z
f(z)dz
zn+1
(n = 0,1,2,...) (2.4.2)
that expresses the nth coefficient of the Taylor’s series expansion f(z) = P
anzn
as a contour integral involving the function f. The contour can
be any simple, closed curve that encloses the origin and that lies entirely
inside a region in which f is analytic.
One has immediately, from (2.4.2), Cauchy’s inequality, which states
that
|an| ≤
M(r)
rn
,
and which holds for all n ≥ 0 and all 0 < r < R, where R is the radius of
convergence of the series, and
M(r) = max
|z|≤r
|f(z)| = max
|z|=r
|f(z)|. (2.4.3)
Just as the analysis of Example 3 above is refined by the method of Dar-
boux to a much more precise method of estimating the growth of coefficient
sequences, so is Cauchy’s inequality refined by the method of Hayman (The-
orem 5.4.1) to another very precise tool for the same purpose.
If a power series actually converges to a function, then we can use roots
of unity to pick out a progression of terms from a series. For instance, how
can we select just the even powers out of a power series? If the series
represents a function f, then, as is well known, (f(x) + f(−x))/2 has just
the terms that involve even powers of x from the series for f(x), and (f(x)−
f(−x))/2 has just the odd ones.
But suppose, instead of wanting to keep every second term of the series,
we want to keep only every third term? For instance, what function do we
get if we take the exponential series and keep just the terms where the
powers of x are multiples of 3? In other words, who is
g(x) =
X
n≥0
x3n
(3n)!
? (2.4.4)2.4 Power series, analytic theory 51
Well, what makes the (f(x) + f(−x))/2 thing work is that the two
square roots of unity, namely ±1, have the property that
1n
+ (−1)n
2
=
½
1, if n is even;
0, if n is odd.
Now here is a correspondingly helpful property of the three cube roots
of unity 1, ω1, ω2:
(1n
+ ωn
1 + ωn
2 )
3
=
½
1, if 3\n;
0, else.
(2.4.5)
Since that is the case, we have, for any convergent power series f = P
r arxr
,
f(x) + f(ω1x) + f(ω2x)
3
=
X
r
a3rx3r
. (2.4.6)
Since ω1 = e(2πi)/3
and ω2 = e(4πi)/3
, we can unmask the mystery
function g(x) in (2.4.4) as
g(x) =
1
3
(ex
+ eω1x
+ eω2x
)
=
1
3
Ã
ex
+ 2e−x/2
cos(
√
3x
2
)
!
.
(2.4.7)
Example 4.
For fixed n, find
λn =
X
k
(−1)k
µ
n
3k
¶
.
We could do this one if we knew the function
f(x) =
X
k
µ
n
3k
¶
x3k
,
because λn = f(−1). But f(x) picks out every third term from the series
F(x) = (1 + x)n
, and so
f(x) = (F(x) + F(ω1x) + F(ω2x))/3
= {(1 + x)n
+ (1 + ω1x)n
+ (1 + ω2x)n
}/3.
Thus the numbers that we are asked to find are, for n > 0,
λn = f(−1) = {(1 − ω1)n
+ (1 − ω2)n
}/3
=
1
3
(Ã
3 −
√
3i
2
!n
+
Ã
3 +
√
3i
2
!n)
= 2 · 3(n/2−1)
cos(
nπ
6
).
(2.4.8)52 2 Series
The first few values of the {λn}n≥0 are 1, 1, 1, 0, −3, −9, −18, ....
To complete this example we want to prove the helpful property (2.4.5)
of the cube roots of unity. But for every r > 1, the rth roots of unity do
the same sort of thing, namely
1
r
X
ωr=1
ωn
=
n
1 if r\n
0 else.
(2.4.9)
Indeed, the left side is
1
r
r−1 X
j=0
e(2πijn)/r
,
which is a finite geometric series whose sum is easy to find, and is as stated
in (2.4.9). So, with more or less difficulty, it is always possible to select a
subset of the terms of a convergent series in which the exponents form an
arithmetic progression. See exercise 25.
## 2.5 Some useful power series
Generatingfunctionologists need reference lists of known power series
and other series that occur frequently in applications of the theory. Here
is such a list. For each series we show the series and its sum. The radius
of the largest open disk, centered at the origin, in which convergence takes
place will be, of course, the modulus of the singularity of the function that
is nearest to the origin. Considering the relatively simple forms of the
functions, the locations of those singularities will be sufficiently obvious
that the radii of convergence are not explicitly shown in the table below.
1
1 − x
=
X
n≥0
xn
(2.5.1)
log
1
1 − x
=
X
n≥1
xn
n
(2.5.2)
ex
=
X
n≥0
xn
n!
(2.5.3)
sinx =
X
n≥0
(−1)n x2n+1
(2n + 1)!
(2.5.4)
cosx =
X
n≥0
(−1)n x2n
(2n)!
(2.5.5)2.5 Some useful power series 53
(1 + x)α
=
X
k
µ
α
k
¶
xk
(2.5.6)
1
(1 − x)k+1
=
X
n
µ
n + k
n
¶
xn
(2.5.7)
x
ex − 1
=
X
n≥0
Bnxn
n!
(2.5.8)
tan−1
x =
X
n≥0
(−1)n x2n+1
2n + 1
(2.5.9)
1
2x
(1 −
√
1 − 4x) =
X
n
1
n + 1
µ
2n
n
¶
xn
(2.5.10)
= 1 + x + 2x2
+ 5x3
+ 14x4
+ 42x5
+ 132x6
+ 429x7
+ 1430x8
+ 4862x9
+ ···
1
√
1 − 4x
=
X
k
µ
2k
k
¶
xk
(2.5.11)
= 1 + 2x + 6x2
+ 20x3
+ 70x4
+ 252x5
+ 924x6
+ 3432x7
+ 12870x8
+ 48620x9
+ ···
xcotx =
X
k≥0
(−4)k
B2k
(2k)!
x2k
(2.5.12)
= 1 −
x2
3
−
x4
45
−
2x6
945
−
x8
4725
−
2x10
93555
− ···
tanx =
X
r≥1
(−1)r−1 22r
(22r
− 1)B2r
(2r)!
x2r−1
(2.5.13)
= x +
x3
3
+
2x5
15
+
17x7
315
+
62x9
2835
+
1382x11
155925
+ ···
+
21844x13
6081075
+
929569x15
638512875
+ ···54 2 Series
x
sinx
=
X
r≥0
(−1)r−1 (4r
− 2)B2r
(2r)!
x2r
= 1 +
x2
6
+
7x4
360
+
31x6
15120
+ ··· (2.5.14)
1
√
1 − 4x
µ
1 −
√
1 − 4x
2x
¶k
=
X
n
µ
2n + k
n
¶
xn
(2.5.15)
µ
1 −
√
1 − 4x
2x
¶k
=
X
n≥0
k(2n + k − 1)!
n!(n + k)!
xn
(k ≥ 1) (2.5.16)
sin−1
(x) = x +
1
2
x3
3
+
1 · 3
2 · 4
x5
5
+
1 · 3 · 5
2 · 4 · 6
x7
7
+ ··· (2.5.17)
ex
sinx =
X
n≥1
2
n
2 sin nπ
4
n!
xn
(2.5.18)
= x + x2
+
x3
3
−
x5
30
−
x6
90
−
x7
630
+ ···
1
2
tan−1
(x)log(1 + x2
) =
X
r≥1
(−1)r−1
H2r
x2r+1
2r + 1
(2.5.19)
=
x3
2
−
5x5
12
+
7x7
20
−
761x9
2520
+ ···
1
4
tan−1
(x)log
1 + x
1 − x
=
X
r≥0
x4r+2
4r + 2
µ
1 −
1
3
+
1
5
− ··· +
1
4r + 1
¶
=
x2
2
+
13x6
90
+
263x10
3150
+ ··· (2.5.20)
1
2
½
log
1
1 − x
¾2
=
X
r≥2
Hr−1
r
xr
(2.5.21)2.5 Some useful power series 55
=
x2
2
+
x3
2
+
11x4
24
+
5x5
12
+
137x6
360
+
7x7
20
+ ···
s
1 −
√
1 − x
x
=
∞ X
k=0
(4k)!
16k
√
2(2k)!(2k + 1)!
xk
(2.5.22)
=
1
√
2
µ
1 +
x
8
+
7x2
128
+
33x3
1024
+
715x4
32768
+
4199x5
262144
+
52003x6
4194304
+
334305x7
33554432
+
17678835x8
2147483648
+
119409675x9
17179869184
+
1641030105x10
274877906944
+ ···
¶
earcsinx
=
∞ X
k=0
Qk−1
j=0(4j2
+ 1)
(2k)!
x2k
+
∞ X
k=0
4k
Qk
j=1(1
2 − j + j2
)
(2k + 1)!
x2k+1
= 1 + x +
x2
2
+
x3
3
+
5x4
24
+
x5
6
+
17x6
144
+
13x7
126
+
629x8
8064
+
325x9
4536
+
8177x10
145152
+ ··· (2.5.23)
µ
arcsinx
x
¶2
=
∞ X
k=0
4k
k!2
(k + 1)(2k + 1)!
x2k
(2.5.24)
= 1 +
x2
3
+
8x4
45
+
4x6
35
+
128x8
1575
+
128x10
2079
+ ···
(x +
p
1 + x2)a
=
∞ X
k=0
2k
· (a
2 − k
2 + 1)k
(1 + k/a)k!
xk
(2.5.25)
= 1 + ax +
a2
x2
2
+
µ
−a
6
+
a3
6
¶
x3
+
µ
−a2
6
+
a4
24
¶
x4
+
a
¡
9 − 10a2
+ a4
¢
x5
120
+
a2
¡
64 − 20a2
+ a4
¢
x6
720
+
a
¡
−225 + 259a2
− 35a4
+ a6
¢
x7
5040
+
a2
¡
−2304 + 784a2
− 56a4
+ a6
¢
x8
40320
+ ···56 2 Series
In the above, the {Bn} are the Bernoulli numbers, and they are defined
by (2.5.8). The Bernoulli numbers {Bn}16
0 have the values
1, −1/2,
1
6
, 0, −
1
30
, 0,
1
42
, 0, −
1
30
, 0,
5
66
, 0, −
691
2730
, 0,
7
6
, 0, −
3617
510
.
The {Hn} are the harmonic numbers that were defined in section 2.2.
The symbol mk
, in (2.5.25), means m(m+1)···(m+k−1). The expansions
(2.5.22)-(2.5.25) are taken from [Ko].
## 2.6 Dirichlet series, formal theory
We have already discussed two slightly different forms of generating
functions of sequences, namely the ordinary power series form and the ex-
ponential generating function form. We remarked that when, in a particular
problem, one has to decide which of these forms to use, the choice is most
often dictated by the form of the multiplicative convolution of the two se-
quences that occurs in the problem. If the form is as in Rule 30
and (2.3.3),
then we choose the egf, whereas if it is of the form (2.3.4), the opsgf may
well be preferred.
To help highlight the basis for this kind of choice, we will now discuss
yet another kind of generating function that matches yet another kind of
convolution of two sequences, a kind that also occurs naturally in many
problems in combinatorics and number theory.
Definition. Given a sequence {an}∞
1 ; we say that a formal series
f(s) =
∞ X
n=1
an
ns
= a1 +
a2
2s
+
a3
3s
+
a4
4s
+ ···
(2.6.1)
is the Dirichlet series generating function (Dsgf) of the sequence, and we
write
f(s) Dir
← → {an}∞
1 .
The importance of Dirichlet series stems directly from their multipli-
cation rule. Suppose f(s) Dir
← → {an}∞
1 and g(s) Dir
← → {bn}∞
1 . The question is,
what sequence is generated by f(s)g(s)?
To find out, consider the product of these series,
fg = (a1 + a22−s
+ a33−s
+ ···)(b1 + b22−s
+ b33−s
+ ···)
= (a1b1) + (a1b2 + a2b1)2−s
+ (a1b3 + a3b1)3−s
+ (a1b4 + a2b2 + a4b1)4−s
+ ···2.6 Dirichlet series, formal theory 57
What is the general rule? In the product fg, what is the coefficient of
n−s
? It is the sum of all products of a’s and b’s where the product of their
subscripts is n, i.e., it is X
rs=n
arbs.
Now if rs = n then r and s are divisors of n, so the above sum can also be
written as X
d\n
adbn
d
,
in which the symbol ‘d\n’ is read ‘d divides n.’ We state this formally as:
Rule 100
. If f(s) Dir
← → {an}∞
1 and g(s) Dir
← → {bn}∞
1 , then
f(s)g(s) Dir
← →



X
d\n
adbn
d



∞
n=1
. (2.6.2)
Let’s hasten to say what kind of a problem gives rise to this kind of a
convolution of sequences. It is, roughly, a situation in which all objects of
size n are obtained by stitching together d objects of size n/d, where d is
some divisor of n. Before we get to examples of this sort of thing, since the
multiplication is so important, let’s look at a few more of its properties.
What happens to the sequence generated if we take the kth power of
a Dirichlet series? Let’s work it out, as follows:
f(s)k
=


X
n≥1
ann−s


k
=
X
n1,...,nk≥1
an1
···ank
(n1n2 ···nk)−s
=
X
n≥1
n−s
(
X
n1···nk=n
an1
···ank
)
.
This shows:
Rule 200
. If f(s) Dir
← → {an}∞
1 then f(s)k Dir
← → a sequence whose nth member
is the sum, extended over all ordered factorizations of n into k factors, of the
products of the members of the sequence whose subscripts are the factors
in that factorization.
What series f generates the sequence of all 10
s: {1}∞
1 ? When we asked
that question in the cases of the opsgf and the egf, the answers turned out
to be ‘famous’ functions. For opsgf’s it was 1/(1−x) and for egf’s it was ex
.
In the present case, the formal Dirichlet series whose coefficients are all 1’s58 2 Series
is not related to any simple function of analysis, it is a new creature, and
it gets a new name: the Riemann zeta function. It is the Dirichlet series
ζ(s) =
∞ X
n=1
1
ns
= 1−s
+ 2−s
+ 3−s
+ 4−s
+ ···,
(2.6.3)
and it is one of the most important functions in analysis.
Now, since ζ(s) Dir
← → {1}∞
1 , what sequence does ζ2
(s) generate? Directly
from (2.6.2),
[n−s
]ζ2
(s) =
X
d\n
1 · 1 = d(n),
where d(n) is the number of divisors of the integer n. The sequence d(n) is
quite irregular, and begins with
1,2,2,3,2,4,2,4,3,4,2,...
Nevertheless, its Dirichlet series generating function is ζ2
(s), by Rule 200
.
Likewise, ζ(s)k
generates the number of ordered factorizations of n
into k factors. If the factor 1 is regarded as inadmissible, then (ζ(s) − 1)k
generates the number of ordered factorizations of n in which there are k
factors, all ≥ 2.
One can go on and study further examples of interesting number-
theoretic sequences that are generated by relatives of the Riemann zeta
function, but there is a somewhat breathtaking generalization that takes in
all of these at a single swoop, so let’s prepare the groundwork for that.
Definition. A number-theoretic function is a function whose domain is
the set of positive integers. A number-theoretic function f is said to be
multiplicative if it has the property that f(mn) = f(m)f(n) for all pairs of
relatively prime positive integers m and n.
Since every positive integer n is uniquely, apart from order, a product
of powers of distinct primes,
n = pa1
1 pa2
2 ···par
r , (2.6.4)
it follows that a multiplicative number-theoretic function is completely de-
termined by its values on all powers of primes. Indeed,
f(n) = f(pa1
1 )f(pa2
2 )···f(par
r ). (2.6.5)
For instance, suppose that I have a certain function f in mind. It is
multiplicative and, further, for every prime p and positive integer m we2.6 Dirichlet series, formal theory 59
have f(pm
) = p2m
. Well then, it must be that f(n) = n2
for all n, because
if n is as shown in (2.6.4), then
f(n) = f(
Y
pai
i ) =
Y
i
f(pai
i )
=
Y
i
p2ai
i =
(
Y
i
pai
i
)2
= n2
,
as claimed.
Another, less obvious, example of a multiplicative function is d(n), the
number of divisors of n. For instance,
6 = d(12) = d(3 · 4) = d(3)d(4) = 2 · 3 = 6.
To see that d(n) is multiplicative in general, let m and n be relatively prime
positive integers. Then every divisor d of mn is uniquely the product of a
divisor d0
of m and a divisor d00
of n. Indeed, we can take d0
= gcd(d,m)
and d00
= gcd(d,n). Therefore the number of divisors of mn is the product
of the number of divisors of m and the number of divisors of n, which was
to be shown.
It is quite easy, therefore, to dream up examples of multiplicative func-
tions: let your function f do anything it likes on the powers of primes, then
declare it to be multiplicative, and walk away.
Multiplicative number-theoretic functions satisfy an amazing identity,
which we will state, then prove, and then use.
Theorem 2.6.1. Let f be a multiplicative number-theoretic function.
Then we have the formal identity
∞ X
n=1
f(n)
ns
=
Y
p
©
1 + f(p)p−s
+ f(p2
)p−2s
+ f(p3
)p−3s
+ ···
ª
(2.6.6)
in which the product on the right extends over all prime numbers p.
Proof. Imagine, if you will, multiplying out the product that appears on
the right side of (2.6.6). Each factor in that product is an infinite series.
The product looks like this, when spread out in detail:
(1 + f(2)2−s
+ f(22
)2−2s
+ f(23
)2−3s
+ ···)×
(1 + f(3)3−s
+ f(32
)3−2s
+ f(33
)3−3s
+ ···)×
(1 + f(5)5−s
+ f(52
)5−2s
+ f(53
)5−3s
+ ···)×
(1 + f(7)7−s
+ f(72
)7−2s
+ f(73
)7−3s
+ ···) × ···
(2.6.7)60 2 Series
To multiply out a bunch of formal infinite series like this, we reach into
the first parenthesis and pull out one term, for instance f(23
)2−3s
. Then
we reach into the second parenthesis, pull out one term, say f(3)3−s
and
multiply it by the one we got earlier. This gives us an accumulated product
(so far) of
f(23
)f(3)2−3s
3−s
=
f(23
)f(3)
(24)s
. (2.6.8)
Suppose, just as an example, that in all of the following parentheses we
exercise our choice of one term by pulling out the term ‘1.’ Then, as a
result of having made all of those choices, one out of each parenthesis, the
contribution to the answer would be the single term shown in (2.6.8) above.
Now here’s the interesting part. That particular set of choices has
produced a term that involves (24)−s
. What other sequence of choices of
a single term out of each parenthesis would also lead to a net contribution
that involves (24)−s
? The answer: no other set of choices can do that.
Indeed, if from the first parenthesis we choose any term other than
f(23
)2−3s
, then no matter what terms we pull out of all following paren-
theses, there is no way we will ever find the power of 2, namely 2−3s
, that
occurs in (24)−s
. We need three 2’s, and no other parenthesis has any 2’s
at all to offer, so we’d better take them when we have the chance.
Similarly, we need a factor of 3−s
in order to complete the formation
of the term (24)−s
. There are no 3’s available in any parenthesis other than
the second one, and there, to get the right number of 3’s, namely one, we
had better take the term f(3)3−s
that we actually chose.
Thus, the coefficient of (24)−s
on the right side of (2.6.6) is just what
we found, namely f(23
)f(3). Now since f is multiplicative, that’s the same
as f(24). Hence the coefficient of (24)−s
is f(24). But that is just what
the left side of (2.6.6) claims.
Let’s say that again, using ‘n’ instead of ‘24.’ Let n be some fixed
integer, and let (2.6.4) be its factorization into prime powers. In order to
obtain a term that involves n−s
, i.e., that involves
Q
p−ais
i , we are forced to
choose the ‘1’ term in every parenthesis on the right side of (2.6.7), except
for those parentheses that involve the primes pi that actually occur in n.
Inside a parenthesis that belongs to pi, we must choose the one and only
term in which pi is raised to the power with which it actually occurs in n,
else we won’t have a chance of getting n−s
. Thus we are forced to choose
the term f(pai
i )p−ais
i out of the parenthesis that belongs to pi. That means
that the coefficient of n−s
in the end will be
Y
i
f(pai
i ) = f(n),
by (2.6.5).
Let’s look again at (2.6.6). One thing that is very apparent is that a
multiplicative function is completely determined by its values on all prime2.6 Dirichlet series, formal theory 61
powers. Indeed, on the right side of (2.6.6) we see only the values of f at
prime powers, but on the left, all values appear.
Try an example of the theorem. Take the multiplicative function
f(n) = 1 (all n). Then (2.6.6) says that
ζ(s) =
Y
p
©
1 + p−s
+ p−2s
+ ···
ª
=
Y
p
½
1
1 − p−s
¾
=
1
Q
p(1 − p−s)
,
(2.6.9)
which is a fundamental factorization of the zeta function.
For another example, take the multiplicative function µ(n) whose val-
ues on prime powers are
µ(pa
) =
(
+1, if a = 0;
−1, if a = 1;
0, if a ≥ 2.
With this function substituted for f in (2.6.6), one sees that the once
formidable series in the braces now has only two terms, and (2.6.6) reads
X
n≥1
µ(n)
ns
=
Y
p
{1 − p−s
}. (2.6.10)
An important fact emerges by comparison of (2.6.9) with (2.6.10): the
series ζ(s) and the series on the left side of (2.6.10) are reciprocals of each
other. Hence,
1
ζ(s)
=
X
n≥1
µ(n)
ns
,
or, what amounts to the same thing, 1/ζ(s) Dir
← → {µ(n)}∞
1 .
The function µ(n) is the Möbius function, and it plays a central role
in the analytic theory of numbers, because of the fact that it is generated
by the reciprocal of the Riemann zeta function. For instance, watch this:
Suppose we have two sequences {an}∞
1 and {bn}∞
1 , and suppose that these
two sequences are connected by the following equations-
an =
X
d\n
bd (n ≥ 1). (2.6.11)
The question is, how can we invert these equations, and solve for the b’s in
terms of the a’s?62 2 Series
Nothing to it. Let the Dsgf’s of the two sequences be A(s) and B(s).
Then, if we take a step into Generatingfunctionland, we see that (2.6.11)
means
A(s) = B(s)ζ(s)
by Rule 100
. Hence B(s) = A(s)/ζ(s), and then from Rule 100
again,
bn =
X
d\n
µ
³n
d
´
ad (n = 1,2,3,...) (2.6.12)
This is the celebrated Möbius Inversion Formula. The reciprocal relation-
ships (2.6.11) and (2.6.12) of the sequences mirror the reciprocal relation-
ships of their Dsgf’s ζ(s) and 1/ζ(s).
Example 1. Primitive bit strings.
How many strings of n 0’s and 1’s are primitive, in the sense that such
a string is not expressible as a concatenation of several identical smaller
strings?
For instance, 100100100 is not primitive, but 1101 is.
There are a total of 2n
strings of length n. Suppose f(n) of these are
primitive. Every string of length n is uniquely expressible as a concatenation
of some number, n/d, of identical primitive strings of length d, where d is
a divisor of n.
Thus we have
2n
=
X
d\n
f(d) (n = 1,2,...)
By (2.6.12) we have
f(n) =
X
d\n
µ(
n
d
)2d
(n = 1,2,...) (2.6.13)
for the required number.
Example 2. Cyclotomic polynomials
Among the n roots of the equation xn
= 1, the primitive nth roots of
unity are those that are not also mth roots of unity for some m < n. Thus
the 4th roots of unity are ±1,±i, but ±1 are roots of x2
= 1, so they aren’t
primitive 4th roots.
In general, the nth roots of unity are {e2πir/n
}n−1
r=0 , and the primitive
ones are
{e2πir/n
} (0 ≤ r ≤ n − 1;gcd(r,n) = 1).
So for each n there are exactly φ(n) primitive nth roots of unity.
The equation whose roots are all n of the n roots of unity is obviously
the equation xn
− 1 = 0. The question is this: what is the polynomial2.6 Dirichlet series, formal theory 63
Φn(x) of degree φ(n) whose roots are exactly the set of primitive nth roots
of unity? In other words, what can be said about the polynomial
Φn(x) =
Y
0≤r≤n−1
gcd(r,n)=1
(x − e2πir/n
) (n = 1,2,3,...)?
The polynomials Φn(x) are called the cyclotomic (“circle-cutting”) polyno-
mials.
The important fact for answering this question is that
Y
d\n
Φd(x) = 1 − xn
(n = 1,2,3,...). (2.6.14)
Indeed, the right side of the equation is the product of all possible factors
(ω − x) where ω is an nth root of unity, primitive or not. But every nth
root of unity is a primitive dth root of unity for exactly one d ≤ n, and
that d is a divisor of n.
In detail, if we have some nth root ω = e2πir/n
, then let g = gcd(r,n),
d = n/g, and r0
= r/g. Since ω = e2πir0
/d
we see that ω is a primitive dth
root of unity and that d\n. Thus every linear factor on the right side of
(2.6.14) occurs in one and only one of the cyclotomic polynomials on the
left side of (2.6.14), which proves the assertion.
From (2.6.14) we will obtain a fairly explicit formula for the Φn(x),
by inverting the equation to solve for the Φ’s. The form of the equation
reminds us of the setup (2.6.11) for the Möbius inversion formula, but we
have a product over divisors instead of a sum over divisors. A small dose of
logarithms will convert products to sums, however, so we take the logarithm
of both sides of (2.6.14), to get
X
d\n
logΦd(x) = log(1 − xn
) (n = 1,2,3,...).
This is now precisely in the form (2.6.11), so we can use (2.6.12) to invert
it, the result being
logΦn(x) =
X
d\n
µ(
n
d
)log(1 − xd
) (n = 1,2,3,...).
Finally, we exponentiate both sides to obtain our “fairly explicit formula,”
Φn(x) =
Y
d\n
(1 − xd
)µ(n/d)
(n = 1,2,3,...). (2.6.15)
This is a good time to remember that the values of the Möbius function
µ can only be ±1 or 0. So the exponents on the right side of (2.6.15) tell64 2 Series
us whether to omit a certain factor, which we do if µ = 0, to put it in the
numerator (if µ = 1), or to put it in the denominator (if µ = −1). For
instance, Φ12(x) is
(1 − x)µ(12)
(1 − x2
)µ(6)
(1 − x3
)µ(4)
(1 − x4
)µ(3)
(1 − x6
)µ(2)
(1 − x12
)µ(1)
= (1 − x)0
(1 − x2
)1
(1 − x3
)0
(1 − x4
)−1
(1 − x6
)−1
(1 − x12
)1
=
(1 − x2
)(1 − x12
)
(1 − x4)(1 − x6)
= 1 − x2
+ x4
,
which didn’t look much like a polynomial at all until the very last step!
An important and beautiful fact about these polynomials is that the
equation Φn(z) = 0 can always be solved by radicals. That is, the solutions
can always be obtained by a finite number of root extractions and rational
operations. This is certainly not the case for general polynomial equations.
As an example of this property we note the splendid fact that
cos
2π
17
=
1
16
½
−1 +
√
17 +
q
2(17 −
√
17)
+ 2
r
17 + 3
√
17 −
q
2(17 −
√
17) − 2
q
2(17 +
√
17)
¾
.
The proof is fairly difficult, and can be found in Rademacher [Ra].
Some applications of cyclotomic polynomials will appear in section
4.10.Exercises 65
Exercises
1. Calculate the first three coefficients of the reciprocals of the power series
of the functions:
(a) cosx
(b) (1 + x)m
(c) 1 + t2
+ t3
+ t5
+ t7
+ t11
+ ···
2. Calculate the first three coefficients of the inverses of the power series
for the functions:
(a) sinx
(b) tanx
(c) x + x2
√
1 + x
(d) x + x3
(e) log(1 − x)
3. Let f be a formal power series such that f00
+ f = 0. Give a careful
proof that f = Asinx + B cosx.
4. Find simple closed formulas for the opsgf’s of the following sequences:
(a) {n + 7}∞
0
(b) {1}∞
4
(c) {1,0,1,0,1,0,1,0,...}
(d) {1/(n + 1)}∞
2
(e) {1/(n + 5)!}∞
0
(f) F1,2F2,3F3,4F4,... (the F’s are the Fibonacci numbers)
(g) {(n2
+ n + 1)/n!}∞
1
5. Use generating functions to prove that
P
k
¡n
k
¢
= 2n
.
6. Given positive integers n, k; define f(n,k) as follows: for each way of
writing n as an ordered sum of exactly k nonnegative integers, let S be
the product of those k integers. Then f(n,k) is the sum of all of the S’s
that are obtained in this way. Find the opsgf of f and an explicit, simple
formula for it.
7. Let f(n,k,h) be the number of ordered representations of n as a sum of
exactly k integers, each of which is ≥ h. Find
P
n f(n,k,h)xn
.
8. Find the limit superior of each of the following sequences. In each case
give a careful proof that your answer is correct.
(a) 1,0,1,0,1,0,...
(b) {(−1)n
}∞
066 2 Series
(c) {cos(nπ/k)}n≥0 (k 6= 0 is a fixed integer)
(d) {1 + ((−1)n
/n)}n≥1
(e) {n1/n
}n≥1
9. Prove that if a sequence has a limit then its limit superior is equal to
that limit.
10. Prove that a sequence cannot have two distinct limits superior.
11. Find the radius of convergence of each of the following power series:
(a)
P
n≥1 xn
/(n2
)
(b) 1 + x3
+ x6
+ x9
+ x12
+ ···
(c) 1 + 5x2
+ 25x4
+ 125x6
+ ···
(d) 1 + 2!x2
+ 4!x4
+ 6!x6
+ ···
(e)
P
n≥0 xn!
12. Finish the proof of theorem 2.4.1 in the cases where R = 0 and R = ∞.
13. Show that if {f(n)}∞
1 is a multiplicative function, then so is
g(n) =
X
d\n
f(d) (n = 1,2,...)
14. Euler’s function φ(n) is the number of integers 1 ≤ m ≤ n such that m
is relatively prime to n. Show by a direct counting argument that
X
d\n
φ(d) = n (n = 1,2,...).
15. Show that each of the following functions is multiplicative. In each case
find the value of the function when n is a prime power, and thereby find a
formula for its value on any integer n.
(a) Euler’s function φ(n) (use the results of problems 13, 14 above).
(b) σ(n), which is the sum of the divisors of n.
(c) The function |µ(n)|, which is 1 if n is not divisible by a square
and 0 otherwise.
16. For each of the functions defined in problem 15 above, find its Dirichlet
series generating function by using Theorem 2.6.1. First substitute into
(2.6.6) the values of the function at prime powers. Then try to sum the
power series that occurs, in closed form. Finally, by comparing the product
that results with (2.6.9), try to express your answer simply in terms of the
Riemann zeta function. In each case the Dsgf can be simply expressed in
terms of ζ(s), or small variations thereof.
17. Find the Dsgf of each of the following sequences:Exercises 67
(a) {n}∞
1
(b) {nα
}∞
1
(c) {logn}∞
1
(d) {
P
d\n dq
}∞
n=1
18. For each of the following identities: first check that the identity is
sometimes correct by calculating both sides of the alleged equation when
n = 1,2,3,4,5,6,7,8; next find the Dsgf’s of the sequences on both sides
of the claimed identity, observe that they are the same, and thereby prove
the identity. Use the results of exercise 16 above.
(a)
P
d\n φ(d) = n (n ≥ 1)
(b)
P
d\n µ(d) = 0 if n ≥ 2 and =1 if n = 1
(c)
P
δ\n µ(δ)d(n/δ) = 1 (n ≥ 1)
19. If {f(k)} is the sequence in example 7 of section 2.2, show that f(k) =
F2k−1 for k ≥ 1, where the {Fk} are the Fibonacci numbers.
20. Prove the binomial theorem
(x + y)n
=
X
k
µ
n
k
¶
xk
yn−k
by comparing the coefficient of tn
/n! on both sides of the equation et(x+y)
=
etx
ety
. Prove the multinomial theorem
(x1 + ··· + xk)n
=
X
r1+···+rk=n
n!
r1!···rk!
xr1
1 ···xrk
k
by a similar device.
21.
(a) Let T be a fixed set of nonnegative integers. Let f(n,k,T) be
the number of ordered representations of n as a sum of k integers
chosen from T. Find
P
n f(n,k,T)xn
.
(b) Let g(n,k,T) be the number of ordered representations of n as a
sum of k distinct integers chosen from T. Find
P
n g(n,k,T)xn
.
(c) Finally, let S,T be two fixed sets of nonnegative integers. Let
f(n,k,S,T) be the number of ordered representations of n as a
sum of k integers chosen from T, each being chosen with a multi-
plicity that belongs to S. Find
P
n f(n,k,S,T)xn
.
22. Let f(n) be the excess of the number of ordered representations of n
as the sum of an even number of positive integers over those as a sum of
an odd number of them. Find f(n) by finding
P
n f(n)xn
and reading off
its coefficients.68 2 Series
23. Let {Bn} be the sequence of Bernoulli numbers defined by (2.5.8), and
let m be a positive integer. By considering the generating function
x(emx
− 1)
ex − 1
in two ways, find an evaluation of the sum of the rth powers of the first N
positive integers as a polynomial of degree r + 1 in N, whose coefficients
are given quite explicitly in terms of the Bernoulli numbers.
24.
(a) Make a table of values of the classical Möbius function µ(n) for
n = 1,2,...,30.
(b) Make a table of the values of the function f(n) of (2.6.13) for
n = 1,2,...,12.
(c) Make a list of the primitive strings of length 6, and verify your
value of f(6).
25. This problem is intended to show how generating functions occur in
coding theory. An important question in coding theory is the following: for
fixed integers n and d, what is the length A(n,d) of the longest list of n-bit
strings of 0’s and 1’s (codewords) such that two distinct codewords always
differ in at least d bit positions?
(a) Assign to each of the 2n
codewords (²1,...,²n) a color, as follows:
the color of ² is
P
j j²j modulo 2n. Show that if two codewords
differ in just 1 or 2 coordinates, then they are assigned distinct
colors in this scheme.
(b) From part (a), show that A(n,3) ≥ 2n
/(2n).
(c) Let aj be the number of codewords for which
P
r r²r = j, for each
j. Find the opsgf f(z) =
P
j ajzj
explicitly as a product.
(d) If βr is the number of codewords of color r, then express βr in
terms of the aj’s above. Then use the roots of unity method of
section 2.4 to find that
βr =
1
2n
n00
X
j=1
22a
(j,n00
)
e−2πirj
n00
for each r = 0,1,...,2n−1. Here a and n00
are defined by n = 2a
n00
where n00
is odd, and (b,c) denotes the g.c.d. of b and c.
(e) Deduce that β0 is the largest of the βr’s, and therefore find the
stronger bound
A(n,3) ≥
1
2n
n00
X
j=1
22a
(j,n00
)
≥
2n
2n
.Exercises 69
(f) Use Parseval’s identity and the result of part (d) to find the vari-
ance of the occupancy numbers β0,...,β2n−1. Make an estimate
that shows that the variance is in some sense very small, so that
this coloring scheme is shown to distribute codewords into color
classes very uniformly.
26. Derive (2.5.7) from (2.5.6). That is, show that
µ
−n
k
¶
= (−1)k
µ
n + k − 1
k
¶
.
27. Let D(n) be the number of derangements of n letters, discussed in
Example 4.
(a) Find, in simple explicit form, the egf of {D(n)}∞
0 .
(b) Prove, by any method, that
D(n + 1) = (n + 1)D(n) + (−1)n+1
(n ≥ 0;D(0) = 1)
(c) Prove, by any method, that
D(n + 1) = n(D(n) + D(n − 1)) (n ≥ 1;D(0) = 1;D(1) = 0).
(c) Show that the number of permutations of n letters that have exactly
1 fixed point differs from the number with no fixed points by ±1.
(d) Let Dk(n) be the number of permutations of n letters that have
exactly k fixed points. Show that
X
k,n≥0
Dk(n)
xn
yk
n!
=
e−x(1−y)
1 − x
.
28. Prove the following variation of the Möbius inversion formula. Let
{an(x)} and {bn(x)} be two sequences of functions that are connected by
the relation
an(x) =
X
d\n
bn
d
(xd
) (n = 1,2,3,...).
Then we have
bn(x) =
X
d\n
µ(
n
d
)ad(xn/d
) (n = 1,2,3,...).
29.
(a) Make a table of the values of φ(n) for 1 ≤ n ≤ 25.70 2 Series
(b) As far as your table goes, verify that φ is a multiplicative function,
by actual computation. Then check by actual computation from your
table, that the result stated in exercise 14 above is true when n = 20
and n = 24.
(c) Let n = pa
where p is a prime number. What is φ(n)?
(d) Use the results above to find a general formula for φ(n) in terms of the
prime factorization n = pa1
1 pa2
2 ···pak
k of n. Use your result to calculate
φ(2592).
(e) Find the Dirichlet series generating function of φ(n), using (2.6.6), and
express it in terms of the Riemann zeta function.
(f) Apply the Möbius inversion formula to the result of exercise 18(a), and
thereby “solve” 18(a) for φ(n), to get an explicit formula for φ(n) that
involves a sum of various values of the Möbius function.
(g) Show that your answers to parts (d) and (f) of this problem are iden-
tical, even though they look different.
30. Find the Dirichlet series generating functions for the sequences
(a) an =
√
n
(b) an = |µ(n)|, where µ is the Möbius function.
(c) A number-theoretic function f(n) is strongly multiplicative if it is
true that f(mn) = f(m)f(n) for all pairs m,n of positive integers.
Let λ(n) be the strongly multiplicative function that takes the value
−1 on every prime, and λ(1) = 1. Find its Dsgf, and then prove
that X
d\n
λ(d) =
n
1 if n is a square;
0 otherwise.
31. A Lambert series is a series of the form
f(x) =
X
n≥1
an
xn
1 − xn
,
and we then say that f is the Lambert series gf for the sequence {an}.
(Lambert series are only rarely used because they’re hard to analyze.)
(a) Suppose f is the Lambert series gf of a sequence {an}∞
1 , and the
same f is the opsgf of a sequence {bn}∞
1 . Find the b’s in terms of
the a’s.Exercises 71
(b) Thus prove the amazing identity
X
n≥1
µ(n)xn
1 − xn
= x,
where again µ is the Möbius function.
(c) Find the Lambert series generating function of Euler’s φ function.
32. Let a = {an}n≥0 be a given sequence. Let S be the operator that
transforms a into its sequence of partial sums: (Sa)n = a0 + ··· + an, for
n ≥ 0.
(a) If f is the opsgf of a, what is the opsgf of Sa?
(b) If f is the opsgf of a and r ≥ 0 what is the opsgf of Sr
a?
(c) What is Sr
a if a is the sequence of all 1’s?
(d) For a general sequence a, find an explicit formula, involving a single
summation sign, for the nth member of the sequence Sr
a.
(e) An unknown sequence a has the following property: if, beginning
with a we iterate r times the operation S, of replacing the sequence
by its sequence of partial sums, we obtain the sequence {1,0,0,...}.
Find a.
33.
(a) Write out the first twelve cyclotomic polynomials.
(b) If n = pa
is a prime power, what is Φn(x)?
(c) Show that for n ≥ 1,
Φn(1) =
(
1, if n > 1 is not a prime power;
p, if n = pk
is a prime power;
0, if n = 1.
34. Consider the following sequence of polynomials.
ψn(x) =
X
1≤m≤n
gcd(m,n)=1
xm
(n = 1,2,...).
Thus ψ1 = x, ψ2 = x, ψ3 = x + x2
, ψ4 = x + x3
, etc.
(a) Show that
X
d\n
ψn
d
(xd
) =
x(1 − xn
)
1 − x
(n = 1,2,...).
(b) Use the result of exercise 28 to show that
ψn(x) = (1 − xn
)
X
d\n
µ(d)
xd
1 − xd
(n = 1,2,...).72 2 Series
(c) Show that at every primitive nth root of unity ω we have ψn(ω) =
µ(n), and therefore the polynomial ψn(x) − µ(n) is divisible by the
nth cyclotomic polynomial Φn(x).3.1 Introduction 73
Chapter 3
Cards, Decks, and Hands: The Exponential Formula
## 3.1 Introduction
In this chapter we will discuss a particularly rich vein of applications of
the theory of generating functions to counting problems. The exponential
formula, which is our main goal here, is a cornerstone of the art of count-
ing. It deals with the question of counting structures that are built out of
connected pieces. The structures themselves need not be connected, but
their pieces always are. The question is, if we know how many pieces of
each size there are, how many structures of each size can we build out of
those pieces?
We begin with a little example. There is 1 connected labeled graph
that has 1 vertex, there is 1 connected labeled graph that has 2 vertices, and
there are 4 connected labeled graphs that have 3 vertices. These creatures
are all shown in Fig. 3.1 below.
3 2
1
2 1 3 1 2 3 1 3 2
1 1 2
Fig. 3.1: The six labeled, connected graphs of ≤ 3 vertices.
Now think of graphs that have exactly 3 labeled vertices but are not
necessarily connected. There are 8 of them, as shown in Fig. 3.2.
The question is, how can we develop a theory that will show us the
connection between the number 8, of all graphs of ≤ 3 vertices, and the
numbers 1, 1, 4 of connected labeled graphs of 1, 2, and 3 vertices? After all,
such a theory should exist, because the connected graphs are the building
blocks out of which all graphs are constructed. How, exactly, are those
building blocks used?
Suppose we want to construct a graph G of n vertices and k connected
components. We can first choose which k connected graphs to use for the
connected components, subject only to the condition that the sum of their
numbers of vertices must be n.
Second, after deciding which connected graphs to use, we need to re-
label all of their vertices. That is because the connected graphs that we74 3 Cards, Decks, and Hands: The Exponential Formula
3 2
1
2 1 3 1 2 3 1 3 2
1 2 3 1 3 2 2 3 1
2 3
1
Fig. 3.2: The eight not-necessarily-connected labeled graphs of 3 vertices.
use, as in Fig. 3.1, each have their own private sets of vertex labels. A
connected graph of 5 vertices will have labels 1, 2, 3, 4, 5 on its vertices,
etc. However, the final assembled graph G, that we are manufacturing out
of those connected pieces, will use each vertex label 1,2,3,...,n exactly
once, as in Fig. 3.2. Note, for instance, that the connected graph of 1
vertex appears three times in the first graph of Fig. 3.2 with 3 different
vertex labels.
So our counting theory will have to take into account the choices of the
connected graphs that are used as building blocks, as well as the number
of ways to relabel the vertices of those connected graphs to obtain the final
product.
Now we’re going to raise the ante. Instead of going ahead and an-
swering these counting questions in the case of graphs, it turns out to be
better to be a bit more general right from the start, because a lot of nice
applications don’t quite fall under the heading of graphs. So we are going
to develop the theory in a context of ‘playing cards’ and ‘hands,’ instead
of ‘connected graphs’ and ‘all graphs.’
Next you will see a number of definitions of the basic terminology.
After all of those definitions, a few examples will no doubt be welcome, and
will be immediately forthcoming. Then we will get on with the development
of the theory and its numerous applications.
## 3.2 Definitions and a question
We suppose that there is given an abstract set P of ‘pictures.’
Definition. A card C(S,p) is a pair consisting of a finite set S (the ‘label
set’) of positive integers, and a picture p ∈ P. The weight of C is n = |S|.
A card of weight n is called standard if its label set is [n].*
* Recall that [n] is the set {1,2,...,n}.3.3 Examples of exponential families 75
Definition. A hand H is a set of cards whose label sets form a partition
of [n], for some n.
This means that if n denotes the sum of the weights of the cards in the
hand, then the label sets of the cards in H are pairwise disjoint, nonempty,
and their union is [n].
Definition. The weight of a hand is the sum of the weights of the cards
in the hand.
Definition. A relabeling of a card C(S,p) with a set S0
is defined if |S| =
|S0
|, and it is the card C(S0
,p). If S0
= [|S|] then we have the standard
relabeling of the card.
Definition. A deck D is a finite set of standard cards whose weights are
all the same and whose pictures are all different. The weight of the deck is
the common weight of all of the cards in the deck.
Definition. An exponential family F is a collection of decks D1, D2,...
where for each n = 1,2,..., the deck Dn is of weight n.
If F is an exponential family, we will write dn for the number of cards
in deck Dn, and we will call D(x), the egf of the sequence {dn}∞
1 , the deck
enumerator of the family.
Question: Given an exponential family F. For each n ≥ 0 and k ≥ 1, let
h(n,k) denote the number of hands H of weight n that consist of k cards,
and are such that each card in the hand is a relabeling of some card in
some deck in F. Repetitions are allowed. That is, we are permitted to take
several copies of the same card from one deck, and to relabel those copies
with different label sets.
How can we express h(n,k) in terms of d1,d2,d3,..., where di is the
number of different cards in deck Di (i ≥ 1)?
If h(n,k) is the number of hands H of weight n that have exactly k
cards, then we introduce the 2-variable generating function
H(x,y) =
X
n,k≥0
h(n,k)
xn
n!
yk
. (3.2.1)
This is a generator of mixed type; it is an opsgf with respect to the y
variable and an egf with respect to x. We will call it the 2-variable hand
enumerator of the family.
If h(n) =
P
k h(n,k) is the number of hands of weight n without regard
to the number of cards in it, then we write H(x) for the egf of {h(n)},
instead of H(x,1). It is the 1-variable hand enumerator of F.
One way to answer the question raised above would be to exhibit a
simple relationship between the generating functions H(x,y) and D(x),
and that, of course, is exactly what we are about to do (see (3.4.4) below
for a look at the answer).76 3 Cards, Decks, and Hands: The Exponential Formula
## 3.3 Examples of exponential families
Before we get on with the business of answering the question that
was raised in the previous section, here are a few examples of exponential
families that have important roles in combinatorial theory.
Example 1.
The first exponential family that we will describe is the family of all
vertex-labeled, undirected graphs. We will call this family F1.
A graph G is a set of vertices some pairs of which are designated as
edges. A labeled graph is a graph that has a positive integer associated
with each vertex. The integers (‘labels’) are all different. The graph has
the standard labeling if the set of its vertex labels is [n], where n is the
number of vertices of G.
There are
¡n
2
¢
possible edges in graphs of n vertices, so there are 2(n
2)
labeled graphs of n vertices. For instance, there are 8 labeled graphs of 3
vertices, and these are shown in Fig. 3.2 (graphs are drawn by first drawing
the n vertices and then, between each pair of vertices that is designated as
an edge, drawing a line).
Some graphs are connected and some are disconnected. A graph is con-
nected if, given any pair of vertices, we can walk from one to the other along
edges in the drawing of the graph. Otherwise, the graph is disconnected.
Of the 8 graphs of 3 vertices, shown in Fig. 3.2, 4 are connected, namely
the last 4 that are pictured there.
Now let’s describe our exponential family.
First, we describe a card C(S,p). There is a card corresponding to
every connected labeled graph G. The set S is the set of vertex labels that
is used in the graph.
Before we can describe the ‘picture’ on the card we need to say what
a standard relabeling of a graph is. Let G be a graph of n vertices that are
labeled with a set S of labels. Then relabel the vertices with [n], preserving
the order of the labels. That is, the vertex that had the smallest label in
S will then get label 1, etc. Therefore the standard relabeling is uniquely
defined.
Now, if G is a labeled, connected graph, the picture p on the card
C(S,p) that corresponds to G is the standard relabeling of G. Hence, on
a card C we see two things: a picture of a connected graph with standard
labels, and another set of labels, of equal cardinality.
For instance, one card of weight 3 might be
(S,p) =
¡
{5,9,11}, 1 3 2 ¢
which would correspond to the connected labeled graph
5 11 93.3 Examples of exponential families 77
So cards correspond to connected graphs with not-necessarily-standard
label sets.
What is a hand? A hand is a collection of cards whose label sets
partition [n], where n is the weight of the hand, which is to say, it is the
total number of vertices in all of the connected graphs on all of the cards
of the hand. But that is something very useful; a hand H corresponds
to a not-necessarily-connected graph with standard labels! Its individual
connected components may have nonstandard labels, but the graph itself
uses exactly the labels 1,2,...,n, where n is its number of vertices.
In summary then, the set of all vertex labeled graphs forms an expo-
nential family. Each card is a labeled connected graph, each deck Dn is
the set of all connected standard labeled graphs of n vertices, each hand
is a standard (not-necessarily-connected) labeled graph. The number dn of
cards in the nth deck is the number of standard connected labeled graphs
of n vertices, and the number h(n,k) of hands of weight n with k cards
is the number of standard labeled graphs of n vertices with k connected
components. The question posed at the end of the last section in this case
asks for the relationship between the numbers of all labeled graphs and all
connected labeled graphs of all sizes.
Example 2.
In this example we will find that the set of all permutations can be
thought of as an exponential family.
First let’s say what the cards are. On a card, the picture will show n
points arranged in a circle, the points being labeled with the set [n], in some
order, and there will be arrowheads around the circle, all pointing clockwise,
to tell us that the points are arranged in clockwise circular sequence.
So much for the ‘picture’ part of the card. Additionally, there is a set
S of n positive integers on the card.
The reader will recognize that such a card corresponds to a cyclic
permutation of the elements of S, i.e., a permutation of S that has a single
cycle. For instance, the card whose picture is shown in Fig. 3.3
5
2
3
1
4
Fig. 3.3: A cyclic permutation is in the cards.
and whose set is S = {2,4,7,9,10} represents the cyclic permutation
2 −→ 7 −→ 4 −→ 10 −→ 9 −→ 2
of the set S.78 3 Cards, Decks, and Hands: The Exponential Formula
Now what is a deck of these cards? The cards in a deck are standard
cards, and they consist of one sample of every distinct standard card of a
given weight. In this case the nth deck Dn contains exactly (n − 1)! cards,
one for each cyclic permutation of [n].
So far we have accounted for the permutations with one cycle. They
are the building blocks out of which all permutations are constructed, using
hands of cards.
So what is a hand, in this example? A hand is a collection of cards,
and on each card there are two things: a cyclic permutation and a label
set. The label sets are pairwise disjoint and their union is {1,2,...,n}.
The cardinality of the label set on each card matches that of the cyclic
permutation that is shown there. The collection of all of the cards in the
hand represents a permutation of n letters. The cycles of this permutation
are the ones shown on the individual cards of the hand after the cycle on
each card has been relabeled, in an order-preserving way, with the elements
of the label set on the card.
Since every permutation of n letters has a unique decomposition into
cycles, we see that hands of weight n correspond exactly to permutations of
n letters.
Hence the set of all permutations is an exponential family. We call it
F2.
How many cards are in deck Dn? There are dn = (n−1)! of them. The
question raised at the end of the last section asks for the number h(n,k)
of hands of weight n and k cards. Such a hand represents a permutation
of n letters that has k cycles. Hence in this case h(n,k) is the number of
permutations of n letters that have k cycles. When we have our general
theorems in place, the ones that give the relationships between the dn’s
and the h(n,k)’s, we’ll learn a lot about permutations of various kinds with
given numbers and sizes of cycles. Later, in chapter 5, we’ll return to this
subject and re-use these generating functions to get asymptotic information
about permutations and their cycles.
## 3.4 The main counting theorems
In this section we will state and prove various forms of the exponential
formula. The next section contains 109
applications of the method.
First, let two exponential families be given. We will say what it means
to merge them. Roughly, it means to form a new family whose decks of
each weight are the unions of the decks of those weights in the two given
families. Some care is necessary, however, to insure that the two decks have
all different cards, so we will now give a precise definition.
Let F0
and F00
be two exponential families whose picture sets P0
, P00
are disjoint. We form a third family F, and write F = F0
⊕F00
, as follows:3.4 The main counting theorems 79
fix n ≥ 1. From F0
we take all of the d0
n cards of deck D0
n and put them
in a new pile. Then from F00
we take all d00
n of its cards from deck D00
n and
add these d00
n cards to the pile, which now contains dn = d0
n + d00
n different
cards. Repeat this for each n ≥ 1.
The Fundamental Lemma of Labeled Counting. Let F0
, F00
be two
exponential families, and let F = F0
⊕ F00
be their merger. Further, let
H0
(x,y), H00
(x,y), H(x,y) be the respective 2-variable hand enumerators
of these families. Then
H(x,y) = H0
(x,y)H00
(x,y).
Proof. Consider a hand H in the merged family F. Some of its cards
came from F0
and some came from F00
. The collection of cards that came
from F0
forms a sub-hand H0
of weight, say, n0
, and having k0
cards, that
has been relabeled, in an order-preserving way, with a certain label set
S ⊂ [n]. All hands H in the merged family are uniquely determined by a
particular hand H0
from F0
, the choice of new labels S with which that
hand is to be relabeled, and the remaining subhand H00
from F00
, which
must be relabeled, again preserving the order of the labels, with [n] − S.
Consequently the number of hands in the merged family that have
weight n and have exactly k cards is
h(n,k) =
X
n0,k0
µ
n
n0
¶
h0
(n0
,k0
)h00
(n − n0
,k − k0
)
=
·
xn
n!
yk
¸
H0
(x,y)H00
(x,y),
(3.4.1)
and we are finished.
The main idea is that the processes of merging families and of mul-
tiplying egf’s correspond exactly. The fact that in equation (3.4.1) the n0
variable in the sum carries a binomial coefficient along in its wake, while
the k0
does not, accounts for the mixed nature of the generating function
that was chosen, with the ‘x’ variable being egf-like and the ‘y’ variable
ops-like.
The Fundamental Lemma will allow us to build up the general rela-
tionship between deck and hand enumerators very easily, in a ‘Sorcerer’s
Apprentice’ fashion, beginning with a trickle and ending with a flood. We
begin with a starkly simple exponential family that consists of exactly one
nonempty deck that has just one card in it. The hand enumerator there
will be obvious. Then we consider a family that has a number of cards in
one deck, and no other decks. Finally we jump to the general situation, at
each stage using the Fundamental Lemma, because we will be carrying out
a merging operation.80 3 Cards, Decks, and Hands: The Exponential Formula
Step 1: The trickle.
Fix a positive integer r. Let the rth deck, Dr, contain exactly one card,
and let all other decks be empty. The deck counts are dr = 1 and all other
dj = 0. The deck enumerator is D(x) = xr
/r!. A hand H consists of some
number, say s, of copies of the one card that exists. The weight of H is rs.
Therefore the number of hands of k cards and of weight n is h(n,k) = 0
unless n = kr. If n = kr, then how many hands of weight n are there? We
can choose the labels for the first card in
¡n
r
¢
ways, for the second in
¡n−r
r
¢
ways, etc, for the kth card in
¡n−(k−1)r
r
¢
= 1 way. Since the order of the
labeled cards is immaterial, the number of hands is therefore
h(kr,k) =
1
k!
n!
r!k
.
The hand enumerator of this elementary family is therefore
H(x,y) =
X
n,k
h(n,k)xn
yk
/n!
=
X
k
xkr
yk
k!r!k
= exp
½
yxr
r!
¾
.
(3.4.2)
We won’t have to do any more computation to get the general result;
the Fundamental Lemma will do it for us.
Step 2: The flow
Fix positive integers r and dr, and consider an exponential family F
that has dr cards in its rth deck Dr, and has no other nonempty decks. We
claim that the hand enumerator of this family is
H(x,y) = exp
½
ydrxr
r!
¾
. (3.4.3)
The proof is by induction on dr. The claim is correct when dr = 1, for
that is (3.4.2). Suppose the claim is true for dr = 1,2,...,m − 1, and let
the family F have m cards in its rth deck. Then F is the result of merging
a family with m−1 cards in the rth deck and a family with 1 card in that
deck. By the inductive hypothesis and the Fundamental Lemma, the hand
enumerator is the product
exp{y(m − 1)xr
/r!}exp{yxr
/r!} = exp{ymxr
/r!},
and the claim is proved.
Step 3: The flood.
We are now ready to prove the main counting theorem.3.5 Permutations and their cycles 81
Theorem 3.4.1 (The exponential formula). Let F be an exponential
family whose deck and hand enumerators are D(x) and H(x,y), respec-
tively. Then
H(x,y) = eyD(x)
. (3.4.4)
In detail, the number of hands of weight n and k cards is
h(n,k) =
·
xn
n!
¸½
D(x)k
k!
¾
. (3.4.5)
Proof. In (3.4.3) we have proved this result in the special case where
there is only one nonempty deck. But a general exponential family with
a full sequence of nonempty decks D1,D2,... is the merger of the special
families Fr (r = 1,2,...), each of which has just a single nonempty deck Dr.
By the Fundamental Lemma, the hand enumerator of the general family
is the product of the hand enumerators of the special families. But the
generating function (3.4.4) claimed in the theorem is indeed the product of
the enumerators (3.4.3) of the special families Fr, and the proof is finished.
By summing (3.4.5) over all k we obtain the following:
Corollary 3.4.1. Let F be an exponential family, let D(x) be the egf of
the sequence {dn}∞
1 of sizes of the decks, and let H(x) egf
← → {hn}∞
0 , where
hn is the number of hands of weight n. Then
H(x) = eD(x)
. (3.4.6)
By summing (3.4.5) over just those k that lie in a given set T, we
obtain
Corollary 3.4.2 (The exponential formula with numbers of cards
restricted). Let T be a set of positive integers, let eT (x) =
P
n∈T xn
/n!,
and let hn(T) be the number of hands whose weight is n and whose number
of cards belongs to the allowable set T. Then
{hn(T)}∞
0
egf
← → eT (D(x)). (3.4.7)
The next several sections of this chapter will contain applications of
the exponential formula.
## 3.5 Permutations and their cycles
We apply the theorems to the exponential family F2 of permutations,
that was described in example 2 of section 3.3. There we observed that the82 3 Cards, Decks, and Hands: The Exponential Formula
deck Dn contains dn = (n−1)! cards. The exponential generating function
of the sequence {(n − 1)!}∞
1 is
D(x) =
X
n≥1
(n − 1)!
xn
n!
=
X
n≥1
xn
n
= log
1
1 − x
.
Now from theorem 3.4.1 we have
H(x,y) = exp
½
y log
1
1 − x
¾
=
1
(1 − x)y
.
(3.5.1)
In this exponential family, h(n,k) is the number of permutations of n
letters that have k cycles, and it is called the Stirling number of the first
kind. We will use one of the standard notations,
£n
k
¤
*, for these numbers,
and will reserve the h(n,k) for the general situation.
Now,
X
k
·
n
k
¸
yk
=
·
xn
n!
¸
(1 − x)−y
= n!
µ
y + n − 1
n
¶
(by (2.5.7))
= y(y + 1)···(y + n − 1),
(3.5.2)
so the numbers of permutations of n letters with various numbers of cycles
are the coefficients in the expansion of the ‘rising factorial’ function y(y +
1)···(y + n − 1).
The enumerator of hands of k cards is obviously
1
k!
½
log
1
1 − x
¾k
(k = 1,2,...),
which tells us that the Stirling number is also given by
·
n
k
¸
=
·
xn
n!
¸
1
k!
½
log
1
1 − x
¾k
. (3.5.3)
* There are as many notations for
£n
k
¤
as there are books on combina-
torics. It is called (−1)k
s(n,k) or s1(n,k), or s(n,k), or c(n,k), or several
other things. Similarly the
©n
k
ª
are called s2(n,k) or S(n,k), etc.3.7 A subclass of permutations 83
One thing that we don’t find is a simple little formula for these Stirling
numbers. One can find formulas for them, but they’re fairly unpleasant,
involving double sums of summands with sign alternations, etc. But with
the generating function apparatus we can do just about whatever we want
to without such a formula. To calculate numerical values of the
£n
k
¤
, for in-
stance, one can use the very simple recurrence relations that can be derived
from these generating functions (see Exercise 8).
## 3.6 Set partitions
We introduce a new exponential family F3, as follows: first, for each
n ≥ 1, in the deck Dn there is just one card of weight n. On that card
there is a picture of a smiling rabbit,* and there is the label set [n].
What is a hand? There is a hand H corresponding to every partition
of the set [n]. Indeed, given such a partition, take the sets in it and let
them relabel the label sets on the cards in the hand. Then the cards are
otherwise uniquely determined since there’s only one card of each weight.
So in this exponential family the number of hands of weight n that have
k cards is equal to the number of partitions of the set [n] into k classes.
But that is something we’ve met before, in example 6 of chapter 1, where
we called those numbers
©n
k
ª
, the Stirling numbers of the second kind.
To apply the exponential formula we first compute the egf of the num-
bers dn of cards in each deck. But these numbers are all 1, if n ≥ 1, and
are 0 else, so
D(x) =
X
n
dn
xn
n!
=
X
n≥1
xn
n!
= ex
− 1.
Now by the exponential formula the enumerator of hands is
H(x,y) = ey(ex
−1)
, (3.6.1)
and in particular ½
n
k
¾
=
·
xn
n!
¸½
(ex
− 1)k
k!
¾
. (3.6.2)
Compare this result with the generating function (1.6.12) of the Bell num-
bers and find that we have here a refinement of that generating function.
Not only does eex
−1
generate the numbers of partitions of n-sets, but each
term of the expansion
eex
−1
=
X
k≥0
(ex
− 1)k
k!
has significance with respect to the numbers of classes in the partitions.
* Why not? Since there’s only one card the picture is immaterial, so it
might as well be cheerful.84 3 Cards, Decks, and Hands: The Exponential Formula
3.7 A subclass of permutations
How many permutations σ of n letters have the property that σ has
an even number of cycles and all of them are of odd lengths?
This problem takes place in an exponential family that is like the family
F2 of permutations, except that it contains only the decks of odd weights,
D1,D3,.... The numbers {dn}∞
1 that count the cards in the decks are now
1, 0, 2, 0, 24, 0, 720, .... The egf of the deck counts is
D(x) =
X
n odd
(n − 1)!
xn
n!
=
X
r≥0
x2r+1
2r + 1
= log
r
1 + x
1 − x
by (2.5.2).
Since the number of cycles is required to be even, the allowable numbers
of cards in a hand are the set T=the even numbers. By (3.4.7), the egf of
the answer is
cosh
(
log
r
1 + x
1 − x
)
=
1
√
1 − x2
=
X
m≥0
µ
2m
m
¶
(x/2)2m
.
The number of permutations that meet the conditions of the problem is the
coefficient of xn
/n! here, namely
µ
n
n
2
¶
n!
2n
.
That’s one way to answer the question, but the answer can be restated
in quite a striking form, like this-
Theorem 3.7.1. Let a positive integer n be fixed. The probabilities of
the following two events are equal:
(a) a permutation is chosen at random from among those of n letters,
and it has an even number of cycles, all of whose lengths are odd
(b) a coin is tossed n times and exactly n/2 heads occur.
## 3.8 Involutions, etc.
Fix positive integers m,n. How many permutations σ, of n letters,
satisfy σm
= 1, where ‘1’ is the identity permutation?
To do this problem, we need the following:3.9 2-regular Graphs 85
Lemma. For σm
= 1 it is necessary and sufficient that all of the cycle
lengths of σ be divisors of m.
Proof. Consider a cycle C of σ, of length r. Let i be some letter that
is in C. Then, by definition of a cycle, σm
(i) is the letter on C that we
encounter by beginning at i and moving m steps around the cycle, namely
the letter that is m mod r steps around C from i. But σm
(i) = i. Therefore
m mod r = 0, i.e., r divides m. Therefore m is a multiple of the length of
every cycle of C. The converse is clear, and the proof is finished.
Now back to the problem. Consider the exponential family F4 in which
the cards are the usual ones for cycles of permutations, but in which the
only decks that occur are those whose weights are divisors of m. Then
dr = (r − 1)! if r\m, and is 0 else. Hence
D(x) =
X
r≥1
drxr
/r! =
X
d\m
xd
d
. (3.8.1)
By the exponential formula (theorem 3.4.1) we have the following elegant
result:
Theorem 3.8.1. Fix m > 0. The numbers of permutations of n letters
whose mth power is the identity permutation have the generating function
exp
µX
d\m
(xd
/d)
¶
. (3.8.2)
Let’s try a special case of this theorem. Take m = 2. Then we are
talking about permutations whose square is 1. These are called involutions.
Involutions can have cycles of lengths 1 or 2 only, by the lemma above. If
tn is the number of involutions of n letters, then by (3.8.2) we have
X
n≥0
tn
n!
xn
= ex+1
2
x2
. (3.8.3)
3.9 2-regular Graphs
How many undirected, labeled graphs are there on n vertices, in which
every vertex is of degree 2 (such graphs are called 2-regular)?
Such a graph is a disjoint union of undirected cycles, so we have an ex-
ponential family F5 in which the cards stand for undirected cycles, instead
of directed ones, as in the case of permutations.
For fixed n ≤ 2 there are no undirected cycles at all. For n ≥ 3, the
number dn of cards in the nth deck is the number of undirected circular86 3 Cards, Decks, and Hands: The Exponential Formula
arrangements of n letters, and that number is (n − 1)!/2. Therefore the
generating function of the deck sizes is
D(x) =
X
n≥3
(n − 1)!
2n!
xn
=
1
2
X
n≥3
xn
/n
=
1
2
½
log
1
1 − x
− x −
x2
2
¾
.
By the exponential formula (3.4.4), the exponential generating function of
the number g(n) of undirected 2-regular labeled graphs is
X
n≥0
g(n)
xn
n!
= exp
½
1
2
log
1
1 − x
−
x
2
−
x2
4
¾
=
e−1
2 x−1
4 x2
√
1 − x
.
(3.9.1)
This answer is a sparkling example of the ability of the generating function
method to produce answers to difficult counting problems with minimal
effort.
## 3.10 Counting connected graphs
How many labeled, connected graphs of n vertices are there?
Now we’re back in the exponential family F1 of labeled graphs, but
there are one or two little twists. The exponential formula can tell you the
number of all gadgets of each size if you know the number of connected
ones, or vice versa. This problem is ‘vice versa.’ The number of all labeled
graphs of n vertices is 2(n
2), so in the equation ‘Hands =eDecks
’ we know
‘Hands’ and we want to find ‘Decks,’ rather than the other way around.
There’s one more twist. Let D(x) and H(x) be the egf’s of the decks
and the hands, respectively. Then
H(x) =
X
n≥0
2(n
2)
n!
xn
,
and this series does not converge for any x 6= 0. So this is a formal power
series generating function only, and we should not expect analytic functions
at the end of the road.
Having said all of that, the machinery still works very nicely. We
will now find a recurrence formula for the number of connected graphs by
the ‘xDlog’ method of section 1.6. It isn’t any harder to find a general
recurrence relation than for this special case, however, so let’s do it in
general.3.11 Counting labeled bipartite graphs 87
Theorem 3.10.1. The counting sequences {dn} and {hn}, of decks and
hands in an exponential family satisfy the recurrence
nhn =
X
k
µ
n
k
¶
kdkhn−k (n ≥ 1;h0 = 1). (3.10.1)
Proof. Apply the ‘xDlog’ method of section 1.6 to the exponential formula
(3.4.6).
It follows that the numbers dn of connected labeled graphs of n vertices
satisfy the recurrence
n2(n
2) =
X
k
µ
n
k
¶
kdk2(n−k
2 ) (n ≥ 1). (3.10.2)
From this formula we are able, for example, to compute the dn’s for small
n. For n = 1,...,6 we find the values 1, 1, 4, 38, 728, 26704.
## 3.11 Counting labeled bipartite graphs
How many bipartite vertex-labeled graphs of n vertices are there?
The exponential formula can handle even this problem with just a little
bit of coaxing. A bipartite graph G is a graph whose vertex set V (G) can
be partitioned into V = A ∪ B such that every edge of G is of the form
(a,b), where a ∈ A and b ∈ B. A bipartite graph of 10 vertices is shown in
Fig. 3.4.
9
6
4
1
10
8
7
5
3
2
Fig. 3.4: A bipartite graph
Now, of the 2(n
2) labeled graphs of n vertices, how many are bipartite?
Well, there’s a little problem. The exponential formula can count the
hands if you can count the decks, or it can count the decks if you can count
the hands. But it can’t do both, and in this problem it isn’t immediately
clear how many connected bipartite graphs there are or how many there
are altogether.
A thought might be to choose the sets A, B of the partition [n] = A∪B,
and then count the bipartite graphs that have that partition. The latter
is easy; since there are |A||B| possible edges, there must be 2|A||B|
ways to
exercise the freedom to draw or not to draw all of those edges.88 3 Cards, Decks, and Hands: The Exponential Formula
The problem is that a fixed bipartite graph might get counted several
times in the process. In other words, there may be several ways to exhibit
a partition of the vertex set with all edges running between vertices in
different classes. For instance, the graph G of Fig. 3.4 would turn up
several times: once with A = {1,4,6,9}, again with A = {2,3,5,7,8,10},
again with A = {1,4,5,9}, etc.
In general, a bipartite graph that has c connected components would
be created 2c
times by the construction that we are considering, the reason
being that for each connected component Gi of G we can choose which of
the two sets in its vertex partition, Ai or Bi, will get put on the left hand
side, in A, and which on the right hand side, in B.
To get around this conundrum we use slightly different playing cards.
By a 2-colored bipartite graph we mean a vertex-labeled bipartite graph G
together with a coloring of the vertices of G in two colors (‘Red,’ ‘Green’),
such that whenever (v,w) is an edge of G, then v and w have different
colors.
A connected bipartite graph, for instance, creates two 2-colored graphs.
A bipartite graph with c connected components creates 2c
such 2-colored
graphs.
In the exponential family F6 that we are making, there will be a card
C corresponding to each 2-colored connected labeled bipartite graph. Im-
printed on the card there will be, as always, S, the set of vertex labels
that are used, and a picture of a 2-colored, connected bipartite graph of |S|
vertices with standard vertex labels.
What have we gained by coloring the cards? Just this: we now know
how many hands of weight n there are. That number is
γn =
X
k
µ
n
k
¶
2k(n−k)
, (3.11.2)
because each and every hand arises exactly once from the following con-
struction:
(i) fix an integer k, 0 ≤ k ≤ n.
(ii) choose k of the elements of [n] and color them ‘Red.’
(iii) color the remaining elements of [n] ‘Green.’
(iv) decide independently for each vertex pair (ρ,γ), where ρ is Red
and γ is Green, whether or not to make (ρ,γ) an edge.
It is obvious that (3.11.2) counts the possible outcomes of the con-
struction.
So, even though we are in the wrong exponential family, because things
are colored that we wish weren’t, at least we know how many hands there
are!
Next, let’s use the exponential formula to find the egf for the decks,
which correspond to connected 2-colored bipartite graphs. It tells us in-3.12 Counting labeled trees 89
stantly that
D(x) = log
½X
n≥0
γn
n!
xn
¾
, (3.11.3)
where γn is defined by (3.11.2).
Now that we have the connected colored graphs counted, is it hard to
count the connected uncolored graphs? Not at all, because there are just
half as many uncolored and connected as there are colored and connected.
So the egf of ordinary, uncolored connected bipartite graphs is D(x)/2,
where D(x) is given by (3.11.3).
But now we have achieved, in the correct exponential family, the ob-
jective that we had not reached before: we know how many cards there are
in each deck. So we know one of the two items that the exponential formula
relates, and therefore we can find the other one.
Since D(x)/2 generates the deck counts, it must be that
eD(x)/2
= exp
½
1
2
log
½X
n≥0
γn
n!
xn
¾¾
=
sX
n≥0
γn
n!
xn
(3.11.4)
generates the hand counts, and we have:
Theorem 3.11.1. Let β(n) denote the number of vertex labeled bipartite
graphs of n vertices. Then
X
n≥0
β(n)
n!
xn
=
sX
n≥0
γn
n!
xn, (3.11.5)
where the γn are given by (3.11.2).
So all of the complications about multiple counting were resolved by
taking the square root of the generating function that we started with!
## 3.12 Counting labeled trees
A tree is a connected graph that has no cycles. How many (standard)
labeled trees of n vertices are there?
In this example we will derive the answer to that question in the form
of one of the most famous results in combinatorics, namely:
Theorem 3.12.1. For each n ≥ 1 there are exactly nn−2
labeled trees of
n vertices.
Although many proofs are known, the one by generating functions,
which uses the exponential formula, is particularly enchanting, and here it
is:90 3 Cards, Decks, and Hands: The Exponential Formula
A rooted tree is a tree that has a distinguished vertex called the root.
There are obviously n times as many labeled rooted trees of n vertices as
there are trees, so we will be finished if we can count the rooted ones.
Let tn be the number of rooted trees (with standard labels) of n vertices
for n ≥ 1. We define an exponential family F7 as follows. The cards
correspond to rooted labeled trees. On a card C(S,p), p is a picture of a
standard rooted tree of |S| vertices, and S is a set of labels.
In F7, what is a hand? A hand H corresponds to a rooted labeled
forest, which is a labeled graph each of whose connected components is a
rooted tree. The exponential formula will tell us how many forests there
are if we know how many trees there are, or vice versa. But this is one of
those unsettling situations where we know neither. The solution? Press on,
and keep the faith.
By the exponential formula,
H(x) = eD(x)
, (3.12.1)
where H(x) egf
← → {fn}, D(x) egf
← → {tn} and fn is the number of rooted forests
of n vertices. Now (3.12.1) is one equation in two unknown functions. To
get another one we use a fact that was discovered by Pólya, namely that
tn+1 = (n + 1)fn (n ≥ 0). (3.12.2)
To prove (3.12.2), let F be a rooted labeled forest of n vertices. In-
troduce a new vertex v, and assign to it a label j, where 1 ≤ j ≤ n + 1.
Relabel F with the set 1,2,...,j − 1,j + 1,...,n + 1, preserving the or-
der of the labels. Then draw edges between v and all of the roots of the
components of F, and root the resulting tree at v. The result is a rooted
labeled tree of n + 1 vertices. As we vary the label j, we construct n + 1
rooted trees corresponding to each rooted forest F. The construction is
easily reversible, so every rooted tree of n+ 1 vertices occurs exactly once,
which proves (3.12.2).
The sequence fn = tn+1/(n + 1) has the egf
H(x) =
X
n≥0
fn
n!
xn
=
X
n≥0
tn+1
(n + 1)!
xn
=
1
x
D(x).
If we combine this with (3.12.1) we get
D(x) = xeD(x)
. (3.12.3)3.13 Exponential families and polynomials of ‘binomial type.’ 91
Now, in previous problems where there was an unknown generating
function it has always happened that we obtained some sort of functional
equation that had to be solved in order to find the function. We have seen
situations where the equation was a differential equation, and others where
it was a quadratic equation. In (3.12.3) we have a functional equation that
is to be solved for D(x), which in fact determines D(x) uniquely, but which
is not a differential equation or an algebraic equation, and whose solution
isn’t obvious at all.
There is a powerful tool for dealing with this kind of a functional
equation, called the Lagrange Inversion Formula, which will be discussed
in section 5.1. There we will finish the enumeration of trees as an illustration
of the use of the Lagrange formula.
## 3.13 Exponential families and polynomials of ‘binomial type.’
Associated with each exponential family there is a sequence of polyno-
mials
φn(y) =
X
k
h(n,k)yk
(n = 0,1,2,...), (3.13.1)
where h(n,k) is the number of hands of weight n and k cards. In view
of the exponential formula (3.4.4) these polynomials satisfy the generating
relation
eyD(x)
=
X
n≥0
φn(y)
n!
xn
. (3.13.2)
Polynomial sequences that satisfy (3.13.2) have been called polynomials of
binomial type by Rota and Mullin [RM]. The reason for the name is that
since
euD(x) egf
← → {φn(u)}; evD(x) egf
← → {φn(v)};
it follows that
φn(u + v) =
X
r
µ
n
r
¶
φr(u)φn−r(v) (n ≥ 0),
which is reminiscent of the binomial theorem.
Although various authors have given combinatorial interpretations for
such polynomial sequences, the very natural interpretation that appears
above seems not to have been discussed. That interpretation is: when
the coefficients of polynomials {φn(y)} of binomial type are nonnegative,
then there exists an exponential family F such that for each n ≥ 0, φn(y)
generates the hands of weight n, by numbers of cards. Conversely, every
exponential family has a family of polynomials of binomial type associated
with it.92 3 Cards, Decks, and Hands: The Exponential Formula
## 3.14 Unlabeled cards and hands
In the remainder of this chapter we will consider the same kinds of
problems, except that there will be no label sets to worry about. This
would seem to simplify things, and it does in some respects, but not in all.
We will be concerned with how many structures (hands) can be built out
of given building blocks (cards).
A card C = C(n,p) now has only its weight n and its picture p. For
each n = 1,2,... there is a deck Dn that contains dn cards, all of weight n.
A hand is a multiset of cards. That is, we may reach into one of the decks
Dr and pull out of it some number of copies of a single card C(r,p0
), then a
number of copies of C(r,p00
), and so forth, then from another deck we can
take more cards, etc.
No significance attaches to the sequence of cards in the hand. What
matters is which cards have been selected and with which multiplicities.
The weight of a hand is the sum of the weights of the cards in the hand,
taking account of their multiplicities. As before, we let h(n,k) be the
number of hands of weight n that contain exactly k cards, and we let
H(x,y) =
X
n,k
h(n,k)xn
yk
. (3.14.1)
Notice that the ‘n!’ is missing in the assumed form of the generating func-
tion. Instead of the mixed egf-ops that was appropriate for labeled counting,
a pure ops is the way to go for unlabeled counting.
We need a generic name for the systems that we are constructing. We
will call them prefabs (instead of exponential families, which applies in the
labeled case), and will use letters like P to represent them.
Thus a prefab P consists of a sequence of decks D1,D2,... from which
we can form hands, as described above. In P we let D(x) ops
← → {dn}∞
1 .
The main problem is to find the functional relationship between H(x,y)
and D(x), so let’s do that now. We will use the Sorcerer’s Apprentice
method once more.
For the trickle, consider a prefab P that consists of just one nonempty
deck, Dr, and suppose that Dr contains only a single card.
In this prefab, a hand H is a fairly simple-minded thing. It consists of
some number, k say, of copies of the one and only card that there is, and
its weight will be n = rk. Hence in this prefab the number h(n,k) of hands
of weight n that have exactly k cards is 1 if n = rk and is 0 else. Thus
H(x,y) =
X
n,k
h(n,k)xn
yk
=
X
k≥0
1 · xrk
yk
=
1
1 − yxr
.
(3.14.2)3.14 Unlabeled cards and hands 93
Next, just as in section 3.4, we define the merge operation. If P0
and
P00
are prefabs whose picture sets are disjoint, then by their merger P =
P0
⊕P00
we mean the prefab whose deck Dn, for each n, is the union of the
corresponding decks of P0
and P00
. If there were d0
n, d00
n cards, respectively,
in those two decks, then there are dn = d0
n + d00
n cards in Dn.
Fundamental lemma of unlabeled counting. Let H0
(x,y), H00
(x,y)
and H(x,y) be the hand enumerators of prefabs P0
, P00
and P = P0
⊕ P00
,
respectively. Then H = H0
H00
.
Proof. Consider a hand H ∈ P, of weight n, and containing exactly k
cards. Some k0
of those cards come from P0
, and their total weight is, say,
n0
, while the remaining k − k0
cards come from P00
, and their total weight
must be n − n0
. Thus
h(n,k) =
X
k0,n0
h0
(n0
,k0
)h00
(n − n0
,k − k0
),
but, by a strange coincidence, that is exactly the relationship which holds
between the coefficients of the power series H, H0
and H00
.
Armed with the fundamental lemma, we can now consider a slightly
more complicated prefab Pr, which still contains just one nonempty deck
Dr, but now that deck contains dr different cards. By induction on dr =
1,2,..., we see at once that the hand enumerator of this prefab is
H(x,y) =
1
(1 − yxr)dr
. (3.14.3)
Finally (déjá vu anybody?), in a general prefab P in which there are
dn cards in deck Dn, for each n = 1,2,3,..., we observe that P = ⊕∞
n=1Pn,
where the Pn are as defined in the previous paragraph. We obtain at once:
Theorem 3.14.1. In a prefab P whose hand enumerator is H(x,y) we
have
H(x,y) =
∞ Y
n=1
1
(1 − yxn)dn
, (3.14.4)
where dn is the number of cards in the nth deck (n ≥ 1).
This is the analogue of the exponential formula in the case where there
are no labels. Like the exponential formula, this one too has an astounding
number of elegant applications, and we will discuss a number of them in
the sequel. Before we get to that, let’s convert (3.14.4) into a formula from
which we could actually compute the h’s from the d’s, using the ‘yDlog’
method of section 1.6.94 3 Cards, Decks, and Hands: The Exponential Formula
If we take the logarithm of both sides of (3.14.4),
logH(x,y) =
∞ X
s=1
log
1
(1 − yxs)ds
=
X
s≥1
ds log
1
(1 − yxs)
=
X
s≥1
ds
X
m≥1
ym
xsm
m
=
X
n,m≥1
d n
m
xn ym
m
,
where dj is to be interpreted as 0 if its subscript is not a positive integer.
Next we differentiate with respect to y and multiply by yH, getting
y
∂H(x,y)
∂y
= H(x,y)
X
n,m≥1
xn
ym
d n
m
.
Finally, we take [xn
ym
] of both sides, which yields
mh(n,m) =
X
r,m0≥1
h(n − rm0
,m − m0
)dr (n,m ≥ 1;h(n,0) = δn,0).
(3.14.5)
This recurrence holds in any prefab, and permits the numerical computation
of the hand counts from the deck counts.
Often the 2-variable deck enumerators H(x,y) or {h(n,k)}n,k≥0 give
more detail than is necessary. If hn =
P
k h(n,k) is the number of hands
of weight n, however many cards they contain, and if
H(x) ops
← → {hn}∞
0 ,
then, since we obtain H(x) from H(x,y) by formally replacing y by 1, the
general counting theorem (3.14.4) becomes
H(x) =
∞ Y
r=1
1
(1 − xr)dr
. (3.14.6)
The recurrence (3.14.5) can be replaced by
nhn =
X
m≥1
Dmhn−m (n ≥ 1;h0 = 1), (3.14.7)
where Dm =
P
r\m rdr (m = 1,2,...).3.15 The money changing problem 95
Considerably more detailed information can be obtained with just a
little more effort. Suppose we restrict the multiplicities with which the
cards can be used in hands. For instance, suppose we decree that every
card that appears in a hand must appear there with multiplicity that is
divisible by 3, etc. Then what can be said about the number of hands?
Let W be a fixed set of nonnegative integers, containing 0. For each
n and k we let h(n,k;W) be the number of hands of weight n that have
exactly k cards (counting multiplicities!), each appearing with a multiplicity
that belongs to W. Let
H(x,y;W) =
X
n,k
h(n,k;W)xn
yk
.
Finally, let
w(t) =
X
k∈W
tk
. (3.14.8)
The generating functions are again multiplicative under merger of pre-
fabs with disjoint picture sets. Consider a prefab with just 1 card of weight
r, and no other decks. Then h(n,k;W) = 1 if k ∈ W and n = kr, and is 0
otherwise, and so
H(x,y;W) =
X
k∈W
xkr
yk
= w(yxr
).
If there are dr cards in the rth deck, and no other cards, then H(x,y;W) =
w(yxr
)dr
, and finally we obtain:
Theorem 3.14.2. Let the prefab P contain decks of sizes d1,d2,..., and
let W be a set of nonnegative integers, 0 ∈ W. If h(n,k;W) is the number of
hands of k cards of weight n, such that each card appears with a multiplicity
that belongs to W, then
H(x,y;W) =
X
n,k
h(n,k;W)xn
yk
=
Y
r≥1
w(yxr
)dr
, (3.14.9)
where w(t) is given by (3.14.8).
Observe that the theorem reduces to theorem 3.14.1 in the case where
W = Z+
, the set of all nonnegative integers.
A noteworthy special case is W = {0,1}, which means that we can
choose a card for our hand or not, but we can’t take more than one copy
of it. In that case (3.14.9) gives
H(x,y;{0,1}) =
Y
r≥1
(1 + yxr
)dr
=
1
H(x,−y;Z+)
.
(3.14.10)96 3 Cards, Decks, and Hands: The Exponential Formula
We proceed with several examples of the use of these formulas.
## 3.15 The money changing problem
Suppose that in the coinage of a certain country there are 5-cent coins,
11-cent coins, and 37-cent coins. In how many ways can we make change
for $17.19?
In general terms, we are given M positive integers
1 ≤ a1 < a2 < ··· < aM,
and we ask the following question: for each positive integer n, in how many
ways can we write
n = x1a1 + x2a2 + ··· + xMaM (∀i : xi ≥ 0), (3.15.1)
where the x’s are integers? This problem is of great importance in a number
of areas, both pure and applied, and it has a very beautiful theory, some of
which we will give here.
For given a1,...,aM we write S = S(a1,...,aM) for the set of all n
that can be written in the form (3.15.1). S is a semigroup of nonnegative
integers.
First let’s identify the prefab P in which everything will be happening.
The decks are almost all empty. The only decks that are not empty are the
M decks Da1
,...,DaM
. Each of these contains just a single card. Hence
the deck enumerating sequence is
dn =
n
1 if n = a1,...,aM
0 else.
In a sense, then, the problem is all over. If h(n,k) denotes the number
of ways of making change that use exactly k coins, i.e., the number of
representations (3.15.1) in which
P
i xi = k, then according to the main
counting theorem (eq. (3.14.4)) we have
H(x,y) =
1
(1 − yxa1)(1 − yxa2)···(1 − yxaM )
. (3.15.2)
If hn is the number of ways of representing n without regard to the number
of coins, then from the cruder formula (3.14.6)
H(x) =
1
(1 − xa1)(1 − xa2)···(1 − xaM )
. (3.15.3)
Even though the generating functions are known, substantial questions
remain. Here are a few of them.3.15 The money changing problem 97
How can we describe the set S? That is, which sums of money can be
changed? Given 8-cent and 12-cent coins only, it wouldn’t be reasonable
to expect to make change for 53 cents. In general, if the greatest common
divisor of the set {a1,...,aM} is g > 1, then only multiples of g can be
represented. But suppose that g = 1, i.e., that the ai’s are relatively prime.
Then which integers are representable? The central result of this subject is
due to I. Schur. It states that S then contains all sufficiently large integers,
i.e. there exists an integer N such that every integer n ≥ N is representable
in the form (3.15.1).
The smallest integer N that has the property stated in the theorem will
be called the conductor of the set S = {a1,...,aM}, and will be denoted
by the symbol κ = κ(S).
For instance, every integer ≥ 8 can be represented as a nonnegative
integer linear combination of 3 and 5, and 7 cannot be so represented, so
κ({3,5}) = 8.
The problem of determining the conductor of a set S exactly seems to
be of enormous difficulty. There are no general ‘formulas’ for the conductor
if M ≥ 3, and no good algorithms for calculating it if M ≥ 4. The case
M = 2 is already very pretty, and the answers are known, so here they are:
Theorem 3.15.1. Let a and b be relatively prime positive integers. Then
(a) every integer n ≥ κ = (a − 1)(b − 1) is of the form n = xa + yb,
x,y ≥ 0, and
(b) the integer κ − 1 is not of that form, and
(c) of the integers 0,1,2,...,κ−1, exactly half are representable and
half are not.
Proof. (Our proof follows [NW]) Since gcd(a,b) = 1, we can certainly write
every integer m as xa + yb if x,y can have either sign. The representation
is unique if we require that 0 ≤ x < b. Then m ∈ S if y ≥ 0, and m / ∈ S if
y < 0. The largest integer that is not representable is therefore obtained by
choosing x = b−1, y = −1. Hence κ(S) is one unit larger than (b−1)a−b,
and parts (a) and (b) of the theorem are proved.
To prove (c), let 0 ≤ m < κ(S), and again consider the unique way of
writing m = xa + yb , with 0 ≤ x < b. Then
m0
= κ − 1 − m = (b − 1 − x)a + (−1 − y)b.
Now 0 ≤ b − 1 − x < b, so if y ≥ 0 then m is representable and m0
is not,
while if y < 0 then m0
is representable and m is not. Hence exactly half of
the numbers 0,1,...,κ − 1 are representable.
Now we’re going to prove Schur’s theorem. The idea of the proof is
that we will consider (without ever writing it down) the partial fraction
expansion of the right side of (3.15.3). Among the multitude of terms that
occur there we will identify one term whose power series coefficients grow
more rapidly than any other, and this will give the desired result.98 3 Cards, Decks, and Hands: The Exponential Formula
The generating function H(x) in (3.15.3) is a rational function whose
poles all lie on the unit circle |x| = 1. In fact, the poles are at various roots
of unity.
What are the multiplicities of these poles? The point x = 1 is a pole of
multiplicity M, because the denominator of H(x) is divisible by (1 − x)M
.
Let ω = e2πir/s
be a primitive (i.e., gcd(r,s) = 1) sth root of 1. What is
the multiplicity with which this point x = ω occurs as a pole of H(x)? It
is equal to the number of ai’s that are divisible by s. Since the ai’s are
relatively prime, it cannot be that all of them are divisible by s.
Therefore x = 1 is a pole of order M of H(x), and every other pole
has multiplicity < M.
Suppose ω is a pole of order r. Then the portion of the partial fraction
expansion of H that comes from ω is of the form
c1
(1 − x/ω)r
+
c2
(1 − x/ω)r−1
+ ···.
Now refer to the power series expansion (2.5.7), which we repeat here:
1
(1 − x)k+1
=
X
n≥0
µ
n + k
k
¶
xn
.
If k = 1, the coefficients of this expansion are linear functions of n. If
k = 2 they are quadratic functions of n. In general, the coefficients of xn
are growing, as n → ∞, like nk
/k!.
The contribution of one fixed pole of order r to the coefficient sequence
of H(x) therefore grows like cnr−1
. There is one pole, at x = 1, of order M.
Its portion of the partial fraction expansion contributes ∼ cnM−1
to the nth
coefficient of H(x). Since all other poles have strictly lower multiplicities,
none of them can alter the asymptotic rate of growth that is contributed by
the principal pole at x = 1. Hence, for n → ∞ we have hn ∼ cnM−1
. That
certainly implies that for all large enough values of n we will have hn 6= 0,
and that finishes the proof. However, as long as we’re here, why not find
out the value of c also?
The partial fraction expansion of H(x) is of the form
H(x) =
1
(1 − xa1)(1 − xa2)···(1 − xaM )
=
c
(1 − x)M
+ O((1 − x)−M+1
).
To calculate c, multiply both sides by (1 − x)M
and let x → 1. This gives
c = 1/(a1 ···aM). Thus we get a growth estimate along with the proof of
the theorem.3.15 The money changing problem 99
Theorem 3.15.2 (Schur’s theorem). If hn denotes the number of rep-
resentations of n as a nonnegative integer linear combination of a1,...,aM,
these being a relatively prime set of positive integers, then
hn ∼
nM−1
(M − 1)!a1a2 ···aM
(n → ∞). (3.15.4)
In particular, there exists an integer N such that every n ≥ N is so repre-
sentable in at least one way.
Example 1.
Given two relatively prime integers a, b. Find an explicit formula for
f(n), the number of ways to change n cents using those coins.
From (3.15.3) we have
X
n
f(n)xn
=
1
(1 − xa)(1 − xb)
, (3.15.5)
so what remains is a partial fraction expansion. We find
1
(1 − xa)(1 − xb)
=
A
(1 − x)2
+
B
(1 − x)
+
X
ωa=1
ω6=1
Cω
1 − x/ω
+
X
ζb=1
ζ6=1
Dζ
1 − x/ζ
.
(3.15.6)
As regards the constants, we already know that A = 1/(ab), from
(3.15.4). To find B, multiply (3.15.6) by (1 − x)2
, differentiate, and let
x = 1. This gives B = (a+b−2)/(2ab). To find Cω, multiply by (1−x/ω)
and let x = ω. The result is that Cω = 1/(a(1−ωb
)), and similarly for Dζ.
Finally we take the coefficient of xn
throughout (3.15.6) to get the formula
f(n) =
n
ab
+
a + b
2ab
+
X
ωa=1
ω6=1
Cω
ωn
+
X
ζb=1
ζ6=1
Dζ
ζn
. (3.15.7)
If we examine the two sums that appear in (3.15.7) as functions of n, we
see that each of them is a periodic function of n. The first sum is periodic of
period a and the second is periodic of period b. The sum of these two sums
is therefore periodic of period ab. We have therefore found that the number
of ways to change n cents into coins of a- and b-cent denominations is
f(n) =
n
ab
+
a + b
2ab
+ per(n), (3.15.8)
where per(n) is periodic of period ab, and is on the average 0.
We might like to see this periodicity in action, so let’s take a = 3 and
b = 5. A good way to compute the numbers f(n) is to use the recurrence100 3 Cards, Decks, and Hands: The Exponential Formula
formula that is implicit in the generating function (3.15.5). If we use the
xDlog method on (3.15.5), we find the recurrence in the form
nf(n) = 3
X
j≥1
f(n − 3j) + 5
X
j≥1
f(n − 5j) (n ≥ 1;f(0) = 1), (3.15.9)
with the understanding that f(m) = 0 if m < 0. Table 3.1 shows n, f(n),
and 15(f(n) − (n/15) − (4/15)) (which is periodic of period 15, according
to (3.15.8)).
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
1 0 0 1 0 1 1 0 1 1 1 1 1 1 1
11 −5 −6 8 −8 6 5 −11 3 2 1 0 −1 −2 −3
15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
2 1 1 2 1 2 2 1 2 2 2 2 2 2 2
11 −5 −6 8 −8 6 5 −11 3 2 1 0 −1 −2 −3
Table 3.1
## 3.16 Partitions of integers
A partition of a positive integer n is a representation
n = r1 + r2 + ··· + rk (r1 ≥ r2 ≥ ··· ≥ rk ≥ 1). (3.16.1)
The numbers r1,...,rk are the parts of the partition. Hence (3.16.1) is a
partition of n into k parts.
There are 7 partitions of 5, namely 5=5, =4+1, =3+2, =3+1+1,
=2+2+1, =2+1+1+1, =1+1+1+1+1. The number of partitions of n is de-
noted by p(n), and p(n,k) is the number of partitions of n into k parts.The
investigation of the deeper properties of p(n) was one of the jewels of 20th
century analysis, involving researches of Hardy and Ramanujan and further
work by Rademacher, the result of which was an exact closed formula for
p(n) that was at the same time a complete asymptotic series. The whole
story can be found in Andrews [An].
From our point of view, the theory of partitions is the case of the
money-changing problem where coins of every positive integer size are avail-
able. Thus, theorem 3.14.1 gives us immediately an opsgf of the partition
function in the form of the reciprocal of an infinite product,
X
n,k≥0
p(n,k)xn
yk
=
1
(1 − yx)(1 − yx2)(1 − yx3)(1 − yx4)···
(p(0,k) = δ0,k).
(3.16.2)3.16 Partitions of integers 101
With y = 1 we find
X
n≥0
p(n)xn
=
1
(1 − x)(1 − x2)(1 − x3)(1 − x4)···
(p(0) = 1) (3.16.3)
as the generating function for {p(n)} itself.
At the other extreme, we can think about partitions with constrained
parts and constrained multiplicities of parts. Let two sets W, of nonnegative
integers, and R, of positive integers, be given, with 0 ∈ W. Let p(n,k;W,R)
be the number of partitions of n into k parts such that all of the parts lie
in R, and all of their multiplicities lie in W. Then from (3.14.9)
X
n,k
p(n,k;W,R)xn
yk
=
Y
r∈R
Ã
X
k∈W
yk
xkr
!
. (3.16.4)
From this generating function we can prove many theorems about parti-
tions.
Example 1.
Let W = {0,1}, R = {1,2,...}. Then p(n,k;W,R) is the number of
partitions of n into k distinct parts, and we have
X
n,k
p(n,k;{0,1},Z+
)xn
yk
=
Y
r≥1
(1 + yxr
). (3.16.5)
If we let y = 1 we obtain
X
n
p(n;{0,1},Z+
)xn
=
Y
r≥1
(1 + xr
)
=
Y
r≥1
1 − x2r
1 − xr
=
(1 − x2
)(1 − x4
)···
(1 − x)(1 − x2)(1 − x3)(1 − x4)···
=
1
(1 − x)(1 − x3)(1 − x5)(1 − x7)···
.
The last member, however, generates the partitions of n into odd parts,
and we have a generating function proof of:
Theorem 3.16.1. For each n = 1,2,3,..., the number of partitions of n
into odd parts is equal to the number of partitions of n into distinct parts.
For instance, the partitions of 5 into odd parts are 5, 3+1+1, and
1+1+1+1+1, while its partitions into distinct parts are 5, 4+1, and 3+2.102 3 Cards, Decks, and Hands: The Exponential Formula
Theorem 3.16.1 was discovered by Euler. A great many proofs of it have
been given. Some of the most interesting proofs are bijective; that is, they
give explicit constructions that match each partition into odd parts with a
partition into distinct parts.
Example 2.
Now let W = {0,1,...,q} and R = Z+
. The right side of (3.16.4)
becomes
Y
r≥1
(1 + tr
+ ··· + tqr
) =
Y
r≥1
µ
1 − tr(q+1)
1 − tr
¶
.
Each factor in the numerator of this product cancels one in the denominator,
leaving in the denominator only those factors in which r is not divisible by
q + 1. This proves the following result, which reduces to theorem 3.16.1
when q = 1.
Theorem 3.16.2. Fix q ≥ 1. For each n ≥ 1, the number of partitions
of n into parts that are not divisible by q + 1 is equal to the number of
partitions of n in which no part appears more than q times.
## 3.17 Rooted trees and forests
A rooted tree is a tree whose vertices are unlabeled, except that one
of them is distinguished as ‘the root.’
In section 3.12 we counted labeled trees, using the exponential formula.
Here we will count unlabeled, rooted trees. On each card in a deck Dn there
is now the integer n and a picture of a rooted tree of n vertices. The deck
D4 is shown in Fig. 3.5.
4 4 4 4
R R R R
Fig. 3.5: The rooted trees of 4 vertices
A hand of weight n and k cards is, in this case, a rooted forest of n
vertices and k connected components (rooted trees). If h(n,k) is the number
of these and if h(n) =
P
k h(n,k) is the number of all rooted forests of n
vertices, then by (3.14.6)
X
n
h(n)xn
=
Y
n≥1
1
(1 − xn)t(n)
, (3.17.1)3.18 Historical notes 103
where t(n) = h(n,1) is the number of rooted trees of n vertices.
Next, just as we found in the labeled case (see 3.12.2), there is a simple
relationship between the number of rooted forests of n vertices and of rooted
trees of n+1 vertices: they are equal. Just add a new vertex r to the forest,
call it the new root, connect it to all of the former roots of the trees in the
forest, and there is the rooted tree that corresponds to the given forest.
Hence h(n) = t(n + 1) (n ≥ 0). Then (3.17.1) takes the form
X
n
t(n + 1)xn
=
Y
n≥1
1
(1 − xn)t(n)
. (3.17.2)
This equation in fact determines all of the numbers {t(n)}. It is, however,
a fairly formidable equation, and we should not expect simple formulas for
these numbers.
## 3.18 Historical notes
The exponential formula first appeared in the thesis of Riddell [RU],
in the form of counting connected labeled graphs from a knowledge of the
number of all labeled graphs. Since then the idea has been generalized and
extended by several researchers.
In [BG], and at about the same time in [FS], significant extensions
of the idea were made to very general labeled and unlabeled applications,
by Bender and Goldman and by Foata and Schützenberger. The former
introduced ‘prefabs’ and the latter used the ‘composé partitionnel.’ Further
developments of the method can be found in Stanley ([St1], [St2]) who
worked with a partition-based approach, in Joyal [Jo] who used functorial
methods in his theory of ‘species,’ in Beissinger [Bei], and in Garsia and
Joni [GaJ].
The approach taken in this book is most closely akin to the composé
partitionnel. The suggestion to cast the discussion in terms of cards, decks,
and hands was made to me in private conversation by Adriano Garsia, when
I showed him a set of lecture notes of mine that were based on the graph-
theoretical point of view. I think that his suggestion affords maximum
clarity of the ideas along with maximum generality of applications.104 3 Cards, Decks, and Hands: The Exponential Formula
Exercises
1. Give an explicit 1-1 correspondence between partitions of n into distinct
parts and partitions of n into odd parts.
2. Fix integers n,k. Let f(n,k) be the number of permutations of n letters
whose cycle lengths are all divisible by k. Find a simple, explicit egf for
{f(n,k)}n≥0. Find a simple, explicit formula for f(n,k). (Hint: You might
need the discussion at the end of section 3.4.)
3. Find the egf for the partitions of the set [n], all of whose classes have a
prime number of elements.
4. In a group Γ, the order of an element g is the least positive integer ρ
such that gρ
= 1Γ.
(a) In the group of all permutations of n letters, express the order of
a permutation σ in terms of the lengths of its cycles.
(b) Let g(n,k) be the number of permutations of n letters whose or-
der is k. Express g(n,k) in terms of the number g̃(n,m) of n-
permutations whose cycle lengths all divide m.
5. Let Tn be the number of involutions of n letters.
(a) Find a recurrence formula that is satisfied by these numbers.
(b) Compute T1,...,T6.
(c) Give a combinatorial and constructive interpretation of the re-
currence. That is, after having derived it from the generating
function, re-derive it without the generating function.
6. Find, in simple form, the egf of the sequence of numbers of permutations
of n letters that have no cycles of lengths ≤ 3. Your answer should not
contain any infinite series.
7. Find the generating function for labeled graphs with all vertices of
degrees 1 or 2, and an odd number of connected components. Find a
recurrence formula for these numbers, calculate the first few, and draw the
graphs involved.
8. From (3.5.2) find a three term recurrence relation that is satisfied by
the Stirling numbers of the first kind. Give a direct combinatorial proof of
this recurrence relation. That is, reprove it, without using any generating
functions.
9. As in section 3.7, find the egf of the numbers {g(n)}∞
0 of permutations
of n letters that have both of the following two properties: (a) they have
an odd number of cycles and (b) the lengths of all of their cycles are even.
Find a simple, explicit formula for these numbers.
10. Find an explicit formula for
©n
k
ª
, the Stirling number of the second
kind by expanding the kth power that appears in (3.6.2) by the binomialExercises 105
theorem. Your formula should be in the form of a single finite sum.
11. Let S,T be fixed sets of positive integers. Let f(n;S,T) be the number
of partitions of [n] whose class sizes all lie in S and whose number of classes
lies in T. Show that {f(n;S,T)}n≥0 has the egf eT (eS(x)), where eS(x) = P
s∈S xs
/s!.
12. Fix k > 0. Let f(n,k) be the number of permutations of n letters
whose longest cycle has length k. Find the egf of {f(n,k)}n≥0, for k fixed.
13. If T(x) and G(x) denote, respectively, the egf’s of involutions, in (3.8.3),
and of 2-regular graphs, in (3.9.1), then observe that
T(x)G(x)2
=
1
1 − x
.
(a) Write out the identity between the sequences {g(n)}, {tn} that is
implied by the above generating function relation.
(b) Show that for each fixed n ≥ 1 there are exactly the same numbers
of
(i) permutations of n letters and of
(ii) triples (τ,G1,G2), where τ is an involution of a set R, G1
is a 2-regular graph on a vertex set S, G2 is a 2-regular
graph on a vertex set T, and R,S,T partition [n].
(c) Find, explicitly, a 1-1 correspondence such as is described in part
(b) above.
14. Let F be an exponential family with associated polynomials {φn(x)}
of binomial type, and with deck enumerator D(x).
(a) If Dy denotes the differential operator ∂/∂y, then show that
D(−1)
(Dy)φn(y) = nφn−1(y) (n ≥ 0)
by directly applying the operator to the egf of the polynomial
sequence (here D(−1)
denotes the inverse function in the sense of
functional composition).
(b) In the case of the exponential family of permutations by cycles,
find the associated polynomials of binomial type, and verify the
identity proved in part (a) by direct computation with those poly-
nomials.
15. In an exponential family F, let h̃(n) be the number of hands of weight
n whose cards have all different weights.
(a) Show that
X
n≥0
h̃(n)
n!
xn
=
∞ Y
k=1
½
1 +
dk
k!
xk
¾
.106 3 Cards, Decks, and Hands: The Exponential Formula
(b) Let pn be the probability that a permutation of n letters has cycles
whose lengths are all different. Then
{pn} ops
← →
Y
k≥1
½
1 +
xk
k
¾
.
(c) If p(x) denotes the generating function in part (b) above, deter-
mine the growth of p(x) as x → 1−
. Do this by inserting additional
factors of e−xk
/k
in the product.
16. Let numbers {cn} be defined by
xx
= 1 +
X
n≥1
cn
n!
(x − 1)n
.
Show that each cn is an integer multiple of n, and in fact is a multiple of
n(n − 1) if and only if n − 1 divides (n − 2)!.
17. Here we want to show that the Stirling numbers of the first and second
kinds are inverse to each other, in a certain sense. In the generating function
(3.5.2) for the former, replace x by 1/x and compare with the generating
function (1.6.5) for the latter. Multiply the functions together so that the
hard part cancels out. Read off the coefficient of xn
in what remains, and
state it as an assertion that a certain pair of matrices, each involving Stirling
numbers, are inverses of each other.
18. Let an be the number of unlabeled graphs of n vertices each of whose
connected components is a path or a cycle. Let F(x) be the opsgf of the
sequence {an}. Find F(x) and express it in terms of Euler’s opsgf for the
sequence {p(n)} of the numbers of partitions of integers n.
19. Let an be the number of unlabeled rooted trees of n vertices in which
the degree of the root is 2. That is, there are exactly 2 edges incident at
the root. Let T(x) be the opsgf of the sequence {tn} that counts all rooted
trees of n vertices. Show that
X
n
anxn−1
=
1
2
µ
T(x)2
+ T(x2
)
¶
.
20. Find the largest integer that is not of the form 6x + 10y + 15z where
x,y,z are nonnegative integers. Prove that your answer is correct, i.e., that
your integer is not so representable, and that every integer larger than it is
so representable.
21. In a country that has 1-cent, 2-cent, and 3-cent coins only, the number
of ways of changing n cents is exactly the integer nearest to (n + 3)2
/12.
22. This exercise develops a considerable sharpening of the exponential
formula, that will be used again in section 4.7.3.18 Historical notes 107
(a) In an exponential family F, the number of hands of weight n that
contain exactly a1 cards of weight 1 and a2 cards of weight 2 and
a3 of weight 3 and ..., where a1 +2a2 +··· = n, is the coefficient
of (tn
xa1
1 xa2
2 ···)/n! in the expansion of
exp
©X
i≥1
xiditi
i!
ª
.
(b) Let f(n,r,s) be the number of partitions of the set [n] that have
exactly r classes of size 1 and exactly s classes of size 2 (however
many classes of other sizes they may have). Then
X
n,r,s
f(n,r,s)xr
ys tn
n!
= exp
¡
xt +
yt2
2
+ et
− 1 − t −
t2
2
¢
.108 4 Applications of generating functions
Chapter 4
Applications of generating functions
## 4.1 Generating functions find averages, etc.
Power series generating functions are exceptionally well adapted to
finding means, standard deviations, and other moments of distributions,
with minimum work. Suppose f(n) is the number of objects, in a certain
set S of N objects, that have exactly n properties, for each n = 0,1,2,...,
with
P
n f(n) = N. What is the average number of properties that an
object in S has? Evidently it is
µ =
1
N
X
n
nf(n). (4.1.1)
Suppose we happen to be fortunate enough to be in possession of the
opsgf of the sequence {f(n)}, say F(x) ops
← → {f(n)}. Is there some convenient
way to express the mean µ of (4.1.1) in terms of F? But of course. Clearly,
µ = F0
(1)/F(1). So averages can be computed directly from generating
functions.
Let’s go to the next moment, the standard deviation σ, of the distri-
bution. This is defined as follows:
σ2
=
1
N
X
ω∈S
(n(ω) − µ)2
, (4.1.2)
where ω represents an object in the set S, and n(ω) is the number of prop-
erties that ω has. σ2
, which is known as the variance of the distribution,
is therefore the mean square of the difference between the number of prop-
erties that each object has and the mean number of properties µ.
Every one of the f(n) objects ω that has exactly n properties will
contribute (n − µ)2
to the sum in (4.1.2), and therefore
σ2
=
1
N
X
n
(n − µ)2
f(n)
=
1
N
X
n
(n2
− 2µn + µ2
)f(n)
=
1
N
{(xD)2
− 2µ(xD) + µ2
}F(x)|x=1
= (F00
(1) + (1 − 2µ)F0
(1) + µ2
F(1))/F(1)
= F00
(1)/F(1) + F0
(1)/F(1) − (F0
(1)/F(1))2
= {(logF)0
+ (logF)00
}x=1.
(4.1.3)4.1 Generating functions find averages, etc. 109
So the standard deviation can also be calculated in terms of the values of
F and its first two derivatives at x = 1.
Let’s work this out in exponential families. In an exponential family
F, what is the average number, µ(n), of cards in a hand of weight n?
If h(n,k) is the number of hands of weight n that have k cards, then
the average is
µ(n) =
1
h(n)
X
k
kh(n,k). (4.1.4)
Now if we begin with the exponential formula
X
n,k
h(n,k)
xn
n!
yk
= eyD(x)
the thing to do is to apply the operator ∂/∂y and then set y = 1. The
result is that
X
n
xn
n!
X
k
kh(n,k) = D(x)eD(x)
= D(x)H(x). (4.1.5)
Theorem 4.1.1. In an exponential family F, the average number of cards
in hands of weight n is
µ(n) =
·
h(n)xn
n!
¸
D(x)H(x)
=
1
h(n)
X
r
µ
n
r
¶
drh(n − r).
(4.1.6)
Example 1. Cycles of permutations
The averaging relations (4.1.6) are particularly happy if h(n) = n!, as
in the family of all permutations. There, (4.1.6) becomes
µ(n) =
1
n!
X
r
µ
n
r
¶
(r − 1)!(n − r)!
= 1 +
1
2
+
1
3
+ ··· +
1
n
.
Consequently, the average number of cycles in a permutation of n letters is
the harmonic number Hn.
What is the standard deviation? The function F(x) that appears in
(4.1.3), in the case of permutations, is, for n fixed,
F(x) =
X
k
h(n,k)xk
= x(x + 1)(x + 2)···(x + n − 1),110 4 Applications of generating functions
by (3.5.2). After taking logarithms and differentiating, following (4.1.3),
we find F(1) = n!, (logF)0
(1) = Hn, and
(logF)00
(1) = −1 − 1/4 − 1/9 − 1/16 − ··· − 1/n2
.
If we substitute this into (4.1.3), we find that the variance of the distribution
of cycles over permutations of n letters is
σ2
= Hn − 1 − 1/4 − 1/9 − ··· − 1/n2
= logn + γ − π2
/6 + o(1).
where γ is Euler’s constant.
Hence the average number of cycles is ∼ logn with a standard deviation
σ ∼
√
logn.
4.2 A generatingfunctionological view of the sieve method
The sieve method* is one of the most powerful general tools in com-
binatorics. It is explained in most texts in discrete mathematics, however
it most often appears as a sequence of manipulations of alternating sums
of binomial coefficients. Here we will emphasize the fact that generating
functions can greatly simplify the lives of users of the method.
We are given a finite set Ω of objects and a set P of properties that
the objects may or may not possess.** In this context, we want to answer
questions of the following kind: how many objects have no properties at
all? how many have exactly r properties? what is the average number of
properties that objects have? etc., etc.
The characteristic flavor of problems that the sieve method can handle
is that, although it is hard to see how many objects have exactly r proper-
ties, for instance, it is relatively easy to see how many objects have at least
a certain set of properties and maybe more.
What the method does is to convert the ‘at least’ information into the
‘exactly’ information.
To see how this works, if S ⊆ P is a set of properties, let N(⊇ S)
be the number of objects that have at least the properties in S. That is,
N(⊇ S) is the number of objects whose set of properties contains S.
For fixed r ≥ 0, consider the sum
Nr =
X
|S|=r
N(⊇ S). (4.2.1)
* A.k.a. ‘the principle of inclusion-exclusion,’ and often abbreviated as
‘p.i.e.’
** Strictly speaking, a property is just a subset of the objects, but in
practice we will usually have simple verbal descriptions of the properties.4.2 A generatingfunctionological view of the sieve method 111
Introduce the symbol P(ω) for the set of properties that ω has. Then we
can write Nr as follows:
Nr =
X
|S|=r
N(⊇ S)
=
X
|S|=r
X
ω∈Ω
S⊆P(ω)
1
=
X
ω∈Ω

 
 
X
|S|=r
S⊆P(ω)
1

 
 
=
X
ω∈Ω
µ
|P(ω)|
r
¶
.
(4.2.2)
Therefore every object that has exactly t properties contributes
¡t
r
¢
to
Nr. If there are et objects that have exactly t properties, then (4.2.2)
simplifies to
Nr =
X
t≥0
µ
t
r
¶
et (r = 0,1,2,...). (4.2.3)
Recall the philosophy of the method: the Nr’s are easier to calculate
than the er’s because they can be found from (4.2.1). However, the er’s are
what we want. Therefore it is desirable to be able to solve the equations
(4.2.3) for the e’s in terms of the N’s. But how can we do that? After all,
(4.2.3) is a set of simultaneous equations.
At first glance that might seem to be a tall order, but with a friendly
generating function at your side, it’s easy. Let N(x) and E(x) denote* the
opsgf’s of the sequences {Nr}, {er}, respectively. What relation between
the two generating functions is implied by the equations (4.2.3)?
Multiply (4.2.3) by xr
and sum on r. We then get
N(x) =
X
r
X
t
µ
t
r
¶
etxr
=
X
t
et
(
X
r
µ
t
r
¶
xr
)
=
X
t
et(x + 1)t
= E(x + 1).
(4.2.4)
* The letters ‘N’ and ‘E’ are intended to suggest the Nr’s and the word
‘Exactly.’112 4 Applications of generating functions
In the language of generating functions, the set of equations (4.2.3)
boils down to the fact that N(x) = E(x + 1). Now the problem of solving
for the e’s in terms of the N’s is a triviality, and the solution is obviously
E(x) = N(x − 1)
(4.2.5)
This is the sieve method. The act of replacing the variable x by x − 1 in
the generating function N(x) replaces the unfiltered data {Nr} by the sieved
quantities {er}.
If the N’s are known, then in principle we can read off the e’s as the
coefficients of N(x − 1).
For example, e0 is the number of objects that have no properties at
all. By (4.2.5),
e0 = E(0) = N(−1) =
X
t
(−1)t
Nt. (4.2.6)
It’s easy to find explicit formulas for all of the ej’s by looking at the coef-
ficient of xj
on both sides of (4.2.5). The result is
ej =
X
t
(−1)t−j
µ
t
j
¶
Nt. (4.2.7)
But (4.2.5) says it all, in a much cleaner fashion.
We will now summarize the sieve method, and then give a number of
examples of its use.
The Sieve Method
(A) (Find Ω and P) Given an enumeration problem, find a set of objects
and properties such that the problem would be solved if we knew
the number of objects with each number of properties.
(B) (Find the unfiltered counts N(⊇ S)) For each set S of properties,
find N(⊇ S), the number of objects whose set of properties contains
S.
(C) (Find the coefficients Nr) For each r ≥ 0, calculate the Nr by sum-
ming the N(⊇ S) over all sets S of r properties, as in (4.2.1).
(D) (The answer is here.) The numbers er are the coefficients of the
powers of x in the polynomial N(x − 1).
Before we get to some examples, we would like to point out that the
number N1 has a special role to play. According to (4.2.3), N1 =
P
t tet.
That, however, is what you would want to know if you were trying to4.2 A generatingfunctionological view of the sieve method 113
calculate the average number of properties that objects have. Hence it is
good to remember that when using the sieve method on a set of N objects,
the average number of properties that an object has is N1/N.
Example 1. The fixed points of permutations.
Of the n! permutations of n letters, how many have exactly r fixed
points?
Step (A) of the sieve method asks us to say what the set of objects is
and what the set of properties is. It is almost always worthwhile to be quite
explicit about these. In the case at hand, the set Ω of objects is the set of
all permutations of n letters. There are n properties: for each i = 1,...,n,
a permutation τ has property i if i is a fixed point of τ, i.e., if τ(i) = i.
With those definitions of Ω and P, it is indeed true that we would like
to know the numbers of objects that have exactly r properties, for each r.
In step (B) we must find the N(⊇ S). Hence let S be a set of properties.
Then S ⊆ [n] is a set of letters, and we want to know the number of
permutations of n letters that leave at least the letters in S fixed.
If a permutation leaves the letters in S fixed, then it can act freely
on only the remaining n − |S| letters, and so there are (n − |S|)! such
permutations. Hence
N(⊇ S) = (n − |S|)!.
For step (C) we calculate the Nr’s. But, for each r = 0,...,n,
Nr =
X
|S|=r
N(⊇ S) =
X
|S|=r
(n − |S|)! =
µ
n
r
¶
(n − r)! =
n!
r!
.
In step (D) we’re ready for the answers. It will save some writing if we
introduce the abbreviation exp|α for the truncated exponential series
exp|α(x) =
X
0≤r≤α
xr
r!
. (4.2.8)
Now we form the opsgf N(x) from the Nr’s that we just found:
N(x) =
n X
r=0
n!
r!
xr
= n!
n X
r=0
xr
r!
.
Then et is the coefficient of xt
in N(x − 1), i.e.,
E(x) =
X
t
etxt
= n!
n X
r=0
(x − 1)r
r!
= n!exp|n(x − 1). (4.2.9)
As an extra dividend, the average number of fixed points that permu-
tations of n letters have is
N1
N
=
n!
n!
= 1.114 4 Applications of generating functions
On the average, a permutation has 1 fixed point.
The number of permutations that have no fixed points at all is
e0 = E(0) = N(−1) = n!exp|n(−1) ∼
n!
e
. (4.2.10)
Finally, if we really want a formula for the et’s, it’s quite easy to find
from (4.2.9) that
et =
n!
t!
exp|(n−t)(−1)
∼ e−1 n!
t!
(n → ∞).
(4.2.11)
Example 2. The number of k-cycles in permutations.
Fix positive integers n,k, and r ≥ 0. How many permutations of n
letters have exactly r cycles of length k?
Whatever the answer is, it should at least have the good manners to
reduce to the answer of the previous example when k = 1, since a fixed
point is a cycle of length 1.
What are the objects and the properties? Evidently Ω is the set of all
permutations of n letters. Further, the set P of properties is the set of all
possible k-cycles chosen from n letters. How many such k-cycles are there?
The k letters can be chosen in
¡n
k
¢
ways, and they can be arranged around
a cycle in (k − 1)! ways, so we are facing a list of
¡n
k
¢
(k − 1)! properties.
Choose a set S of k-cycles from P. How many permutations have at
least the set S of properties? None at all, unless the sets of letters in those
cycles are pairwise disjoint. If the sets are pairwise disjoint, then there are
N(⊇ S) = (n−k|S|)! permutations that have at least all of those k-cycles.
Next we calculate Nr, the sum of N(⊇ S) over all sets of r properties.
The terms in this sum are either 0 or (n −kr)!. So we really need to know
only how many of them are not 0, that is, in how many ways we can choose
a set of r k-cycles from n letters in such a way that the cycles operate on
disjoint sets of letters.
The letters for the first cycle can be chosen in
¡n
k
¢
ways, and they can
be ordered around the cycle in (k−1)! ways. The letters for the second cycle
can then be chosen in
¡n−k
k
¢
ways, and ordered in (k−1)! ways, etc. Finally,
since the sequence in which the cycles are constructed is of no significance,
we divide by r!. Hence
Nr =
(n − kr)!
r!
n!(k − 1)!r
(k!)r(n − kr)!
=
n!
krr!
(0 ≤ r ≤ n/k).
(4.2.12)4.2 A generatingfunctionological view of the sieve method 115
We can get a little piece of the solution right here, with no more
work: the average number of k-cycles that permutations of n letters have
is N1/n! = 1/k.
The opsgf of {Nr} is
N(x) = n!
X
0≤r≤n/k
xr
krr!
= n!exp|(n/k)(
x
k
).
(4.2.13)
Finally, in the sieving step, we convert this to exact information by
replacing x by x − 1, to obtain
E(x) = n!exp|(n/k)
µ
x − 1
k
¶
. (4.2.14)
Example 3. Stirling numbers of the second kind.
The Stirling numbers
©n
k
ª
, which we studied in section 1.6, are the
numbers of partitions of a set of n elements into k classes. We can find out
about them with the sieve method if we can invent a suitable collection of
objects and properties. For the set Ω of objects we take the collection of all
kn
ways of arranging n labeled balls in k labeled boxes. Further, such an
arrangement will have property Pi if box i is empty (i = 1,...,k). Then
k!
©n
k
ª
is the number of objects that have exactly no properties.
Let S be some set of properties. How many arrangements of balls in
boxes have at least the set S of properties? If N(⊇ S) is that number, then
N(⊇ S) counts the arrangements of n labeled balls into just k−|S| labeled
boxes, because all of the boxes that are labeled by S must be empty.
There are obviously (k − |S|)n
such arrangements. Hence
N(⊇ S) =
½
(k − |S|)n
if |S| ≤ k,
0, else.
If we now sum over all sets S of r properties, we obtain for r ≤ k,
Nr =
µ
k
r
¶
(k − r)n
,
whose opsgf is
N(x) =
X
0≤r≤k
µ
k
r
¶
(k − r)n
xr
.
We can now invoke the sieve to find that the number of arrangements
that have exactly t empty cells is the coefficient of xt
in N(x − 1). On the116 4 Applications of generating functions
other hand, the number of arrangements that have exactly t empty cells is
clearly µ
k
t
¶
(k − t)!
½
n
k − t
¾
=
k!
t!
½
n
k − t
¾
.
The result is the identity
X
0≤r≤k
µ
k
r
¶
(k − r)n
(x − 1)r
= k!
X
0≤t≤k
½
n
k − t
¾
xt
t!
. (4.2.15)
If we put x = 0, we find the explicit formula (1.6.7) again.
If, on the other hand, we compare (4.2.15) with the rule (2.3.3) for
finding the coefficients of the product of two egf’s, we discover the following
remarkable identity:
X
1≤k≤n
½
n
k
¾
yk
= e−y
X
r≥1
rn
r!
yr
. (4.2.16)
This shows that e−y
times the infinite series is a polynomial! The special
case y = 1 has been previously noted in (1.6.10).
Example 4. Rooks on chessboards
For n fixed, a chessboard C is a subset of [n] × [n]. We are given C,
and we define a sequence {rk} as follows: rk is the number of ways we can
place k nonattacking (i.e., no two in the same row or column) rooks on C.
Next, let σ be a permutation of n letters. For each j we let ej denote the
number of permutations that ‘meet the chessboard C in exactly j squares,’
i.e., if the event (i,σ(i)) ∈ C occurs for exactly j values of i, 1 ≤ i ≤ n.
The question is, how can we find the ej’s in terms of the rk’s?
Let the objects Ω be the n! permutations of [n]. There will be a
property P(s) corresponding to each square s ∈ C. A permutation σ has
property P(s) if σ meets the mini-chessboard that consists of the single cell
s.
Let S be a set of properties, i.e., of cells in C, and consider the sum
Nk =
P
|S|=k N(⊇ S). Each arrangement of k nonattacking rooks on C
contributes (n−k)! to this sum. Indeed, when the set S corresponds to the
cells on which those rooks can be placed, then we are looking at k of the n
values of a permutation that hits C in at least k squares. The permutation
can be completed, in the remaining n − k rows, in (n − k)! ways.
Hence Nk = rk(n − k)!, for each k, 0 ≤ k ≤ n. Therefore
N(x) =
X
k
(n − k)!rkxk
,
and immediately we find that the number of n-permutations that hit C in
exactly j cells is
[xj
]
X
k
(n − k)!rk(x − 1)k
. (4.2.17)4.3 The ‘Snake Oil’ method for easier combinatorial identities 117
Example 5. A problem on subsets.
This example is more cute than profound, but we will at least finish
with a combinatorial proof of an interesting identity, as well as illustrating
the generating function aspect of the sieve method.
For a fixed positive n, take as our set Ω of objects the
¡2n
n
¢
ways
of choosing an n-subset of [2n]. For the set P of properties we take the
following list of n (not 2n) properties: an n-subset Q has property i if
i / ∈ Q, for each i = 1,2,...,n (note that we are working with only the first
half of the possible elements of S).
If S is a set of properties (i.e., is a set of letters chosen from [n]), then
the number of ‘objects’ Q that have at least that set of properties (i.e., are
missing at least all of the i ∈ S) is clearly
N(⊇ S) =
µ
2n − |S|
n
¶
.
Hence
Nr =
X
|S|=r
N(⊇ S) =
µ
n
r
¶µ
2n − r
n
¶
.
If we substitute these N’s into the sieve (4.2.5) we find that
X
j
ejtj
=
X
r
µ
n
r
¶µ
2n − r
n
¶
(t − 1)r
. (4.2.18)
This formula tells us the number ej of objects that have exactly j properties,
for each j.
But we didn’t need to be told that!
An object that has exactly j of these properties is a subset Q of [2n]
that is missing exactly j of the elements 1,2,...,n. Obviously there are
just
¡n
j
¢2
such subsets Q, because we can choose the j elements that they
are missing in
¡n
j
¢
ways, and we can then choose the other j elements that
are needed to fill the subset from n + 1,...,2n in
¡n
j
¢
ways also.
Thus, with no assistance from the sieve method, we already knew that
ej =
¡n
j
¢2
, for all j. Hence, according to (4.2.18), it must be true that
X
j
µ
n
j
¶2
tj
=
X
r
µ
n
r
¶µ
2n − r
n
¶
(t − 1)r
. (4.2.19)
We therefore have an odd kind of a combinatorial proof of the identity
(4.2.19). The reader should suspect that something of this sort is going on
whenever an identity involves an expansion around the origin on one side,
and an expansion around t = 1 on the other side.118 4 Applications of generating functions
## 4.3 The ‘Snake Oil’ method for easier combinatorial identities
Combinatorial mathematics is full of dazzling identities. Legions of
them involving binomial coefficients alone fill text- and reference books
(see below for some references). It is a fine skill for a working discrete
mathematician to have if he/she is able to evaluate or simplify complicated
looking sums that involve combinatorial numbers, because they have a way
of turning up in connection with problems in graphs, algorithms, enumer-
ation, etc. (they’re fun, too!).
In the past, one had to have built up a certain arsenal of special devices,
the more the better, in order to be able to trot out the correct one for
the correct occasion. Recently, however, a good deal of quite dramatic
systematization has taken place, and there are unified methods for handling
vast sub-legions of the legions referred to above.
In this section we are going to do two things. First we will give a single
method (the Snake Oil* method) that uses generating functions to deal
with the evaluation of combinatorial sums. That one method is capable
of handling a great variety of sums involving binomial coefficients, but
there’s nothing special about binomial coefficients in this respect. The
method also works beautifully, within its limitations, on sums involving
other combinatorial numbers. The philosophy is roughly this: don’t try
to evaluate the sum that you’re looking at. Instead, find the generating
function for the whole parameterized family of them, then read off the
coefficients.
Second, we will confess that Snake Oil doesn’t cure them all. Some
combinatorial sums are really hard. Many of the very hardest binomial
coefficient sums can now be proved by computers using the method of
rational functions, which we will discuss next. Not only that, but use
of the computer has resulted in some new proofs of classical identities.
The hallmarks of these proofs are that (a) they are very short compared
to the previously known proofs, (b) they seem extremely unmotivated to
the reader, but (c) nothing is left out, and they really are proofs. The
computerized proof techniques rely on a very simple-looking observation,
which we will describe and illustrate.
Therefore, in this section you can expect to see one unified method
that works on a lot of relatively easy sums, and one other unified method
that works on many more kinds of binomial coefficient sums, including some
fiendishly difficult ones.
First let’s talk about the Snake Oil method.
The basic idea is what I might call the external approach to identities
* The Random House Dictionary of the English Language defines ‘snake
oil’ as a purported cure for everything, and gives the example The governor
promised to lower taxes, but it was the same old snake oil. The date of the
expression is given as ‘1925-30, Amer.’4.3 The ‘Snake Oil’ method for easier combinatorial identities 119
rather than the usual internal method.
To explain the difference between these two points of view, suppose we
want to prove some identity that involves binomial coefficients. Typically
such a thing would assert that some fairly intimidating-looking sum is in
fact equal to such-and-such a simple function of n.
One approach that is now customary, thanks to the skillful exposition
and deft handling by Knuth in [Kn], and by Graham, Knuth and Patashnik
in [GKP], consists primarily of looking inside the summation sign (‘inter-
nally’), and using binomial coefficient identities or other manipulations of
indices inside the summations to bring the sum to manageable form.
The method that we are about to discuss is complementary to the in-
ternal approach. In the external, or generatingfunctionological, approach
that we are selling here, one begins by giving a quick glance at the expres-
sion that is inside the summation sign, just long enough to spot the ‘free
variables,’ i.e., what it is that the sum depends on after the dummy vari-
ables have been summed over. Suppose that such a free variable is called
n.
Then instead of trying to grapple with the sum, just sweep it all under
the rug, as follows:
The Snake Oil Method for Doing Combinatorial Sums
(a) Identify the free variable, say n, that the sum depends on. Give a
name to the sum that you are working on; call it f(n).
(b) Let F(x) be the opsgf whose [xn
] is f(n), the sum that you’d love
to evaluate.
(c) Multiply the sum by xn
, and sum on n. Your generating func-
tion is now expressed as a double sum over n, and over whatever
variable was first used as a dummy summation variable.
(d) Interchange the order of the two summations that you are now
looking at, and perform the inner one in simple closed form. For
this purpose it will be helpful to have a catalogue of series whose
sums are known, such as the list in section 2.5 of this book.
(e) Try to identify the coefficients of the generating function of the
answer, because those coefficients are what you want to find.
If that seems complicated, just wait till you see the next seven exam-
ples. By then it will seem quite routine.
The success of the method depends on favorable outcomes of steps
(d) and (e). What is surprising is the high success rate. It also has the
‘advantage’ of requiring hardly any thought at all; when it works, you know
it, and when it doesn’t, that’s obvious too.
We will adhere strictly to the customary conventions about binomial120 4 Applications of generating functions
coefficients and the ranges of summation variables. These are: first that the
binomial coefficient
¡x
m
¢
vanishes if m < 0 or if x is a nonnegative integer
that is smaller than m. Second, a summation variable whose range is not
otherwise explicitly restricted is understood to be summed from −∞ to ∞.
Thus we have, for integer n ≥ 0,
X
k
µ
n
k
¶
= 2n
,
in the sense that the sum ranges over all positive and negative and 0 values
of k, the summand vanishes unless 0 ≤ k ≤ n, and the sum has the value
advertised. These conventions will save endless fussing over changing limits
of summation when the dummy variables of summation get changed. For
example, we find that
X
k
µ
n
r + k
¶
xk
= x−r
X
k
µ
n
r + k
¶
xr+k
= x−r
X
s
µ
n
s
¶
xs
= x−r
(1 + x)n
,
for nonnegative integer n and integer r, without ever even thinking about
the ranges of the summation variables.
The series evaluations that are most helpful in the examples that follow
are, first and foremost,
X
r≥0
µ
r
k
¶
xr
=
xk
(1 − x)k+1
(k ≥ 0), (4.3.1)
which is basically a rewrite of (2.5.7). Also useful are the binomial theorem
X
r
µ
n
r
¶
xr
= (1 + x)n
(4.3.2)
and (2.5.11), which we repeat here for easy reference:
X
n
1
n + 1
µ
2n
n
¶
xn
=
1
2x
(1 −
√
1 − 4x). (4.3.3)
Example 1. Openers
Consider the sum
X
k≥0
µ
k
n − k
¶
(n = 0,1,2,...).
The free variable is n, so let’s call the sum f(n). Write it out like this:
f(n) =
X
k≥0
µ
k
n − k
¶
.4.3 The ‘Snake Oil’ method for easier combinatorial identities 121
OK, now multiply both sides by xn
and sum over n. You have now arrived
at step (c) of the general method, and you are looking at
F(x) =
X
n
xn
X
k≥0
µ
k
n − k
¶
.
Ready for step (d)? Interchange the sums, to get
F(x) =
X
k≥0
X
n
µ
k
n − k
¶
xn
.
We would like to ‘do’ the inner sum, the one over n. The trick is to
get the exponent of x to be exactly the same as the index that appears in
the binomial coefficient. In this example the exponent of x is n, and n is
involved in the downstairs part of the binomial coefficient in the form n−k.
To make those the same, the correct medicine is to multiply inside the sum
by x−k
and outside the inner sum by xk
, to compensate. The result is
F(x) =
X
k≥0
xk
X
n
µ
k
n − k
¶
xn−k
.
Now the exponent of x is the same as what appears downstairs in the
binomial coefficient. Hence take r = n − k as the new dummy variable of
summation in the inner sum. We find then
F(x) =
X
k≥0
xk
X
r
µ
k
r
¶
xr
.
We recognize the inner sum immediately, as (1 + x)k
. Hence
F(x) =
X
k≥0
xk
(1 + x)k
=
X
k≥0
(x + x2
)k
=
1
1 − x − x2
.
The generating function on the right is an old friend; it generates the Fi-
bonacci numbers (see Example 1.3 of chapter 1). Hence f(n) = Fn+1, and
we have discovered that
X
k≥0
µ
k
n − k
¶
= Fn+1 (n = 0,1,2,...).122 4 Applications of generating functions
Example 2. Another one
Consider the sum
X
k
µ
n + k
m + 2k
¶µ
2k
k
¶
(−1)k
k + 1
(m,n ≥ 0). (4.3.4)
Can it be that the same method will do this sum, without any further
infusion of ingenuity? Indeed; just pour enough Snake Oil on it and it will
be cured. Let f(n) denote the sum in question, and let F(x) be its opsgf.
Dive in immediately by multiplying by xn
and summing over n ≥ 0, to get
F(x) =
X
n≥0
xn
X
k
µ
n + k
m + 2k
¶µ
2k
k
¶
(−1)k
k + 1
=
X
k
µ
2k
k
¶
(−1)k
k + 1
x−k
X
n≥0
µ
n + k
m + 2k
¶
xn+k
=
X
k
µ
2k
k
¶
(−1)k
k + 1
x−k
X
r≥k
µ
r
m + 2k
¶
xr
=
X
k
µ
2k
k
¶
(−1)k
k + 1
x−k xm+2k
(1 − x)m+2k+1
(by (4.3.1))
=
xm
(1 − x)m+1
X
k
µ
2k
k
¶
1
k + 1
½
−x
(1 − x)2
¾k
=
−xm−1
2(1 − x)m−1
(
1 −
s
1 +
4x
(1 − x)2
)
=
−xm−1
2(1 − x)m−1
½
1 −
1 + x
1 − x
¾
=
xm
(1 − x)m
.
The original sum is now unmasked: it is the coefficient of xn
in the
last member above. But that is
¡n−1
m−1
¢
, by (4.3.1) again, and we have our
answer. See exercise 16 for a generalization of this sum.
If the train of manipulations seemed long, consider that at least it’s
always the same train of manipulations, whenever the method is used, and
also that with some effort a computer could be trained to do it!
Example 3. A discovery
Is it possible to write the sum
fn =
X
k≤n
2
(−1)k
µ
n − k
k
¶
yn−2k
(n ≥ 0) (4.3.5)4.3 The ‘Snake Oil’ method for easier combinatorial identities 123
in a simpler closed form?
This example shows the whole machine at work again, along with a
few new wrinkles. The first step is to let F ops
← → {fn}, and try to find the
generating function F instead of the sequence {fn}.
To do that we multiply (4.3.5) on both sides by xn
and sum over n ≥ 0
to obtain
F(x) =
X
n≥0
xn
X
k≤n
2
(−1)k
µ
n − k
k
¶
yn−2k
.
The next step is invariably to interchange the summations and hope. To
try to make the innermost summation as clean looking as possible, be sure
to take to the outer sum any factors that depend only on k. This yields
F(x) =
X
k
(−1)k
y−2k
X
n≥2k
µ
n − k
k
¶
xn
yn
.
Now focus on (4.3.1), and try to make the inner sum look like that. If in
our inner sum the powers of x and y were xn−k
yn−k
, then those exponents
would match exactly the upper story of the binomial coefficient
¡n−k
k
¢
, and
so after a change of dummy variable of summation we would be looking
exactly at the left side of (4.3.1).
Hence we next multiply inside the inner sum by x−k
y−k
, and outside
the inner sum by xk
yk
. Now we have
F(x) =
X
k
(−1)k
y−2k
xk
yk
X
n≥2k
µ
n − k
k
¶
xn−k
yn−k
=
X
k
(−1)k
xk
y−k
X
a≥k
µ
a
k
¶
(xy)a
=
X
k≥0
(−1)k
xk
y−k (xy)k
(1 − xy)k+1
(by (4.3.1))
=
1
1 − xy
X
k≥0
½
−x2
1 − xy
¾k
=
1
1 − xy
1
1 + x2
1−xy
=
1
1 − xy + x2
.
(4.3.6)
(Question: Why, after the third equals sign above, did the range of k get
restricted to ‘k ≥ 0’?)124 4 Applications of generating functions
We now expand (4.3.6) in partial fractions to obtain a closed form for
the sum (4.3.5). This gives
F(x) =
1
(1 − xx+)(1 − xx−)
=
x+
(x+ − x−)(1 − xx+)
−
x−
(x+ − x−)(1 − xx−)
,
where
x± =
y ±
p
y2 − 4
2
.
Hence, for n ≥ 0 the coefficient of xn
is
fn =
1
p
y2 − 4



Ã
y +
p
y2 − 4
2
!n+1
−
Ã
y −
p
y2 − 4
2
!n+1



.
We now have our answer, but just for a demonstration of the effec-
tiveness of cleanup operations, let’s invest a little more time in making the
answer look as neat as possible. Because of the ubiquitous appearance of p
y2 − 4 in the answer, we replace y formally by x + (1/x). Then
p
y2 − 4 = x −
1
x
,
and our formula becomes
X
k≤n
2
(−1)k
µ
n − k
k
¶
(x2
+ 1)n−2k
x2k
=
x2n+2
− 1
x2 − 1
(n ≥ 0).
Finally we write t = x2
to obtain the pretty evaluation
X
k≤n
2
(−1)k
µ
n − k
k
¶
(t + 1)n−2k
tk
=
1 − tn+1
1 − t
(n ≥ 0). (4.3.7)
For instance, the value t = 1 gives
X
k≤n
2
(−1)k
µ
n − k
k
¶
2n−2k
= n + 1 (n ≥ 0). (4.3.8)
As a final touch, we can read off the coefficient of tm
in (4.3.7) to
discover the interesting fact that
X
k≤n
2
(−1)k
µ
n − k
k
¶µ
n − 2k
m − k
¶
=
½
1, if 0 ≤ m ≤ n;
0, otherwise.
(4.3.9)4.3 The ‘Snake Oil’ method for easier combinatorial identities 125
Try this identity with n = 2 and watch what happens.
Here is another example of the same technique.
Example 4.
Evaluate the sums
fn =
X
k
µ
n + k
2k
¶
2n−k
(n ≥ 0). (4.3.10)
Without stopping to think, let F be the opsgf of the sequence, multiply
both sides of (4.3.10) by xn
, sum over n ≥ 0, and interchange the two sums
on the right. This produces
F =
X
k
2−k
X
n≥0
µ
n + k
2k
¶
2n
xn
=
X
k
2−k
(2x)−k
X
n≥0
µ
n + k
2k
¶
(2x)n+k
=
X
k≥0
2−k
(2x)−k (2x)2k
(1 − 2x)2k+1
(by (4.3.1))
=
1
1 − 2x
X
k≥0
½
x
(1 − 2x)2
¾k
=
1
1 − 2x
1
1 − x
(1−2x)2
=
1 − 2x
(1 − 4x)(1 − x)
=
2
3(1 − 4x)
+
1
3(1 − x)
.
It is now a triviality to read off the coefficient of xn
on both sides and
discover the answer:
X
k
µ
n + k
2k
¶
2n−k
=
22n+1
+ 1
3
(n ≥ 0). (4.3.11)
Example 5.
Our next example will be of a sum that we won’t succeed in evaluating
in a neat, closed form. However, the generating function that we obtain
will be rather tidy, and that is about the most that can be expected from
this family of sums.126 4 Applications of generating functions
The sum is
fn(y) =
X
k
µ
n
k
¶µ
2k
k
¶
yk
(n ≥ 0). (4.3.12)
Follow the usual prescription. Define F(x,y) =
P
n≥0 fn(y)xn
. To find
F, multiply (4.3.12) by xn
, sum over n ≥ 0 and interchange the inner and
outer sums, to obtain
F(x,y) =
X
k
µ
2k
k
¶
yk
X
n≥0
µ
n
k
¶
xn
=
X
k
µ
2k
k
¶
yk xk
(1 − x)k+1
=
1
1 − x
X
k
µ
2k
k
¶µ
xy
1 − x
¶k
.
(4.3.13)
Now since
X
k
µ
2k
k
¶
zk
=
1
√
1 − 4z
, (4.3.14)
by (2.5.11), we obtain
F(x,y) =
1
(1 − x)
q
1 − 4xy
1−x
=
1
p
(1 − x)(1 − x(1 + 4y))
.
(4.3.15)
For general values of y, that’s about all we can expect. There are two
special values of y for which we can go further. If y = −1/4, we find that
X
k
µ
2k
k
¶µ
n
k
¶
(−
1
4
)k
= 2−2n
µ
2n
n
¶
(n ≥ 0). (4.3.16)
If y = −1/2, then
F(x,−1/2) = 1/
p
1 − x2
=
X
m
µ
2m
m
¶
(x/2)2m
(by (2.5.11)).
Hence we have Reed Dawson’s identity
X
k
µ
2k
k
¶µ
n
k
¶
(−1)k
2−k
=
½¡ n
n/2
¢
2−n
if n ≥ 0 is even,
0 if n ≥ 0 is odd,
(4.3.17)4.3 The ‘Snake Oil’ method for easier combinatorial identities 127
and Snake Oil triumphs again.
Example 6.
Suppose we have two complicated sums and we want to show that
they’re the same. Then the generating function method, if it works, should
be very easy to carry out. Indeed, one might just find the generating
functions of each of the two sums independently and observe that they are
the same.
Suppose we want to prove that
X
k
µ
m
k
¶µ
n + k
m
¶
=
X
k
µ
m
k
¶µ
n
k
¶
2k
(m,n ≥ 0)
without evaluating either of the two sums.
Multiply on the left by xn
, sum on n ≥ 0 and interchange the summa-
tions, to arrive at
X
k
µ
m
k
¶
x−k
X
n≥0
µ
n + k
m
¶
xn+k
=
X
k
µ
m
k
¶
x−k xm
(1 − x)m+1
=
xm
(1 − x)m+1
µ
1 +
1
x
¶m
=
(1 + x)m
(1 − x)m+1
.
If we multiply on the right by xn
, etc., we find
X
k
µ
m
k
¶
2k
X
n≥0
µ
n
k
¶
xn
=
1
(1 − x)
X
k
µ
m
k
¶µ
2x
(1 − x)
¶k
=
1
(1 − x)
µ
1 +
2x
1 − x
¶m
=
(1 + x)m
(1 − x)m+1
.
Hence the two sums are equal, even if we don’t know what they are!
Example 7.
There are, in combinatorics, a number of inversion formulas, and gen-
erating functions give an easy way to prove many of those. An inversion
formula in general is a relationship that expresses one sequence in terms
of another, along with the inverse relation, which recovers the original se-
quence from the constructed one.
We have already seen a couple of famous examples of these. One is
the Möbius inversion formula, which is the pair (2.6.11), (2.6.12). Another128 4 Applications of generating functions
is the pair (4.2.3), (4.2.7) that occurred in the sieve method. We repeat
that pair here, for ready reference. It states that if we compute a sequence
{Nr} from a sequence {er} by the relations
Nr =
X
t≥0
µ
t
r
¶
et (r = 0,1,2,...), (4.3.18)
then we can recover the original sequence (‘invert’) by means of
et =
X
j
(−1)j−t
µ
j
t
¶
Nt (t ≥ 0).
To give just one more example of such a pair of formulas, consider the
relation
ar =
X
s
µ
r
s
¶
bs (r ≥ 0), (4.3.19)
which differs from the previous pair in that the summation is over the lower
index in the binomial coefficient. How can we find the relations that are
inverse to (4.3.19)? That is, how can we solve for the b’s in terms of the
a’s?
The answer is that we convert the relation (4.3.18) between two se-
quences into a relation between their exponential generating functions,
which we then invert. By (2.3.3) we have A(x) = ex
B(x), where A and
B are the egf’s. Hence B(x) = e−x
A(x), and therefore
bn =
X
m
µ
n
m
¶
(−1)n−m
am (n ≥ 0). (4.3.20)
An inversion formula of a somewhat deeper kind appears in (5.1.5),
(5.1.6).
Example 8. Snake Oil vs. hypergeometric functions.
Many combinatorial identities are special cases of identities in the the-
ory of hypergeometric series (we’ll explain that remark, briefly, in a mo-
ment). However, the Snake Oil method can cheerfully deal with all sorts
of identities that are not basically about hypergeometric functions. So the
approaches are complementary.
A hypergeometric series is a series
X
k
Tk4.3 The ‘Snake Oil’ method for easier combinatorial identities 129
in which the ratio of every two consecutive terms is a rational function of
the summation variable k. That means that
Tk+1
Tk
=
P(k)
Q(k)
,
where P and Q are polynomials, and it takes in a lot of territory. Many
binomial coefficient identities, including all of the examples in this chapter
so far, are of this type. There are some general tools for dealing with such
sums, and these are very important considering how frequently they occur
in practice. For a discussion of some of these tools, see, for example, the
article by Roy [Ro].
In this example we want to emphasize that the scope of the Snake Oil
method includes a lot of sums that are not hypergeometric. Consider, for
instance, the following sum-
f(n) =
X
k
·
n
k
¸
Bk,
where the
£ ¤
’s are the Stirling numbers of the first kind, and the B’s are
the Bernoulli numbers.
Now one thing, at least, is clear from looking at this sum: it is not
hypergeometric. The ratio of two consecutive terms is certainly not a ra-
tional function of k. The Snake Oil method is, however, unfazed by this
turn of events. If you follow the method exactly as before, you could define
F(x) to be the egf of the sequence {f(n)}, multiply by xn
/n!, sum on n,
interchange the indices, etc., and obtain
F(x) =
X
n
f(n)xn
n!
=
X
n
xn
n!
X
k
·
n
k
¸
Bk
=
X
k
Bk
X
n
·
n
k
¸
xn
n!
=
X
k
Bk
(
1
k!
µ
log
1
1 − x
¶k
)
(by (3.5.3))
=
X
k
Bk
k!
uk
(u = log
1
1 − x
)
=
u
eu − 1
(by (2.5.8))
=
1 − x
x
log
1
1 − x
.130 4 Applications of generating functions
If we now read off the coefficient of xn
/n! on both sides, we find that
the unknown sum is
X
k
·
n
k
¸
Bk = −
(n − 1)!
n + 1
(n ≥ 1). (4.3.21)
Example 9. The scope of the Snake Oil method
The success of the Snake Oil method depends upon being given a sum
to evaluate in which there is a free variable that appears in only one place.
Then, after interchanging the order of the summations, one finds one of the
basic power series (4.3.1) or (4.3.2) to sum.
At the risk of diminishing the charm of the method somewhat by
adding gimmicks to it, one must remark that in many important cases
this limitation on the scope is easy to overcome. This is because it fre-
quently happens that when an identity is presented that has a free variable
repeated several times, that identity turns out to be a special case of a more
general identity in which each of the repeated appearances of the free vari-
able is replaced by a different free variable. Before abandoning the method
on some given problem, this possibility should be explored.
Consider the identity
X
i
µ
n
i
¶µ
2n
n − i
¶
=
µ
3n
n
¶
.
At first glance the possibilities for successful Snake Oil therapy seem dim
because of the multiple appearances of n in the summand. However, if we
generalize the identity by splitting the appearances of n into different free
variables, we might be led to consider the sum
X
i
µ
n
i
¶µ
m
r − i
¶
,
which is readily evaluated by the Snake Oil method. It is characteristic of
the subject of identities that it is usually harder to prove special cases than
general theorems. Multiple appearances of a free variable are often a hint
that one should try to find a suitable generalization.
4.4 WZ pairs prove harder identities
Computers can now find proofs of combinatorial identities, including
most of the identities that we did by the Snake Oil method in the previous
section, as well as many, many more. In this section we will say how that is
done. Although finding proofs this way requires more work than a human
would care to do, the result, after the computer is finished, is a neat and
compact proof that a human can often easily check, and can always check4.4 WZ pairs prove harder identities 131
with the assistance of one of the numerous symbolic manipulation programs
that are now available on personal computers. Hence there is no need for
blind trust in the computer. One can ask it to find a proof of an identity,
and one can readily check that the proof is correct.
These developments are quite recent, and they will surely change our
attitudes towards, for instance, binomial coefficient identities. Instead of
regarding each one as a challenge to our ingenuity, we can instead ask
our computer to find a proof. It will not always succeed, but in the vast
majority of cases it will. In fact, even more powerful methods are now
becoming available, which promise a 100% success rate in certain classes of
identities.
This doesn’t mean that it was a waste of time to have learned the
Snake Oil method. There were identities that Snake Oil handled that the
method of [WZ] (which we’re about to discuss) cannot deal with, like the
fact that
P
k≥0
¡ k
n−k
¢
= Fn for n ≥ 0, which was the first example in the
previous section. Another one that offers no hope to the WZ method is
(4.3.21), which involves Stirling and Bernoulli numbers. Also, to use the
Snake Oil method, one doesn’t need to know the right hand side of the
identity in advance; the method will find it. The method that we are about
to describe will prove a given identity, but it won’t discover the identity for
itself.
With those disclaimers, however, it is fair to say that the method is
quite versatile, and seems able to handle in a unified way some of the
knottiest identities that have ever been discovered.
It stems from some totally obvious facts, concatenated in a slightly
un-obvious way. Suppose we want to prove that an identity
X
k
U(n,k) = rhs(n) (n = 0,1,2,...)
is true. The first thing we do is to divide by the right hand side to get the
standard form X
k
F(n,k) = 1 (n = 0,1,2,...). (4.4.1)
So, in standard form, we are trying to prove that a certain sum is indepen-
dent of n, for n ≥ 0.
To do that, rewrite (4.4.1) with n replaced by n+1 and then subtract
(4.4.1), to get
X
k
{F(n + 1,k) − F(n,k)} = 0 (n = 0,1,...) (4.4.2)
Wouldn’t it be helpful if there were a nice function G(n,k) such that
F(n + 1,k) − F(n,k) = G(n,k + 1) − G(n,k), (4.4.3)132 4 Applications of generating functions
for then the sum (4.4.2) would telescope? In detail, that would mean that
k=K X
k=−L
{F(n + 1,k) − F(n,k)} =
k=K X
k=−L
{G(n,k + 1) − G(n,k)}
= G(n,K + 1) − G(n,−L).
Well, as long as we’re wishing, why not wish for G(n,±∞) = 0 too, for
then, by letting K,L → ∞ we would find that (4.4.2) is indeed true! This
line of reasoning leads quickly to the following:
Theorem 4.4.1. (Wilf, Zeilberger [WZ]) Let (F,G) satisfy (4.4.3), and
suppose
lim
k→±∞
G(n,k) = 0 (n = 0,1,2,...). (4.4.4)
Then the identity
X
k
F(n,k) = const. (n = 0,1,2,...)
holds.
Example 1.
Suppose we want to prove the identity
X
k
µ
n
k
¶
= 2n
(n ≥ 0). (4.4.5)
If we divide by the right hand side we find that the function F(n,k) of
(4.4.1) is
F(n,k) =
µ
n
k
¶
/2n
(n ≥ 0). (4.4.6)
Now we need to find the mate G(n,k) of this F. Well, it is
G(n,k) = −
¡ n
k−1
¢
2n+1
. (4.4.7)
That raises two questions. Does this G really work, and where did it come
from?
Let’s take the easy one first. To check that it works we need to check
first that (4.4.3) holds, which in this case says that
2−n−1
µ
n + 1
k
¶
− 2−n
µ
n
k
¶
= −2−n−1
µ
n
k
¶
+ 2−n−1
µ
n
k − 1
¶
.4.4 WZ pairs prove harder identities 133
After a few moments of work we can satisfy ourselves that this is true.
Further, the boundary conditions (4.4.4) are easy to verify, and we are all
finished.
Definition. We say that an identity (4.4.1) is certified by a pair (F,G)
(‘WZ pair’) if the conditions (4.4.3), (4.4.4) hold.
Hence, the simple identity (4.4.5) is certified by the pair (F,G) of
(4.4.6), (4.4.7).
We can cut down still further on the complexity of the apparatus, as
follows. It will turn out in the class of identities that we are discussing here
that the mate G will always be of the form G(n,k) = R(n,k)F(n,k − 1),
where R(n,k) is a rational function of n and k. Hence, instead of describing
the pair (F,G), we need to give only F and R. But F comes directly from
the identity that we’re trying to prove, just by dividing the summand by
the right hand side. So if we have the identity in front of us, then the
rational function R is the only extra certification that we need.
The class of identities for which the above simplification is true is the
class of those that are of the form (4.4.1) in which the function F has the
property that both
F(n + 1,k)
F(n,k)
and
F(n,k − 1)
F(n,k)
are rational functions of n and k. This class includes just about every
binomial coefficient identity that we have encountered or will encounter.
Let’s recapitulate the complete proof procedure for an identity that is
certified by a single rational function R(n,k):
(a) Given an identity
P
k U(n,k) = rhs(n) (n = 0,1,2,...), and
also given a rational function proof certificate R(n,k).
(b) Define F(n,k) = U(n,k)/rhs(n), for n ≥ 0 and integer k.
(c) Define G(n,k) = R(n,k)F(n,k − 1).
(d) Check that the conditions (4.4.3) and (4.4.4) are satisfied.
(e) Check that the identity is true when n = 0.
(f) The proof of the identity is now complete.
Now here are some more examples of the technique in action. Do take
the time to check one or more of these using the full proof technique (a)-(f)
given above.
Theorem.
P
k(−1)k
¡n
k
¢¡2k
k
¢
4n−k
=
¡2n
n
¢
(n ≥ 0)
Proof: Take R(n,k) = (2k − 1)/(2n + 1).
Let’s check that statement, one step at a time, following the proof
procedure above. From step (b) we find that
F(n,k) = (−1)k
¡n
k
¢¡2k
k
¢
4n−k
¡2n
n
¢ .134 4 Applications of generating functions
From step (c) we find that
G(n,k) = (−1)k−1 2k − 1
2n + 1
µ
n
k − 1
¶µ
2k − 2
k − 1
¶
4n−k+1
¡2n
n
¢ .
Now we know the pair (F,G). In step (d) we must first check that the
condition F(n+1,k)−F(n,k) = G(n,k +1)−G(n,k) is satisfied. At this
point it would be very helpful to have a symbolic manipulation program
available, for then one would simply type in the functions F and G, and
ask it to verify that the condition holds. Otherwise, it’s a rather dull pencil
and paper computation of five minutes’ length, and we will omit it.
The second part of step (d) is the check of the boundary condition
lim
k→±∞
G(n,k) = 0 (n = 0,1,2,...).
That, however, is a triviality, because in this case not only are the limits 0,
but the function G(n,k) is 0 for every single value of k > n + 1 and for all
values of k < 1.
In step (e) we quickly check and find that 1=1, and the proof is com-
plete.
Theorem.
P
k(−1)k
¡n
k
¢
/
¡k+a
k
¢
= a/(n + a) (n ≥ 0)
Proof: Take R(n,k) = k/(n + a).
Theorem.
P
k(−1)n−k
¡2n
k
¢2
=
¡2n
n
¢
(n ≥ 0)
Proof: Take R(n,k) = −(10n2
−6kn+17n+k2
−5k+7)/(2(2n−k+2)2
).
After the last three examples the reader will probably be wondering
how to find the R(n,k)’s, instead of just checking that an R(n,k) snatched
out of the blue sky seems to work. So we are going to tell that story
too, because it’s a very important one, not just for these purposes but for
symbolic manipulation in general.
The problem is this: the function F(n,k) is known, and we want to
find G(n,k) so that the identity (4.4.3) is true. Since F is known, so is
F(n+1,k)−F(n,k), so we might as well call it f(n,k). Next, observe that
at this moment the index n is a silent partner. That is, we are looking for
G so that f(n,k) = G(n,k + 1) − G(n,k), and we see that k is an active
index but n is just a parameter, since n has the same value throughout.
So we might as well suppress the appearance of n altogether, and state the
problem this way: if fk is a given function of k (and other parameters),
how can we find gk so that fk = gk+1 − gk for all integers k?
We still don’t quite have the right question, but we’re getting there.
The question as asked is a triviality. There is always such a gk and it is4.4 WZ pairs prove harder identities 135
just
P
j<k fj. Take the function fk = k, for instance. Then we can take gk
to be
P
0≤j<k j.
To ask the right question we have to add the condition that the sum
that represents gk can be done in closed form. This whole problem is about
closed forms. What is closed form? Well roughly it means that the answer
should be pleasant to look at and have no summation signs left in it. That
idea is too nebulous to work with, so we will use one way of making it
precise that has proved to be productive.
Definition. A function fk of the integer k is a hypergeometric term if
fk+1/fk is a rational function of k.
Thus k! is a hypergeometric term. So is (3k + 2)!/(5k − 6)!, and so is
(−1)k
4n−k
¡2k
k
¢
¡n+k
k
¢.
The function kk
is not a hypergeometric term, nor is e
√
k
. The function
fk =
X
0≤j≤k
µ
n
j
¶
is not obviously a hypergeometric term, nor is it obviously not a hyperge-
ometric term. The expression serves to define the function but does not
immediately reveal the nature of the beast.
Now we’re ready for the right question.
Let fk be defined for integer k and be a hypergeometric term. Does
there exist a hypergeometric term gk such that fk = gk+1−gk for all integers
k?
An algorithm that is due to R. W. Gosper, Jr. [Gos] gives a complete
algorithmic answer to this question. That is to say, if we input f to Gosper’s
algorithm it will then either return a function g with the desired properties,
or it will return a guarantee that no such function exists. It will not ever
return a statement ‘I don’t know.’ We will not describe Gosper’s algorithm
here because that would take us rather far afield from generating functions.
However, the reader is urged to consult either the original reference [Gos]
or the lucid explanation in [GKP].
Gosper’s algorithm is built in to some of the commercially available
symbolic manipulation packages. At this writing (June, 1989) the algorithm
is fully implemented in Macsyma, where it can be invoked with the nusum
command, and it is partially implemented in Mathematica. No doubt it
will be more widely available as its usefulness becomes recognized.
Now here are the statements and proofs of two more general and dif-
ficult identities, using the [WZ] method of proof by rational function certi-
fication.136 4 Applications of generating functions
Theorem 4.4.2. (The Pfaff-Saalschütz identity)
X
k
(a + k)!(b + k)!(c − a − b + n − 1 − k)!
(k + 1)!(n − k)!(c + k)!
=
(a − 1)!(b − 1)!(c − a − b − 1)!(c − a + n)!(c − b + n)!
(c − a − 1)!(c − b − 1)!(n + 1)!(c + n)!
.
Proof: Take
R(n,k) = −
(b + k)(a + k)
(c − b + n + 1)(c − a + n + 1)
.
Theorem 4.4.3. (Dixon’s identity)
X
k
(−1)k
µ
n + b
n + k
¶µ
n + c
c + k
¶µ
b + c
b + k
¶
=
(n + b + c)!
n!b!c!
.
Proof: Take R(n,k) = (c+1−k)(b +1−k)/(2(n+ k)(n+b +c+ 1)).
## 4.5 Generating functions and unimodality, convexity, etc.
The binomial coefficients are the prototype of unimodal sequences. A
sequence is unimodal if its entries rise to a maximum and then decrease.
The binomial coefficients {
¡n
k
¢
}n
k=0 do just that. The maximum (‘mode’)
of the binomial coefficient sequence occurs at k = n/2 if n is even, and at
k = (n ± 1)/2 if n is odd.
In general, a sequence c0,c1,...,cn is unimodal if there exist indices
r,s such that
c0 ≤ c1 ≤ c2 ≤ ··· ≤ cr = cr+1 = ··· = cr+s ≥ cr+s+1 ≥ ··· ≥ cn. (4.5.1)
Many of the sequences that occur in combinatorics are unimodal.
Sometimes it is easy and sometimes it can be very hard to prove that a
given sequence is unimodal. Generating functions can help with this kind
of a problem, though they are far from a panacæa.
A stronger property than unimodality is logarithmic concavity. First
recall that a function f on the real line is concave if whenever x < y we
have f((x + y)/2) ≥ (f(x) + f(y))/2. This means that the graph of the
function bulges up over every one of its chords.
Similarly, a sequence c0,c1,...,cn of positive numbers is log concave
if logcµ is a concave function of µ, which is to say that
(logcµ−1 + logcµ+1)/2 ≤ logcµ.
If we exponentiate both sides of the above, to eliminate all of the logarithms,
we find that the sequence is log concave if
cµ−1cµ+1 ≤ c2
µ (µ = 1,2,...,n − 1). (4.5.2)
If, in (4.5.2) we can replace the ‘≤’ by ‘<’, then we will say that the sequence
is strictly log concave.4.5 Generating functions and unimodality, convexity, etc. 137
Proposition. Let {cr}n
0 be a log concave sequence of positive numbers.
Then the sequence is unimodal.
Proof. If the sequence is not unimodal then it has three consecutive mem-
bers that satisfy cr−1 > cr < cr+1 which contradicts the assumed log
concavity.
In many cases of interest, generating functions can help to prove log
concavity of a sequence, and therefore unimodality too. The source of such
results is usually some variant of the following:
Theorem 4.5.2. Let p(x) = c0+c1x+c2x2
+···+cnxn
be a polynomial all
of whose zeros are real and negative. Then the coefficient sequence {cr}n
0
is strictly log concave.
To prove the theorem we need to recall Rolle’s theorem of elementary
calculus. It holds that if f(x) is continuously differentiable in (a,b), and
if f(a) = f(b), then somewhere between a and b the derivative f0
must
vanish.
If f is a polynomial this can be considerably strengthened. Let u and
v be two consecutive distinct zeros of f. Then by Rolle’s theorem there is
a zero of f0
in (u,v). Suppose f is of degree n, has only real zeros, and has
exactly r distinct real zeros. Then Rolle’s theorem accounts for r−1 of the
zeros of f0
, because we find one between each pair of consecutive distinct
zeros of f. The remaining n − r zeros of f are copies of the distinct zeros.
But if x0 is a root of f of multiplicity m > 1, then (x − x0)m
is a factor of
f, and so (x − x0)m−1
is a factor of f0
. Thus x0 is a zero of multiplicity
m − 1 of f0
. This accounts for the other n − 1 − (r − 1) = n − r zeros
of f0
. In particular, the zeros of f0
are all real if the zeros of f are. For
maximum utility in our present discussion, we summarize this discussion in
the following way:
Lemma 4.5.1. Let
f(x,y) = c0xn
+ c1xn−1
y + ··· + cnyn
(4.5.3)
be a polynomial all of whose roots x/y are real. Let g(x,y) be the result of
differentiating f some number of times with respect to x and y. If g is not
identically zero, then all of its zeros are real.
Proof of theorem 4.5.2: Since the zeros of f are all negative, we have
f(x) = c0 + c1x + ··· + cnxn
=
n Y
j=1
(x + xj), (4.5.4)
where the xj’s are positive real numbers. Hence none of the ci’s can vanish.
Now apply the differential operator Dm
x Dn−m−2
y to the polynomial f(x,y)
of (4.5.3). Then only three terms survive, viz.:
cn−m−2(m + 2)
n − m − 1
x2
+ 2cn−m−1xy +
(n − m)cn−m
m + 1
y2
. (4.5.5)138 4 Applications of generating functions
We can put this in a cleaner form by writing cj =
¡n
j
¢
pj, in which case the
result (4.5.5) becomes
µ
n
m + 1
¶
(pn−m−2x2
+ 2pn−m−1xy + pn−my2
).
But this quadratic polynomial, according to lemma 4.5.1 above, must have
two real roots, and so its discriminant must be nonnegative, i.e.,
p2
n−m−1 ≥ pn−m−2pn−m,
and the sequence of p’s is log concave. If we substitute back the c’s, we find
that
c2
n−m−1 ≥
(m + 2)(n − m)
(m + 1)(n − m − 1)
cn−m−2cn−m
> cn−m−2cn−m,
and the strict log concavity is established.
Corollary 4.5.1. The binomial coefficient sequence
©¡n
k
¢ªn
k=0
is log con-
cave, and therefore unimodal.
Proof. The zeros of the generating polynomial (1 +x)n
are evidently real
and negative.
Corollary 4.5.2. The sequence of Stirling numbers of the first kind
{
·
n
k
¸
}n
k=1
is log concave, and therefore unimodal.
Proof. According to (3.5.2), the opsgf of these Stirling numbers is the
polynomial
X
j
·
n
j
¸
xj−1
= (x + 1)(x + 2)···(x + n − 1),
whose zeros are clearly real and negative.
Corollary 4.5.3. The sequence of Stirling numbers of the second kind
{
©n
k
ª
}n
k=1 is log concave, and therefore unimodal.
Proof. We’ll have to work just a little harder for this one, because the
zeros of the polynomial
An(x) =
X
j
½
n
j
¾
xj4.5 Generating functions and unimodality, convexity, etc. 139
are not easy to find. They are, however, real and negative, and here is one
way to see that: by (1.6.8) we have the recurrence formula
An(y) = {y(1 + Dy)}An−1(y) (n > 0;A0 = 1),
which can be rewritten in the form
ey
An(y) = y (ey
An−1(y))
0
(n > 0;A0 = 1). (4.5.6)
We claim that for each n = 0,1,2,..., the function ey
An(y) has exactly
n zeros, which are real, distinct, and negative except for the one at y = 0.
This is true for n = 0, and if it is true for 0,1,...,n − 1, then (4.5.6) and
Rolle’s theorem guarantee that (ey
An−1(y))0
has n − 2 negative, distinct
zeros, one between each pair of zeros of An−1(y). After multiplying by y,
as in (4.5.6), we have n − 1 negative, distinct zeros for ey
An(y), but we
need to find still one more. But ey
An−1(y) obviously approaches zero as
y → −∞. Hence its derivative must have one more zero to the left of the
leftmost zero of An−1(y), and we are finished.
The theorem is very strong, but one must not be left with the im-
pression that unimodality or log concavity has something essential to do
with reality of the zeros of the generating polynomials. Many sequences are
known that are unimodal, and have generating polynomials whose zeros all
lie on the unit circle, and are quite uniformly distributed, in angle, around
the circle. In such cases our theorem will be of no help.
For example, an inversion of a permutation σ of n letters is a pair
(i,j) for which 1 ≤ i < j ≤ n, but σ(i) > σ(j). A permutation may have
between 0 and
¡n
2
¢
inversions. It is well known that if b(n,k) is the number
of permutations of n letters that have exactly k inversions, then
{b(n,k)}k≥0
ops
← → (1 + x)(1 + x + x2
)···(1 + x + x2
+ ··· + xn−1
). (4.5.7)
The zeros of the generating polynomial are very uniformly sprinkled around
the unit circle, so the hypotheses of theorem 4.5.2 are extravagantly vio-
lated. Nonetheless, the sequence is unimodal; it rises steadily for k ≤
¡n
2
¢
/2,
and falls steadily thereafter.140 4 Applications of generating functions
## 4.6 Generating functions prove congruences
In this section we give one or two examples of the power of the generat-
ing function method in proving congruences among combinatorial numbers.
A congruence between two generating functions means that the congruence
holds between every pair of their corresponding coefficients.
Example 1. Stirling numbers of the first kind
We found, in chapter 3, that the Stirling numbers of the first kind
£n
k
¤
have the generating function
X
k
·
n
k
¸
xk
= x(x + 1)(x + 2)···(x + n − 1). (4.6.1)
Suppose we are interested in finding some criterion for deciding the evenness
or oddness of these numbers.
If we read (4.6.1) modulo 2, it becomes
X
k
·
n
k
¸
xk
≡ x(x + 1)x(x + 1)··· (mod 2)
= xdn/2e
(x + 1)bn/2c
.
(4.6.2)
Now take the coefficient of xk
on both sides, and find that
·
n
k
¸
≡ [xk
]xdn/2e
(x + 1)bn/2c
(mod 2)
=
h
xk−dn/2e
i
(1 + x)bn/2c
=
µ
bn/2c
k − dn/2e
¶
.
(4.6.3)
Theorem 4.6.1. The Stirling number
£n
k
¤
has the same parity as the bino-
mial coefficient
¡ bn/2c
k−dn/2e
¢
. In particular,
£n
k
¤
is an even number if k < dn/2e.
Example 2. The other Stirling numbers
In the case of the Stirling numbers that count set partitions, the
©n
k
ª
’s,
we found in (1.6.5) that they have the ops generating function
X
n
½
n
k
¾
xn
=
xk
(1 − x)(1 − 2x)···(1 − kx)
.
Again, suppose we read the equation modulo 2. Then we would find
that
X
n
½
n
k
¾
xn
≡
xk
(1 − x)dk/2e
(mod 2)
= xk
X
h
µ
dk/2e + h − 1
h
¶
xh
.4.7 The cycle index of the symmetric group 141
Now take the coefficient of xn
throughout. The result is:
Theorem 4.6.2. The Stirling number
©n
k
ª
has the same parity as the
binomial coefficient µ
dk/2e + n − k − 1
n − k
¶
. (4.6.4)
## 4.7 The cycle index of the symmetric group
We have already studied the Stirling numbers of the first kind, which
give the number of permutations of n letters that have exactly k cycles.
Now we’ll look for much more detailed information about the cycles of
permutations. Instead of considering only the number of cycles that a
permutation has, we will be interested in the numbers of cycles that it has
of each length.
So let a= {a1,a2,a3,...} be a given sequence of nonnegative integers
for which n = a1 + 2a2 + 3a3 + ··· is finite. How many permutations of n
letters have exactly a1 cycles of length 1 and exactly a2 cycles of length 2
and etc.? For a given permutation σ, we will call the vector a = a(σ) the
cycle type of σ. It tells us the numbers of cycles of each length that σ has.
Let c(a) denote the required number of permutations, and write
φn(x) =
X
a1+2a2+···=n
a1≥0,a2≥0,...
c(a)xa1
1 xa2
2 ···. (4.7.1)
Then φn(x) is called the cycle index of the symmetric group Sn. If we can
somehow find φn(x) then the coefficient of each monomial x is the number
of permutations of n letters whose cycle type is a.
We are going to find the “grand” generating function
C(x,t) =
∞ X
n=1
φn(x)
tn
n!
(4.7.2)
which will turn out to have a surprisingly elegant form (see (4.7.5) below),
considering the large amount of information that it contains.
The derivation will be unusual in at least one respect. Most often a
generating function is a way-station on the road to finding an exact formula
for something. But in this problem we will begin by finding an exact formula
for c(a). It will then be easy to check that its generating function really
generates the sequence.
Well, for a given a, how many permutations σ have a for their cycle
type? We will first prove a lemma, and then give the answer.142 4 Applications of generating functions
Lemma A. Given integers m,a,k. The number of ways of choosing ka
letters from m (distinct) given letters, and arranging them into a cycles of
length k is
f(m,a,k) =
m!
(m − ka)!kaa!
. (4.7.3)
Proof. First choose an ordered ka-tuple of the letters, which can be done
in m!/(m−ka)! ways. Then arrange each consecutive block of k letters in a
cycle, which gives us our set of a cycles. However, we claim that every fixed
set of a cycles of length k will arise exactly ka
a! times in this construction.
Indeed, that set will occur in every ordering of the list of cycles (a! such).
Furthermore, the same set of a cycles results from each of the k possible
circular permutations of elements within blocks of k consecutive entries in
the original ka-tuple, i.e., ka
times.
Hence if we are given n letters, and a sequence of nonnegative integers
a1,a2,... such that
a1 + 2a2 + 3a3 + ··· = n,
then the number of ways of forming these letters into a1 1-cycles and a2
2-cycles, and ..., is evidently
f(n,a1,1)f(n − a1,a2,2)f(n − a1 − 2a2,a3,3)···
=
µ
n!
(n − a1)!1a1a1!
¶µ
(n − a1)!
(n − a1 − 2a2)!2a2a2!
¶
···
=
n!
a1!a2!···1a12a23a3 ···
,
(4.7.4)
where Lemma A was used. This yields the following explicit formula for
the number of permutations of each given cycle type.
Theorem 4.7.1. Let a be nonnegative integers for which
P
j jaj = n.
Then the number of permutations of n letters that have a for their cycle
type is exactly
c(a) =
n!
Q
j≥1(aj!jaj )
.
Next we’ll look for the generating function of the quantities c(a). Since
there are infinitely many variables a we shouldn’t be surprised by the need4.7 The cycle index of the symmetric group 143
for a generating function in infinitely many variables. We calculate
C(x,t) =
X
n≥0
φn(x)
n!
tn
=
X
n≥0
tn
n!
X
a1+2a2+···=n
a1≥0,a2≥0,...
c(a)x
=
X
n≥0
tn
n!
X
a1+2a2+···=n
a1≥0,a2≥0,...
c(a)xa1
1 xa2
2 ···
=
µ X
a1≥0
(tx1)a1
1a1a1!
¶µX
a2≥0
(t2
x2)a2
2a2a2!
¶
···
= etx1
et2
x2/2
et3
x3/3
···
= exp
¡X
j≥1
xjtj
j
¢
.
We have proved the following result.
Theorem 4.7.2. The coefficient of tn
/n! in
C(x,t) = exp
¡X
j≥1
xjtj
j
¢
(4.7.5)
is the cycle index of Sn, i.e., the generating function φn(x) in (4.7.1) above,
of the numbers of permutations of n letters that have each possible cycle
type. In more detail, the coefficient of xtn
/n! is the number of permuta-
tions of n letters whose cycle type is a.
If this result rather reminds you of the exponential formula, and if you
suspect that there must be some connection, you are quite correct. The
result of exercise 22 of the previous chapter is a generalization of theorem
4.7.2 to exponential families. Indeed, the theorem is an immediate special
case of the result of that exercise, but we thought it might be interesting
to give an elementary proof also.
Thus the generating function C(x,t) in (4.7.5) generates the cycle in-
dexes of all of the symmetric groups. We will now give some of its applica-
tions to the probabilistic theory of permutations.
The polynomials φn(x) of (4.7.1) have coefficients that give the number
of permutations of n letters with given cycle type. If we divide them by n!,
as in (4.7.2), then since n! is the total number of permutations of n letters,
we will then be finding the probabilities that a permutation has various144 4 Applications of generating functions
cycle type vectors. Thus
C(x,t) =
X
n
φn(x)
n!
tn
=
X
n
pn(x)tn
(4.7.6)
where
pn(x) =
X
a1+2a2+···=n
a1≥0,a2≥0,...
Prob(a,n)x (4.7.7)
and Prob(a,n) is the probability that a permutation of n letters has the
cycle type a.
Just ahead of us now there lie some very pretty theorems. They are
theorems that give very quantitative answers to questions that don’t seem
to have any quantities in them. For instance, take this question, which is a
simple illustration of the genre: what is the probability that a permutation
has no fixed points?
Notice that the question doesn’t tell us how many letters the permu-
tation permutes. There is no ‘n’ in the question. But it has a nontrivial
answer: 1/e, as we discovered in (4.2.10). To interpret a question like this,
one proceeds as follows. Let f(n) be the number of permutations of n letters
that have no fixed points. Then f(n)/n! is the probability that a permu-
tation of n letters has no fixed points. Since, in this case, limn→∞ f(n)/n!
exists and is equal to 1/e, we can then say that, in this precise sense, the
probability that a permutation has no fixed points is 1/e.
There are many lovely questions about permutations that sound like
what is the probability that a permutation has ...?, in which the number of
letters that the permutations act upon is not even mentioned, and to which
the answers are nontrivial numbers, like the 1/e above. We are about to
derive handfuls of them at once. But first we need a lemma.
Lemma B. Let
P
j bj be a convergent series. Then in the power series
expansion of the function
1
1 − t
X
j
bjtj
=
X
n
αntn
,
we have that limn αn exists and is equal to
P
j bj.
Proof. By Rule 5 of section 2.2, αn is the sum of those bj for which j ≤ n.
The latter sum clearly approaches the limit stated.
Now let S be a (finite or infinite) set of positive integers, with the
property that
X
s∈S
1
s
< ∞.4.7 The cycle index of the symmetric group 145
In the generating function C(x,t) we set all xi = 1 for i / ∈ S. That means
that we are declaring ourselves to have no interest in any cycle lengths other
than those in S. The others can be whatever they please. Then C becomes
C(x,t) = exp
µX
i∈S
xi
ti
i
+
X
i/ ∈S
ti
i
¶
= exp
µX
i∈S
(xi − 1)ti
i
+ log
1
1 − t
¶
=
1
1 − t
exp
µX
i∈S
(xi − 1)ti
i
¶
.
By Lemma B above, the coefficient of tn
in this last expression approaches
the limit
exp
µX
i∈S
(xi − 1)
i
¶
as n → ∞, which proves the following.
Theorem 4.7.3. Let S be a set of positive integers for which
P
s∈S 1/s
converges, and let a be a fixed cycle type vector. The probability that
the cycle type vector of a random permutation agrees with a in all of its
components whose subscripts lie in S exists and is equal to
e
−
¡P
s∈S
1/s
¢
[x]exp
¡X
s∈S
xs
s
¢
=
1
Q
s∈S
¡
e
1
s sasas!
¢. (4.7.8)
As a first example, take S = {1}, so we are interested only in fixed
points. Then from (4.7.8), the probability that a random permutation has
exactly a fixed points is 1/(a!e), for a ≥ 0.
Take S = {r}. Then we see at once that the probability that a random
permutation has exactly a r-cycles is 1/(e
1
r ra
a!), for each a = 0,1,....
Let S = {r,s}. The probability that a random permutation has exactly
ar r-cycles and exactly as s-cycles is therefore
e−1/r−1/s
rar sasr!s!
.
OK, now blindfold yourself, reach into a bag that contains every per-
mutation in the world, and pull one out. What is the probability that none
of its cycle lengths is the square of an integer? We claim that the probabil-
ity is e−π2
/6
= .193025..., so the odds are about 5 to 1 against this event.
Indeed, this is just the case where we take S to be the set of all squares of
integers, and use the fact that 1 + 1/22
+ 1/32
+ ··· = π2
/6.
For a final example, what is the probability that a randomly chosen
permutation contains equal numbers of 1-cycles and 2-cycles? Well, if that146 4 Applications of generating functions
number is j, then the probability is e−3/2
/(2j
j!2
), for each j = 0,1,2,....
If we sum over all of these j, we find that the required probability is
e−3/2
∞ X
j=0
1
2jj!2
= 0.34944033....
We can recast the result in theorem 4.7.3 in the language of the Poisson
distribution. The Poisson distribution is a probability distribution on the
nonnegative integers j = 0,1,2,... that occurs very naturally in a number
of areas of application, such as in the theory of waiting lines. It is given by
Prob(j) = e−M Mj
j!
(j = 0,1,2,...)
where M is the mean.
Theorem 4.7.3 then asserts the following: If a set S is fixed, for which P
s∈S 1/s < ∞, then for a randomly chosen permutation the numbers
of cycles of each length s ∈ S have asymptotically independent Poisson
distributions in which the mean number of s-cycles is 1/s for each s ∈ S.
## 4.8 How many permutations have square roots?
Let σ be a permutation. There may or may not be a permutation τ
such that σ = τ2
. We want to describe and to count the σ’s that do have
square roots, in this sense. More generally, σ has a kth root if there is
a τ such that σ = τk
, and again, we would like to know the number of
permutations of n letters that have kth roots.
The answers to these questions involve some fairly spectacular generat-
ing functions, and the methods will lean strongly on the cycle index results
of the previous section, and in particular on theorem 4.7.2.
We begin with the square root problem. So let τ be a permutation,
and consider a single cycle of τ, say this one:
8 → 3 → 13 → 19 → 7 → 12 → 8.
What happens to that cycle when we square τ? The mapping τ2
executes
the permutation τ twice, so it carries 8 into 13 and 13 into 7, etc. Thus
we go hopping around the cycle of τ, visiting every second member, until
we return to our starting point. A cycle of even length therefore falls apart
into two cycles of half the length, while an odd cycle remains a cycle of the
same length, although it becomes a different cycle of that length.
In the example above, the cycle shown breaks into two cycles, like this:
8 → 13 → 7 → 8 and 3 → 19 → 12 → 3.
In general, every cycle of τ whose length is 2m will contribute two cycles
of length m to τ2
.4.8 How many permutations have square roots? 147
A cycle of even length in τ2
, therefore, can only be the result of splitting
a cycle of twice its length in τ into two cycles. Hence, if σ has a square
root, then the number of cycles that it has of each even length must be even.
Conversely, let σ be any permutation that has this property. Then we
claim that σ = τ2
for at least one τ. In fact we can construct such a τ (in
how many ways?). To do that, pick up a pair of cycles of the same even
length and thread them together into a single cycle of twice that length, as
in the two examples above, by taking alternately a letter from one of the
cycles and a letter from the other. These threaded cycles are all parts of
the permutation τ that is being constructed.
What do we do with the odd cycles of σ? If we are given a cycle of
odd length 2m + 1 in σ we convert it into a cycle of the same odd length
in τ as follows. Let the letters in the given cycle of σ be
a1 → a2 → a3 → ··· → a2m → a2m+1 → a1.
Then into τ we put the cycle
a1 → am+2 → a2 → am+3 → a3 → am+4 → ··· → a2m+1 → am+1.
This cycle clearly has the property that if we square it then it will be
back in the original order as in σ, and completes the proof of the following
theorem (as well as giving us an algorithm for finding the square root of a
permutation!).
Theorem 4.8.1. A permutation σ has a square root if and only if the
numbers of cycles of σ that have each even length are even numbers.
Now let f(n,2) be the number of permutations of n letters that have
square roots. We seek the generating function of the sequence. Consider the
cycle type vector a of such a permutation. The even-indexed components
must be even numbers, and the odd-indexed components are arbitrary.
According to theorem 4.7.2, the coefficient of xtn
/n! in the product
ex1t
ex2t2
/2
ex3t3
/3
···
is the number of permutations of n letters whose cycle type is a. The sum of
these coefficients over all of the cycle types that we are considering, namely
a’s for which the even-indexed entries are even, is obtained as follows. In the
product of the exponential functions above, put x1 = 1, because all values
of a1 are admissible. In the second exponential factor, ex2t2
/2
, don’t use
the whole exponential series. Since only even powers of x2 are admissible,
use the subseries of even powers of the exponential series, namely the cosh
series, and then put x2 = 1. Then put x3 = 1. Then use the cosh(x4t4
/4)
series and put x4 = 1, and so forth.148 4 Applications of generating functions
The result will be that the number f(n,2) of permutations of n letters
that have square roots satisfies
X
n≥0
f(n,2)
tn
n!
= et
cosh(t2
/2)et3
/3
cosh(t4
/4)et5
/5
···
= exp(t + t3
/3 + t5
/5 + ···)
Y
m≥1
cosh(
t2m
2m
)
=
r
1 + t
1 − t
Y
m≥1
cosh(
t2m
2m
)
= 1 + t +
t2
2!
+ 3
t3
3!
+ 12
t4
24
+ 60
t5
5!
+ ···.
(4.8.1)
Hence the sequence {f(n,2)} begins as
1,1,1,3,12,60,270,1890,14280,....
Corollary. Let p(n) be the probability that a permutation of n letters has
a square root. Then for each n = 0,1,2,..., we have p(2n) = p(2n + 1).
Proof. The generating function in (4.8.1) is of the form 1/(1−t) times an
even function of t. Hence f(n,2)/n! is the nth partial sum of the coefficient
sequence of an even function.
More generally, the sequence of probabilities is actually weakly de-
creasing, i.e.,
p(0) = p(1) ≥ p(2) = p(3) ≥ p(4) = p(5) ≥ ···.
Bijective proofs of these facts have been found by Dennis White (p.c.).
Now let’s try the question of kth roots. We let f(n,k) be the number
of permutations of n letters that have kth roots, and we seek the egf of
{f(n,k)}n≥0. Some additional notation will be helpful here. For a prime p
and an integer n we will write e(p,n) for the highest power of p that divides
n. Next, for a pair m,k of positive integers, we define ( (m,k)) to be
((m,k) ) =
Y
p\m
pe(p,k)
.
First, if k is given, for which permutations σ is it true that there exists
a permutation τ such that σ = τk
? The generalization of theorem 4.8.1 is
the following.
Theorem 4.8.2. A permutation σ has a kth root if and only if for every
m = 1,2,... it is true that the number of m-cycles that σ has is a multiple
of ((m,k)).
To prove this, let σ = τk
be a permutation of n letters, and suppose
σ has exactly νm cycles of length m, for each m = 1,2,.... Consider a4.8 How many permutations have square roots? 149
cycle of length r in τ. In τk
this contributes (r,k) cycles of lengths r/(r,k).
Hence the νm cycles of length m in σ must come from cycles of length r in
τ where r/(r,k) = m. From this equation r = m(r,k) it is easy to see that
r must be a multiple of m( (m,k) ). Hence the cycles of length m in σ all
come from cycles of lengths that are multiples of m( (m,k) ) in τ. But every
such cycle in τ contributes a multiple of ( (m,k) ) m-cycles in σ. Hence the
number of m-cycles in σ must be a multiple of ( (m,k) ).
To show that it is also sufficient, let σ be a permutation that satisfies
the condition. We will construct a kth root, τ, of σ. Fix m, and write
g = ( (m,k) ). Then the number of m-cycles of σ is a multiple of g, so we can
tie them up into bundles of g m-cycles each, and then for each bundle we
can construct a single new cycle of length mg as follows: construct a circle
with mg places marked consecutively around it. Take the first m-cycle
in the bundle and arrange its elements in the marked places, consecutive
elements being spaced apart by g places. Then do the same for the second
m-cycle in the bundle, etc. Repeat for each m to complete the proof.
Theorem 4.8.2 is due to Arnold Knopfmacher and Richard Warlimont,
and it corrects an error that appeared in this discussion in the previous
printing of this book.
To obtain the egf of the sequence {f(n,k)} we proceed as in (4.8.1)
above. It will be convenient to have a name for the subseries of the expo-
nential series that occur. So let us write expq(x) for the subseries of the
exponential series ex
that is obtained by choosing only the powers of x that
are divisible by q. That is
expq(x) =
X
j≥0
xjq
(jq)!
(q = 1,2,3,...).
Thus exp1(x) = ex
, exp2(x) = coshx, exp3(x) is explicitly shown in eq.
(2.4.7) of chapter 2, etc. Now following the argument that led to (4.8.1) we
obtain this generalization.
Theorem 4.8.3. Let f(n,k) be the number of permutations of n letters
that have a kth root. Then we have
∞ X
n=0
f(n,k)
xn
n!
=
∞ Y
m=1
exp( (m,k) )
xm
m

(k = 1,2,3,...). (4.8.2)
The reader is invited to check that this reduces to a triviality when
k = 1, and to (4.8.1) when k = 2. A short table of f(n,k) (1 ≤ n ≤ 10;2 ≤
k ≤ 7) is shown below.150 4 Applications of generating functions
k = 2 : 1 1 3 12 60 270 1890 14280 128520 1096200
k = 3 : 1 2 4 16 80 400 2800 22400 181440 1814400
k = 4 : 1 1 3 9 45 225 1575 11130 100170 897750
k = 5 : 1 2 6 24 96 576 4032 32256 290304 2612736
k = 6 : 1 1 1 4 40 190 1330 8680 52920 340200
k = 7 : 1 2 6 24 120 720 4320 34560 311040 3110400
## 4.9 Counting polyominoes
By a cell we will mean the interior and boundary of a unit square in the
x-y plane, if the vertices of the square are at lattice points (points whose
coordinates are both integers). Let P be a collection of cells. We associate
with P a graph, whose vertices correspond to the cells of P, and in which
two vertices are joined by an edge in the graph if the two cells to which they
correspond intersect in a line segment (rather than in a vertex, or not at
all). We say that P is a connected collection of cells if the graph associated
with P is a connected graph.
A collection P of cells is in standard position if all of its cells lie in the
first quadrant, and at least one of them intersects the y axis and at least
one of them intersects the x axis.
A polyomino is a connected collection of cells that is in standard posi-
tion.
Here are all of the polyominoes that have one, two, or three cells:
Sometimes polyominoes are called animals. This is because one can
imagine a single cell that ‘grows’ by sprouting a new cell along one of its
edges. Then that two-celled animal would grow a new cell along one of its
edges, etc. If f(n) is the number of n-celled polyominoes, then from the
picture above we see that {f(n)} = 1,2,6,.... It would be good to be able
to say that in this section we are going to derive the generating function etc.
for the sequence f(n). We aren’t going to do that, though. The sequence
and its generating function are unknown, despite a great deal of effort that
has been invested in the problem.
Various special kinds of polyominoes, however, have been counted,
with respect to various properties of the polyomino. For instance, among
the properties that a polyomino has, one might mention its area, or number
of cells, and its perimeter. So one might ask for the number of polyominoes
of some special kind whose area is n, or the number whose perimeter is m,4.9 Counting polyominoes 151
or the number whose area is n and whose perimeter is m, or the generating
functions of any of these, etc. For a survey of recent progress in such
questions see [De1] and [De2].
What we will do in this section will be to count a special kind of
polyomino that is called horizontally convex (HC). An HC-polyomino is
one in which every row is a single contiguous block of cells. The picture
below shows a typical HC-polyomino.
Another special kind of polyomino is called convex. A polyomino is
convex if it is both vertically and horizontally convex. One of the striking
results in the theory of polyominoes is the fact that there are exactly
(2n + 11)4n
− 4(2n + 1)
µ
2n
n
¶
(4.9.1)
convex polyominoes of perimeter 2n + 8. The number of area n has been
found by M. Bousquet-Melou [Bo].
There are interesting problems involved in counting HC-polyominoes
either by area or by perimeter. We are going to count them here by area.
It is worth noting that the question of enumerating them by perimeter has
also been solved [De2], and the solution involves a remarkable generating
function, which looks like this: if cn is the number of HC-polyominoes
whose perimeter is 2n + 2 then
X
n≥0
cntn
=
p
−(AC1/3 + D + EC−1/3) − F
2
√
AH
−
H
2
√
2A
− G
in which A,B,...,H are certain specific functions. For instance A =
18t4
(2t3
− 23t2
+ 38t − 18)2
. For the complete list see [De2].
We return to the problem of counting HC-polyominoes by area, which
is similar to the enumeration of ‘fountains’ in section 2.2, and our method
of attack will be similar.
Let f(n,k,t) be the number of HC-polyominoes of n cells, having k
rows, of which t are in the top row. If we strip off the top row of one of
these polyominoes, what will remain will have n−t cells, arranged in k−1
rows, with some number r ≥ 1 in the top row. Hence after removing the
top row, there are f(n−t,k −1,r) possibilities for what remains, for some
r. However, each one of those possibilities generates r+t−1 of the original152 4 Applications of generating functions
(n,k,t) HC-polyominoes, by adjoining a top row of t cells, and sliding it
left and right through all legal positions atop the second row.
Hence we have
f(n,k,t) =
X
r≥1
f(n − t,k − 1,r)(r + t − 1) (k ≥ 2; f(n,1,t) = δt,n).
(4.9.2)
If we define the generating functions Fk,t(x) =
P
n f(n,k,t)xn
, then we
have F1,t(x) = xt
, for t ≥ 1 and after multiplying (4.9.2) by xn
and sum-
ming over n, we obtain
Fk,t(x) = xt
X
r≥1
(r + t − 1)Fk−1,r(x) (k ≥ 2). (4.9.3)
Now let Uk(x) =
P
r≥1 Fk,r(x) and Vk(x) =
P
r≥1 rFk,r(x). Then
U1(x) = x/(1 − x) and V1(x) = x/(1 − x)2
. Further, from (4.9.3),
Fk,t(x) = xt
(Vk−1(x) + (t − 1)Uk−1(x)) (k ≥ 2), (4.9.4)
and if we sum on t we find that
Uk(x) =
x
1 − x
Vk−1(x) +
x2
(1 − x)2
Uk−1(x) (k ≥ 2). (4.9.5)
If we first multiply (4.9.4) by t and then sum on t we find
Vk(x) =
x
(1 − x)2
Vk−1(x) +
2x2
(1 − x)3
Uk−1(x) (k ≥ 2). (4.9.6)
We now have two simultaneous recurrences to solve for the sequences
Uk and Vk. To do that we eliminate the Vk sequence as follows: solve (4.9.5)
for Vk−1 in terms of Uk and Uk−1, and substitute the result in (4.9.6). After
simplification we obtain a single three term recurrence for the U’s, viz.
1 − x
x
Uk+1(x) −
x + 1
1 − x
Uk(x) −
x2
(1 − x)3
Uk−1(x) = 0 (k ≥ 1), (4.9.7)
along with the initial data U0(x) = 0 and U1(x) = x/(1 − x).
Finally, to solve (4.9.7) we introduce the generating function φ(x,y) = P
k≥0 Uk(x)yk
. Then, if we multiply (4.9.7) by yk
and sum over k ≥ 1 we
get
1 − x
xy
½
φ(x,y) − U1(x)y
¾
−
x + 1
1 − x
φ(x,y) −
x2
y
(1 − x)3
φ(x,y) = 0.4.10 Exact covering sequences 153
If we use the initial conditions and solve for φ, the result is that
φ(x,y) =
X
k≥0
Uk(x)yk
=
X
n,k,r
f(n,k,r)xn
yk
=
xy(1 − x)3
(1 − x)4 − xy(1 − x − x2 + x3 + x2y)
.
(4.9.8)
Notice that the sum over r has no variable attached to it; it acts
directly on f(n,k,r) and yields the number of HC-polyominoes of n cells
and k rows, without regard to how many cells are in the top row. Thus if
g(n,k) is that number, then
X
n,k
g(n,k)xn
yk
=
xy(1 − x)3
(1 − x)4 − xy(1 − x − x2 + x3 + x2y)
. (4.9.9)
For the complete 3-variable generating function of the sequence {f(n,k,r)},
see exercise 21 at the end of this chapter.
Perhaps we are interested only in the total number of HC-polyominoes,
and we don’t need to know the number of rows. In that case we let y = 1
in (4.9.8) and we find the following result, which is due to D. Klarner, who
used different methods.
Theorem 4.9.1. Let f(n) be the number of n-celled HC-polyominoes.
Then
X
n≥1
f(n)xn
=
x(1 − x)3
1 − 5x + 7x2 − 4x3
= x + 2x2
+ 6x3
+ 19x4
+ 61x5
+ 196x6
+ 629x7
+ 2017x8
+ 6466x9
+ 20727x10
+ 66441x11
+ 212980x12
+ ···
.
(4.9.9)
We now will give a preview of the material in chapter 5, by working out
an asymptotic formula for f(n). To do this we take the generating function
in (4.9.9) and expand it in partial fractions. This gives
x(1 − x)3
1 − 5x + 7x2 − 4x3
= −
5
16
+
x
4
+
c1
1 − ξ1x
+
c2
1 − ξ2x
+
c3
1 − ξ3x
,
in which ξ1 = 3.20556943... and ξ2,3 = 0.897215 ± .665457i.
Thus the number of HC-polyominoes is, for n ≥ 2,
f(n) = c1ξn
1 + c2ξn
2 + c3ξn
3
= c1ξn
1 + O(|ξ2|n
)
= 0.1809155018...(3.2055694304...)n
+ O(1.1171n
).154 4 Applications of generating functions
The first term of this formula gives, for example, f(12) = 212979.61,
compared to 212980, the exact value, as shown in (4.9.9).
## 4.10 Exact covering sequences
Every positive integer n is either 1 mod 2 or 0 mod 4 or 2 mod 4, as
a moment’s reflection will confirm. So the three pairs (a1,b1) = (1,2),
(a2,b2) = (0,4) and (a3,b3) = (2,4) of residues and moduli exactly cover
the positive integers.
An exact covering sequence (ECS) is a set (ai,bi) (i = 1,...,k) of
ordered pairs of nonnegative integers with the property that for every non-
negative integer n there is one and only one i such that 1 ≤ i ≤ k and
n ≡ ai mod bi.
In this section we will give the basic theory of such sequences and deal,
in two or three different ways, with the question of how we can tell if a given
sequence of pairs is or is not an exact covering sequence.
Here is what generating functions have to contribute to this subject.
Suppose (ai,bi) (i = 1,...,k) is an exact covering sequence. Then in
the series
k X
i=1
X
t≥0
xai+tbi
every nonnegative integer n occurs exactly once as an exponent of x, so it
must be true that the series shown is equal to 1/(1−x). If we perform the
summation over t, we find that
k X
i=1
xai
1 − xbi
=
1
1 − x
. (4.10.1)
For example
x
1 − x2
+
1
1 − x4
+
x2
1 − x4
=
1
1 − x
.
Theorem 4.10.1. For a set of pairs (ai,bi) (i = 1,...,k) to be an exact
covering sequence it is necessary and sufficient that the relation (4.10.1)
hold.
One conclusion that we can draw immediately is that in an ECS we
must have
P
i 1/bi = 1. To see that, just multiply (4.10.1) by 1 − x and
let x → 1. But we can learn much more by comparing the partial fraction
expansions of the left and right sides of (4.10.1).
For the left side, we have
k X
i=1
xai
1 − xbi
=
X
ω:ωN =1
A(ω)
ω − x4.10 Exact covering sequences 155
where
A(ω) = lim
x→ω
(ω − x)
k X
i=1
xai
1 − xbi
=
X
j:ωbj =1
ωaj+1
bj
,
and N = l.c.m.{bj}. If we compare with the right side of (4.10.1) we see
that the A(ω)’s must all vanish except that A(1) = 1. Hence we must have
X
j:ωbj =1
ωaj
bj
=
½
1, if ω = 1;
0, otherwise.
Now A(ω) surely vanishes unless ω is a root of unity. So let ω = e2πir/s
,
where s ≥ 1 and (r,s) = 1, be a primitive sth root of unity. Then our
conditions take the form
X
j:s\bj
ωaj
bj
=
n
1 if s = 1;
0 otherwise.
(4.10.2)
Hence, associated with any sequence of pairs (ai,bi)|k
i=1 we can define
polynomials
ψs(z) =
X
j:s\bj
zaj
bj
(s = 1,2,3,...). (4.10.3)
In terms of these polynomials we can restate our conditions (4.10.2) as
follows: necessary and sufficient for the given set of pairs to constitute an
exact covering sequence is that for each s > 1 the polynomial ψs should
vanish at the primitive sth rots of unity, and ψ1(1) = 1.
However, any polynomial that vanishes at all of the primitive sth roots
of unity must be divisible by the cyclotomic polynomial (see section 2.6,
example 2)
Φs(z) =
Y
r:(r,s)=1;0<r<s
(z − e2πir/s
) (s = 1,2,3,...)
since Φs(z) has only those roots. The first few cyclotomic polynomials are
1 − z,1 + z,1 + z + z2
,1 + z2
,1 + z + z2
+ z3
+ z4
,1 − z + z2
,....
If we put all of this together, we obtain the following result.156 4 Applications of generating functions
Theorem 4.10.2. A set of pairs of integers (a1,b1),...,(ak,bk), in which
the a’s are nonnegative and the b’s are positive, is an exact covering se-
quence if and only if
P
j 1/bj = 1 and for each s > 1, the polynomial ψs(z),
of (4.10.3), is divisible by the cyclotomic polynomial Φs(z).
For an example, take the pairs
(0,4),(2,4),(1,6),(3,6),(5,12),(11,12).
Then
P
j 1/bj = 1/4+1/4+1/6+1/6+1/12+1/12 = 1, and the divisibility
conditions of the theorem look like this:
Φ2(z) = (1 + z) divides 1
4 + z2
/4 + z/6 + z3
/6 + z5
/12 + z11
/12
Φ3(z) = (1 + z + z2
) divides z/6 + z3
/6 + z5
/12 + z11
/12
Φ4(z) = (1 + z2
) divides 1
4 + z2
/4 + z5
/12 + z11
/12
Φ6(z) = (1 − z + z2
) divides z/6 + z3
/6 + z5
/12 + z11
/12
Φ12(z) = (1 − z2
+ z4
) divides z5
/12 + z11
/12.
These are all readily checked, and so the given pairs are an ECS.
Theorem 4.10.2 has a number of corollaries, some of which are left as
exercises. One of them, however, is quite clear. If B = max{bj}, then B
cannot occur just once among the moduli {bj}. Indeed, if we take s = B
in the theorem, we discover that ψB(z) must have enough monomials in
it to allow it to be divisible by ΦB(z), so it must surely have at least two
monomials.Exercises 157
Exercises
1. Given a coin whose probability of turning up ‘heads’ is p, let pn be the
probability that the first occurrence of ‘heads’ is at the nth toss of the coin.
Evaluate pn and the opsgf of the sequence {pn}. Use that opsgf to find the
mean of the number of trials till the first ‘heads’ and the standard deviation
of that number.
2. In the coupon collector’s problem we imagine that we would like to get
a complete collection of photos of movie stars, where each time we buy a
box of cereal we acquire one such photo, which may of course duplicate one
that is already in our collection. Suppose there are d different photos in
a complete collection. Let pn be the probability that exactly n trials are
needed in order, for the first time, to have a complete collection.
(a) Show that
pn =
d!
©n−1
d−1
ª
dn
,
where
©n
k
ª
is the Stirling number of the second kind (see section
1.6).
(b) Let p(x) ops
← → {pn}. Show that
p(x) =
(d − 1)!xd
(d − x)(d − 2x)···(d − (d − 1)x)
.
(c) Find, directly from the generating function p(x), the average num-
ber of trials that are needed to get a complete collection of all d
coupons.
(d) Similarly, using p(x), find the standard deviation of that number
of trials.
(e) In the case d = 10, how many boxes of cereal would you expect to
have to buy in order to collect all 10 different kinds of pictures?
3. (First return times on trees) By a random walk on a graph we mean
a walk among the vertices of the graph, which, having arrived at some
vertex v, goes next to a vertex w that is chosen uniformly from among the
neighbors of v in the graph.
If T is a tree, and v is a vertex of T, let p(j;v;T) denote the probability
that a random walk on T which starts at vertex v, returns to v for the first
time after exactly j steps.
Now let T1, T2 be trees, let vi be a vertex of Ti for i = 1,2, and let
T be the tree that is formed from these two by adding edge (v1,v2).
Finally, let F1(x;v1), F2(x;v2), F(x;v1) be the opsgf’s of the sequences
{p(j;v1;T1)}j≥0, {p(j;v2;T2)}j≥0, and {p(j;v1;T)}j≥0, respectively.158 4 Applications of generating functions
(a) Show that
F(x;v1) =
1
d1 + 1
½
d1F1(x;v1) +
x2
d2 + 1 − d2F2(x;v2)
¾
,
where di is the degree of vertex vi in the tree Ti, for i = 1,2.
(b) Let µT (a) be the average number of steps in a random walk that
starts at vertex a ∈ T and stops when it returns to a for the first
time. Show, by differentiating the answer to part (a), that
µT (v1) =
1
d1 + 1
¡
2 + d1µT1
(v1) + d2µT2
(v2)
¢
.
(c) Let the tree T be a path of n + 1 vertices. Show that the mean
return time of a walk that begins at vertex v is 2n if v is one of
the two endpoints, and is n for all other v (surprisingly?).
(d) Again, if T is a path of n vertices, and if Pn(x) denotes the gener-
ating function F(x;v1) of part (a), where v1 is an endpoint of T,
then find an explicit formula for Pn(t).
4. Find, in terms of N(x), the opsgf of the sequences {e≤m} (resp. {e≥m})
which count the objects that have at most m properties (resp. at least m
properties).
5. What chessboard would you use to derive the number of permutations
that have no fixed points? Rederive the formula for this number using the
chessboard method.
6. (Bonferroni’s inequalities) In the sieve method, eq. (4.2.6) computes the
number of objects that have no properties at all. Suppose the alternating
series on the right were cut off after a certain value t = m, say. Show that
the result would overestimate e0 if m were even, and underestimate it for
m odd.
To do this, show that the sequence
αm =
X
r≥m
(−1)r−m
Nr (m = 0,1,2,...)
has the opsgf e0 + x
P
r≥0 er+1(x + 1)r
, whose coefficients are obviously
nonnegative.
7. (Bonferroni’s inequalities, cont.) Not only is e0 alternately under- and
overestimated by the successive partial sums of its sieve formula, the same
is true of every ek, the number of objects that have exactly k properties.
To show this generatingfunctionologically, define, for each k,t ≥ 0,
γ(k,t) = (−1)t+1



ek −
X
j≤t
(−1)j
µ
k + j
j
¶
Nk+j



.Exercises 159
Then the problem is to show that all γ(k,t) ≥ 0.
To do this,
(a) let Γ(x,y) be the 2-variable opsgf of the γ’s. Then multiply the
definition of the γ’s by xk
yt
, sum over k,t ≥ 0, and show that
Γ(x,y) =
E(x + (1 + y)) − E(x)
(1 + y)
.
(b) It now follows that the γ’s are nonnegative, and in fact that
γ(k,t) =
X
r>k
µ
r
k
¶µ
r − k − 1
t
¶
er (k,t ≥ 0).
8. Show that
X
r
µ
n
¥r
2
¦
¶
xr
= (1 + x)(1 + x2
)n
.
Then use Snake Oil to evaluate
X
k
µ
n
k
¶µ
n − k
¥m−k
2
¦
¶
yk
explicitly, when y = ±2 (due to D. E. Knuth). Find the generating function
of these sums, whatever the value of y.
9. Let G be a graph of n vertices, and let positive integers x, λ be given.
Let P(λ;x;G) denote the number of ways of assigning one of λ given colors
to each of the vertices of G in such a way that exactly x edges of G have
both endpoints of the same color.
Formulate the question of determining P as a sieve problem with a suitable
set of objects and properties. Find a formula for P(λ;x;G), and observe
that it is a polynomial in the two variables λ and x. The chromatic poly-
nomial of G is P(λ;0;G).
10.
(a) Let w be a word of m letters over an alphabet of k letters. Suppose
that no final substring of w is also an initial string of w. Use the
sieve method to count the words of n letters, over that alphabet
of k letters, that do not contain the substring w.
(b) Use the Snake Oil method on the sum that you got for the answer
in part (a).
11. Use the Snake Oil method to do all of the following:
(a) Find an explicit formula, not involving sums, for the polynomial
X
k≥0
µ
k
n − k
¶
tk
.160 4 Applications of generating functions
(b) Invent a really nasty looking sum involving binomial coefficients
that isn’t any of the ones that we did in this chapter, and evaluate
it in simple form.
(c) Evaluate
X
k
µ
2n + 1
2p + 2k + 1
¶µ
p + k
k
¶
,
and thereby obtain a ‘Moriarty identity.’
(d) Show that
X
m
µ
r
m
¶µ
s
t − m
¶
=
µ
r + s
t
¶
.
Then evaluate
X
k
µ
n
k
¶2
.
(e) Show that (Graham and Riordan)
X
k
µ
2n + 1
2k
¶µ
m + k
2n
¶
=
µ
2m + 1
2n
¶
.
(f) Show that for all n ≥ 0
X
k
µ
n
k
¶µ
k
j
¶
xk
=
µ
n
j
¶
xj
(1 + x)n−j
.
(g) Show that for all n ≥ 0
x
X
k
µ
n + k
2k
¶µ
x2
− 1
4
¶n−k
=
µ
x − 1
2
¶2n+1
+
µ
x + 1
2
¶2n+1
.
(h) Show that for n ≥ 1
X
k≥1
µ
n + k − 1
2k − 1
¶
(x − 1)2k
xn−k
k
=
(xn
− 1)2
n
.
12. The Snake Oil Method works not only on sums that involve binomial
coefficients, but on all sorts of counting numbers, as this exercise shows.
(a) Let {an} and {bn} be two sequences whose egf’s are, respectively,
A(x), B(x). Suppose that the sequences are connected by
bn =
X
k
·
n
k
¸
ak (n ≥ 0),Exercises 161
where the
£ ¤
’s are the Stirling numbers of the first kind. Show
that their egf’s are connected by
B(x) = A
µ
log
1
(1 − x)
¶
.
(b) Let b̃n be the number of ordered partitions of [n] (see (5.2.7)).
Show that
X
k
·
n
k
¸
b̃k = n!2n−1
(n ≥ 1).
(c) Let {an} be the numbers of derangements (= fixed point free
permutations) of n letters, and let {bn} be defined as in part (a).
Show that
{bn} egf
← →
1 − x
1 + log(1 − x)
.
(d) Repeat parts (a)-(c) on the Stirling numbers of the second kind,
and discover a few identities of your own that involve them.
(e) Generalize parts (a)-(d) to exponential families.
13. Prove that
X
k
(−1)n−k
µ
2n
k
¶2
=
µ
2n
n
¶
by exhibiting this sum as a special case of a sum with two free parameters,
and by using Snake Oil on the latter.
14. To do a sum that is of the form
S(n) =
X
k
f(k)g(n − k),
the natural method is to recognize S(n) as [xn
]{F(x)G(x)}, where F and
G are the opsgf’s of {fn} and {gn}. Use this method to evaluate
S(n) =
X
k
1
k + 1
µ
2k
k
¶
1
n − k + 1
µ
2n − 2k
n − k
¶
.
15.
(a) Prove the following generalization of (4.2.19), and show that it is
indeed a generalization. For all m,n,q ≥ 0, we have
X
r
µ
m
r
¶µ
n − r
n − r − q
¶
(t − 1)r
=
X
r
µ
m
r
¶µ
n − m
n − r − q
¶
tr
.162 4 Applications of generating functions
(b) The Jacobi polynomials may be defined, for n ≥ 0, by
P(a,b)
n (x) =
X
k
µ
n + a
k
¶µ
n + b
n − k
¶µ
x − 1
2
¶n−k µ
x + 1
2
¶k
.
Use the result of part (a) to show also that
P(a,b)
n (x) =
X
j
µ
n + a + b + j
j
¶µ
n + a
j + a
¶µ
x − 1
2
¶j
.
(c) Use the result of part (b) and a dash of Snake Oil to show that
P(a,b)
n (x) = 2−n
(x − 1)−a
£
tn+a+b
¤
½
(1 + x − 2t)n+a
(1 − t)n+1
¾
.
16. Prove the following generalization of the sum in example 2: if two
sequences {fn} and {ck} are connected by the equations
fn =
X
k
µ
n + k
m + 2k
¶
ck (n ≥ 0),
where m ≥ 0 is fixed, then their opsgf’s are connected by
F(x) =
xm
(1 − x)m+1
C
µ
x
(1 − x)2
¶
.
Say exactly what was special about the sequence {ck} that was used in
example 2 that made the result turn out to be so neat in that case.
17. The purpose of this problem is to show the similarity of the method of
[WZ] to some well known continuous phenomena.
(a) Let F(x,y), G(x,y) be differentiable functions that satisfy the
conditions that Fx = Gy and limy→±∞ G(x,y) = 0, for all x in a
certain interval a < x < b. Show that we have the ‘identity’
Z ∞
−∞
F(x,y)dy = const. (a < x < b).
(b) Show, using the result of part (a), that if f(z) is analytic in the
strip −∞ < a < <z < b < ∞, and if f → 0 on all vertical lines in
that strip, then the conclusion of part (a) holds, where F(x,y) is
the real part of f(z).
(c) Show that the result stated in part (b) is true without using the
result of part (a), but using instead the Cauchy integral theorem
applied to a suitable rectangle.Exercises 163
(d) Apply these results to f(z) = ez2
and thereby discover the ‘iden-
tity’ Z ∞
−∞
e−y2
cos(2xy)dy = ce−x2
(x real),
which states that the function e−y2
is its own Fourier transform.
Find c.
18. This problem gives a neat proof of Cayley’s formula for the number of
trees of n vertices, by showing more, namely that there is a pretty formula
for the number of such trees even if the degrees of all vertices are specified.
(a) Let d1,...,dn be positive integers whose sum is 2n − 2. Show that
the number of vertex-labeled trees T of n vertices, in which for all
i = 1,...,n it is true that di is the degree of vertex i of T, is exactly
fn(d1,...,dn) =
(n − 2)!
(d1 − 1)!(d2 − 1)!···(dn − 1)!
.
(Do this by induction on n. Show that one of the di’s, at least, must
be =1, and go from there.)
(b) Find the generating function
Fn(x1,...,xn) =
X
d1+···+dn=2n−2
d1,...,dn≥1
fn(d1,...,dn)xd1
1 ···xdn
n
in a pleasant, explicit form, involving no summation signs.
(c) Let x1 = x2 = ··· = xn = 1 in your answer to part (b), and thereby
prove Cayley’s result that there are exactly nn−2
labeled trees of n
vertices.
(d) Use the sieve method to show that if ek is the number of vertex
labeled trees on n vertices of which k are endpoints (vertices of degree
1), then
X
k
ekxk
=
X
r
µ
n
r
¶
rn−2
(x − 1)n−r
.
(e) Show that the average number of endpoints that trees of n vertices
have is
n
µ
1 −
1
n
¶n−2
∼
n
e
(n → ∞),
i.e., the probability that a random vertex of a tree is an endpoint is
about 1/e.164 4 Applications of generating functions
19.
(a) If N(⊆ S) is the number of objects whose set of properties is con-
tained in S, then for all sets T, the number of objects whose set of
properties is precisely T is
N(= T) =
X
S⊆T
(−1)|S|−|T|
N(⊆ S).
(b) Let S be a fixed set of positive integers, and let hn(S) be the number
of hands of weight n, in a certain labeled exponential family, whose
card sizes all belong to S. Find the egf of {hn(S)}.
(c) Multiply by (−1)|S|−|T|
and sum over S ⊆ T to find the egf of
{ψn(T)}n≥0, the number of hands whose set of distinct card sizes is
exactly T, in the form (the d’s are the deck sizes)
X
n≥0
ψn(T)
n!
xn
=
Y
t∈T
µ
e
dtxt
t! − 1
¶
.
(d) Let ρ(n,k) be the number of hands of weight n that have exactly k
different sizes of cards (however many cards they might have!). Sum
the result of (c) over all |T| = k, etc., to find that
X
n,k≥0
ρ(n,k)
n!
xn
yk
=
Y
t≥1
½
1 + y
¡
edtxt
/t!
− 1
¢
¾
.
(e) Let cn be the average number of different sizes of cycles that occur
in permutations of n letters. Show that the opsgf of {cn} is
1
1 − x
X
t≥1
µ
1 − e−xt
/t
¶
,
and find an explicit formula for cn.
20. Begin with the set {1,2,...,n}. Toss a coin n times, once for each
member of the set. Keep the elements that scored ‘Heads’ and discard the
elements that got ‘Tails’. You now have a certain subset S of the original
set. Call this whole process a ‘step’. Now take a step from S. That is,
toss a coin for each element of S, and keep those that get ‘Heads’, getting
a sub-subset S0
, etc. The game halts when the empty set is reached. Let
f(n,k,r) be the probability that after k steps, exactly r objects remain.
(a) Find a recurrence relation for f, find the generating function for f,
and find f itself.
(b) What is the average number of steps in a complete game?Exercises 165
(c) What is the standard deviation of the number of steps in the game?
21. As in section 4.7, let f(n,k,t) be the number of HC-polyominoes that
have n cells, in k layers, the highest layer consisting of exactly t cells. Show
that the ‘grand’ three-variable generating function is
X
n,k,t
f(n,k,t)xn
yk
zt
=
xyz(1 − x)2
((1 − xz)(1 − x)2
+ x2
y(z − 1))
(1 − xz)2((1 − x)4 − xy(1 − x − x2 + x3 + x2y))
.
Note that you do not have to start from scratch here, but instead you can
use the results of section 4.7.
22. Let (a1,b1),...,(ak,bk) be an exact covering sequence. Show that
X
j:aj is even
1
bj
= 1/2 =
X
j:aj is odd
1
bj
.
Generalize this result to other residue classes for the aj.
23. What is the probability that a random permutation has equal numbers
of r-cycles and s-cycles? Express your answer in terms of Bessel functions
(see chapter 2). Make a table of your answer, as a function of r and s, for
1 < r < s ≤ 6.
24. Find a three term recurrence relation, whose coefficients are polyno-
mials in n, that is satisfied by the quantity shown in (4.8.1), which is the
number of convex polyominoes of perimeter 2n + 8.
25. For (ai,bi)|k
i=1 to be an exact covering sequence it is necessary and
sufficient that for all n such that 0 ≤ n ≤ N, n is congruent to ai mod bi
for exactly one i, where N is the least common multiple of b1,...,bk.
26.
(a) Develop the generalization of the exponential formula that we were
really using in section 4.7. Precisely, suppose that for each i =
1,2,3,... we are given a set Si of positive integers. Let h(n) be the
number of hands of weight n that can be formed from a given collec-
tion of decks if our choices of cards are restricted by the condition
that for each i = 1,2,3,..., the number of cards of weight i that are
chosen for the hand must lie in the set Si. Then show that
X
n≥0
h(n)
tn
n!
=
∞ Y
i=1
expSi
¡diti
i!
¢
,
where expS(x) is the subseries of the exponential series whose indices
lie in the set S and, as in chapter 3, di is the number of cards in the
ith deck.166 4 Applications of generating functions
(b) Find the egf of {f(n)}, where f(n) is the number of partitions of the
set [n] in which the number of classes of size 2 is divisible by 2 and
the number of classes of size 3 is divisible by 3, etc.
27. In order that (ai,bi)|k
i=1 be an exact covering sequence of residues and
moduli, it is necessary and sufficient that [Fr]
k X
i=1
bn−1
i Bn(
ai
bi
) = Bn (n = 0,1,2,...)
where the {Bn} are the Bernoulli numbers (defined by (2.5.8)), and the
Bn(x) are the Bernoulli polynomials, defined by
text
et − 1
=
∞ X
n=0
Bn(x)tn
n!
.
28. Find a formula for the number of square roots that a permutation has.
What kind of a permutation has a unique square root?5.1 The Lagrange Inversion Formula 167
Chapter 5
Analytic and asymptotic methods
In the preceding chapters we have emphasized the formal aspects of
the theory of generating functions, as opposed to the analytic theory. One
of the attractions of the subject, however, is how easily one can shift gears
from thinking of generating functions as mere clotheslines for sequences to
regarding them as analytic functions of complex variables. In the latter
state of mind, one can deduce many properties of the sequences that are
generated that would be inaccessible to purely formal approaches. Notable
among these properties are the asymptotic growth rates of the sequences,
which are probably the main focus of the analytic side of the theory. Hence
in this chapter we will develop some of the analytic machinery that is invalu-
able for such studies. For an introduction to asymptotics and definitions of
all of the symbols of asymptotics, see, for example, chapter 4 of [Wi1].
## 5.1 The Lagrange Inversion Formula
The Lagrange Inversion Formula is a remarkable tool for solving certain
kinds of functional equations, and at its best it can give explicit formulas
where other approaches run into stone walls. The form of the functional
equation that the LIF can help with is
u = tφ(u). (5.1.1)
Here φ is a given function of u, and we are thinking of the equation as
determining u as a function of t. That is, we are ‘solving for u in terms of
t.’
We found one example of such an equation in section 3.12. There we
saw that if T(x) is the egf for the numbers of rooted labeled trees of each
number of vertices, then T(x) satisfies the equation T = xeT
, which is
indeed of the form (5.1.1), with φ(u) = eu
.
The general problem is this: suppose we are given the power series
expansion of the function φ = φ(u), convergent in some neighborhood of
the origin (of the u-plane). How can we find the power series expansion of
the solution of (5.1.1), u = u(t), in some neighborhood of the origin (in the
t-plane)? The answer is surprisingly explicit, and it even allows us to find
the expansion of some function of the solution u(t).
Theorem 5.1.1. (The Lagrange Inversion Formula) Let f(u) and φ(u) be
formal power series in u, with φ(0) = 1. Then there is a unique formal
power series u = u(t) that satisfies (5.1.1). Further, the value f(u(t)) of f
at that root u = u(t), when expanded in a power series in t about t = 0,
satisfies
[tn
]{f(u(t))} =
1
n
£
un−1
¤
{f0
(u)φ(u)n
}. (5.1.2)168 5 Analytic and asymptotic methods
Proof. First we note that it suffices to prove the theorem in the case
where f and φ are polynomials. Indeed, if n is fixed, and if f and φ are
full formal power series, then suppose that we truncate both of those series
by discarding all terms that involve powers uk
for k > n. If the result is
true for these polynomials then it remains true for the original untruncated
series, since the higher order terms that were discarded do not affect (5.1.2),
for the fixed n, at all.
Therefore we now suppose that f and φ are polynomials.
We will first make a formal computation, and then discuss the range
of validity of the results. We have
£
un−1
¤
{f0
(u)φ(u)n
} =
£
un−1
¤
{f0
(u)(u/t)n
}
=
£
u−1
¤
{f0
(u)/tn
}
=
1
2πi
Z
f0
(u)
t(u)n
du
=
1
2πi
Z
t−n
f0
(u(t))u0
(t)dt
= [tn
]{t(d/dt)f(u(t))}
= n[tn
]f(u(t)).
(5.1.3)
In the above, the first equality comes from (5.1.1), the second is trivial,
and the third is the residue theorem of complex integration, in which the
integrand is a function of u and the contour is, say, a small circle enclosing
0.
The fourth equality needs some discussion. Consider the behavior of
the function g(u) = u/φ(u) near the origin. Since φ(0) = 1, the function φ
remains nonzero in a neighborhood of 0. Hence g is analytic there, and it
has a power series development of the form u + cu2
+ ···. It follows that g
is a 1-1 conformal map near 0. Hence it has a well defined inverse mapping
that is itself analytic near 0. Thus (5.1.1) has a unique solution u = u(t)
in some neighborhood < of t = 0, and u is an analytic function of t there.
If the contour of integration in the integral that appears after the fourth
equals sign above is a circle around t = 0 that lies in <, then the sign of
equality is valid simply as a change of variable from u to t in the integral.
The remaining equalities are trivialities, and the proof is complete.
Example 1.
In section 3.12 we embarked on proving theorem 3.12.1, to the effect
that there are exactly nn−2
labeled trees of n vertices. We found that if
D(x) egf
← → {tn}, where tn is the number of rooted labeled trees of n vertices,
then D(x) satisfies the functional equation
D(x) = xeD(x)
. (5.1.4)5.1 The Lagrange Inversion Formula 169
Now, with the Lagrange Inversion Formula, we can actually solve
(5.1.4), because it is the case φ(u) = eu
of (5.1.1). If we take f(u) = u,
then according to (5.1.2),
[xn
]D(x) = (1/n)
£
un−1
¤
{φ(u)n
}
= (1/n)
£
un−1
¤
{enu
}
= (1/n)
nn−1
(n − 1)!
=
nn−1
n!
.
Hence,
tn
n!
=
nn−1
n!
,
and tn = nn−1
. But tn is the number of rooted trees of n vertices, and every
labeled tree contributes n rooted labeled trees, so the number of labeled
trees of n vertices is nn−2
, which completes the proof of theorem 3.12.1.
Example 2.
At the end of chapter 4 we discussed inverse pairs of summation for-
mulas and gave some examples beyond the Möbius inversion formula. Here
we’ll derive a much fancier example with the help of the LIF. We propose
to show that if two sequences {an} and {bn} are related by
bn =
X
k
µ
k
n − k
¶
ak, (5.1.5)
then we have the inversion
nan =
X
k
µ
2n − k − 1
n − k
¶
(−1)n−k
kbk. (5.1.6)
Indeed, if (5.1.5) holds, then, as we did so often in section 4.3, multiply
by xn
, sum on n, and interchange the k and n summations, to get
B(x) =
X
k
akxk
X
n
µ
k
n − k
¶
xn−k
=
X
k
akxk
(1 + x)k
= A(x(1 + x)),
(5.1.7)
where A, B are the opsgf’s of the sequences. Now we can solve for A in
terms of B by setting y = x + x2
. Then if we read (5.1.7) backwards, we
find that
A(y) = B(x(y)), (5.1.8)170 5 Analytic and asymptotic methods
where x(y) is the solution of the quadratic equation y = x+x2
that vanishes
when y = 0.
Now we could, of course, solve the quadratic explicitly. If we were to
do that (which we won’t) we would find from (5.1.8) that
A(y) = B
µ√
1 + 4y − 1
2
¶
,
and then we would want to find a nice formula for the coefficient of yn
on
the right hand side for every n. That, in turn, would require a nice formula
for
[yn
]
½√
1 + 4y − 1
2
¾k
(5.1.9)
for every n and k. Instead of trying to deal with (5.1.9) by explicitly raising
the quantity in braces to the kth power and working with the square root,
it is a lot more elegant to let the LIF do the hard work.
We begin by rephrasing the question (5.1.9) implicitly, rather than
explicitly. What we want is
[yn
]{x(y)k
},
where x = x(y) is the solution of y = x+x2
that is 0 at y = 0. In terms of
the LIF, we write the equation as
x =
y
1 + x
,
which is of the form (5.1.1) with φ(u) = 1/(1 + u). Further, since we want
the coefficients of the kth power of x(y), the function f(u) in the LIF is
now f(u) = uk
.
The conclusion (5.1.2) of the LIF tells us that
[yn
]{x(y)}k
= (1/n)[xn−1
]
½
kxk−1
(1 + x)n
¾
= (k/n)[xn−k
]
1
(1 + x)n
= (k/n)(−1)n−k
µ
2n − k − 1
n − k
¶
,
and we are all finished with the proof of (5.1.6).
It should be particularly noted that the LIF is as adept at computing
the coefficients of the kth power of the unknown function as those of the
unknown function itself. The function f in the statement of the LIF simply
specifies the function of the unknown function whose coefficients we would
like to know. The LIF then hands us those coefficients.5.2 Analyticity and asymptotics (I): Poles 171
## 5.2 Analyticity and asymptotics (I): Poles
Suppose we have found the generating function f(z) for a certain se-
quence of combinatorial numbers that interests us. Next we might want to
find the asymptotic behavior of the sequence, i.e., to find a simple function
of n that affords a good approximation to the values of our sequence when
n is large.
The first law of doing asymptotics is: look for the singularity or sin-
gularities of f(z) that are nearest to the origin. The reason is that f(z) is
analytic precisely in the largest circle centered at the origin that contains
no singularities, and we find the radius of that circle by finding the singu-
larities nearest to the origin. Once we have that radius, we have also the
radius of convergence of the power series f(z). Once we have the radius of
convergence we know something about the sizes of the coefficients when n
is large, as in theorem 2.4.3. By various refinements of this process we can
discover more detailed information.
Therefore, in this and the following sections we will study the influence
of the singularities of analytic functions on the asymptotic behavior of their
coefficients. These methods, taken together, provide a powerful technique
for obtaining the asymptotics of combinatorial sequences, and provide yet
another justification, if one were needed, of the generating function ap-
proach.
In this section we will concentrate on functions whose only singularities
are poles.
Let f(z) be analytic in some region of the complex plane that includes
the origin, with the exception of a finite number of singularities. If R is
the smallest of the moduli of these singularities, then f is analytic in the
disk |z| < R, so this will be precisely the disk in which its power series
expansion about the origin converges.
Conversely, if the power series expansion of a certain generating func-
tion f converges in the disk |z| < R but in no larger disk centered at the
origin, then there are one or more singularities of the function f on the
circumference |z| = R.
A number of methods for dealing with questions of asymptotic growth
of coefficient sequences rely on the following strategy: find a simple function
g that has the same singularities that f has on the circle |z| = R. Then
f − g is analytic in some larger disk, of radius R0
> R, say.
Then, according to theorem 2.4.3 (q.v.), the power series coefficients
of f − g will be < ( 1
R0 + ²)n
for large n, and therefore they will be much
smaller than the coefficients of f itself. The latter, according to the same
theorem 2.4.3, will infinitely often be as large as ( 1
R − ²)n
.
Therefore we will be able to find the most important aspects of the
growth of the coefficients of f by looking at the growth of the coefficients
of g.
The strategy that wins, therefore, is that of finding a simple function172 5 Analytic and asymptotic methods
that mimics the singularities of the function that one is interested in, and
then of using the growth of the coefficients of the simple function for the
estimate.
These considerations come through most clearly in the case of a mero-
morphic function f(z), i.e., one that is analytic in the region with the
exception of a finite number of poles, and so we will study such functions
first. The idea is that near a pole z0, a meromorphic function is well ap-
proximated by the principal part of its Laurent expansion, i.e., by the finite
number of terms of the series that contain (z−z0) raised to negative powers.
Example 1.
The function f(z) = ez
/(z − 1) is meromorphic in the whole finite
plane. Its only singularity is at z0 = 1, and the principal part at that
singularity is e/(z − 1). Hence the function f(z) − e/(z − 1) is analytic in
the whole plane. Thus if {cn} are the power series coefficients of f about
the origin, and {dn} are the same for the function e/(z −1), the difference
cn −dn is small when n is large. In fact, theorem 2.4.3 guarantees that for
every ² > 0 we have |cn − dn| < ²n
for all large enough n. Therefore the
‘unknown’ coefficients of f(z) are very well approximated by those of the
simple function e/(z − 1).
It is easy to work out this particular example completely to see just
how the machine works. The expansion of ez
/(z − 1) about the origin is
(see Rule 5 of section 2.2)
ez
(z − 1)
= −
X
n≥0
{1 + 1 + 1/2! + ··· + 1/n!}zn
.
On the other hand, the expansion of e/(z − 1) is
e
(z − 1)
= −e − ez − ez2
− ez3
− ···.
Hence the act of replacing the function by its principal part yields in one
step the approximation of the true coefficient of zn
, which is the nth partial
sum of the power series for −e, by −e itself, which is a smashingly good
approximation indeed. The reason for the great success in this case is that
merely subtracting off one principal part from the function expands its disk
of analyticity from radius =1 to radius = ∞.
Here’s another way to look at this example, without mentioning any
of the heavy machinery. Consider the innocent fact that
f(z) =
ez
z − 1
=
e
z − 1
+
ez
− e
z − 1
.
In the first term, the power series coefficients are all equal to −e. The
second term has no singularities at all in the finite plane, i.e., it is an entire5.2 Analyticity and asymptotics (I): Poles 173
function of z. By theorem 2.4.3, its coefficients are O(²n
) for every positive
². Therefore the coefficients of f(z) are
= −e + O(²n
) (n → ∞)
for every ² > 0.
In less favorable cases one may have to subtract off several principal
parts in order to increase the size of the disk of analyticity at all (i.e., if
there are several poles on the circumference), and even then it may increase
only a little bit if there are other singularities on a slightly larger circle.
If f is meromorphic in <, let z0 be a pole of f of order r, 1 ≤ r < ∞.
Then in some punctured disk centered at z0, f has an expansion
f(z) =
r X
j=1
a−j
(z − z0)j
+
∞ X
j=0
aj(z − z0)j
. (5.2.1)
The first one of the two sums above, the one containing the negative powers
of (z−z0), is called the principal part of the expansion of f around the singu-
larity z0, and we will denote it by PP(f;z0). The function f −PP(f;z0) is
analytic at z0. That is to say, we can remove the singularity by subtracting
off the principal part.
If, besides z0, there are other poles of f on the same circle |z| = R =
|z0|, then let z1,...,zs be all such poles. The function
h(z) = f(z) − PP(f;z0) − PP(f;z1) − ··· − PP(f;zs) (5.2.2)
is regular (analytic) at every one of the points {zj}s
0. But f had no other
singularities on that circle, so h is analytic in a circle centered at the origin
that has radius R0
, where R0
> R.
That means, by theorem 2.4.3 again, that the power series coefficients
of h, about the origin, cannot grow faster than
µ
1
R0
+ ²
¶n
for all large n. Thus, if f ops
← → {an}, and if
g(z) = PP(f;z0) + PP(f;z1) + ··· + PP(f;zs) ops
← → {bn}, (5.2.3)
then
an = bn + O
µµ
1
R0
+ ²
¶n¶
(n → ∞).
We may then be well on our way towards finding the asymptotic behavior
of the coefficients of f.174 5 Analytic and asymptotic methods
Indeed, let us now study the power series coefficients, about the origin,
of the sum of the principal parts that are shown in (5.2.3). We have, if z0
is a pole of multiplicity r,
PP(f;z0) =
r X
j=1
a−j
(z − z0)j
=
r X
j=1
(−1)j
a−j
zj
0(1 − (z/z0))j
=
r X
j=1
(−1)j
a−j
zj
0
X
n≥0
µ
n + j − 1
n
¶
(z/z0)n
=
X
n≥0
zn
½ r X
j=1
(−1)j
a−j
zn+j
0
µ
n + j − 1
j − 1
¶¾
.
(5.2.4)
We see, therefore, that a pole of order r at z0, of a function f, con-
tributes
r X
j=1
(−1)j
a−j
zn+j
0
µ
n + j − 1
j − 1
¶
(5.2.5)
to the coefficient of zn
in f.
The basic theorem, which asserts that we can well approximate the
coefficients of a meromorphic function by the coefficients of the principal
parts at its poles of smallest modulus, can be stated as follows:
Theorem 5.2.1. Let f be analytic in a region < containing the origin,
except for finitely many poles. Let R > 0 be the modulus of the pole(s)
of smallest modulus, and let z0,...,zs be all of the poles of f(z) whose
modulus is R. Further, let R0
> R be the modulus of the pole(s) of next-
smallest modulus of f, and let ² > 0 be given. Then
[zn
]f(z) = [zn
]
½ s X
j=0
PP(f;zj)
¾
+ O
µµ
1
R0
+ ²
¶n¶
. (5.2.6)
Proof. By theorem 2.4.3, this theorem will be proved as soon as we estab-
lish that if we subtract from f(z) the sum of all of its principal parts from
singularities on the circle |z| = R, then the resulting function is analytic in
the larger disk |z| < R0
. Consider the moment when we subtract PP(f;z0)
from f(z). Certainly the resulting function, g, say, is analytic at z0. Next,
however, we subtract PP(f;z1) from g instead of subtracting PP(g;z1)
from g. We claim that this doesn’t matter, i.e., that
PP(f − PP(f;z0);z1) = PP(f;z1).5.2 Analyticity and asymptotics (I): Poles 175
To see this, observe that
PP(f − PP(f;z0);z1) = PP(f;z1) − PP(PP(f;z0);z1).
But the second term on the right vanishes because PP(f;z0) is analytic at
z1.
By induction on s, the result follows.
Example 1. Ordered Bell numbers
We now investigate the asymptotic behavior of the ‘ordered Bell num-
bers.’ These are defined as follows: a set of n elements has
©n
k
ª
partitions
into k classes. If we now regard the order of the classes as important, but
not the order of the elements within the classes, then we see that [n] has
k!
©n
k
ª
ordered partitions into k classes. The ordered Bell number b̃(n) is
the total number of ordered partitions of [n], i.e., it is
P
k k!
©n
k
ª
.
Our question concerns the growth of {b̃(n)} when n is large. To find a
nice formula for these numbers, multiply both sides of the identity (4.2.16)
by e−y
and integrate from 0 to ∞. This gives the neat result that
b̃(n) =
X
r≥0
rn
2r+1
. (5.2.6)
Then the exponential generating function of the ordered Bell numbers is*
f(z) =
X
n≥0
b̃(n)
n!
zn
=
1
2 − ez
. (5.2.7)
We’re in luck! The generating function f(z) has only simple poles,
namely at the points log2 ± 2kπi for all integer k. The principal part at
the pole z0 = log2 is (−1/2)/(z − log2). That principal part all by itself
contributes
1
2(log2)n+1
to the coefficient of zn
. There are no other singularities of f(z) on the circle
of radius log2 centered at the origin. Hence
h(z) = f(z) −
(−1/2)
(z − log2)
is analytic in the larger circle that extends from the origin to log2 + 2πi.
The radius of that circle is
ρ =
p
(log2)2 + 4π2 = 6.321....
* Be sure to work this out for yourself.176 5 Analytic and asymptotic methods
Hence the coefficients of h(z) are O((.16)n
). Altogether, we have shown
that the ordered Bell numbers b̃(n) are of the form
b̃(n) =
1
2(log2)n+1
n! + O((.16)n
n!), (5.2.8)
which is not bad for so little effort invested. More terms of the asymptotic
expansion can be produced as desired from the principal parts of f(z) at
its remaining poles, taken in nondescending order of their absolute values.
The reader should look into the contribution of the next two poles together,
which are complex conjugates of each other.
Below we show a table of some values of n, b̃(n), and n!/(2(log2)n+1
).
n 1 2 3 5 10
b̃(n) 1 3 13 541 102247563
n!/(2(log2)n+1
) 1.04 3.002 12.997 541.002 102247563
The agreement is astonishingly close. Basically all we have done is to
use the Taylor coefficients of the series for 1/(2(log2−z)) as approximations
to the coefficients of the series for 1/(2 − ez
). Yet we are rewarded with a
superb approximation.
Example 2. Permutations with no small cycles
Fix a positive integer q. Let f(n,q) be the number of permutations
of n letters whose cycles all have lengths > q. We want the asymptotic
behavior of f(n,q).
By exercise 11 of chapter 3, the egf of {f(n,q)}∞
0 is
fq(z) = exp
X
n>q
zn
n
= exp



log
1
1 − z
−
X
1≤n≤q
zn
n



=
1
1 − z
e−{z+···+zq
/q}
.
(5.2.9)
The only singularity of fq(z) in the finite plane is a pole of order 1 at
z = 1 with principal part e−Hq
/(1 − z), where
Hq = 1 +
1
2
+
1
3
+ ··· +
1
q
is the qth harmonic number.5.3 Analyticity and asymptotics (II): Algebraic singularities 177
This is the kind of situation where we get very accurate asymptotic
estimates, because the difference between the function and its principal part
at z = 1 is
h(z) = fq(z) −
e−Hq
1 − z
=
e−{z+···+zq
/q}
− e−Hq
1 − z
,
and is analytic in the whole plane, i.e., is an entire function. Again, by
theorem 2.4.3, the nth coefficient of h(z) is O(²n
) as n → ∞ for every
² > 0. Therefore,
f(n,q)
n!
= e−Hq
+ O(²n
) (n → ∞). (5.2.10)
The strikingly small error term in this estimate suggests that for each
fixed q the probability that an n-permutation has no cycles of length ≤ q
should be very nearly independent of n. Consider the case q = 1 to get some
of the flavor of what is going on here. Then f(n,1)/n! is the probability
that an n-permutation has no fixed point. But we saw in (4.2.10) that
f(n,1)/n! = e−1
|n = 1 − 1 + 1/2 − ··· + (−1)n
/n!
= e−1
+ O(1/n!).
Indeed, the probability is very nearly independent of n, and the error in-
volved in using the principal part is O(²n
) for every positive ².
The two examples above have shown the method at work in situations
where it was atypically accurate. More commonly one finds not just one
pole of order 1 in the entire plane, but many poles of various multiplicities.
The method remains the same in such cases, but a lot more work may be
necessary in order to get estimates of reasonable accuracy. An example
that shows this kind of phenomenon was worked out in section 3.15, in
connection with the money-changing problem. In fact, the proof of Schur’s
theorem (Theorem 3.15.2) was an exercise in the use of principal parts at the
poles of a meromorphic function. The importance of the single dominant
singularity was, in that case, much less, though it was enough to get the
theorem proved!
## 5.3 Analyticity and asymptotics (II): Algebraic singularities
Again, let f(z) be analytic in some region that contains the origin, but
now suppose that the singularity z0 of f that is nearest to 0 is not a pole,
but is an algebraic singularity (branch point). What that means is that
f(z) = (z0 −z)α
g(z), where g is analytic at z0 and α is not an integer, but
is a real number.178 5 Analytic and asymptotic methods
A case in point was given in (3.9.1), where we found that the egf for
the numbers of graphs of n vertices whose vertex-degrees are all equal to 2
is
f(z) =
e−z/2−z2
/4
√
1 − z
. (5.3.1)
In this section we will derive the theorem (‘Darboux’s lemma’) that
allows us to deduce the asymptotics of sequences with this kind of a gener-
ating function. What it all boils down to is that one should do exactly the
same thing in this case as in the case of meromorphic functions, and the
right answer will fall out. The proof that this is indeed valid, however, is
more demanding in the present case. We follow the proof in [KnW].
By considering f(zz0) instead of f(z), if necessary, we see that we can
assume without loss of generality that z0 = 1. Hence we are dealing with a
function f that is analytic in the unit disk, and which has a branch point
at z = 1. We will also assume, until further notice, that z0 = 1 is the only
singularity that f has in some disk |z| < 1 + η, where η > 0.
After the lessons of the previous section on meromorphic functions,
here’s how we might proceed in this case. First we have f(z) = (1−z)α
g(z),
where g is analytic at z = 1. That being the case, we can expand g in a
power series
g(z) =
X
k≥0
gk(1 − z)k
that converges in a neighborhood of z = 1. Hence f itself has an expansion
f(z) =
X
k≥0
gk(1 − z)k+α
. (5.3.2)
By analogy with the procedure for meromorphic functions, we might
expect that each successive term in the above series expansion generates
the next term of the asymptotic expansion of the coefficients of f. That is
in fact true. The dominant behavior of the coefficient of zn
in f(z) comes
from the first term in (5.3.2). That is, the simple function g0(1 − z)α
has,
for its coefficient of zn
, the main contribution to that coefficient of f, etc.
We will now prove all of these things.
Lemma 5.3.1. Let {an}, {bn} be two sequences that satisfy (a) an =
O(n−γ
) and (b) bn = O(θn
) (0 < θ < 1). Then
X
k
akbn−k = O(n−γ
).
Proof. We have first (the C’s are not all the same constant)
¯
¯
¯
¯
X
0≤k≤n/2
akbn−k
¯
¯
¯
¯ ≤
½
max
0≤k≤n/2
|ak|
¾½ X
0≤k≤n/2
Cθn−k
¾
≤ max{C,Cn−γ
}{Cθn/2
}
≤ Cθ̃n
(0 < θ̃ < 1).5.3 Analyticity and asymptotics (II): Algebraic singularities 179
Further,
¯
¯
¯
¯
X
n/2<k≤n
akbn−k
¯
¯
¯
¯ ≤
½
max
n/2<k≤n
|ak|
¾



X
n/2<k≤n
θn−k



≤ Cn−γ
.
Lemma 5.3.2. If β / ∈ {0,1,2,...}, then
[zn
](1 − z)β
∼
n−β−1
Γ(−β)
. (5.3.3)
Proof. We have
[zn
](1 − z)β
=
µ
β
n
¶
(−1)n
=
µ
n − β − 1
n
¶
=
Γ(n − β)
Γ(−β)Γ(n + 1)
,
and the result follows from Stirling’s formula, which is
Γ(n + 1) = n! ∼
³n
e
´n√
2πn (n → ∞).
Lemma 5.3.3. Let u(z) = (1 − z)γ
v(z), where v(z) is analytic in some
disk |z| < 1 + η, (η > 0). Then
[zn
]u(z) = O(n−γ−1
). (5.3.4)
Proof. Apply lemma 5.3.1 with an = [zn
](1−z)γ
and bn = [zn
]v(z). Since
v is analytic in a disk |z| < 1 + η, we have bn = O(θn
). The result follows
by lemma 5.3.2.
Theorem 5.3.1. (Darboux) Let v(z) be analytic in some disk |z| < 1+η,
and suppose that in a neighborhood of z = 1 it has the expansion v(z) = P
vj(1 − z)j
. Let β / ∈ {0,1,2,...}. Then
[zn
]
©
(1 − z)β
v(z)
ª
= [zn
]



m X
j=0
vj(1 − z)β+j



+ O(n−m−β−2
)
=
m X
j=0
vj
µ
n − β − j − 1
n
¶
+ O(n−m−β−2
).
(5.3.5)180 5 Analytic and asymptotic methods
Proof. We have
(1 − z)β
v(z) −
m X
j=0
vj(1 − z)β+j
=
X
j>m
vj(1 − z)β+j
= (1 − z)β+m+1
ṽ(z),
where the regions of analyticity of ṽ and of v are the same. The result now
follows from lemma 5.3.3.
Example 1. 2-regular graphs
For the exponential generating function f(z), in (5.3.1), of the number
of 2-regular graphs of n vertices, we have f(z) = (1−z)β
v(z) with β = −1/2
and v(z) = exp{−z/2−z2
/4}. The first few terms of the expansion of v(z)
about z = 1 are
e−z/2−z2
/4
= e−3/4
+ e−3/4
(1 − z) +
1
4
e−3/4
(1 − z)2
+ ···
Then according to (5.3.5) this expansion of v(z) around z = 1 ‘lifts’
to an asymptotic formula for the coefficients of f(z), which are in this case
γ(n)/n!, where γ(n) is the number of 2-regular graphs of n vertices. If we
use (5.3.5) with m = 2, we obtain
γ(n)
n!
= e−3/4
µ
n − 1/2
n
¶
+ e−3/4
µ
n − 3/2
n
¶
+
1
4
e−3/4
µ
n − 5/2
n
¶
+ O(n−7/2
).
(5.3.6)
If we like, we can further simplify the answer by using the known
asymptotic expansion of the binomial coefficient
µ
n − α − 1
n
¶
≈
n−α−1
Γ(−α)
·
1 +
α(α + 1)
2n
+
α(α + 1)(α + 2)(3α + 1)
24n2
+ ···
¸
.
(5.3.7)
If this be substituted into (5.3.6), the result is
γ(n) ≈
n!e−3/4
√
nπ
½
1 −
5
8n
+
1
128n2
+ ···
¾
. (5.3.8)
The form of Darboux’s method that we have proved applies when there
is just one algebraic singularity on the circle of convergence. The method
can be extended to several such singularities. We quote without proof a
more general result of this kind ([Sz], thm. 8.4):5.4 Analyticity and asymptotics (III): Hayman’s method 181
Theorem 5.3.2. (Szegö) Let h(w) be analytic in |w| < 1 and suppose it
has a finite number of singularities {eiφk
}r
1 on |w| = 1. Suppose that in the
neighborhood of each singularity eiφk
there is an expansion
h(w) =
X
ν≥0
c(k)
ν (1 − we−iφk
)αk+νβk
,
where βk > 0. Then the following is a complete asymptotic series for the
coefficients of h(w):
[wn
]h(w) ≈
X
ν≥0
r X
k=1
c(k)
ν
µ
αk + νβk
n
¶
(−eiφk
)n
.
## 5.4 Analyticity and asymptotics (III): Hayman’s method
In the previous two sections we have seen how to handle the asymp-
totics of sequences whose generating functions have singularities in the finite
plane. Essentially, one looks for the singularity(ies) nearest the origin, finds
simple functions whose behavior near the singularities is the same as that
of the generating function in question, and then proves that the asymptotic
behavior of the coefficients of that generating function is the same as that
of the coefficients of the simple functions that behave the same way near
the singularities.
But what shall we do if the generating function doesn’t have any sin-
gularities, i.e., if it is an entire function?
Example 1. The coefficients of ez
Consider the function ez
. The coefficient of zn
in ez
is 1/n!. Can we
think of some fairly general method for handling the asymptotics of entire
functions, which in this case will derive Stirling’s formula for us?
Here’s how we might begin. By Cauchy’s formula we have
1
n!
=
1
2πi
Z
ez
dz
zn+1
,
where the contour of integration is some simple closed curve that encloses
the origin. If we use for the contour a circle of radius r centered at the
origin, then by taking absolute values we find that
1
n!
≤
1
2π
max
|z|=r
½
|ez
|
|z|n+1
¾
(2πr)
=
er
rn
.
Since ez
is an entire function the value of r > 0 is entirely up to us,
so we might as well choose it to minimize the upper bound that we will
obtain. But
min
r>0
er
rn
(5.4.1)182 5 Analytic and asymptotic methods
is attained at r = n, so the best possible estimate that we can get from this
argument is that
1
n!
≤ (
e
n
)n
.
If we compare this with Stirling’s formula
1
n!
∼
1
√
2nπ
(
e
n
)n
,
we see that we haven’t done too badly, since our rather crude estimate
differs from the ‘truth’ by only a factor of about 1/
√
2nπ.
To do better than this we are going to have to treat the variation of
ez
around the contour of integration with a little more respect, and not
just replace it by the maximum absolute value that it attains. Indeed, for
most of the way around the circumference |z| = r, the absolute value of ez
is considerably smaller than er
. It is only in a small neighborhood of the
point z = r that it is nearly that large.
In his 1956 paper A generalisation of Stirling’s formula, W. K. Hayman
[Ha] developed machinery of considerable power for dealing more precisely
with this kind of situation. Further, his method is uncommonly useful for
generating functions that arise in combinatorial theory, because these tend
to have nonnegative real coefficients. For that reason, on any circle centered
at the origin, such a function will be largest in modulus at the positive real
point on that circle. Hayman’s method is strongest on just such functions.
Hayman’s machinery applies not only to entire functions, but to all
analytic functions, even those with singularities in the finite plane. In
practice it has most often been used on entire functions, mainly because,
as we have seen, other methods are available when singularities exist in the
finite plane.
Let f(z) be analytic in a disk |z| < R in the complex plane, where
0 < R ≤ ∞. Suppose further that f(z) is an admissible function for the
method. Operationally, that simply means that f(z) is a function on which
the method works. We will give some sufficient conditions for admissibility
below.
Define
M(r) = max
|z|=r
{|f(z)|}. (5.4.2)
It will be a consequence of the admissibility conditions that
M(r) = f(r) (5.4.3)
for all large enough r. This is because, as we remarked above, the method
is aimed at functions that take their largest values in the direction of the
positive real axis.5.4 Analyticity and asymptotics (III): Hayman’s method 183
Next define two auxiliary functions,
a(r) = r
f0
(r)
f(r)
(5.4.4)
and
b(r) = ra0
(r) = r
f0
(r)
f(r)
+ r2 f00
(r)
f(r)
− r2
µ
f0
(r)
f(r)
¶2
. (5.4.5)
The main result is the following:
Theorem 5.4.1. (Hayman) Let f(z) =
P
anzn
be an admissible function.
Let rn be the positive real root of the equation a(rn) = n, for each n =
1,2,..., where a(r) is given by eq. (5.4.4) above. Then
an ∼
f(rn)
rn
n
p
2πb(rn)
as n → +∞, (5.4.6)
where b(r) is given by (5.4.5) above.
It will be noted that the recipe itself is quite straightforward to apply.
What is often difficult is determining whether the function f(z) is admis-
sible for the method or not. Before we explain that notion, let’s apply the
theorem to f(z) = ez
, taking on faith, for now, the fact that it is admissible.
Example 1. (continued) The function ez
First we would calculate a(r) = r, in this case, from (5.4.4). Then the
equation a(rn) = n, which determines {rn}, becomes just rn = n. These
numbers rn are the same as those that we found earlier from the condition
(5.4.1). They are simply the values of r at which the minimum of f(r)/rn
occurs.
Next we find b(r) = r from (5.4.5), and Hayman’s result (5.4.6) reads
as
1
n!
∼
en
nn
√
2nπ
,
which is Stirling’s formula again, but this time in its exact form.
Next let’s give a precise definition of the class of admissible functions.
Let f(z) =
P
n≥0 anzn
be regular in |z| < R, where 0 < R ≤ ∞. Suppose
that
(a) there exists an R0 < R such that
f(r) > 0 (R0 < r < R),
and
(b) there exists a function δ(r) defined for R0 < r < R such that
0 < δ(r) < π for those r, and such that as r → R uniformly for
|θ| ≤ δ(r), we have
f(reiθ
) ∼ f(r)eiθa(r)−1
2 θ2
b(r)
,184 5 Analytic and asymptotic methods
and
(c) uniformly for δ(r) ≤ |θ| ≤ π we have
f(reiθ
) =
o(f(r))
p
b(r)
(r → R),
and
(d) as r → R we have b(r) → +∞, where a(r), b(r) are defined by
(5.4.4), (5.4.5). Then we will say that f(z) is admissible, and the apparatus
of theorem 5.4.1 above is available for determining the asymptotic growth
of the coefficients {an}.
However, it isn’t always necessary to appeal directly to the definition
of admissibility in order to be sure that a certain function is admissible.
Here are some theorems that give sufficient conditions for admissibility,
conditions that are much easier to verify than the formal definition above.
(A) If f(z) is admissible, then so is ef(z)
.
(B) If f and g are admissible in |z| < R, then so is fg.
(C) Let f be admissible in |z| < R. Let P be a polynomial with
real coefficients which satisfies P(R) > 0, if R < ∞, and which
has a positive highest coefficient, if R = +∞. Then f(z)P(z) is
admissible in |z| < R.
(D) Let P be a polynomial with real coefficients, and let f be admis-
sible in |z| < R. Then f + P is admissible, and if the highest
coefficient of P is positive, then P[f(z)] is also admissible.
(E) Let P(z) be a nonconstant polynomial with real coefficients, and
let f(z) = eP(z)
. If [zn
]f(z) > 0 for all sufficiently large n, then
f(z) is admissible in the plane.
Example 2.
Let tn be the number of involutions of n letters, i.e., the number of
permutations of n letters whose cycles have lengths ≤ 2. We will find the
asymptotic behavior of {tn}.
By (3.8.3), the egf of the sequence {tn} is
f(z) =
X
n≥0
tn
n!
zn
= ez+1
2 z2
.
By criterion (E) above, f(z) is clearly Hayman admissible in the whole
plane. Hence theorem 5.4.1 applies. To use it, we first calculate the func-
tions a(r), b(r) of (5.4.4) and (5.4.5). We find that
a(r) = r
f0
(r)
f(r)
= r + r2
and
b(r) = ra0
(r) = r + 2r2
.5.4 Analyticity and asymptotics (III): Hayman’s method 185
Next we let rn be the positive real solution of the equation a(rn) = n, which
in this case is the equation
rn + r2
n = n. (5.4.7)
Evidently
rn =
r
n +
1
4
−
1
2
=
√
n
½
1 +
1
4n
¾1
2
−
1
2
=
√
n
½
1 +
1
8n
−
1
128n2
+ ···
¾
−
1
2
(by (2.5.6))
=
√
n −
1
2
+
1
8
√
n
−
1
128n3/2
+ ···,
(5.4.8)
so we have a very good fix on where rn is, in this case.
Now, it would seem, all we have to do is to plug things into Hayman’s
estimate (5.4.6), and that’s true, but there will be one little subtlety that
will require a bit of explanation. If we take a look at (5.4.6) we see that
we will need asymptotic estimates of the ‘∼’ kind for f(rn), b(rn), and rn
n.
Let’s take them one at a time.
First,
f(rn) = ern+1
2 r2
n = e
1
2 (rn+n)
= en/2
ern/2
,
where (5.4.7) was used again. But in view of (5.4.8),
ern/2
= exp
½√
n
2
−
1
4
+ O(n−1/2
)
¾
∼ e
1
2
√
n−1
4 (n → ∞)
,
and so
f(rn) ∼ exp
½
n
2
+
1
2
√
n −
1
4
¾
(n → ∞). (5.4.9)
So far, so good. Next on the list is b(rn), and that one is easy since
b(rn) = rn + 2r2
n ∼ 2r2
n ∼ 2n (n → ∞). (5.4.10)
The last one is the hardest, and it is
rn
n =
½
√
n −
1
2
+
1
8
√
n
− ···
¾n
= n
n
2
½
1 −
1
2
√
n
+
1
8n
− ···
¾n
.
(5.4.11)186 5 Analytic and asymptotic methods
What we want to do now is to find just one term of the asymptotic behavior
of the large curly brace to the nth power, and of course, it’s that nth power
that causes the difficulty.
To illustrate the method in a simpler context, consider (1+ 1
n)n
. What
does this behave like for large n? Does it approach 1? We know that it
doesn’t; in fact it approaches e. So the correct asymptotic relation is
µ
1 +
1
n
¶n
∼ e (n → ∞).
Hence, although 1 + 1
n
∼ 1, (1 + 1
n
)n
∼ e. In general, one cannot raise
both sides of an asymptotic equality to the nth power and expect it still to
be true. In exercise 7 below there are a number of situations of this kind to
think about.
To take a slightly harder example, how would we deal with
µ
1 +
1
√
n
¶n
? (5.4.12)
What does it behave like when n is large? The way to deal with all of these
questions is first to replace (1 + ···)n
by exp{nlog(1 + ···)}. Next, the
logarithm should be expanded by using the power series (2.5.2), to get
(1 + ···)n
= exp{nlog(1 + ···)}
= exp
¡
n{(···) − (···)2
/2 + (···)3
/3 − ···}
¢
.
The infinite series in the argument of the exponential must now be broken
off at exactly the right place. Terms can be ignored beginning with the first
one which, when multiplied by n, still approaches 0. More briefly, we can
ignore all terms of that infinite series which are o(n−1
).
In the example (5.4.12) we have
µ
1 +
1
√
n
¶n
= exp
½
nlog
µ
1 +
1
√
n
¶¾
= exp
½
n
µ
1
√
n
−
1
2n
+ O(n−3/2
)
¶¾
∼ exp
½
n
µ
1
√
n
−
1
2n
¶¾
= exp
½
√
n −
1
2
¾
.
Now that we have that subject under our belts, we can return to the5.4 Analyticity and asymptotics (III): Hayman’s method 187
real problem, which is (5.4.11). We now find that
½
1 −
1
2
√
n
+
1
8n
− ···
¾n
= exp
½
nlog
µ
1 −
1
2
√
n
+
1
8n
− ···
¶¾
= exp
(
n
Ãµ
−
1
2
√
n
+
1
8n
¶
−
1
2
µ
−
1
2
√
n
+
1
8n
¶2
+ O(n−3/2
)
!)
∼ exp(−
√
n/2).
Hence, from (5.4.11),
rn
n ∼ nn/2
exp(−
√
n/2). (5.4.13)
That finishes the estimation of the three quantities that are needed by
Hayman’s theorem. The result, obtained by putting (5.4.9), (5.4.10), and
(5.4.13) into (5.4.6) is that
an =
tn
n!
∼
e
n
2 +
√
n−1
4
2n
n
2
√
nπ
.
Finally, if we multiply by n! and use Stirling’s formula, we obtain, for
the number of involutions of n letters,
tn ∼
1
√
2
nn/2
exp
µ
−
n
2
+
√
n −
1
4
¶
. (5.4.14)188 5 Analytic and asymptotic methods
Exercises
1. Use the LIF to show that the (infinite) binomial coefficient sum
ξ =
X
s
µ
sL + 1
s
¶
A−sL−1
(sL + 1)
,
for A > 1 and integer L > 0, satisfies ξL
− Aξ + 1 = 0.
2. The Legendre polynomials {Pn(x)} are generated by
1
√
1 − 2xt + t2
=
X
n≥0
Pn(x)tn
.
Let x be a fixed complex number that lies outside the real interval [−1,1],
and let τ denote that one of the two roots of the equation τ2
−2xτ +1 = 0
which is > 1 in absolute value. Use the method of Darboux to show that,
as n → ∞,
Pn(x) ∼
τn+1
p
nπ(τ2 − 1)
.
3. If u = u(t) satisfies u = tφ(u) and n ≥ 0, show that
[un
]{φ(u)}n
= [tn
]
½
tu0
(t)
u(t)
¾
= [tn
]
1
(1 − tφ0(u(t)))
.
4. Define, for all n ≥ 0, γn = [xn
](1 + x + x2
)n
.
(a) Use the result of exercise 3 above to prove that for n ≥ 0,
γn = [xn
]
½
1
√
1 − 2x − 3x2
¾
.
(b) Show that, using the notation of problem 2 above,
γn =
³√
3/i
´n
Pn(i/
√
3),
and so obtain the asymptotic behavior of the sequence {γn} for
large n.
5. Define, for integer p ≥ 3,
Sp(n) =
n X
k=0
µ
pn
k
¶
(n ≥ 0).Exercises 189
(a) Exhibit Sp(n) as [xn
] in a certain ordinary power series, which
(alas!) itself depends on n.
(b) Nevertheless, use the LIF (backwards) to show that
X
n
Sp(n)xn
(1 + x)−pn−1
=
1
(1 − x)(1 − (p − 1)x)
.
(c) Deduce from part (b) that the {Sp(n)} satisfy the recurrence
X
k
(−1)k
µ
pn − (p − 1)k
k
¶
Sp(n−k) =
(p − 1)n+1
− 1
p − 2
(n ≥ 0).
(d) If F(u) =
P
n≥0 Sp(n)un
, let
x =
1
(p − 1)
− ²
in part (b) to show that
F
µ
(p − 1)p−1
pp
½
1 −
(p − 1)3
2p
²2
+ ···
¾¶
=
p
(p − 1)(p − 2)²
+O(1)
as ² → 0.
(e) If
g(x) = F
µ
(p − 1)p−1
pp
x
¶
then show that
g(x) =
1
(p − 2)
sµ
p
2
¶
1
√
1 − x
+ O(1).
(f) Use Darboux’s method to show that, as n → ∞,
Sp(n) ∼
1
(p − 2)
s¡p
2
¢
nπ
µ
pp
(p − 1)p−1
¶n
.
(g) From part (b) show that
X
n≥0
S3(n)
µ
4u2
27
¶n
=
u
u − 2sin(1
3 sin−1
u)
−
2u
2u − 3sin(1
3 sin−1
u)
.190 5 Analytic and asymptotic methods
6. Under what additional conditions on a polynomial P with nonnegative
real coefficients will there exist an N such that for all n > N we have
[zn
]eP(z)
> 0?
7. Find the asymptotic behavior (main term) of (1 + ²n)n
if
(a) ²n = na
(0 < a < 1),
(b) ²n = n−a
(0 < a < 1),
(c) ²n = n−a
logn (1 < a < 2).
8. The purpose of this problem is to find the asymptotic behavior of the
number an of permutations of n letters whose cycles are all of lengths ≤ 3,
by using Hayman’s method and the Lagrange Inversion Formula. (The use
of a symbolic manipulation package on a computer is recommended for this
problem, in order to help out with some fairly tedious calculations with
power series that will be necessary).) The egf of {an} is
f(z) = exp{z +
z2
2
+
z3
3
}.
(a) Show that f is admissible in the plane.
(b) Because rn in this case satisfies a cubic equation rather than a
quadratic, as in the example in the text, we will use the LIF to
find the root and its powers with sufficient precision. Show that
if we write
u = 1/rn; t = n−1/3
; φ(u) = (1 + u + u2
)1/3
,
then u satisfies the equation u = tφ(u), which is in the form
(5.1.1).
(c) Use the LIF to show that the root rn has the asymptotic expansion
1
rn
=
1
n1/3
+
1
3
1
n2/3
+
1
3
1
n
+
8
81
1
n4/3
+ O(n−5/3
).
(d) Explain why the number of terms that were retained in part (c) is
the minimum number that can be retained and still get the first
term of the asymptotic expansion of an with this method.
(e) Show that
1
rn
n
∼ n−n
3 exp
½
1
3
n2/3
+
5
18
n1/3
¾
.
(f) Show that
b(rn) ∼ 3n.5.4 Analyticity and asymptotics (III): Hayman’s method 191
(g) Show that
f(rn) ∼ exp
½
1
3
n +
1
6
n2/3
+
5
9
n1/3
−
29
162
¾
.
(h) Combine the results of (d), (e), (f) to show that the number of
permutations of n letters that have no cycles of lengths > 3 is
an ∼
n
2n
3
√
3
exp
½
−
2n
3
+
1
2
n2/3
+
5
6
n1/3
−
29
162
¾
.
9. Derive the power series expansion (2.5.16).
10. In this exercise, σ(n,k) is the number of involutions of n letters that
have exactly k cycles, and tn =
P
k σ(n,k) is the number of involutions of
n letters.
(a) Show that
X
n,k
σ(n,k)
n!
xn
yk
= ey(x+1
2 x2
)
.
(b) Hence find the formula
σ(n,k) =
n!
(n − k)!(2k − n)!2n−k
for σ(n,k).
(c) Using the results of part (a) and problem 5 of chapter 3, show
that the average number of cycles in an involution of n letters is
exactly
n
2
½
1 +
tn−1
tn
¾
.
(d) Using (5.4.14), show that the average number of cycles in an in-
volution of n letters is
=
n
2
+
1
2
√
n(1 + o(1)) (n → ∞).Appendix
Using Maple∗
and Mathematica∗∗
Many branches of mathematics that were formerly thought of as being fit
only for humans, are being invaded by computers. First, elementary school
students learned how to multiply numbers with many digits and then found
out that little calculators could do it for them. Other kinds of mathematics
that are taught in secondary schools that now can be done by computers
include expanding and factoring algebraic expressions, solving linear and
quadratic equations, plotting graphs of curves and surfaces, doing logarithms
and powers, and more.
At the university level we find now that “computer algebra” programs
can differentiate functions symbolically, do integrals, vector analysis, linear
algebra, etc., all symbolically, rather than numerically.
Here we want to show how computers can easily handle much of the
routine work that is involved in solving problems about generating functions.
To emphasize this point, we will show how well computers can do some of
the homework problems in this book! Very well indeed, we’re sure you will
agree.
In this brief Appendix we’ll discuss first how computer programs can
do extensive manipulations of power series. Next we’ll focus on one such
program, MathematicaTM
(Version 2.0) , and tell you about its amazing built-
in RSolve function. Finally we will look at how MapleTM
handles asymptotics,
which can be quite a boon for problems such as those we looked at in the
previous chapter.
1. Series manipulation
In MathematicaTM
, the instruction Series[f,x,x0,m] will display the
first m + 1 terms of the power series expansion of f about x = x0. Thus,
to see the first 10 terms of the series for sinx/(1 + x), about the origin, you
would enter (the MapleTM
instruction that would accomplish the same thing
would be series(sin(x)/(1+x),x=0,9) )
Series[Sin[x]/(1+x),{x,0,9}]
and MathematicaTM
would respond
x −
7x3
6
+
47x5
40
−
5923x7
5040
+
426457x9
362880
+ O(x)
10
.
Perhaps you’d like to check the accuracy of the terms displayed in the
series (2.5.10) of Chapter 2, and to see what the next two terms are. If so,
then enter
∗
Maple is a registered trademark of Waterloo Maple Software.
∗∗
Mathematica is a registered trademark of Wolfram Research, Inc.
1922. The RSolve.m routine 193
Series[(1-Sqrt[1-4x])/(2x),{x,0,9}]
and you will see
1 + x + 2x2
+ 5x3
+ 14x4
+ 42x5
+ 132x6
+ 429x7
+ 1430x8
+ 4862x9
+ 16796x10
+ 58786x11
+ O(x)
12
.
If you want to obtain the list of coefficients of the terms of this series, because
they are the numbers that the series “generates,” then ask for
CoefficientList[%,x]
to obtain (the “%” means the result of the computation in the preceding
line)
{1,1,2,5,14,42,132,429,1430,4862,16796,58786}
and there are the Catalan numbers on display.
If you want to see only the coefficient of x7
then you would enter
Coefficient[%,x,7]
instead, and the 429 would appear.
A little more work is needed to see sequences that are generated by expo-
nential generating functions. Suppose you wanted the first 12 Bell numbers.
According to theorem 1.6.1 these are the coefficients of xn
/n! in
Series[Exp[Exp[x]-1],{x,0,12}].
If you type exactly that, MathematicaTM
will reply with
1 + x + x2
+
5x3
6
+
5x4
8
+
13x5
30
+
203x6
720
+
877x7
5040
+
23x8
224
+
1007x9
17280
+
4639x10
145152
+
22619x11
1330560
+
4213597x12
479001600
+ O(x)13
,
which isn’t quite what you wanted because, for instance, the coefficient of
x8
/8! is not readily apparent. One more instruction, such as
Table[j! Coefficient[%,x,j],{j,0,12}]
will get the desired display of Bell numbers,
{1, 1, 2, 5, 15, 52, 203, 877, 4140, 21147, 115975, 678570, 4213597}.
2. The RSolve.m routine
The RSolve package was written in MathematicaTM
by Marko Petkovšek
[Pe]. Its purpose is to find symbolic solutions to recurrence relations and
difference equations. It can do so by explicitly finding the ordinary power
series or exponential generating function of the unknown sequence.
To use it one first reads in the package with
<<DiscreteMath/RSolve.m194 Using MapleTM
and MathematicaTM
One then has a powerful facility for finding generating function solutions to
problems in combinatorial recurrence.
Let’s try it on the Fibonacci recurrence, with the call
RSolve[{f[n+2]==f[n+1]+f[n],f[0]==0,f[1]==1},f[n],n].
It replies, after an order to Simplify[%], as follows.
{{f(n) →
³
−
³
1
2 −
√
5
2
´n
+
³
1
2 +
√
5
2
´n´
If(n ≥ 1,1,0)
√
5
}},
which is, of course, the explicit formula for the Fibonacci numbers. If you’re
ready for this, let’s change the call above by replacing “RSolve” by “Gener-
atingFunction,” and adding one more argument, x say, to tell it the variable
to use in the generating function. That means that we enter the request
GeneratingFunction[{f[n+2]==f[n+1]+f[n],f[0]==0,f[1]==1},f[n],n,x].
And what is the reply? It is
{{
x
1 − x − x2
}},
which even in an age of multitudinous computer miracles must leave us in
awe.
Perhaps you’d rather have the exponential generating function of your
numbers. Well then you would change the call to
ExponentialGeneratingFunction[{f[n+2]==f[n+1]+f[n],f[0]==0,f[1]==1},f[n],n,x]
and the computer would inform you that
{{
−e
(1−
√
5)x
2 + e
(1+
√
5)x
2
√
5
}}
is the function you seek.
Now let’s watch it solve the recurrence (2.2.6) for the number of block
fountains of coins that have k coins in the first row. This time the call is
GeneratingFunction[f[k]==1+Sum[(k-j) f[j],{j,1,k}]/;k>=1, f[k],k,t],
and the response is
{{−
(−1 + t) t
1 − 3t + t2
}}
in agreement with (2.2.7). It can even find a closed formula for the number
of such fountains from the generating function. To get that, ask for
Simplify[SeriesTerm[%,{t,0,n}]]
and the output will be
{{


¡
5 −
√
5
¢ ³
3
2 +
√
5
2
´n
10
+
³
3
2 −
√
5
2
´n ¡
5 +
√
5
¢
10

 If(n ≥ 0,1,0)
− If(n = 0,1,0)}}.Exercises 195
As you can see, it did the partial fraction expansion followed by two geometric
series manipulations, just as we did to obtain, for instance, (1.3.3).
The package can also find closed form expressions for the sums of series
in which formulas are given for the nth coefficient. A request
PowerSum[a n+b,{z,n}]
will produce the answer to exercise 1(b) in this book, in the form
b
1 − z
+
az
(−1 + z)
2 .
It can do much harder ones than that, like the gf of the harmonic numbers
that we did in Example 5 of chapter 2. That one is the answer to the call
PowerSum[Sum[1/j,{j,1,n}],{x,n}],
namely
−
log(1 − x)
1 − x
.
The reader who takes the time to experiment with the capabilities of the
RSolve.m package will be amply rewarded.
3. Asymptotics in MapleTM
In MapleTM
, if you type asympt(f,x,n); you will receive n terms of the
asymptotic expansion of the function f of the variable x, as x → ∞. Let’s
try Stirling’s formula first, by asking for
asympt(n!,n,5);
The computer’s answer is (we use ‘Pi’ instead of ‘π’ etc. because that’s
pretty much how it will look on your screen)
µ
21/2
Pi1/2
n1/2
+ 1/12
21/2
Pi1/2
n1/2
+ 1/288
21/2
Pi1/2
n3/2
−
139
51840
21/2
Pi1/2
n5/2
−
571
2488320
21/2
Pi1/2
n7/2
+ O(
1
n9/2
)
¶
/((1/n)n
exp(n)).
We all know that (1 + 1/n)n
→ e, but how fast does it go? The answer
given by MapleTM
is
exp(1) − 1/2
exp(1)
n
+
11
24
exp(1)
n2
+ O(
1
n3
).
In closing, let’s do exercise 8(c) of the previous chapter, which asks for
the asymptotic behavior of the nth power of
1
rn
=
1
n1/3
+
1
3
1
n2/3
+
1
3
1
n
+
8
81
1
n4/3
+ O(n−5/3
).196 Using MapleTM
and MathematicaTM
Needless to say, MapleTM
is up to the task, and gives
n−n
3 exp
½
1
3
n2/3
+
5
18
n1/3
¾
(1 + O(1)).
Exercises
On any computer that is available to you, do the following.
1. Exercises 1, 2, 5, 6, 8 of Chapter 1.
2. Check the first five terms of any five of the series displayed in section 2.5.
3. Exercises 1, 2, 4 of chapter 2.
4. Use the “series” command to find the first 15 values of g(n) of (3.9.1).
5. From (3.8.3), tabulate the number of involutions of n letters, for n ≤ 15.
6. Use the asymptotics capability of MapleTM
to find the first 5 terms of the
asymptotic expansions of the following.
(a) (1 + 1/
√
n)n
(b)
√
n!
(c) (1 + 1/n)
√
n
(d) sin(sin1/x)Solutions 197
Solutions
Answers to problems for chapter 1
1.
(a) (xD)(1/(1 − x)) = x/(1 − x)2
(b) (αxD + β)(1/(1 − x)) = αx/(1 − x)2
+ β/(1 − x)
(c) (xD)2
(1/(1 − x))
(d) (α(xD)2
+ βxD + γ)(1/(1 − x))
(e) P(xD)(1/(1 − x))
(f) 1/(1 − 3x)
(g) 5/(1 − 7x) − 3/(1 − 4x)
2.
(a) (xD)ex
= xex
(b) (αxD + β)ex
= (αx + β)ex
(c) (xD)2
ex
= (x + x2
)ex
(d) (α(xD)2
+ βxD + γ)ex
(e) P(xD)ex
(f) e3x
(g) 5e7x
− 3e4x
3.
(a) f(x) + c/(1 − x)
(b) αf(x) + c/(1 − x)
(c) xDf(x)
(d) P(xD)f(x)
(e) f(x) − a0
(f) f(x) − a0 − a1x + (1 − a2)x2
(g) (f(x) + f(−x))/2
(h) (f(x) − a0)/x198 Solutions
(i) (f(x) −
Ph−1
0 ajxj
)/xh
(j) (f − a0 − a1x)/x2
+ 3((f − a0)/x) + f
(k) (f − a0 − a1x)/x2
− ((f − a0)/x) − f
4.
(a) f(x) + cex
(b) αf(x) + cex
(c) xf0
(x)
(d) P(xD)f(x) (e) f − a0 (f) f − a0 − a1x + (1 − a2)x2
/2
(g) (f(x) + f(−x))/2 (h) f’(x) (i) Dh
f(x)
(j) f00
+ 3f0
+ f (k) f00
− f0
− f
5.
(a) 2n
/n!
(b) αn
(c) (−1)m
if n = 2m + 1 is odd, and 0 else.
(d) (an+1
− bn+1
)/(a − b)
(e)
¡ m
n/2
¢
6.
(a) We see at once that f/x = 3f+2/(1−x), so f = 2x/((1−x)(1−3x)).
(b) f/x = αf + β/(1 − x) so f = βx/((1 − x)(1 − αx)).
(c) Here (f − x)/x2
= 2f/x − f so f = x/(1 − x)2
.
(d) Since f/x = f/3 + 1/(1 − x) we have f = 3x/((1 − x)(3 − x)).
8.
(a) f0
= 3f + 2ex
, f(0) = 0 give f = e3x
− ex
(b) f0
= αf + βex
so f = (β/(1 − α))(ex
− eαx
)
(c) f00
= 2f0
− f, f(0) = 0,f0
(0) = 1 yield f = xex
(d) f0
= f/3 + ex
, f(0) = 0 give f = 3
2
(ex
− ex/3
)
9. Multiply both sides of the equation f(2n) = f(n) by x2n
and sum over
n ≥ 1. Then multiply both sides of f(2n + 1) = f(n) + f(n + 1) by x2n+1
,
sum over n ≥ 1, and add to the previous result. Then add f(1)x = x to that
result to obtain the functional equation.
To find the explicit infinite product form of the solution, let’s first see how
we might guess that answer, and then how we might prove it.
Take the functional equation for F, and replace x by x2
throughout, then
substitute the result back in the functional equation, to get
F(x) = (1 + x + x2
)(1 + x2
+ x4
)F(x4
).
If we now replace x by x2
again, and substitute we’ll get even more factors ofSolutions 199
the infinite product. Hence we should suspect that the product is the answer.
To prove that the product is the answer, we have two choices. First, over
the ring of formal power series, consider the product as a formal beast which
obviously satisfies the functional equation for F. Second, analytically, an
infinite product
Q
(1+qn) converges if the series
P
|qn| does; so, the product
converges for |x| small enough, to an analytic function F.
10. For part (a) see section 4.1.
(b) p
(2)
n =
Pn
j=0 Prob(X = j)Prob(X = n − j) = [xn
]P(x)2
.
(c) Pk(x) = P(x)k
(d) By part (c) the mean is
P0
k(1)/Pk(1) =
£
kP(x)k−1
P0
(x)/P(x)k
¤
x=1
= kµ,
and the variance is
(logPk(x))0
+ (logPk(x))00
¯
¯
¯
¯
x=1
= k(logP(x))0
+ (logP(x))00
¯
¯
¯
¯
x=1
,
which is kσ2
.
(e) Since Ak
= B we have kA0
/A = B0
/B or kA0
B = AB0
. Equate the
coefficients of xn
to find that nbn =
Pn
j=1(j(k + 1) − n)ajbn−j for
n ≥ 1, with b0 = 1.
(f) p∗
is the coefficient of x300
in (.1x + .2x2
+ .1x3
+ .2x4
+ .2x5
+
.2x6
)100
/(1 − x). Numerically, it is about .00000095.
(g) The required probability is
[xj
]
1
1 − x
¡x + x2
+ ··· + xm
m
¢n
=
1
mn
[xj−n
]
(1 − xm
)n
(1 − x)n+1
.
The result follows by expanding the numerator by the binomial
theorem, the reciprocal of the denominator by the binomial series,
and multiplying.
11. Among these subsets we distinguish those that do contain n and those
that don’t. If such a subset contains n, then the rest of that subset is one
of the subsets that is counted by f(n − 2). If it does not contain n then
the entire subset is one of those that is counted by f(n − 1). Thus f(n) =
f(n−1)+f(n−2), which together with the starting values f(1) = 2, f(2) = 3
tells us that f(n) = Fn+2, where the F’s are the Fibonacci numbers.
12. As in problem 11, we distinguish those k-subsets that do contain n and
those that do not. If such a k-subset does contain n then the rest of that
subset is one of the subsets that is counted by f(n −2,k − 1), otherwise the200 Solutions
entire k-subset is one of those that is counted by f(n−1,k). Thus f(n,k) =
f(n−1,k)+f(n−2,k−1), for k ≥ 2. If we define Fk(x) =
P
n≥1 f(n,k)xn
,
then after multiplying the recurrence by xn
and summing over n ≥ 1 we find
that Fk(x) = x2
Fk−1(x)/(1 − x), which together with F1(x) = x/(1 − x)2
tells us that Fk(x) = x2k−1
/(1 − x)k+1
. If we expand in the binomial series
we find that
f(n,k) = [xn
]Fk(x) = [xn
]x2k−1
X
h≥0
µ
k + h
k
¶
xh
=
µ
n − k + 1
k
¶
.
13. From problems 11 and 12, it must be that
X
k
µ
n − k + 1
k
¶
= Fn+1 (n ≥ 0),
which will be proved another way in example 1 of section 4.3.
14. A circular arrangement that does contain n is obtained by taking a linear
arrangement of {2,3,...,n − 2}, no two consecutive (on the line), adjoining
n to it, and laying it out around a necklace. So by exercise 11, there are Fn−1
such arrangements. One that does not contain n is obtained by taking any
linear arrangement of {1,2,...,n−1} and laying it out around a necklace, so
there are Fn+1 of these. Hence there are Fn−1 +Fn+1 such circular sequences
altogether.
15. As in the previous problem, the answer is f(n − 3,k − 1) + f(n − 1,k)
where f(n,k) =
¡n−k+1
k
¢
is the solution to exercise 12.
16. The partial fraction expansion of 1/(1 − x2
)2
is
1
4(1 − x)2
+
1
4(1 − x)
+
1
4(1 + x)2
+
1
4(1 + x)
.
Therefore the coefficient of xn
in its power series expansion is
n + 1
4
+
1
4
+
(−1)n
(n + 1)
4
+
(−1)n
4
,
which is 0 if n is odd and is (n+2)/2 if n is even. Otherwise, take the series
for 1/(1−u)2
and replace u by x2
. Even sneakier would be to use one of the
symbolic manipulation programs that are now available on computers. They
can produce the general term of such series on demand.
17. Fix j, 1 ≤ j ≤ n, and consider just those permutations σ of n letters that
have σ(j) = n. Then no inversions have j as the second member of the pair
and exactly n− j inversions have j as the first member of the pair. Hence ifSolutions 201
we delete n from the string of values of σ we obtain a permutation of n − 1
letters with n − j fewer inversions. Thus b(n,k) =
P
j b(n − 1,k − n + j).
Multiply by xk
and sum on k to obtain Bn(x) = (1+x+···+xn−1
)Bn−1(x).
Hence b(n,k) is the coefficient of xk
in
(1 + x)(1 + x + x2
)(1 + x + x2
+ x3
)···(1 + x + x2
+ x3
+ ··· + xn−1
).
18.
(a) The probability is evidently 1/k! that the first k values will decrease,
so n!/k! of the permutations have this property.
(b) The probability that a permutation begins with k decreasing values
followed by an increasing one is 1/k!−1/(k +1)!, if 0 ≤ k < n, and
is 1/n! when k = n. The average value of k, weighted with these
probabilities, is
n−1 X
k=0
k
¡ 1
k!
−
1
(k + 1)!
¶
+
n
n!
=
n X
k=1
1
k!
,
and therefore an average permutation of n letters begins with a
decreasing sequence whose length is approximately e − 1.
(c) If we begin with a permutation of n − 1 letters that has k runs,
then by inserting the letter n in each of the n possible places we
manufacture k permutations of n letters that have k runs and n−k
permutations of n letters that have k + 1 runs. Thus f(n,k) =
kf(n − 1,k) + (n − k + 1)f(n − 1,k − 1).
19.
(a) It is (1 + x)2
(1 + x2
)(1 + x5
)(1 + x10
)2
(1 + x20
)(1 + x50
).
(b) The sum represents 38
= 6561 integers, each between −99 and 99.
Hence these 199 integers are represented an average of 6561/199 =
32.9.. ways, so some integer must be represented at least 33 ways.
The required product is
(1/x + 1 + x)2
(1/x2
+ 1 + x2
)(1/x5
+ 1 + x5
)···(1/x50
+ 1 + x50
).
(c) If w1,···,wr are distinct integers, and if Dn is the number of repre-
sentations of n as a sum n = w1x1 +w2x2 +···+wkxk where each
of the xi is ±1, then
X
n
Dntn
=
r Y
i=1
(twi
+ t−wi
).202 Solutions
The set of roots is the union of the sets of 2with roots of −1, for
i = 1,...,k.
Answers to problems for chapter 2
1. The thing to remember is that 1/(1 − u) = 1 + u + u2
+ ···.
(a) We have
1
cosx
=
1
1 − (x2
2 − x4
24 + ···)
= 1 + (
x2
2
−
x4
24
+ ···) + (
x2
2
−
x4
24
+ ···)2
+ ···
= 1 +
x2
2
+
5x4
24
+ ···
(b) Here we use the binomial theorem with negative exponent.
1
(1 + x)m
= (1 + x)−m
=
X
k
µ
−m
k
¶
xk
= 1 +
µ
−m
1
¶
x +
µ
−m
2
¶
x2
+
µ
−m
3
¶
x3
+ ···
= 1 − mx +
m(m + 1)
2
x2
−
m(m + 1)(m + 2)
6
x3
+ ···
(c) This is like part (a). We find
1
1 + (t2 + t3 + t5 + ···)
= 1 − (t2
+ t3
+ t5
+ ···) + ···
= 1 − t2
− t3
+ t4
+ t5
+ ···.
2. In each case (except (e)), replace x by x + bx2
+ cx3
+ ···, set the result
equal to x, and equate the coefficients of like powers of x to 0 to solve for b
and c.
(a) x + x3
6 + ···
(b) x − x3
3
+ ···
(c) x − x2
+ 3
2x3
+ ···
(d) x − x3
+ ···Solutions 203
(e) In this part, note that if y is the inverse function, then
log(1 − y) = x,
i.e., y = 1 − ex
= −x − x2
/2 − x3
/6 − ···.
3. If f =
P
k≥0 akxk
then
0 = f00
+ f =
X
k≥0
{(k + 2)(k + 1)ak+2 + ak}xk
and so
ak+2 = −
ak
(k + 1)(k + 2)
(k = 0,1,2,...).
If a0 and a1 are arbitrarily fixed, then by induction on k
a2k = (−1)k
a0/(2k)!
and
a2k+1 = (−1)k
a1/(2k + 1)!
for all k ≥ 0, and the result follows.
4.
(a) x
(1−x)2 + 7
1−x
(b) x4
1−x
(c) 1
1−x2
(d) {log( 1
1−x) − x − x2
2 }/x
(e) {ex
− 1 − x − x2
/2 − x3
/6 − x4
/24}/x5
(f) x d
dx{ x
1−x−x2 } = x(1+x2
)
(1−x−x2)2
(g) {(xDxD) + (xD) + 1}(ex
− 1) = (1 + x)2
ex
− 1
5. In the binomial theorem (1 + x)n
=
P
k
¡n
k
¢
xk
, let x = 1.
6. We have
f(n,k) =
X
n1+···+nk=n
n1n2 ···nk
= [xn
](
X
r
rxr
)k
= [xn
]
½
x
(1 − x)2
¾k
= [xn
]
xk
(1 − x)2k
.204 Solutions
Hence
P
n f(n,k)xn
= xk
(1−x)2k . Explicitly, since
1
(1 − x)2k
=
X
r≥0
µ
r + 2k − 1
r
¶
xr
,
we find that f(n,k) =
¡n+k−1
n−k
¢
. Notice that the answer is 0 when n < k.
Explain why.
7. As in problem 6 above,
f(n,k,h) = [xn
]
½X
r≥h
xr
¾k
= [xn
]
½
xkh
(1 − x)k
¾
.
8. 1, 1, 1, 1, and 1, respectively.
11. 1, 1, 5−1
2 , 0, 1, respectively.
13. Let a and b be relatively prime. Then every divisor d of ab is uniquely
of the form d = d0
d00
where d0
\a, d00
\b. Hence
g(ab) =
X
d\ab
f(d) =
X
d0\a
d00\b
f(d0
d00
)
=
X
d0\a
d00\b
f(d0
)f(d00
) =
¡X
d0\a
f(d0
)
¢¡X
d00\b
f(d00
)
¢
= g(a)g(b).
14. Consider the n fractions 1/n,2/n,...,n/n. If we write them in lowest
terms, then each of them will reduce to a fraction h/k, where k\n and h,k
are relatively prime. Further, for a fixed divisor k of n, each of the φ(k) such
fractions h/k occurs in exactly one way, i.e., by reducing exactly one fraction
m/n.
15. For Euler’s function, apply Möbius inversion to the result of problem 14
above. This gives
φ(n) =
X
d\n
µ(n/d)d = n
X
d\n
µ(n/d)
n/d
= n
X
d\n
µ(d)
d
.
Since µ is multiplicative, µ(n)/n is a multiplicative function of n, and so, by
problem 13, is the last member above.Solutions 205
For σ(n), suppose a,b are relatively prime. Then every divisor of ab is
uniquely of the form d0
d00
, where d0
and d00
are divisors of a and of b, respec-
tively, and the result follows. Finally, if a,b are relatively prime, |µ(ab)| = 1
iff ab is squarefree iff a and b are squarefree.
16.
(a) ζ(s − 1)/ζ(s)
(b) ζ(s)ζ(s − 1)
(c) ζ(s)/ζ(2s)
17.
(a) ζ(s − 1)
(b) ζ(s − α)
(c) −ζ0
(s)
(d) ζ(s)ζ(s − q)
18.
(a) ζ(s){ζ(s − 1)/ζ(s)} = ζ(s − 1)
(b) ζ(s){1/ζ(s)} = 1
(c) {1/ζ(s)}{ζ2
(s)} = ζ(s)
19. We find that
F(x) =
1
10
µ
5 −
√
5
1 − α+x
+
5 +
√
5
1 − α−x
¶
where α± = (3 ±
√
5)/2. Hence there are exactly
5 −
√
5
10
αk
+ +
5 +
√
5
10
αk
−
block fountains whose first row contains k coins.
21.
(a)
P
n f(n,k,T)xn
= (
P
t∈T xt
)k
(b)
P
n g(n,k,T)xn
=
£
yk
¤Q
t∈T (1 + yxt
)
(c)
P
n f(n,k,S,T)xn
=
£yk
k!
¤Q
t∈T {
P
s∈S
ys
xst
s! }
22. Check that the required number is the coefficient of xn
in
X
k≥1
(−1)k
µ
x
1 − x
¶k
= −x,206 Solutions
hence f(n) = 0 for all n except that f(1) = −1.
23. On the one hand,
x(emx
− 1)
ex − 1
=
µ
x
ex − 1
¶
(emx
− 1)
=
µX
n
Bn
n!
xn
¶µX
j≥1
mj
xj
j!
¶
=
X
n≥0
xn
n!
½X
j≥1
µ
n
j
¶
Bn−jmj
¾
.
On the other hand,
x(emx
− 1)
ex − 1
= x
µ
emx
− 1
ex − 1
¶
= x(1 + ex
+ e2x
+ ··· + e(m−1)x
)
= x
m−1 X
j=0
X
r≥0
jr
xr
r!
=
X
r≥0
xr+1
r!
Sr(m − 1),
where Sr(m) is the sum of the rth powers of the integers 1,...,m. If we
compare the coefficients of xn
we find the explicit formula
Sn(m) =
1
n + 1
X
r≥1
µ
n + 1
r
¶
Bn+1−r(m + 1)r
,
which holds for integers m,n ≥ 1. The first few cases are, for n = 1,2,3,
1 + 2 + ··· + m =
m2
2
+
m
2
12
+ 22
+ ··· + m2
=
m3
3
+
m2
2
+
m
6
13
+ 23
+ ··· + m3
=
m4
4
+
m3
2
+
m2
4
.
25.
(a) If they differ in the jth bit, then their colors differ by j which is not
0. If they differ in the jth and kth bits, then their colors differ by
j + k or j − k modulo 2n, neither of which can be 0.
(c) f(z) =
Qn
k=1(1 + zk
).Solutions 207
27.
(a) e−x
/(1 − x).
(b) If D(x) = e−x
/(1 − x) then (1 − x)D0
= D − e−x
. Match [xn
] on
both sides.
(c) If D1(n) is the number with one fixed point then D1(n) = nD(n−1).
Thus D(n) − D1(n) = D(n) − nD(n − 1) = (−1)n
by part (b).
(d) To construct a permutation of n letters that has k fixed points,
we can choose the k fixed points in
¡n
k
¢
ways, and the rest of the
permutation in D(n − k) ways. Hence Dk(n) =
¡n
k
¢
D(n − k). Now
multiply by xn
yk
/n!, sum, and use part (a).
28. We have
X
d\n
µ(n/d)ad(xn/d
) =
X
d\n
µ(n/d)
X
δ\d
bd/δ(xnδ/d
)
in which the coefficient of br(xn/r
) is
P
δ\n/r µ(n/(rδ)), which vanishes unless
r = n and is 1 in that case.
30.
(a)
P
n≥1
√
n/ns
=
P
n≥1 1/ns−1/2
= ζ(s − 1/2).
(b) The function is multiplicative and its value at n = pa
is 0 if a ≥ 2
and 1 otherwise. Hence by (2.6.6) the generating function is
Y
p
{1 + p−s
} =
Y
p
1 − p−2s
1 − p−s
=
ζ(s)
ζ(2s)
.
(c) Here λ(pa
) = (−1)a
for all a ≥ 0, so by (2.6.6) its generating func-
tion Λ(s) is
Y
p
{1 − p−s
+ p−2s
− ···} =
Y
p
1
1 + p−s
=
ζ(2s)
ζ(s)
.
Finally, equate coefficients of n−s
on both sides of Λ(s)ζ(s) = ζ(2s).
31.
(a) If
X
n≥1
bnxn
=
X
n≥1
an
xn
1 − xn
=
X
n
an
X
m≥1
xmn
=
X
r
xr
X
d\r
ad
thus bn =
P
d\n ad, just as in the theory of Dirichlet series.208 Solutions
(b) Apply part (a) with an = µ(n).
(c) It is
X
n≥1
φ(n)
xn
1 − xn
=
X
n≥1
nxn
=
x
(1 − x)2
since
P
d\n φ(d) = n.
32.
(a) f/(1 − x)
(b) f/(1 − x)r
(c) By part (b), it is the sequence whose gf is 1/(1 − x)r+1
, which, by
(2.5.7), is the sequence
¡n+r
n
¢
n≥0
.
(d) It is the coefficient of xn
in (
P
anxn
)/(1 − x)r
, viz.
n X
m=0
µ
m + r − 1
m
¶
an−m (n = 0,1,2,...).
(e) Then f(x)/(1 − x)r
= 1, so f(x) = (1 − x)r
and an =
¡r
n
¢
(−1)n
for
n ≥ 0.
33.
(b) We have
Φpa(x) =
Y
d\pa
(1 − xd
)µ(pa
/d)
=
1 − xpa
1 − xpa−1 = 1 + xpa−1
+ x2pa−1
+ ··· + x(p−1)pa−1
.
(c) Since
Q
m\n Φm(x) = 1 − xn
we have
Y
m\n
m>1
Φm(1) = n. (∗)
Now for n = pk
use induction on k. If n is not a prime power let pa
be the highest power of p that divides n. Then in (∗) above, each
divisor pj
(1 ≤ j ≤ a) contributes a factor of p, so all such divisors
contribute pa
. But no higher power of p divides n, so Φn(1) cannot
be divisible by p. Since p was arbitrary, Φn(1) must be ±1, and it
is easy to rule out −1.Solutions 209
34.
(a) This says that each integer r, 1 ≤ r ≤ n is uniquely of the form
r = md where d\n and gcd(m,n/d) = 1. But this is clear since we
take d =gcd(r,n) and m = r/d.
(c) Let x → ω in the result of part (b), and use L’Hospital’s rule.
Answers to problems for chapter 3
1. A partition of n into odd parts looks like
n = r1 · 1 + r3 · 3 + r5 · 5 + ···.
Now substitute the binary expansion of each ri, to get
n = (2a1
+ 2b1
+ ···) · 1 + (2a3
+ 2b3
+ ···) · 3 + (2a5
+ 2b5
+ ···) · 5 + ···.
But now we have a partition of n into distinct parts, viz.,
n = 2a1
+ 2b1
+ ··· + 2a3
· 3 + 2b3
· 3 + ··· + 2a5
· 5 + 2b5
· 5 + ···.
(What partition corresponds to 39=3+3+7+7+19 ?) The map is uniquely
invertible.
2. The deck has a card corresponding to each cyclic permutation of length
k,2k,3k,.... The number of these on mk letters is (mk − 1)!. The deck
enumerator is
D(x) =
X
m≥1
(mk − 1)!
(mk)!
xmk
=
X
m≥1
xmk
mk
=
1
k
log
1
1 − xk
.
Hence the hand enumerator, without regard to number of cards in the hand,
is
H(x) = exp
½
1
k
log
1
1 − xk
¾
=
1
(1 − xk)1/k
=
X
m≥0
µ
−1
k
m
¶
(−1)m
xmk
.
The required number is the coefficient of xn
/n! here, which is 0 if k does not
divide n, and is
(−1)r
µ
−1
k
r
¶
n! =
n!
r!kr
(k + 1)(2k + 1)···((r − 1)k + 1)210 Solutions
if n/k = r is an integer.
3. It is exp
½
P
p
xp
p!
¾
.
4.
(a) The order is the least common multiple of the cycle lengths.
(b) Clearly,
g̃(n,k) =
X
d\k
g(n,d).
Hence by Möbius inversion (2.6.12) we have
g(n,k) =
X
d\k
µ(k/d)g̃(n,d).
5.
(a) One finds by logarithmic differentiation of the egf (3.8.3) that
Tn = Tn−1 + (n − 1)Tn−2 (n ≥ 2;T0 = 1;T1 = 1).
(b) 1, 2, 4, 10, 26, 76
(c) Consider separately those involutions of n letters for which n is a
fixed point and those for which n is not fixed.
6. The deck enumerator is
D(x) =
X
n≥4
xn
n
= log
1
(1 − x)
− x − x2
/2 − x3
/3,
and so the hand enumerator is
H(x) =
e−x−x2
/2−x3
/3
(1 − x)
.
7. A card of weight n is a path or a cycle. If n ≥ 3, there are (n − 1)!/2
‘cycle cards’ of weight n, and if n ≥ 2 there are n!/2 ‘path cards.’ Hence
D(x) =
µ
1
(1 − x)
− log(1 − x) − 1 − 2x − x2
/2
¶
/2,
and the hand enumerator H(x) is
sinh
µ
1
2(1 − x)
−
1
2
log(1 − x) −
1
2
− x −
x2
4
¶
= 1
x2
2!
+ 4
x3
3!
+ 15
x4
4!
+ 72
x5
5!
+ 435
x6
6!
+ 3300
x7
7!
+ 30310
x8
8!
+ ···.Solutions 211
Hence the numbers of such graphs on 0,1,...,8 vertices are 0, 0, 1, 4, 15, 72,
435, 3300, 30310.
8. One finds
£n
k
¤
=
£n−1
k−1
¤
+ (n − 1)
£n−1
k
¤
. This can be proved directly by
considering separately those permutations of n letters and k cycles in which
n is a fixed point (cycle of length 1) and those in which it is not.
9. Here the deck enumerator is
D(x) =
X
m≥1
(2m − 1)!x2m
(2m)!
= log
1
√
1 − x2
.
The exponential formula states that the question is answered by sinhD(x),
which simplifies to
H(x) =
x2
2
√
1 − x2
.
The coefficient of xn
/n! is g(n) = 0 if n is odd, and
g(n) =
n!
2n−1
µ
n − 2
n
2 − 1
¶
if n ≥ 2 is even.
10. We find that
½
n
k
¾
=
k X
r=1
(−1)k−r
rn−1
(k − r)!(r − 1)!
.
12. If F(n,k) is the number of n-permutations whose cycles have lengths
≤ k, then F has the egf exp(x + ··· + xk
/k). But f(n,k) counts those whose
longest cycle has length k, so if k ≥ 1, f(n,k) = F(n,k) − F(n,k − 1), and
the required egf is
ex+···+xk−1
k−1
µ
e
xk
k − 1
¶
.
13.
(a) It is
X
i+j+k=n
tigjgk
i!j!k!
= 1 (n ≥ 0).
(b) If we multiply through by n! to get
X
i+j+k=n
n!
i!j!k!
tigjgk = n! (n ≥ 0).212 Solutions
then the multinomial coefficient under the summation sign counts
the ways of choosing an ordered triple (R,S,T) of subsets that par-
tition [n], ti counts the involutions of i letters, each of which gets
relabeled with the elements of R, gj counts the 2-regular graphs of
j vertices, each of which gets relabeled with the elements of S, etc.
Finally, the right side n! counts n-permutations.
(c) This elegant solution was found by Mr. Douglas Katzman. Given
the triple (τ,G1,G2), we construct the corresponding permutation σ
as follows the cycles of the involution τ, acting on R, become cycles
of σ. For each cycle in the graph G1, locate the smallest numbered
vertex v in the cycle. Choose that one of the two possible ways of
orienting the cycle which carries v to the larger numbered vertex
of its two neighbors. Conversely, in G2 select the orientation that
carries the smallest numbered vertex of each cycle into the smaller
of its two neighbors.
14.
(a) From the defining equation
eyD(x)
=
X
n
φn(y)
n!
xn
,
we see that each application of the operator Dy multiplies the left
side by another D(x), so the application of some function f(Dy) will
multiply it by f(D(x)). If we choose f to be the inverse function
D(−1)
(Dy), then we will multiply the left side by D(−1)
(D(x)), that
is, by x. If we multiply the right side of the defining equation by x,
we see that it becomes the egf of {nφn−1(y)}, as claimed.
(b) In this family,
eyD(x)
=
1
(1 − x)y
=
X
n
µ
−y
n
¶
(−1)n
xn
=
X
n
y(y + 1)···(y + n − 1)
n!
xn
.
Thus φn(y) is the ‘rising factorial’ y(y + 1)···(y + n − 1). To
check the identity, we have first that the deck enumerator is D(x) =
−log(1 − x). Hence D(−1)
(x) = 1 − e−x
. Therefore
D(−1)
(Dy)φn(y) = {1 − e−Dy
}φn(y).
But Taylor’s theorem from differential calculus is identical with theSolutions 213
assertion that (eD
)f(y) = f(y + 1) (!!check this!!). Hence
(1 − e−Dy
)φn(y) = φn(y) − φn(y − 1)
= {y ···(y + n − 1)} − {(y − 1)···(y + n − 2)}
= ny(y + 1)···(y + n − 2)
= nφn−1(y),
as required.
15. The result claimed is certainly true if there is only one card in the deck.
Then, by the merge, trickle, and flood argument, it is true in general. Part
(b) is immediate. For part (c), insert the factors into the product, and outside
the product write the reciprocals of all of those factors, to get
p(x) =
∞ Y
k=1
e
xk
k
∞ Y
k=1
(1 +
xk
k
)e−xk
k
=
1
(1 − x)
∞ Y
k=1
(1 +
xk
k
)e−xk
k .
Now as x → 1−
, the infinite product approaches a certain universal constant,
viz.
C =
∞ Y
k=1
(1 +
1
k
)e−1
k ,
hence p(x) ∼ C/(1 − x). The constant is in fact e−γ
, where γ is Euler’s
constant.
16. Here cn is the coefficient of xn
/n! in
(1 + x)x+1
= (1 + x)x
(1 + x) = (1 + x)
X
k
µ
x
k
¶
xk
= (1 + x)
X
k
x(x − 1)···(x − k + 1)
k!
xk
= (1 + x)
X
k
xk
k!
X
r
(−1)r
·
k
r
¸
xr
.
Thus
cn
n
= (n − 1)!
½X
k
(−1)n−k
k!
(
·
k
n − k
¸
−
·
k
n − k − 1
¸
)
¾
.
But in the sum the terms all vanish for k ≥ n, hence the right side is an
integer.214 Solutions
18. The number of cards in the jth deck is 1 for j = 1,2 and is 2 for j ≥ 3.
Hence by (3.14.6), the hand enumerator is
1
1 − x
1
(1 − x2)
Y
j≥3
1
(1 − xj)2
=
P(x)2
(1 − x)(1 − x2)
where P(x) is Euler’s generating function (3.16.3) for {p(n)}.
19. In such a tree there is a rooted tree of j vertices attached to one of the
edges incident at the root, and a rooted tree of n−1−j vertices attached to
the other edge at the root. Further, the full tree is completely determined by
this unordered pair of trees, and so the number an of such full trees is equal
to the number of unordered pairs of rooted trees, the total number of whose
vertices is n − 1, i.e.,
an =
1
2
X
j
tjtn−1−j
if n − 1 is odd, for then every unordered pair is counted twice by the sum.
If n − 1 is even then we need to consider the number of ways that the two
subtrees at the root can be of the same size (n − 1)/2. The number of
unordered pairs of not necessarily distinct objects that can be chosen from a
set of a different objects if
¡a+1
2
¢
. Thus in this case the formula above needs
an extra term t(n−1)/2/2 added to it, which is equivalent to the result stated.
20. It is 29. 29 cannot be of the form stated, for otherwise we could subtract
some multiple of 15 from it to find a nonnegative number of the form 6x+10y.
But 29 is not of that form since it is odd, and 14 isn’t either. Next, if n is
any integer that is representable then so is n+6, so to see that every integer
larger than 29 is so representable it is enough to observe that 30 = 6 · 5,
31 = 6 +10+15, 32 = 6·2 +10·2, 33 = 6·3+15· 1, 34 = 6· 4+10· 1, and
35 = 10 · 2 + 15 · 1.
21. If f(n) is that number then
X
n≥0
f(n)xn
=
1
(1 − x)(1 − x2)(1 − x3)
=
1
6(1 − x)3
+
1
4(1 − x)2
+
17
72(1 − x)
+
1
8(1 + x)
+
1
9(1 − ωx)
+
1
9(1 − ω̄x)
.
If we expand each of the fractions on the right we find the formula
f(n) =
1
6
µ
n + 2
2
¶
+
1
4
(n + 1) +
17
72
+
(−1)n
8
+
2
9
cos(
2nπ
3
)
which can be rewritten as
f(n) =
(n + 3)2
12
+
−7 + 9(−1)n
+ 16cos(2nπ/3)
72
.Solutions 215
The second fraction cannot exceed 32/72 < 1/2 in absolute value, so f(n)
is the unique integer whose distance from (n + 3)2
/12 is less than 1/2, as
required.
22. For a given a1,a2,···, we put n = a1 + 2a2 + ···, and we can then
construct all possible hands of the desired type by choosing and labeling
cards from the given decks as follows.
Make an ordered selection of a1 cards of size 1 chosen independently from
the d1 cards of size 1 that are available in deck 1. Then make an ordered
selection of a2 cards of size 2 from the d2 cards of that size that are available
in deck 2, etc. The number of ways in which this can be done is da1
1 da2
2 ···.
Next, for the a1 chosen cards of size 1, choose the 1 label that will appear
on each card, which can be done in n!/(n − a1)! ways, but since the order
of these cards in the hand is immaterial, this labeling can be done in only
n!/(a1!(n − a1)!) ways.
Then, for the a2 chosen cards of size 2, choose the unordered pairs of labels
that will appear on each card. This can be done in
µ
n − a1
2
¶µ
n − a1 − 2
2
¶
···
µ
n − a1 − 2a2 + 2
2
¶
=
(n − a1)!
(n − a1 − 2a2)!2!a2
ways (we need only the unordered pairs because the chosen cards have place-
holders on them that tell us in what sequence to place the chosen label set
on the card). Finally, since the order of the cards of size 2 in the hand is
immaterial, there are only
(n − a1)!
(n − a1 − 2a2)!2!a2a2!
different ways to do this.
In general, for the aj chosen cards of size j, we can choose the sequence of
sets of j labels that will appear on each card in exactly
(n − a1 − 2a2 − ··· − (j − 1)aj−1)!
(n − a1 − 2a2 − ··· − jaj)!j!aj aj!
different ways. If we multiply all of these together, for all j ≥ 1, we find that
the number of hands of the desired specification is
n!da1
1 da2
2 ···
1!a12!a2 ···a1!a2!···
.
But this is exactly the coefficient of tn
xa1
1 xa2
2 ···/n! in the expansion shown
in the statement of the problem.216 Solutions
For part (b), in the family of set partitions we have all dj = 1 for j ≥ 1.
Use the result of part (a), with x3 = x4 = ··· = 1, since we don’t care about
classes of size greater than 2, to obtain the joint distribution of classes of
sizes 1 and 2 in the form stated.
Answers to problems for chapter 4
1. We have pn = (1 − p)n−1
p for n ≥ 1, hence {pn} has the opsgf P(x) =
px/(1−(1−p)x). The mean is P0
(1) = 1/p, and from (4.1.3) the variance is
σ2
= (logP)0
+ (logP)00
¯
¯
x=1
=
(1 − p)
p2
.
2.
(a) Consider a sequence of n trials that yields a complete collection
for the first time at the nth trial. From that sequence we will
construct an ordered partition of the set [n − 1] into d − 1 classes,
as follows: if the ith photo was chosen at the jth trial (1 ≤ i ≤ d,
1 ≤ j ≤ n − 1), then put j into the ith class of the partition. Note
that d − 1 of the classes are nonempty. Conversely, from such an
ordered partition of [n − 1] we can construct exactly d collecting
sequences, one for each choice of the coupon that wasn’t collected
in the first n − 1 trials. There are (d − 1)!
©n−1
d−1
ª
ordered partitions
of [n−1] into d−1 classes, so there are d!
©n−1
d−1
ª
sequences of trials
that obtain a complete collection precisely at the nth trial. There
are dn
unrestricted sequences of n trials, so the probability of the
event described is as shown.
(b) By (1.6.5),
p(x) = (d − 1)!x
X
n
½
n
d
¾
(
x
d
)n
=
(d − 1)!xd
(d − x)···(d − (d − 1)x)
.
(c) p0
(1) = d(1 + 1
2
+ ··· + 1
d
)
(d) From (4.1.3),
σ2
= d2
d X
i=1
1
i2
− d
¡
1 +
1
2
+ ··· +
1
d
¢
.
(e) About 29 boxes of cereal, with a standard deviation of about 11
boxes.Solutions 217
3. For part (a), the probability p(j,v1,T) has two components. First, with
probability d1/(d1 + 1), the walk begins with a step to another vertex of T1.
In that case the probability of a first return after j steps is the same as it
was in T1, which gives a contribution of
d1
d1 + 1
p(j;v1;T1)
to the answer.
On the other hand, with probability 1/(1+d1) the walk begins by using the
edge (v1,v2). In that case the required probability will be the probability
that the walk takes exactly j−2 steps in the tree T2, finishing at v2 and then
crossing back over the edge (v1,v2) to vertex v1.
Fix m ≥ 0, and consider the following event: the sequence of vertices that
the walk visits after crossing to v2 contains exactly m + 1 appearances of
vertex v2 followed by the return to v1. Hence the sequence looks like
v2,W1,v2,W2,...,Wm,v2,
where each of the Wi is a sequence of vertices of T2 − v2. The total number
of steps in such a walk is j1 +···+jm, where the ji are the numbers of steps
between consecutive returns to v2. We need the probability that j1 + j2 +
··· + jm = j − 2. But that is
X
j1+···+jm=j−2
p(j1;v2;T2)p(j2;v2;T2)···p(jm;v2;T2)
µ
d2
d2 + 1
¶m
(
1
d2 + 1
)
=
1
d2 + 1
µ
d2
d2 + 1
¶m
[xj−2
]F2(x;v2;T2)m
.
If we put it all together, we find that p(j;v1;T) is
d1
d1 + 1
p(j;v1;T1) +
X
m≥0
¡ d2
d2+1
¢m
(d1 + 1)(d2 + 1)
[xj−2
]F2(x;v2)m
=
d1
d1 + 1
p(j;v1;T1) +
1
d1 + 1
[xj−2
]
1
d2 + 1 − d2F2(x;v2)
.
Finally, if we multiply by xj
and sum over j, we obtain the result stated.
In part (d) one has Pn(x) = x2
/(2 − Pn−1(x)) for n ≥ 2, with P1 = 1. If
one assumes Pn(x) = An(x)/Bn(x), then An = x2
Bn−1 and Bn = 2Bn−1 −
x2
Bn−2. This leads to the result that
Pn(x) = x2
µ
rn−2
+ + rn−2
−
rn−1
+ + rn−1
−
¶
(n ≥ 2)218 Solutions
where r± = 1 ±
√
1 − x2.
4. The sequence {e≤m} is obviously generated by
E(x)
1 − x
=
N(x − 1)
1 − x
.
Since e≥m = N(0) − e≤m−1, it has the gf
N(0)
1 − x
− x
E(x)
1 − x
=
N(0) − xN(x − 1)
1 − x
.
5. The board consists of only the diagonal cells of a full n×n board. To put
k nonattacking rooks on this board we can choose any k of the n cells on the
board, so rk =
¡n
k
¢
. Then (4.2.17) with j = 0 gives
X
k
(n − k)!
µ
n
k
¶
(−1)k
= n!
n X
k=0
(−1)k
k!
for the answer, in agreement with (4.2.10).
6. We have
X
m≥0
αmxm
=
X
m≥0
xm
X
r≥m
(−1)r−m
Nr
=
X
r≥0
(−1)r
Nr
X
0≤m≤r
(−1)m
xm
=
X
r≥0
(−1)r
Nr
½
1 + (−1)r
xr+1
1 + x
¾
=
1
1 + x
½
e0 +
X
r≥0
Nrxr+1
¾
=
e0 + xN(x)
1 + x
=
e0 + xE(1 + x)
1 + x
=
e0 + x{e0 + e1(1 + x) + ···}
1 + x
.
Problem 7 is similar.
8. The sum is
1 + x +
µ
n
1
¶
(x2
+ x3
) +
µ
n
2
¶
(x4
+ x5
) + ···
= (1 + x)(1 +
µ
n
1
¶
x2
+
µ
n
2
¶
x4
+ ···)
= (1 + x)(1 + x2
)n
.Solutions 219
If fm(y) denotes the sum in question, then Snake Oil finds that
X
m
fm(y)xm
= (1 + x)(1 + xy + x2
)n
.
See what happens if you try to extend this to the sum that results from
replacing ‘br/2c’ by ‘br/3c’ in the sum to be found.
9. The ‘objects’ Ω are the λn
possible ways of assigning colors to the vertices
of G. For each edge e of the graph G there is a property P(e); a coloring has
property P(e) if the two endpoints of edge e have the same color. We seek
the number of objects that have exactly 0 properties.
Now consider N(⊇ S). For a given set S of edges, this is the number of
colorings such that at least all of the edges in S are badly colored, i.e., have
both endpoints the same color. Think of the graph GS whose vertices are all
n of the vertices of the graph G, together with just the edges in S. If all of
the edges in S are badly colored, and if C is one of the connected components
of GS, then every vertex in C must have the same color. So the number of
ways of assigning colors to the vertices of G such that the edges of S are
badly colored is N(⊇ S) = λκ(S)
, where κ(S) is the number of connected
components of the graph GS. Hence
P(λ;x;G) =
X
r
Nr(x − 1)r
,
where
Nr =
X
|S|=r
λκ(S)
.
10. There are kn
possible words, and we take these to be our set of objects
Ω. A word has property i if the substring w occurs in the word, beginning
in position i of the word. Let S be a given subset of properties, i.e., a set
of places where the substring w is to begin. We seek N(⊇ S), which in this
case is the number of words of n letters, chosen from an alphabet of k letters,
that have the substring w beginning in all of the positions indicated by S,
and maybe elsewhere too. But there are no such words if two of the elements
of S differ by < m, for then two occurrences of w would overlap, contrary to
the hypothesis that they cannot do so.
Hence we suppose that no two elements of S differ by < m. Then rm of the
characters in the word are specified to be occurrences of w, where r = |S|.
That leaves n − rm characters to be specified, and that can be done in
N(⊇ S) = kn−rm
ways. Hence Nr is kn−rm
times the number of subsets S
of r elements of [n−m+1] that have no two entries that differ by < m. But
how many such subsets are there?220 Solutions
Consider a subset S of r elements of [q], no two of whose entries differ by < m.
If we delete the elements of S from [q], the remaining q−r integers are broken
into r+1 intervals of consecutive integers whose lengths are t0,t1,...,tr, say,
where each ti ≥ m−1 for 1 ≤ i ≤ r −1. The number of ways to choose such
integers t0,...,tr is clearly
[xq−r
]
½
1
1 − x
¾½
xm−1
1 − x
¾r−1½
1
1 − x
¾
= [xq−r
]
½
x(m−1)(r−1)
(1 − x)r+1
¾
= [xq−r−(m−1)(r−1)
]
1
(1 − x)r+1
=
µ
q − (m − 1)(r − 1)
r
¶
.
Thus, since q = n − m+ 1, Nr = kn−rm
¡n−mr+r
r
¢
, and the number of w-free
words is
X
r
(−1)r
µ
n − mr + r
r
¶
kn−rm
.
The Snake Oil method tells us that the answer is also the coefficient of xn
in
1
1 − kx + xm
.
In turn this suggests that it might have been easier to do this problem by
finding a recurrence relation that is satisfied by the answer, instead of by
using the sieve method, but we wanted to show you another example of the
sieve method in which the N(⊇ S)’s do not depend only on the cardinality
of the set S.
13. This is an example where the Snake Oil method doesn’t work immedi-
ately because the free parameter n appears too often in the summand. As in
example 9, the thing to do is to generalize the problem, in this case to the
sum
X
k
(−1)k
µ
n
k
¶µ
n
n − m + k
¶
.
The latter responds nicely to Snake Oil, after multiplying by xm
etc. Then
set m = n.
17. We find in part (a) that
∂
∂x
Z A
−B
F(x,y)dy =
Z A
−B
∂F
∂x
dy
=
Z A
−B
∂G
∂y
dy
= G(x,A) − G(x,−B) → 0 (A,B → ∞).Solutions 221
18.
(a) Since the sum of the d’s is 2n − 2, their average is 2−2/n which is
less than 2, so at least one of the d’s must be 1. We can suppose
w.l.o.g. that d1 = 1. Then, in every tree whose degree sequence is
∆ = (d1,...,dn), vertex 1 is connected to exactly one other vertex.
There is an obvious 1-1 correspondence between the trees of degree
sequence ∆ in which vertex 1 is adjacent to vertex j, for some fixed
j ≥ 2, and the trees of n−1 vertices 2,3,...,n, in which the vertex
degrees are (d2,...,dj−1,dj − 1,dj+1,...,dn). By induction on n,
then, the number whose degree sequence is ∆ is
n X
j=2
(n − 3)!
(d2 − 1)!···(dj−1 − 1)!(dj − 2)!···(dn − 1)!
=
n X
j=2
(n − 3)!(dj − 1)
(d2 − 1)!···(dj − 1)!···(dn − 1)!
= ((2n − 3) − (n − 1))
(n − 3)!
(d2 − 1)!···(dn − 1)!
=
(n − 2)!
(d1 − 1)!···(dn − 1)!
as required.
(b) By the multinomial theorem (see exercise 20 of chapter 2),
Fn(x1,...,xn) = (x1x2 ···xn)(x1 + ··· + xn)n−2
.
(d) Let a tree T have property i if vertex i is an endpoint. If S ⊆ [n] then
the number of trees of n vertices whose set of properties contains S
is
N(⊇ S) = (n − |S|)n−|S|−2
(n − |S|)|S|
= (n − |S|)n−2
,
since the first factor is the number of trees of n−|S| vertices and the
second factor is the number of ways we can attach the |S| endpoints
to such a tree. The result now follows from the sieve.
(e) In the sieve method, the average number of properties that an object
has is always N1/N, which in this case is
(n − 1)n−2
n
nn−2
= n(1 −
1
n
)n−2
∼
n
e
.
19.
(a) Evidently we have for all T
N(⊆ S) =
X
V ⊆S
N(= V ),222 Solutions
by definition. Now substitute this for N(⊆ S)) under the summa-
tion sign in the expression given on the right side of the statement
of the problem, interchange the order of summation and verify the
resulting identity.
(b) It is
X
n≥0
hn(S)
n!
xn
=
Y
s∈S
exp
ds
s!
xs
.
Answers to problems for chapter 5
1. Let t = 1/A, φ(u) = 1 + uL
, and f(u) = u. Then the equation u = tφ(u)
that is treated by the LIF becomes the present equation. The result follows
after a small calculation involving the binomial theorem.
3. In the LIF, choose the function f(u) that satisfies f0
(u) = 1/φ(u). Then
1
n
[un−1
]
½
f0
(u)φ(u)n
¾
=
1
u
[un−1
]φ(u)n−1
.
On the other hand, if we write z(t) = f(u(t)), then
[tn
]f(u(t)) = [tn
]z(t) =
1
n
[tn−1
]z0
(t) =
1
n
[tn−1
]
tu0
(t)
u(t)
.
For the last equality of the problem, differentiate u = tφ(u) with respect to
t.
4.
(a) Put φ(u) = 1 +u + u2
in the result of the previous problem to find
that γn = [tn
] 1
1−t(1+2u)
, where u = u(t) satisfies u = t(1 + u + u2
).
By solving the quadratic equation for u and substituting, we find
the result stated.
(b) Let x = i/
√
3 in problem 2.
5.
(a) Clearly Sp(n) = [xn
]
½
(1 + x)pn
/(1 − x)
¾
.
(b) Take φ(u) = (1 + u)p
and f0
(u) = 1/((1 − u)(1 + u)p
) in the LIF,Solutions 223
and find
Sp(n)
n + 1
=
1
n + 1
[un
]
(1 + u)p(n+1)
(1 − u)(1 + u)p
= [tn+1
]f(u(t))
=
1
n + 1
[tn
]{f0
(u(t))u0
(t)}
=
1
n + 1
[tn
]
u0
(t)
(1 − u)(1 + u)p
=
1
n + 1
[tn
]
tu0
(t)
(1 − u(t))u(t)
.
Since u = t(1+u)p
, we find u0
= u(1+u)
t(1−(p−1)u), and substitution leads
to the result stated.
(c) Equate coefficients of xn
on both sides of the result of part (b).
6. Let xn1
,...,xnk
be the powers of x whose coefficients in P(x) are strictly
positive. Then, by Schur’s theorem 3.15.2, what is needed is that
gcd(n1,...,nk) = 1.
7.
(a) It is
(1 + na
)n
∼ nna
exp(n1−a
− n1−2a
/2 + ···),
where the argument of the exponential terminates after the last
positive exponent of n is reached.
(b) As above without the factor nna
.
(c) It is ∼ 1.
8.
(a) It is admissible because, by Schur’s theorem 3.15.2, ez+z2
/2+z3
/3
has positive coefficients from some point on.
9. Take f(u) = (1 + u)k
and φ(u) = (1 + u)2
in the LIF.224 References
References
An excellent general reference on generating functions is [Co], which contains a wealth of
beautiful examples. The volume [GJ] is highly recommended to those who wish to study
deeper and more varied uses of generating functions. For excellent surveys of combinato-
rial asymptotics, see [Be], and [Od]. For other methods that can cope with a wide variety
of combinatorial identities see [Eg], [Kn] vol. 1, and [GKP]. For assortments of unapolo-
getically difficult problems in asymptotics with advanced solution techniques, see [Br] and
[GK]. [Go] is a catalogue of binomial coefficient identities.
[An] Andrews, George. The theory of partitions, Encycl. Math. Appl. vol. 2. Reading,
MA: Addison-Wesley, 1976.
[Bei] Beissinger, Janet. ‘Factorization and enumeration of labeled combinatorial objects.’
Ph.D. Dissertation, University of Pennsylvania (1981).
[Be] Bender, Edward A. ‘Asymptotic methods in enumeration.’ SIAM Review 16 (1974),
485-515.
[BG] Bender, E. A., and Goldman, J. R. ‘Enumerative uses of generating functions.’
Indiana Univ. Math. J. 20 (1971), 753-764.
[Bo] Bousquet-Mélou, Mireille, q-Énumeration de polyominos convexes, Publ. Lab. de
Combinatoire et d’Inf. Math. 9, Dept. de math. et d’inf., U. du Québec à Montréal,
1991.
[Br] de Bruijn, N. G. Asymptotic methods in analysis. North Holland, 1958.
[Co] Comtet, Louis. Advanced Combinatorics; The art of finite and infinite expansions.
Boston, MA: D. Reidel Publ. Co., 1974.
[De1] Delest, M. P. ‘Generating functions for column-convex polyominoes.’ J. Combina-
torial Theory A 48 (1988), 12-31.
[De2] Delest, M. P. ‘Polyominoes and animals: some recent results.’ J. Mathematical
Chemistry 8 (1991), 3-18.
[DV] Delest, M. P. and Viennot, G. ‘Algebraic languages and polyominoes enumeration.’
Theoretical Computer Science 34 (1984), 169-206.
[DRS] Doubilet, P., Rota, G. C., and Stanley, R. P. ‘On the Foundations of Combinatorial
Theory VI: The idea of generating function.’ In Proc. Sixth Berkeley Symposium on
Statistics and Probability, vol. 2 (1972), 267-318.
[Eg] Egorychev, G.P. ‘Integral representation and the computation of combinatorial
sums.’ American Mathematical Society Translations 59, (1984).
[Fo1] Foata, D. ‘La Série Génératrice Exponentielle dans les Problèmes d’Énumération.’
Montreal: Presses de l’Université de Montréal, 1971.
[Fo2] Foata, D. ‘A combinatorial proof of the Mehler formula.’ J. Comb. Th. Ser. A 24References 225
(1978), 367-376.
[FS] Foata, D. and Schützenberger, M. Théorie Géométrique des Polynômes Eulériens,
Lecture Notes in Math. No. 138. Berlin: Springer-Verlag, 1970.
[Fr] Fraenkel, Aviezri. ‘A characterization of exactly covering congruences.’ Discrete
Mathematics 4 (1973), 359-366.
[GaJ] Garsia, A. and Joni, S. A. ‘Composition sequences.’ Commun. in Algebra 8 (1980),
1195-1266.
[Gos] Gosper, R. William, Jr. ‘Decision procedures for indefinite hypergeometric summa-
tion.’ Proc. Nat. Acad. Sci. U.S.A. 75 (1978), 40-42.
[Go] Gould, Henry W. Combinatorial identities. Morgantown, WV, 1972.
[GJ] Goulden, I. P. and Jackson, D. M. Combinatorial enumeration. New York: John
Wiley and Sons, 1983.
[GKP] Graham, Ronald L., Knuth, Donald. E., and Patashnik, Oren. Concrete Mathemat-
ics. Reading, MA: Addison-Wesley, 1989.
[GK] Greene, Daniel H. and Knuth, Donald E. Mathematics for the analysis of algorithms.
Boston: Birkhäuser, 1982.
[Ha] Hansen, E. R. A table of series and products, Prentice-Hall, 1975.
[HRS] Harary, F., Robinson, R. W., and Schwenk, A. J. ‘A twenty step algorithm for
determining the asymptotic number of trees of various species.’ J. Austral Math.
Soc. Ser. A 20 (1975), 483-503.
[Ha] Hayman, Walter. ‘A generalisation of Stirling’s formula.’ Journal für die reine und
angewandte Mathematik 196 (1956), 67-95.
[Jo] Joyal, A. ‘Une théorie combinatoire des séries formelles.’ Adv. Math. 42 (1981),
1-82.
[Kl] Klarner, D. ‘Some results concerning polyominoes.’ Fibonacci Quart. 3 (1965), 9-20.
[Kn] Knuth, Donald E. The Art of Computer Programming, vol. 1: Fundamental Algo-
rithms, 1968 (2nd ed. 1973); vol. 2: Seminumerical Algorithms, 1969 (2nd ed. 1981);
vol. 3: Sorting and Searching, 1973. Reading, MA: Addison-Wesley.
[KnW] Knuth, Donald E., and Wilf, Herbert S. ‘A short proof of Darboux’s lemma.’ Applied
Mathematics Letters 2 (1989), 139-140.
[Ko] Koepf, Wolfram. ‘Power series in computer algebra.’ J. Symb. Comp., to appear.
[MP] Moon, J. W. and Pullman, N. J. ‘The number of triangles in a triangular lattice.’
Delta 3 (1973), 28-31.
[NW] Nijenhuis, Albert, and Wilf, Herbert S. ‘Representations of integers by linear forms
in nonnegative integers.’ J. Number Theory 4 (1970), 98-106.
[Od] Odlyzko, A. M., Asymptotic enumeration methods, to appear.
[Pe] Petkovšek, Marko. Finding closed-form solutions of difference equations by sym-
bolic methods, Ph.D. Dissertation, School of Computer Science, Carnegie Mellon226 References
University, CMU-CS-91-103, 1991.
[Po] Porubský, S̆tefan. Results and problems on covering systems of residue classes. Mit-
teilungen Mathem. Seminar Giessen 150, Selbstverlag Math. Inst., Giessen, !981.
[Ra] Rademacher, Hans, Lectures on elementary number theory, Blaisdell, 1964.
[RU] Riddell, R. J., and Uhlenbeck, G. E. ‘On the theory of the virial development of the
equation of state of monatomic gases.’ J. Chem. Phys. 21 (1953), 2056-2064.
[RM] Rota, Gian-Carlo, and Mullin, Ronald. ‘On the foundations of combinatorial theory,
III.’ In Graph Theory and its Applications, Reading, MA: Academic Press, 1970,
167-213.
[Ro] Roy, Ranjan. ‘Binomial identities and hypergeometric series.’ American Mathemat-
ical Monthly 94 (1987), 36-46.
[Sc] Schützenberger, M. P. ‘Context-free languages and pushdown automata.’ Informa-
tion and Control 6 (1963), 246-264.
[St1] Stanley, Richard P. Enumerative combinatorics. Monterey, CA: Wadsworth, 1986.
[St2] Stanley, Richard P. ‘Generating functions.’ In MAA Studies in Combinatorics,
Washington, DC: Mathematical Association of America, 1978.
[St3] Stanley, Richard P. ‘Exponential structures.’ Studies in Appl. Math. 59 (1978),
78-82.
[Sz] Szegö, Gabor. ‘Orthogonal polynomials.’ American Mathematical Society Collo-
quium Series Publication, 1967.
[Wi1] Wilf, Herbert S. ‘Mathematics for the Physical Sciences.’ New York: John Wiley
and Sons, 1962; reprinted by Dover Publications, 1978.
[Wi2] Wilf, Herbert S. Algorithms and complexity. Englewood Cliffs, NJ: Prentice Hall,
1986.
[Wi3] Wilf, Herbert S. ‘Three problems in combinatorial asymptotics.’ J. Combinatorial
Theory 35 (1983), 199-207.
[WZ1] Wilf, Herbert S., and Zeilberger, Doron. ‘Rational functions certify combinatorial
identities.’ J. Amer. Math. Soc. 3 (1990), 147-158.
[WZ2] Wilf, Herbert S., and Zeilberger, Doron. ‘An algorithmic proof theory for hyperge-
ometric (ordinary and ‘q’) multisum/integral identities.’ Inventiones Mathematicæ,
108 (1992), 575-633.
[Zn] Znám, S̆., ‘A survey of covering systems of congruences.’ Acta Math. Univ. Come-
nian., 40-41 (1982), 59-72.