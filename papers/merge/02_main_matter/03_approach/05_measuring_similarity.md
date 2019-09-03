## Measuring Rule Similarity {#sec:similarity}

The fourth step of SIGMA measures the similarity between every pair of productions. This measure is used by the fifth step to determine which two rules to merge. In this section, we lay out the two measures of similarity that we used for each of the two forms of rules that our normalization step produces. If two productions are different forms, we measure their similarity as 0.

### Term Similarity

The first measure of similarity that we used is for measuring the similarity between two productions of form 1. For explaining our process, we use the following two productions.

!grammar
```
<$P_a$> ::= `a' <A> `b' `c'

<$P_b$> ::= <A> <B> `b' `a'
```

In the first step of measuring the similarity between two productions like this, SIGMA aligns the productions as best as possible. This can be performed using the Longest Common Subsequence (LCS) algorithm \cite{cormen_introduction_2001}.

```
'a' <A>     'b'     'c'
    <A> <B> 'b' 'a'
```

Once we have aligned the two productions as best as possible, we count the number of aligned terms and divide it by the total number of terms. The following formula also describes this:

$$S_1 = \frac{2|\textsc{LCS}(P_a, P_b)|}{|P_a| + |P_b|}$$

Applying the above formula to our example, `<A>` and `'b'` are each counted twice because they occur in both sequences of terms. The total number of terms across both productions is 8. The total similarity score is $S_1 = \frac{4}{8} = .5$.


### Alternatives Similairty

The second measure of similarity that we use is for measuring the similarity between two productions of form 2. For explaining our process, we use the following two productions.

!grammar
```
<\(P_a\)> ::= `a' | <A> | `b' | `c'

<\(P_b\)> ::= <A> | <B> | `b' | `a'
```

Like the previous measure, we calculate the number of common alternatives before dividing by the total number of alternatives. However, since the order of the alternatives doesn't matter, we use a different approach to measure the common alternatives. We simply count an alternative as common to both if it is both productions. The following formula describes how to calculate the similarity score using this method:

$$S_2 = \frac{2|P_a \cap P_b|}{|P_a| + |P_b|}$$

In our particular example, the common elements are `<A>`, `'a'`, and `'b'`. The total similarity is then calculated as $\frac{2*3}{8} = .75$.
