# Approach

![Diagram of Approach](img/SIGMA-DFD.pdf)

Our approach for merging grammars focuses on four steps. First, we perform a trivial merge
of the start symbols of the grammars. Second, we normalize the resulting merged grammar.
Third, we merge the two most similar productions in the grammars. Fourth, we repeat steps
two and three until the most similar productions are too dissimilar.

## Trivial Merge

A trivial merge between the start nodes of grammars is done rather easily. We simply
append the productions of the grammars to one another. We then create a new start node
with a production to each start node. Here is an example where we merge the grammars G1 and G2:

!grammar
```
<G1> ::= `a'

<G2> ::= `b'
```

\noindent After trivially merging, the result is:

!grammar
```
<Generated> ::= <G1> | <G2>

<G1> ::= `a'

<G2> ::= `b'
```

## Normalization

For normalization, we normalized to a unique normal form where every production
was one of the following two forms:

!grammar
```
<A> ::= <B> | `b' | $\varepsilon$ | ...

<B> ::= <A> `a' ...
```

\noindent We chose these forms so that we would be able to easily compare similar productions.
We refer to the two forms as form 1 and form 2 respectively.

In both forms, the rules on the right hand side must not expand to the same form
as on the left hand side. We implemented this so that if productions are nested in different
ways, they normalized to the same form. Here is an example: Given grammar G1

!grammar
```
<A> ::= `a' <B>

<B> ::= `b' `c'
```

\noindent and grammar G2

!grammar
```
<A> ::= <B> `c'

<B> ::= `a' `b'
```

\noindent they both normalize to the same grammar.

!grammar
```
<A> ::= `a' `b' `c'
```

Finally, we made sure that if two symbols have equivalent productions
that the two symbols are combined into one symbol.

## Merging Similar Rules

When merging similar rules, we had two steps. First we measured
the similarity between each pair of rules with equivalent forms.
Then we merged the two most similar rules.

### Similarity Measures

### Merging Process