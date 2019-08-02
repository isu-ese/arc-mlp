# Methods

In this section, we explain the approach we used to evaluate our approach
for merging grammars. First, we chose a small number of grammars. Then
we evaluated the effectiveness of merging each grammar with itself. Third,
we evaluated the effectiveness of merging two somewhat similar high level
programming languages. Finally, we evaluated the effectiveness of merging
grammars with mutated versions of themselves.

For each of the merging tests, we tested five different values for $M_s$. These values
were .001, .25, .5, .75, and 1. We used a value of .001 rather than 0
so that SIGMA would not attempt to merge productions of different forms. We predicted
that SIGMA would not perform particularly well for $M_s$ values of .001 or 1. For the other
values of $M_s$, we predicted that the algorithm would work to various degrees of success. 

## Test Grammars

The grammars that we chose to evaluate our approach were Brainfuck, Java, and C#.
The reason we chose Brainfuck is its small grammar which makes it easier to understand.
The reason we chose Java and C# is because they're relatively similar to each other
and are fully featured programming languages.

For our Brainfuck grammar, we used the grammar in [@fig:brainfuck_grammar].

!figures(brainfuck_grammar)(Brainfuck Grammar)(
!grammar
```
<prog> ::= $\varepsilon$ | <command> <prog>

<command> ::= <loop> | <simpleCommand>

<loop> ::= `[' <prog> `]'

<simpleCommand> ::= `>' | `<' | `.' | `,' | `-' | `+'
```
)

For the Java and C# grammars, we used grammars from a repository of ANTLR grammars [@AntlrGrammarsv4Grammars].
Their ANTLR representation wasn't fully compatible
with the BNF format our tool depends upon. To resolve this, we removed or converted
all non-bnf features except for dot, character range, character class, and not rules. The dot rule is a single character wildcard. Character ranges allow
you to specify a range of characters. A character class only matches characters that
fall into certain Unicode classes. The not rules match anything that isn't one of a
set of items. For dot, character range, and character class rules, we converted
them to special terminal symbols. We kept not rules, but made sure
to extract them out as their own rules and their contents as well. For example

```
A: 'a' . ~('b' | 'c')
```

\noindent would be converted to

!latex
```
\begin{grammar}
<A> ::= `a' DOT <Generated-1>

<Generated-1> ::= \textasciitilde<Generated-2>

<Generated-2> ::= `b' | `c'
\end{grammar}
```

\noindent The not rules are ignored completely by our algorithm except for
when detecting and merging duplicate rules.

## Merging With Self

For each of our three grammars, we tested the effectiveness of our algorithm at merging
them with themselves. To evaluate the effectiveness, we looked at its ability at producing a
grammar that is similar to the original grammar and its ability at identifying identical
rules to merge. 

## Merging With Others

We tested the effectiveness of SIGMA by merging the Java and C# programming languages.
These languages both have relatively complicated syntax. However, they are similar languages to each other.
To evaluate the effectiveness of SIGMA, we looked in the merged grammar for the identification and
merging of similar constructs between the two languages. In particular, we looked for the identification
and merging of import/use statements, classes, methods, statements, and expressions.

## Merging With Mutations

Finally, we tested the effectiveness of merging each grammar with mutants of themselves. To derive mutants,
we used mutation operators developed for mutation testing [@offuttMutationTestingImplements2006a].
Because this produces a large number of mutants, we tested our merging process on only a small selection of
mutated grammars. The mutation operators we decided to use are enumerated in [@offuttMutationTestingImplements2006a].

