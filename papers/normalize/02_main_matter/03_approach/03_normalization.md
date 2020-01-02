## Normalization Algorithm {#sec:norm_alg}

Algorithm \ref{alg:norm} defines the approach for normalizing grammars.  A grammar representing using our meta-model is the algorithm's input. The algorithm's output is a grammar which is equivalent to the input grammar and also has the properties enumerated in our design process.

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

The first process removes all productions that are not produced, directly or indirectly, from the start production. This is accomplished by enumerating all symbols producible from the start symbol via a depth first search and then creating a new grammar using only the enumerated symbols as shown in Algorithm \ref{alg:elim_unused_prod}.


The second process simplifies productions by removing unnecessary empty strings ($\varepsilon$). These are those that are operands of the concatenation operator. This process is incarnate in Algorithm \ref{alg:simp_prod}.


The third process replaces productions that have identical rules with a single production. The algorithm for this is shown in Algorithm \ref{alg:merge_equiv_prod}. The process replaces symbols by scanning the entire grammar and then replacing each old symbol with the new symbol. How the new symbol's name is constructed affects only the readability of the resulting grammar. In our implementation, the names of the old productions are concatenated.


The fourth process removes all unit productions unless the production is the start symbol producing a single non-terminal. To do this, it first identifies unit productions. It then replaces symbols on the left of each production with their right-hand symbols. Algorithm \ref{alg:elim_unit_prod} describes this process.

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
