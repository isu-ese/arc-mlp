## Normalization Foundations

The constraints were chosen through the identification and resolution of five different issues. These problems revolved around equivalent ways of writing rules that make it difficult for a merging procedure to detect and then combine similar productions across grammars.

\begin{algorithm}[tb]
\caption{Simplify Productions}\label{alg:simp_prod}
 \begin{algorithmic}[1]
  \Function{SimplifyProductions}{$G$}
    \ForAll{$\mathcal{o} \in \Call{OperatorNodes}{G}$}
      \If{$\Call{IsConcatOperator}{\mathcal{o}}$}
        \ForAll{\{$p \in \Call{Operands}{\mathcal{o}} \mid p = \epsilon$\}}
          \State \Call{RemoveOperand}{$p$}
        \EndFor
      \EndIf
    \EndFor
    \State \textbf{return} $G$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

The first issue is spurious usage of the empty string. An example of this would be the production $\bnfpn{A} \bnfpo \bnfpn{B} \bnfsp \bnfes \bnfsp \bnfts{b}.$ The empty string in the middle of the expression is unnecessary. These unnecessary empty strings are eliminated in Algorithm \ref{alg:simp_prod}.

The second problem arises from the associative property of the concatenation and alternation operators. For example, productions $S_1$ and $S_2$ are equivalent in the following productions.

\begin{bnf*}
\bnfprod{$S_1$}{\bnfts{a} \bnfsp \bnfpn{B}} \\
\bnfprod{B}{\bnfts{b} \bnfsp \bnfts{c}} \\
\bnfprod{$S_2$}{\bnfpn{A} \bnfsp \bnfts{c}} \\
\bnfprod{A}{\bnfts{a} \bnfsp \bnfts{b}}
\end{bnf*}

\begin{algorithm}[tb]
\caption{Collapse Productions}\label{alg:coll_prod}
 \begin{algorithmic}[1]
  \Function{CollapseProductions}{$G$}
    \ForAll{$( p_1, p_2 ) \in \Call{OrderedPairs}{G.P}$}
      \State{$\mathcal{o}_1 \gets \Call{RootOperator}{p_1}$}
      \State{$\phi_2 \gets \Call{Symbol}{p_2}$}
      \If{$\phi_2 \in \Call{Children}{\mathcal{o}_1}$}
        \State{$\mathcal{o}_2 \gets \Call{RootOperator}{p_2}$}
        \If{$\Call{Associative}{\mathcal{o}_1, \mathcal{o}_2}$}
          \State $\mathcal{o}_1.\Call{ReplaceChild}{\phi_2, \Call{Children}{\mathcal{o}_2}}$
        \EndIf
      \EndIf
    \EndFor
    \State \textbf{return} $G$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\noindent To address this, we added the constraint that a production cannot use non-terminal symbols that are the same form. Algorithm \ref{alg:coll_prod} of the normalization process transforms each grammar to meet this constraint.

The commutative property of the alternative operator causes the third problem. For example, the following two productions are identical, but are represented differently:

\begin{bnf*}
\bnfprod{A}{\bnfts{a} \bnfor \bnfts{b} \bnfor \bnfts{c}} \\
\bnfprod{A}{\bnfts{c} \bnfor \bnfts{b} \bnfor \bnfts{a}}
\end{bnf*}

\noindent We considered two different approaches to removing this ambiguity. The first approach involved lexicographically ordering the terms. This is unwieldy because it is difficult to define a lexicographic ordering. Instead, we adjusted our domain object model to use a set container for the terms. This eliminated the problem by removing the ordering from our representation.

\begin{algorithm}[tb]
\caption{Eliminate Unit Productions}\label{alg:elim_unit_prod}
 \begin{algorithmic}[1]
  \Function{EliminateUnitProductions}{$G$}
    \ForAll{$p \in \mathcal{G}.V \setminus \{ G.S \}$}
      \If{$\Call{IsSymbol}{\Call{Rule}{p}}$}
        \State \Call{ReplaceUses}{$p, \Call{Rule}{p}$}
      \EndIf
    \EndFor
    \If{$\Call{IsNonTerminalSymbol}{\Call{Rule}{G.S}}$}
      \State \Call{ReplaceUses}{$G.S, \Call{Rule}{G.S}$}
    \EndIf
    \State \textbf{return} $G$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

The fourth issue is the use of unit productions. A unit production is a production where the right hand side is a single symbol. Here is an example:

\begin{bnf*}
\bnfprod{A}{\bnfpn{B}} \\
\bnfprod{B}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}}
\end{bnf*}


\noindent In almost all cases, this is better represented by removing the unit production. The one exception is when the start symbol directly produces a single terminal symbol. Removal of unit productions is performed in Algorithm \ref{alg:elim_unit_prod}.


\begin{algorithm}[tb]
\caption{Merge Equivalent Productions}\label{alg:merge_equiv_prod}
 \begin{algorithmic}[1]
  \Function{MergeEquivProductions}{$G$}
    \ForAll{$\{ p_1, p_2 \} \in \Call{UnorderedPairs}{G.P}$}
      \If{$\Call{Rule}{p_1} = \Call{Rule}{p_2}$}
        \State $\rho \gets \Call{CombineSymbols}{p_1, p_2}$
        \State $G.\Call{ReplaceUses}{p_1, \rho}$
        \State $G.\Call{ReplaceUses}{p_2, \rho}$
      \EndIf
    \EndFor
    \State \textbf{return} $G$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

The fifth and last issue is caused by duplicate productions. Duplicate productions result in multiple symbols producing the same rule. Replacing these multiple symbols with the same symbol can enable other simplifications. In the following example $\bnfpn{A}$'s production can be reduced to a unit rule by replacing the symbols $\bnfpn{B}$ and $\bnfpn{C}$ with a single symbol:

\begin{bnf*}
\bnfprod{A}{\bnfpn{B} \bnfor \bnfpn{C}} \\
\bnfprod{B}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}} \\
\bnfprod{C}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}}
\end{bnf*}

\noindent Because of this, we add the condition that normalized grammars cannot have two different symbols that produce the same expression. Detection and removal of duplicate productions is detailed in algorithm \ref{alg:merge_equiv_prod} of the normalization process.