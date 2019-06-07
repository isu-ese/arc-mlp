### Goals

Our goal is to find a way to calculate a merged grammar \(G_m\) from two grammars \( G_1 \) and \(G_2\). We wish for it to be as compatible as possible with tools that use \(G_1\) and to be able to process all sentences that are valid for both \(G_1\) and \(G_2\). To better express this, we created the following desired properties.

First of all, let's give our terminology. We expect the allowed terminals \( T\) of the grammars to all be the same. We denote grammars as \(G = (R, T, P, r)\) where \(R\) is the set of non-terminal symbols or rules, \(T\) is the set of terminal symbols, \(P = R \rightarrow (R \cup T)^* \) is the productions, and \(s\) is the start symbol. We denote the valid languages of a grammar as \(L(G)\). We denote the abstract syntax tree for a sentence \(l \in L(G)\) as \(AST(l, G) = (V, S, C, v)\) where \(V\) is the nodes in the abstract syntax tree, \(S = V \rightarrow (R \cup T)\) is a relation mapping each node to a symbol in \(G\), \(C = V \rightarrow V^* \) defines the children of each node, and \(v\) is the root node.

#### Validity Constraint

Only sentences that are valid in \(G_1\) or \(G_2\) should be valid in \(G_m\). \(L(G_m) = L(G_1) \cup L(G_2)\). This is to make sure that it can parse all valid inputs and properly reject invalid inputs.

#### Compatibility Constraint

The abstract syntax trees produced for sentences in \(G_1\) or \(G_2\) should be compatible with the abstract syntax trees produced with \(G_m\). To ensure this property, we also need to make sure that our algorithm produces mappings between the rules of the grammars: \(M_{a\rightarrow b} = R_a \rightarrow R_b\). By compatibility, we mean that once put through our mappings, the \(AST\)s produced by \(G_m\) should be identical. \(\forall n \in \{1,2\}:\forall l \in L(G_n): M_{m\rightarrow n}(AST(l, G_m)) = AST(l, G_n)\).

#### Equivalence Maximization

Finally, we want tools designed around one language to be able to parse equivalent structures in the other language. This means that we want the abstract syntax trees produced for different sentences to share as much structure with the other language as possible. We can measure the amount of shared structure for a sentence \(l\) by measuring the total fraction of nodes in the AST that have a mapping to symbols in both \(G_1\) and \(G_2\). 