## Merging Similar Rules {#sec:merging_similar}

Once we have detected the two most similar productions using the above method, we merge them together. Just like for measuring similarity, we have two different processes for merging similar productions. These measures also differ for the forms that we merge together.

In our process, we have to define a minimal similarity $M_s$ score before we merge similar productions. We only merge productions if their similarity score is above or equal to this threshold.

### Merging Similar Terms

To merge two productions of the first form, we use the LCS alignment produced while measuring the similarity between the terms. We identify each pair of subsequences that do not align. In the previous example, these pairs of subsequences are (`'a'`, $\varepsilon$), ($\varepsilon$, `<B>`), and (`'a'`, `'c'`). We then replace each subsequence with a term that produces to either subsequence. For example, the two sequences of terms mentioned earlier would merge to

!grammar
```
<$P_{a+b}$> ::= (`a' | $\varepsilon$) <A> ($\varepsilon$ | <B>) `b' (`c' | `a')
```

### Merging Similar Alternatives

Merging two productions of the second form is simpler than the first form. The merged production produced simply contains all alternatives that are in either constituent production. Our previous example would be merged to the following

!grammar
```
<\(P_{a+b}\)> ::= `a' | <A> | <B> | `b' | `c'
```
