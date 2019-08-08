## Trivial Merge {#sec:trivial_merge}

A trivial merge between the start nodes of grammars is done rather easily. We begin by create a fresh start node in the new grammar. The production rule for this new start production is then an alternatives list containing each of the source grammars' start nodes. The trivial merging of grammars $G_1$ and $G_2$ yields the grammar $G_3$ depicted in @fig:grammar_g3. Where the original source grammar start productions are renamed S1 and S2 representing the start productions for both $G_1$ and $G_2$, respectively.

```{=latex}
\begin{figure}[tb]
 \centering
 \begin{minipage}[t]{.15\textwidth}
```
!grammar
~~~
<S> ::= <S1> | <S2>

<S1> ::= <A> | <B>

<S2> ::= <F> | <G>

<A> ::= 'a'

<B> ::= 'b'

<C> ::= 'c'

<D> ::= 'd'

<E> ::= 'e'

<F> ::= 'f'

<G> ::= 'g'

<H> ::= 'h'

<I> ::= 'i'

<J> ::= 'j'
~~~
```{=latex}
 \end{minipage}
 \caption{Grammar $G_3$.}\label{fig:grammar_g3}
\end{figure}
```
