\section{Normalization Algorithm}\label{sec:norm_alg}

The following algorithm defines the approach for normalizing a given grammar. The normalization process defined here facilitates the ability to merge productions, in pursuit of the overarching goal of automated generation of Island [X], Tolerant [X], Bridge [X], and Bounded Seas [X] grammars.

This algorithm assumes that the source grammar, $G$, was initially in some defined formalism such as Antlr [X], EBNF [X], BNF [X], SDF [X], TXL [X], etc. The grammar was then read in and processed to conform to the metamodel depicted in Figure \ref{fig:metamodel}. Assuming that the grammar meets this condition, the goal of this algorithm is then to reformat the grammar such that each production is of one of $\textrm{Form}_1$ or $\textrm{Form}_2$

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
  \EndProcedure
 \end{algorithmic}
\end{algorithm}

The normalization process, as defined in Algorithm \ref{alg:norm}, repeatedly executes six processes until the grammar stabilizes. These six processes are: i) eliminating unused rules, ii) simplifying productions, iii) merging equivalent rules, iv) eliminating unit rules, v) expanding productions, and vi) collapsing compatible productions.

\subsection{Eliminating Unused Rules}

This process removes all productions that are not produced, directly or indirectly, from the start production. This is accomplished by enumerating all symbols producuable from the start symbol via a depth first search (see Algorithm \ref{alg:dfsmark}) and then creating a new grammar using only the enumerated symbols, as shown in Algorithm \ref{alg:elim_unused_prod}.

\begin{algorithm}[tb]
\caption{Eliminate Unused Productions}\label{alg:elim_unused_prod}
 \begin{algorithmic}[1]
  \Function{EliminateUnusedProductions}{$\mathcal{G}$}
    \State $H \gets (V,E)$ \LineComment Create empty graph
    \ForAll{$v \in \mathcal{G}.V$}
      \State $\mathcal{H}.V \gets \mathcal{H}.V \cup \{v\}$
      \State \Call{AddRuleToGraph}{$\mathcal{G},\mathcal{H}, \mathcal{G}.P(v)$}
      \State $\mathcal{H}.E \gets \mathcal{H}.E \cup \{(v, \mathcal{G}.P(v))\}$
    \EndFor
    \State \Call{DFSMark}{$\mathcal{G}.S$}
      \State $\mathcal{G}.V \gets \{\,v \in \mathcal{G}.V \mid \Call{marked}{v}\,\}$
      \State $\mathcal{G}.P \gets \{\,(v, \mathcal{G}.P(v)) \mid v \in \mathcal{G}.V \,\}$
  \EndFunction
  \Function{AddRuleToGraph}{$\mathcal{G},\mathcal{H}, r$}
    \State $\mathcal{H}.V \gets \mathcal{H}.V \cup \{r\}$
    \If{\Call{IsOperator}{$r$}}
      \ForAll{$c \in \Call{operands}{r}$}
        \State \Call{AddRuleToGraph}{$\mathcal{G},\mathcal{H}, c$}
        \State $\mathcal{H}.E \gets \mathcal{H}.E \cup \{(r,c)\}$
      \EndFor
    \EndIf
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\begin{algorithm}[tb]
\caption{Depth First Marking}\label{alg:dfsmark}
 \begin{algorithmic}[1]
  \Function{DFSMark}{$start$}
    \State $\mathcal{S} \gets [start]$
    \While{$\mathcal{S} \ne \varnothing$}
      \State $p \gets$ \Call{pop}{$\mathcal{S}$}
      \State \Call{Mark}{$p$}
      \ForAll{$s \in $\Call{succ}{$p$}}
        \If{$!$\Call{isMarked}{$s$}}
          \State \Call{push}{$\mathcal{S},s$}
        \EndIf
      \EndFor
    \EndWhile
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\subsection{Simplifying Productions}

This process aims to simplify productions. This is achieved by removing unnecessary $\varepsilon$'s concatenated with other rules and replacing operators with only one operand with their operator. This process is embodied in Algorithm \ref{alg:simp_prod}.

\begin{algorithm}[tb]
\caption{Simplify Productions}\label{alg:simp_prod}
 \begin{algorithmic}[1]
  \Function{SimplifyProductions}{$\mathcal{G}$}
    \ForAll{$v \in \mathcal{G}.V$}
      \State $\mathcal{G}.P(v) \gets \Call{SimplifyRule}{\mathcal{G}.P(v)}$
    \EndFor
  \EndFunction
  \Function{SimplifyRule}{$r$}
    \LineComment Replace empty terminal string with $\epsilon$
    \If{$\Call{IsTerminal}{r} \land \Call{IsEmpty}{r}$}
      \State \textbf{return} $\epsilon$
    \EndIf
    \If{$\Call{IsOperator}{r}$}
      \State \textbf{let} $C$ be \Call{Children}{$r$}
      \State $C \gets \{\,\Call{SimplifyRule}{c} \mid c \in C\,\}$
      \If{$\Call{IsConcatenate}{r}$}
        \State $C \gets \{\,c \in C \mid c \neq \epsilon \,\}$
        \If{$|C| = 0$}
          \State \textbf{return} $\epsilon$
        \EndIf
      \EndIf
      \If{$\Call{IsConcatenate}{r}\lor\Call{IsUnion}{r}$}
        \LineComment Replace operators with single operand with operand
        \If{$|C| = 1$}
          \State \textbf{let} $\{c\}$ be $C$
          \State \textbf{return} $c$
        \Else
          \State \textbf{return} $r$
        \EndIf
      \EndIf
    \EndIf
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\subsection{Merging Equivalent Productions}

Productions that have identical rules are replaced by a single production. This new production is given a name derived from the productions that were merged to create it. The algorithm for this is shown in Alg. \ref{alg:merge_equiv_prod}.

\begin{algorithm}[tb]
\caption{Merge Equivalent Productions}\label{alg:merge_equiv_prod}
 \begin{algorithmic}[1]
  \Function{MergeEquivProductions}{$\mathcal{G}$}
    \State $pairs \gets \varnothing$
    \For{$i \in [0,|\mathcal{G}.\Sigma|)$}
      \For{$j \in (i, |\mathcal{G}.\Sigma|)$}
        \If{$i \ne j$}
          \State $pairs \gets pairs \cup (\mathcal{G}.\Sigma[i], \mathcal{G}.\Sigma[j])$
        \EndIf
      \EndFor
    \EndFor
    \ForAll{$p \in pairs$}
      \If{$p.left.rule = p.right.rule$}
        \State \Call{CombineAndReplace}{$p.left,p.right$}
      \EndIf
    \EndFor
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\subsection{Eliminating Unit Productions}

All non-terminals with productions of one of the following two forms will have their non-terminal symbols replaced by their rules, and their productions eliminated.

\begin{bnf*}
\bnfprod{a}{\bnfpn{b}}\\
\bnfprod{a}{\bnfts{a}}
\end{bnf*}

\noindent Elimination of productions of the first form, is derived from Chomsky Normal Form (CNF) [X]. Eliminations of productions of the second form, a derivation from CNF, allows the simplification process to simplify rules of the following form:

\begin{bnf*}
\bnfprod{a}{\bnfpn{b} \bnfsp \bnfts{a} \bnfsp \bnfts{b}}\\
\bnfprod{b}{\bnfes}
\end{bnf*}


\begin{algorithm}[tb]
\caption{Eliminate Unit Productions}\label{alg:elim_unit_prod}
 \begin{algorithmic}[1]
  \Function{EliminateUnitProductions}{$\mathcal{G}$}
    \ForAll{$p \in \mathcal{G}.\Sigma$}
      \If{$|p.rule| = 1$}
        \State \Call{replace}{$uses(p),p.rule$}
      \EndIf
    \EndFor
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\subsection{Expanding Productions}

Productions that have nested rules have all nested content replaced by with a non-terminal. The new non-terminal defines a production pointing to their content.

\begin{algorithm}[tb]
\caption{Expand Productions}\label{alg:expand_prod}
 \begin{algorithmic}[1]
  \Function{ExpandProductions}{$\mathcal{G}$}
    \Repeat
      \State $changed \gets \bot$
      \ForAll{$p \in \mathcal{G}.\Sigma$}
        \If{\Call{isConcat}{$p.rule$}}
          \ForAll{$g \in p.rule$}
            \If{\Call{isGroup}{$g$}}
              \State \Call{createAndReplaceWithProd}{$g$}
              \State $changed \gets \top$
            \EndIf
          \EndFor
        \ElsIf{\Call{isAlt}{$p.rule$}}
          \ForAll{$a \in p.rule$}
            \State \Call{createAndReplaceWithProd}{$a$}
            \State $changed \gets \top$
          \EndFor
        \EndIf
      \EndFor
    \Until{$changed = \bot$}
  \EndFunction
 \end{algorithmic}
\end{algorithm}

\subsection{Collapsing Compatible Productions}

The final step of the normalization process combines productions that are associative with each other. This ensures that any non-terminal symbols referenced by a rule will not define a duplicate production. The following provides an example:

\begin{bnf*}
\bnfprod{A}{\bnfts{a} \bnfsp \bnfpn{B}}\\
\bnfprod{B}{\bnfts{b} \bnfsp \bnfts{c}}\\
\bnfprod{C}{\bnfts{c} \bnfor \bnfpn{D}}\\
\bnfprod{D}{\bnfts{d} \bnfor \bnfts{e}}
\end{bnf*}

\noindent would then collapse to form:

\begin{bnf*}
\bnfprod{A}{\bnfts{a} \bnfsp \bnfts{b} \bnfsp \bnfts{c}}\\
\bnfprod{C}{\bnfts{c} \bnfor \bnfts{d} \bnfor \bnfts{e}}
\end{bnf*}



\begin{algorithm}[tb]
\caption{Collapse Productions}\label{alg:coll_prod}
 \begin{algorithmic}[1]
  \Function{CollapseProductions}{$\mathcal{G}$}
    \LineComment Split productions into form1 and form2
    \State $f_1 \gets$ \Call{Collect}{``form1''}
    \State $f_2 \gets$ \Call{Collect}{``form2''}
    \ForAll{$p \in f_1$}
      \If{\Call{OnlyTerminals}{$p.rule$}}
        \State \Call{ReplaceF1UsesWithRule}{$p$}
      \EndIf
    \EndFor
    \ForAll{$p \in f_2$}
      \If{\Call{OnlyTerminals}{$p.rule$}}
        \State \Call{ReplaceF2UseWithRule}{$p$}
      \EndIf
    \EndFor
  \EndFunction
 \end{algorithmic}

\end{algorithm}

