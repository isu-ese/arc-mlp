## Normalization Algorithm {#sec:norm_alg}

The following algorithm defines the approach for normalizing grammars.  A grammar representing using our meta-model is the algorithm's input. The algorithm's output is a grammar which is equivalent to the input grammar and also has the properties enumerated in our design process.

\begin{algorithm}[tb]
 \caption{Normalization Algorithm}\label{alg:norm}
 \begin{algorithmic}[1]
  \Procedure{Normalize}{$\mathcal{G}$}
   \Repeat
     \State $\mathcal{G} \gets$ \Call{EliminateUnusedProductions}{$\mathcal{G}$}
     \State $\mathcal{G} \gets$ \Call{SimplifyProductions}{$\mathcal{G}$}
     \State $\mathcal{G} \gets$ \Call{MergeEquivProductions}{$\mathcal{G}$}
     \State $\mathcal{G} \gets$ \Call{EliminateUnitProductions}{$\mathcal{G}$}
     \State $\mathcal{G} \gets$ \Call{ExpandProductions}{$\mathcal{G}$}
     \State $\mathcal{G} \gets$ \Call{CollapseProductions}{$\mathcal{G}$}
   \Until{\Call{Unchanged}{$\mathcal{G}$}}
   \State \textbf{return} $\mathcal{G}$
  \EndProcedure
 \end{algorithmic}
\end{algorithm}

The normalization process, as defined in Algorithm \ref{alg:norm}, repeatedly executes six steps until the grammar stabilizes. These six processes are: i) eliminating unused rules, ii) simplifying productions, iii) merging equivalent rules, iv) eliminating unit rules, v) expanding productions, and vi) collapsing compatible productions.

The first process removes all productions that are not produced, directly or indirectly, from the start production. This is accomplished by enumerating all symbols producible from the start symbol via a depth first search and then creating a new grammar using only the enumerated symbols as shown in Algorithm \ref{alg:elim_unused_prod}.

\begin{algorithm}[tb]
 \caption{Eliminate Unused Productions}\label{alg:elim_unused_prod}
 \begin{algorithmic}[1]
  \Function{EliminateUnusedProductions}{$G$}
    \State $W \gets G.V \cap \Call{DepthFirstSearchFrom}{G.S}$
    \State $Q \gets \{ (w, G.P(w)) \mid w \in W \}$
    \State $H \gets (W,G.\Sigma, Q, G.S)$
    \State \textbf{return} $H$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

The second process simplifies productions by removing unnecessary empty strings ($\varepsilon$). These are those that are operands of the concatenation operator. This process is incarnate in Algorithm \ref{alg:simp_prod}.

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

The third process removes replaces productions that have identical rules with a single production. The algorithm for this is shown in Algorithm \ref{alg:merge_equiv_prod}. The process replaces symbols by scanning the entire grammar and then replacing each old symbol with the new symbol. How the new symbol's name is constructed affects only the readability of the resulting grammar. In our implementation, the names of the old productions are concatenated.

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

The fourth process removes all unit productions unless the production is the start symbol producing a single non-terminal. To do this, it first identifies unit productions. It then replaces symbols on the left of each production with their right-hand symbols. Algorithm \ref{alg:elim_unit_prod} describes this process.

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

The fifth process converts each production to one of Form 1 or Form 2. Each non-root operator node of the expression tree of the rule is pulled into a distinct production, as presented in Algorithm \ref{alg:expand_prod}.

\begin{algorithm}[tb]
\caption{Expand Productions}\label{alg:expand_prod}
 \begin{algorithmic}[1]
  \Function{ExpandProductions}{$G$}
    \ForAll{$p \in G.P$}
      \ForAll{$\mathcal{o} \in \Call{NonRootOpNodes}{\Call{Rule}{p}}$}
        \State $G.\Call{ReplaceWithNewRule}{\mathcal{o}}$
      \EndFor
    \EndFor
    \State \textbf{return} $G$
  \EndFunction
 \end{algorithmic}
\end{algorithm}

The sixth and final step of the normalization process combines associative operators. For BNF grammars, only the concatenation and alternation operators are associative. Algorithm \ref{alg:coll_prod} details this step.

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