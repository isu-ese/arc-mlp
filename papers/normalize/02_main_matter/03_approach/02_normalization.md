## Normalization {#sec:normalization}

Next, the trivially merged grammar is normalized to a unique normal form wherein every production is one of the following two forms:

!grammar
```
<A> ::= <B> `a' ...

<B> ::= <A> | `b' | ... | $\varepsilon$
```

\noindent Where production $\left<A\right>$ represents form $F_1$ and production $\left<B\right>$ represent form $F_2$. These forms were selected to ease comparison of similar productions. Note, as per this normalization, neither form may be recursively defined. The rational behind this, is to ensure that regardless of how productions are nested they will normalize to the same form, for example: Given grammar $EG_1$

!grammar
```
<A> ::= `a' <B>

<B> ::= `b' `c'
```

\noindent and grammar $EG_2$

!grammar
```
<A> ::= <B> `c'

<B> ::= `a' `b'
```

\noindent both $EG_1$ and $EG_2$ normalize to the same grammar, as follows:

!grammar
```
<A> ::= `a' `b' `c'
```

\noindent Normalization continues, repeatedly, through the following six processes until stabilization: eliminating unused rules, simplifying productions, merging equivalent rules, eliminating unit rules, expanding productions, and collapsing compatible productions.

### Eliminating Unused Rules

Remove all rules that are not produced, directly or indirectly, from the start rule. This is accomplished by marking all rules enumerated via a depth first search, and then dropping unmarked rules. When applied to $G_3$ the grammar is transformed into grammar $G_4$, as depicted in @fig:grammar_g4.

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

### Simplifying Productions

To simplify in-memory grammar representations, the process removes $\varepsilon$ embedded inside terms. Next, productions containing one term are replaced with that term. When this step is applied to grammar $G_4$, it is transformed into grammar $G_5$, as depicted in @fig:grammar_g5

### Merging Equivalent Rules

Rules that have identical productions are replaced by a single rule. This new rule is given a name derived from the rules that were merged to create it. In the following example of this step, rules a and b are merged into the rule a+b:

!grammar
~~~
<s> ::= <a> | <b>

<a> ::= `a' `b' <a>

<b> ::= `a' `b' <a>
~~~

\noindent Which after equivalent rules are merged yields:

!grammar
~~~
<s> ::= <a+b>

<a+b> ::= `a' `b' <a+b>
~~~

\noindent When this step is applied to grammar $G_5$, it is transformed into grammar $G_6$, as depicted in @fig:grammar_g6.

### Eliminating Unit Rules

All non-terminals with productions of one of the following two forms will have their non-terminal symbols replaced by their rules, and their productions eliminated.

!grammar
~~~
<a> ::= <b>

<a> ::= `a'
~~~

\noindent Elimination of productions of the first form, is derived from Chomsky Normal Form (CNF) [X]. Eliminations of productions of the second form, a derivation from CNF, allows the simplification process to simplify rules of the following form:

!grammar
~~~
<a> ::= <b> `a' `b'

<b> ::= $\varepsilon$
~~~

\noindent When this step is applied to grammar $G_6$, it is transformed into grammar $G_7$, as depicted in @fig:grammar_g7.

### Expanding Productions

Productions that have nested rules have all nested content replaced by with a non-terminal. The new non-terminal defines a production pointing to their content. When this step is applied to grammar $G_7$, it is transformed into grammar $G_8$, as depicted in @fig:grammar_g8.

### Collapsing Compatible Productions

The final step of the normalization process combines productions that are compatible with each other. This ensures that any non-terminal symbols referenced in a rule will not define a duplicate production. The following provides an example:

!grammar
~~~
<A> ::= `a' <B>

<B> ::= `b' `c'

<C> ::= `c' | <D>

<D> ::= `d' | `e'
~~~

\noindent would then collapse to form:

!grammar
~~~
<A> ::= `a' `b' `c'

<C> ::= `c' | `d' | `e'
~~~


\noindent When this step is applied to grammar $G_8$, it is transformed into grammar $G_9$, as depicted in @fig:grammar_g9.
