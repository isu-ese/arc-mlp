## Trivial Merge {#sec:trivial_merge}

The initial merge is the combination of the start productions of the grammars to be combined. First, a new start symbol is created in the new grammar. Productions are also added from this symbol to each of the source grammars' start productions. The trivial merging of grammars $G_1$ and $G_2$ yields the grammar $G_3$ depicted in @fig:grammar_g3. Where the original source grammar start productions are renamed S1 and S2 representing the start productions for both $G_1$ and $G_2$, respectively.

```{=latex}
\begin{figure}[tb]
 \centering
  \begin{minipage}[t]{.2\textwidth}
```

!grammar
```
<S> ::= <\(S_1\)> | <\(S_2\)>

<$S_1$> ::= <A> | <B>

<Y> ::= <A> | `y'

<A> ::= `a' $\varepsilon$ <B> <\(C_1\)>

<$C_1$> ::= `c'

<B> ::= `b' `d'

<$S_  2$> ::= <\(C_2\)> | <D>

<Z> ::= <S> | `z'

<$C_2$> ::= `c'

<D> ::= `a' `d' (`e' | `c') | (<\(C_2\)> | `b')
```

```{=latex}
  \end{minipage}
 \caption{Grammar $G_3$. The result of trivially merging $G_1$ and $G_2$.}\label{fig:grammar_g3}
\end{figure}
```
