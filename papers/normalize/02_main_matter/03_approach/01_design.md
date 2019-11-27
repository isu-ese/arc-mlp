## Design

To design our normal form, we decided that it should have the following properties.

1. Our domain object model represents each rule as a tree of operators and operands. To simplify searching for similar rules and productions, we want the tree for each rule to be flat. We can ensure this by requiring that each rule has a single operator at most.
2. We desire that the size increase induced by normalization is minimal. \label{req:size_increase_minimal}
3. We desire that the normalized grammar is unambiguous given a grammar. I.e. there is exactly one normalized grammar for each grammar. \label{req:unambiguous}
4. \label{req:transformations} We desire that certain transformations on the input grammar before normalization do not change the normalization result. These transformations are
    1. Refactoring common terms of rules into a separate rule.
    2. Duplicating a rule.
    3. Introducing an unused non-terminal symbol and its production.
    4. Replacing a non-terminal symbol with a non-terminal symbol that produces that non-terminal symbol.
    4. Replacing all usages of a non-terminal symbol with its rule.

To meet these requirements, we decided that the normal form would have each production as one of the following forms.

1. $\bnfpn{\(\textrm{Form}_1\)} \bnfpo \bnfpn{A} \bnfsp \bnftd{a} \bnfsp \bnfsk,$ where each term is a terminal symbol or a non-terminal symbol with an $F_2$ production and there are at least two terms in the rule.
2. $\bnfpn{\(\textrm{Form}_2\)} \bnfpo \bnfpn{A} \bnfor \bnftd{a} \bnfor \bnfsk,$ where each term is a terminal symbol, the empty string, or a non-terminal symbol with an $F_1$ production and there are at least two terms in the rule except for the special case when there is only production.

The reason we chose these two forms is that because rules of these forms are relatively easy to compare. This allows rules to easily be compared and merged. The restriction that non-terminal symbols referenced in each rule must have productions of the opposite form is so that examples 

To meet requirement \ref{req:transformations}, our normalization process is performed using only transformation that are the inverse of transformations we do not want to affect our normalization process. To ensure that the size increase is minimal, we do not attempt to reverse transformations that rely on the distributive property between the concatenation and union `|` operators. To reverse transformations of this type, it is required to distribute productions. For example, 
\begin{bnf*}
    \bnfprod{A}{\bnfts{a} \bnfsp \bnfpn{B}} \\
    \bnfprod{B}{\bnfts{b} \bnfor \bnfts{c}}
\end{bnf*}
\noindent would have to be transformed to
\begin{bnf*}
    \bnfprod{A}{\bnfts{a} \bnfsp \bnfts{b} \bnfor \bnfts{a} \bnfsp \bnfts{c}}.
\end{bnf*}
\noindent Performing transformations of this kind repeatedly would result in an unreasonable increase in the number of productions. In addition, it would be unable to handle the case when a production indirectly references itself.