## Merging Similar Rules {#sec:merging_similar}

Once the two most similar productions are detected they are then merged together. Similar to the process of measuring similarity, there are two form specific processes for merging similar productions. This process relies upon a minimal similarity threshold, $M_s$, above which similar productions are merged.

### Merging Similar Terms

To merge two productions of the first form, the LCS alignment produced while measuring the similarity between terms is used. Initially, each pair of subsequences that do not align are identified. In the previous example, the identified unaligned pairs of subsequences are: (`'a'`, $\varepsilon$), ($\varepsilon$, `<B>`), and (`'a'`, `'c'`). Each pair of unaligned subsequence is then substiuted with the union of the two subsequences. As an example, the prior example sequences of terms would merge to: $\left<P_{a+b}\right>$ ::= (`'a'` | $\varepsilon$) $\left<A\right>$ ($\varepsilon$ | $\left<B\right>$) `'b'` (`'c'` | `'a'`).

### Merging Similar Alternatives

Merging two productions of the second form is simpler than the first form. The merged production produced simply contains all alternatives that are in either constituent production. As an example, the prior example productions $\left<P_a\right>$ and $\left<P_b\right>$ would be merged to the following: $\left<P_{a+b}\right>$ ::= `'a'` | $\left<A\right>$ | $\left<B\right>$ | `'b'` | `'c'`.
