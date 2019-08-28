## Normalization {#sec:normalization}

For normalization, we normalized to a unique normal form where every production is either of the following two forms:

!grammar
```
<A> ::= <B> `a' ...

<B> ::= <A> | `b' | ... | $\varepsilon$
```

\noindent We chose these forms so that we would be able to easily compare similar productions. We refer to the two forms as form 1 and form 2 respectively.

In both forms, the rules on the right hand side must not expand to the same form as on the left hand side. We implemented this so that if productions are nested in different ways, they normalized to the same form. Here is an example: Given grammar G1

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

To normalize to the above form, we repeat six processes until the grammar stopped changing. These processes are to eliminate unused rules, simplify the productions, merge equivalent rules, eliminate unit rules, expand productions, and collapse compatible productions.

### Eliminate Unused Rules

To eliminate unused rules, we removed all rules that cannot be eventually produced from the start rule. We did this by enumerating all used rules via a depth first search and then retaining only those rules. When applied to $G_3$ the grammar is transformed into grammar $G_4$ depicted in @fig:grammar_g4.

```{=latex}
\begin{figure}[tb]
 \centering
 \subfloat[Grammar $G_4$.]{
   \label{fig:grammar_g4}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<A> ::= `a' $\varepsilon$ <B> <\(C_1\)>

<$C_1$> ::= `c'

<B> ::= `b' `d'

<$S_2$> ::= <\(C_2\)> | <D>

<$C_2$> ::= `c'

<D> ::= `a' `d' (`e' | `c') | (<\(C_2\)> | `b')
~~~
```{=latex}
 \end{minipage}
}
 \qquad
 \subfloat[Grammar $G_5$.]{
   \label{fig:grammar_g5}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<A> ::= `a' <B> <\(C_1\)>

<$C_1$> ::= `c'

<B> ::= `b' `d'

<$S_2$> ::= <\(C_2\)> | <D>

<$C_2$> ::= `c'

<D> ::= `a' `d' (`e' | `c') | (<\(C_2\)> | `b')
~~~
```{=latex}
 \end{minipage}
}
 \qquad
 \subfloat[Grammar $G_6$.]{
   \label{fig:grammar_g6}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<A> ::= `a' <B> <C>

<C> ::= `c'

<B> ::= `b' `d'

<$S_2$> ::= <C> | <D>

<D> ::= `a' `d' (`e' | `c') | (<C> | `b')
~~~
```{=latex}
 \end{minipage}
}
 \qquad
 \subfloat[Grammar $G_7$.]{
   \label{fig:grammar_g7}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<A> ::= `a' <B> `c'

<B> ::= `b' `d'

<$S_2$> ::= `c' | <D>

<D> ::= `a' `d' (`e' | `c') | (`c' | `b')
~~~
```{=latex}
 \end{minipage}
}
 \qquad
 \subfloat[Grammar $G_8$.]{
   \label{fig:grammar_g8}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<A> ::= `a' <B> `c'

<B> ::= `b' `d'

<$S_2$> ::= `c' | <D>

<D> ::= <\(D_1\)> | <\(D_3\)>

<\(D_1\)> ::= `a' `d' <\(D_2\)>

<\(D_2\)> ::= `e' | `c'

<\(D_3\)> ::= `c' | `b'
~~~
```{=latex}
 \end{minipage}
}
 \qquad
 \subfloat[Grammar $G_9$.]{
   \label{fig:grammar_g9}
   \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <A> | <B> | `c' | <D>

<A> ::= `a' `b' `d' `c'

<B> ::= `b' `d'

<D> ::= <\(D_1\)> | `c' | `b'

<\(D_1\)> ::= `a' `d' <\(D_2\)>

<\(D_2\)> ::= `e' | `c'
~~~
```{=latex}
 \end{minipage}
 }
 \caption{Transformed grammars produced during the normalization of grammar $G_3$.}
\end{figure}
```

### Simplify

The simplify step was added to simplify our object representation. We removed $\varepsilon$ items embedded inside terms and replaced objects containing only one object with the object inside them. When this step is applied to grammar $G_4$, it is transformed into grammar $G_5$, as depicted in @fig:grammar_g5

### Merge equivalent Rules

In this step, we replace rules that have identical productions with a single rule. The new rule is given a name derived from the rules that were merged to create it. In the following example of this step, rules a and b are merged into the rule a+b.

!grammar
~~~
<s> ::= <a> | <b>

<a> ::= `a' `b' <a>

<b> ::= `a' `b' <a>
~~~

Here it is after the rules are merged together.

!grammar
~~~
<s> ::= <a+b>

<a+b> ::= `a' `b' <a+b>
~~~

\noindent When this step is applied to grammar $G_5$, it is transformed into grammar $G_6$, as depicted in @fig:grammar_g6.

### Eliminate Unit Rules

This part of the normalization process is taken from the Chomksy Normal Form. In this process, we eliminate all rules of one of the following two forms by replacing each usage of one of these rules with their production.

!grammar
~~~
<a> ::= <b>

<a> ::= `a'
~~~

\noindent The Chomsky Normal Form differs in its unit rule removal in that it does not eliminate rules of the second form. The reason we chose to eliminate the second form is so that the simplification process can simplify rules of the following form.

!grammar
~~~
<a> ::= <b> `a' `b'

<b> ::= $\varepsilon$
~~~

\noindent When this step is applied to grammar $G_6$, it is transformed into grammar $G_7$, as depicted in @fig:grammar_g7.

### Expand Productions

In this step, we expand out rules that have any nesting in their productions. We do this by replacing all
nested content with a rule pointing to their content.

\noindent When this step is applied to grammar $G_7$, it is transformed into grammar $G_8$, as depicted in @fig:grammar_g8.

### Collapse Compatible Productions

In the final step of the normalization process, we collapse productions that are compatible with each other.
This is to make sure that any non-terminal symbols referenced in a form does not produce a production of the same form. For example, the following productions

!grammar
~~~
<A> ::= `a' <B>

<B> ::= `b' `c'

<C> ::= `c' | <D>

<D> ::= `d' | `e'
~~~

\noindent would collapse to

!grammar
~~~
<A> ::= `a' `b' `c'

<C> ::= `c' | `d' | `e'
~~~


\noindent When this step is applied to grammar $G_8$, it is transformed into grammar $G_9$, as depicted in @fig:grammar_g9.
