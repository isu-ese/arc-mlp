## Measuring Rule Similarity {#sec:similarity}

The fourth step of this approach measures the similarity between each pair of productions. This measure is used by the fifth step to identify merge candidate pairs. In this section, describe the two similarity metrics corresponding to the two forms (defined in @sec:normalization) of productions produced by the normalization process. We note, productions of different forms will have a similarity of 0.

### Term Similarity

The first similarity metric measures the similarity between two productions of form 1. As an example, assume we have the following two productions:

!grammar
```
<$P_a$> ::= `a' <A> `b' `c'

<$P_b$> ::= <A> <B> `b' `a'
```

The first step towards measuring the similarity between these productions is aligning the productions using the Longest Common Subsequence (LCS) algorithm \cite{cormen_introduction_2001}.

```
'a' <A>     'b'     'c'
    <A> <B> 'b' 'a'
```

Once aligned, the number of aligned terms is divided by the total number of terms, as described in Eqn. \ref{eqn:metric1}:

\begin{eqnarray}\label{eqn:metric1}
S_1 & = & \frac{2|\textsc{LCS}(P_a, P_b)|}{|P_a| + |P_b|}
\end{eqnarray}

\noindent Applying Eqn. \ref{eqn:metric1} to the example, `<A>` and `'b'` are each counted twice because they occur in both sequences of terms. The total number of terms across both productions is 8. The total similarity score is computed as, $S_1 = \frac{4}{8} = .5$.


### Alternatives Similarity

The second similarity metric measures the similarity between two productions of form 2. As an example, assume we have the following two productions:

!grammar
```
<\(P_a\)> ::= `a' | <A> | `b' | `c'

<\(P_b\)> ::= <A> | <B> | `b' | `a'
```

Similar to the previous metric, this metric calculates the number of common alternatives divided by the total number of alternatives. However, because the order of the alternatives does not matter, a different approach to measure the common alternatives is applied. In this approach an alternative is counted as common to both if it occurs in both productions. Eqn. \ref{eqn:metric2} describes how to calculate the similarity score using this method:

\begin{eqnarray}\label{eqn:metric2}
S_2 & = & \frac{2|P_a \cap P_b|}{|P_a| + |P_b|}
\end{eqnarray}

\noindent Applying Eqn. \ref{eqn:metric2} to the example, the common elements are `<A>`, `'a'`, and `'b'`. The similarity score is computed as, $\frac{2*3}{8} = .75$.
