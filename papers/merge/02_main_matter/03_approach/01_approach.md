In order to generate an island grammar from one or more source grammars, there is a need to merge components of the source grammar(s) to reduce or deduplicate the final grammar. Specifically, this technique is to be utilized in combining and reducing the island components. Thus, the focus of this paper (as noted in @sec:introduction) is the development of a technique to merge grammars together. This technique is depicted in @fig:approach and utilizes the following step:

1. Parse the input grammars.
2. Trivially merge the grammars into a single grammar.
3. Normalize the merged grammar.
4. Calculate the similarity between each pair of rules.
5. Merge the two most similar rules.
6. Repeat steps 3--5 until the two most similar rules are no longer similar.
7. Output the merged grammar.

![Diagram of Approach](images/paper/SIGMA-DFD.pdf){#fig:approach}

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
 \caption{Example grammars.}
\end{figure}
```
