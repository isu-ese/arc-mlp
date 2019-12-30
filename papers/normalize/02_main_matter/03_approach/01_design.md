## Design

To design the normalization, we needed a normalization process that simplifies merging grammars. This led us to our first design goal: that it is easy to compare productions of normalized grammars. To do this, we constrained the productions of normalized grammars to each be one of two forms:

\textmd{$\textit{Form}_1$}

:   The rule of the production only uses the concatenation operator. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfsp \bnftd{b} \bnfsp \bnfsk.$

\textmd{$\textit{Form}_2$}

:   The rule of the production only uses the alternatives (`|`) operator. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfor \bnftd{b}\bnfor \bnfsk.$

However, restricting each production to one of these two forms can still introduce problems. Productions defining a portion of a language can be written in several different ways. This can introduce undesired ambiguity. To reduce this ambiguity, we identified and removed five sources of ambiguity. The first is ambiguity introduced by spurious usage of the empty string. The second is ambiguity introduced by the associative properties of operators. The third is ambiguity introduced by the commutative property of the alternatives (`|`) operator. The fourth is ambiguity introduced by unit productions. The fifth source is ambiguity introduced by duplicate productions.

The first ambiguity just mentioned is spurious usage of the empty string. An example of this would be the rule $\bnfpn{A} \bnfpo \bnfpn{B} \bnfsp \bnfes \bnfsp \bnfts{b}.$ The empty string in the middle of the expression is unnecessary. These unnecessary empty strings are eliminated in Algorithm \ref{alg:simp_prod}.

The second source of ambiguity arises from the associative property of the concatenation and alternative operators. For example, productions $S_1$ and $S_2$ are equivalent in the following productions.

\begin{bnf*}
\bnfprod{$S_1$}{\bnfts{a} \bnfsp \bnfpn{B}} \\
\bnfprod{B}{\bnfts{b} \bnfsp \bnfts{c}} \\
\bnfprod{$S_2$}{\bnfpn{A} \bnfsp \bnfts{c}} \\
\bnfprod{A}{\bnfts{a} \bnfsp \bnfts{b}}
\end{bnf*}

\noindent To remove this source of ambiguity, we can further qualify $\textit{Form}_1$ and $\textit{Form}_2.$ Namely, we add the constraint that a production cannot use non-terminal symbols that are the same form. Algorithm \ref{alg:coll_prod} of the normalization process details how this is accomplished.

The commutative property of the alternative operator causes the third source of ambiguity. For example, the following two productions are identical, but are represented differently:

\begin{bnf*}
\bnfprod{A}{\bnfts{a} \bnfor \bnfts{b} \bnfor \bnfts{c}} \\
\bnfprod{A}{\bnfts{c} \bnfor \bnfts{b} \bnfor \bnfts{a}}
\end{bnf*}

\noindent We considered two different approaches to removing this ambiguity. The first approach involved lexicographically ordering the terms. This is unwieldy because it is difficult to define a lexicographic ordering. Instead, we adjusted our domain object model to use a set container for the terms. This eliminated the problem by removing the ordering from our representation.

The fourth source of ambiguity is the use of unit productions. A unit production is a production where the right hand side is a single symbol. Here is an example:

\begin{bnf*}
\bnfprod{A}{\bnfpn{B}} \\
\bnfprod{B}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}}
\end{bnf*}

\noindent In almost all cases, this is better represented by removing the unit production. The one exception is when the start symbol directly produces a single terminal symbol. Removal of unit productions is simple and is performed in Algorithm \ref{alg:elim_unit_prod}.

The fifth and last source of ambiguity is ambiguity introduced by duplicate productions. Here is an example production that can be simplified significantly by removing duplicate productions:

\begin{bnf*}
\bnfprod{A}{\bnfpn{B} \bnfor \bnfpn{C}} \\
\bnfprod{B}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}} \\
\bnfprod{C}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}}
\end{bnf*}

\noindent Detection and removal of duplicate productions is detailed in algorithm \ref{alg:merge_equiv_prod} of the normalization process.

Aggregating all chosen design choices, the properties of the normalized grammar are as follows. First, each production is one of the two following forms:

\textmd{$\textit{Form}_1$}

:   The rule of the production only uses the concatenation operator to concatenate symbols. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfsp \bnftd{b} \bnfsp \bnfsk.$

\textmd{$\textit{Form}_2$}

:   The rule of the production only uses the alternation (`|`) operator to combine symbols or the empty string. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfor \bnftd{b} \bnfor \bnfes \bnfor \bnfsk.$

Second, each symbol in a rule cannot have the same form as that rule. Third, unit rules are not permitted except for the case of the start symbol producing a single terminal symbol. Fourth, no pair of productions can have identical right-hand sides.