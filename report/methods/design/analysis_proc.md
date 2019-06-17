## Analysis Procedures

### Metrics

#### Validity Constraint

Only sentences that are valid in \(G_1\) or \(G_2\) should be valid in \(G_m\). \(L(G_m) = L(G_1) \cup L(G_2)\). This is to make sure that it can parse all valid inputs and properly reject invalid inputs.

We can measure this in two parts. First, we can select a given language grammar (e.g. Java)

#### Compatibility Constraint

The abstract syntax trees produced for sentences in \(G_1\) or \(G_2\) should be compatible with the abstract syntax trees produced with \(G_m\). To ensure this property, we also need to make sure that our algorithm produces mappings between the rules of the grammars: \(M_{a\rightarrow b} = R_a \rightarrow R_b\). By compatibility, we mean that once put through our mappings, the \(AST\)s produced by \(G_m\) should be identical. \(\forall n \in \{1,2\}:\forall l \in L(G_n): M_{m\rightarrow n}(AST(l, G_m)) = AST(l, G_n)\).

#### Equivalence Maximization

Finally, we want tools designed around one language to be able to parse equivalent structures in the other language. This means that we want the abstract syntax trees produced for different sentences to share as much structure with the other language as possible. We can measure the amount of shared structure for a sentence \(l\) by measuring the total fraction of nodes in an AST that have a mapping to symbols in both \(G_1\) and \(G_2\). 
