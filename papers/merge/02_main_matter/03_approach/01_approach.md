In order to generate an island grammar from one or more source grammars, there is a need to merge components of the source grammar(s) to reduce or deduplicate the final grammar. Such a technique can be used to reduce the island components. Thus, the focus of this paper is the development of a technique to merge grammars together, and is depicted in @fig:approach. The process is as follows:

1. Parse the input grammars.
2. Trivially merge the grammars into a single grammar.
3. Normalize the merged grammar.
4. Calculate the similarity between each pair of rules.
5. Merge the two most similar rules.
6. Repeat steps 4 and 5 until the two most similar rules are no longer similar.
7. Final Normalization of Merged Grammar
8. Output the merged grammar.

![Data flow diagram of merging process.](images/paper/SIGMA-DFD.pdf){#fig:approach}

The remainder of this section presents the details of each of these steps and utilizes a running example based on the the two grammars depicted in @fig:grammar_g1 and @fig:grammar_g2.

```{=latex}
\begin{figure}[tb]
 \centering
 \subfloat[Grammar $G_1$.]{
   \label{fig:grammar_g1}
   \begin{minipage}[t]{0.2\textwidth}
```

!grammar
~~~
<S> ::= <A> | <B>

<Y> ::= <A> | `y'

<A> ::= `a' $\varepsilon$ <B> <C>

<C> ::= `c'

<B> ::= `b' `d'
~~~

```{=latex}
 \end{minipage}
 }
 \qquad
 \subfloat[Grammar $G_2$.]{
   \label{fig:grammar_g2}
   \begin{minipage}[t]{0.2\textwidth}
```

!grammar
~~~
<S> ::= <C> | <D>

<Z> ::= <S> | `z'

<C> ::= `c'

<D> ::= `a' `d' (`e' | `c') | (<C> | `b')
~~~

```{=latex}
 \end{minipage}
 }
 \caption{Example grammars used to demonstrate merging procedure.}
\end{figure}
```
