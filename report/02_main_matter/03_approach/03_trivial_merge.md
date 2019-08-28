## Trivial Merge {#sec:trivial_merge}

A trivial merge between the start nodes of grammars is done rather easily. We begin by create a fresh start node in the new grammar. The production rule for this new start production is then an alternatives list containing each of the source grammars' start nodes. The trivial merging of grammars $G_1$ and $G_2$ yields the grammar $G_3$ depicted in @fig:grammar_g3. Where the original source grammar start productions are renamed S1 and S2 representing the start productions for both $G_1$ and $G_2$, respectively.

```{=latex}
\begin{figure}[tb]
 \centering
 \subfloat[Grammar $G_3$.]{
  \label{fig:grammar_g3}
  \begin{minipage}[t]{.2\textwidth}
```
!grammar
~~~
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<Y> ::= <A> | `y'

<A> ::= `a' $\varepsilon$ <B> <\(C_1\)>

<$C_1$> ::= `c'

<B> ::= `b' `d'

<$S_2$> ::= <\(C_2\)> | <D>

<Z> ::= <S> | `z'

<$C_2$> ::= `c'

<D> ::= `a' `d' (`e' | `c') | (<\(C_2\)> | `b')
~~~
```{=latex}
  \end{minipage}
 }
 \caption{Grammar $G_3$.}
\end{figure}
```
