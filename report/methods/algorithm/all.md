## Algorithm

Our algorithm merges two grammars to produce a grammar that approximates
both input grammars. This approximation relationship is described 
in [@klusenerDerivingTolerantGrammars2003]. [@klusenerDerivingTolerantGrammars2003]
describes a process by which one can approximate a base grammar using an
island grammar. Based off of this process, we can create a grammar
that approximates multiple grammars.EMCG

In [@klusenerDerivingTolerantGrammars2003], they derive their approximation
grammar by first starting with an island grammar, the base grammar of the
language the island grammar is extracting constructs of interest from,
and a partial mapping between the symbols in each of these grammars. They
then perform a process called root-completion which adds the productions
and symbols that are needed to reach the start symbol from the constructs of
interest. They then provide default values for non-terminals that are not completely
defined in the partial root-completed grammar.

Our approach is heavily inspired by this process. However, rather than
starting with an island grammar, we extract out an island grammar
from the input grammars. In this case, we wish to identify the different parts
of the input grammars as our island grammar.  We can identify the different parts
by first identifying the similar parts, or the water, of the input grammars.
We perform this process by starting with a minimal root-completed grammar of just
the start symbols of each grammar. We then iteratively increase its size until we
cannot increase its size anymore.

### Extracting Common Partial Grammars
 
For extracting the maximum common root-completed grammars, we first
start with a minimal root-completed grammar and then iteratively increase its
size. A minimal root-completed grammar can easily be formed by mapping the
start symbols of the input grammars. Increasing the size of the root-completed
grammar is a more difficult problem.

To ensure that the root-completed grammar stays root completed, we have
to make sure that if a symbol from the input grammar is in the root-completed
grammar, that all symbols that depend on it are also in the input grammar.
To maintain this property, we can only add symbols to our root-completed
grammar that already have this property. However, this would fail to consider
all possible root completed grammars. Namely, when a symbol indirectly depends
on itself, it and none of the symbols that depend on that can be added to the
root completed grammar. To resolve this issue, we can transform the dependency
graph of the input grammars into a strongly connected components graph. Instead of
adding one symbol at a time to our root-completed grammar, we'll add strongly
connected components one at a time. Since the strongly connected component graph
is acyclic, we won't run into the previous issue.

Because we're adding connected components, there can be multiple
ways that we can map these components to each other across the different input
grammars. We have to consider each possible way to ensure that we fully
explore the problem space.


!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}
\caption{Enumerates all maximal root-completed mappings between the symbols of $G_1$ and $G_2$.}
\begin{algorithmic}
    \Procedure{EMRCM-Init}{$G_1, G_2$}
        \LineComment Calculate the dependency graphs of $G_1$ and $G_2$.
        \State $H_1 \gets \{V(G_1), \{(v_1, v_2) \mid \exists a, b: v_1 \Rightarrow_{G_1} a v_2 b \}\}$
        \State $H_2 \gets \{V(G_2), \{(v_1, v_2) \mid \exists a, b: v_1 \Rightarrow_{G_2} a v_2 b\}\}$
        \State
        \State $C_1 \gets \Call{StronglyConnectedComponents}{H_1}$
        \State $C_2 \gets \Call{StronglyConnectedComponents}{H_2}$
        \State
        \LineComment Construct the initial root-completed mapping.
        \State let $c_1$ be an element of $C_1$ so that $S(G_1) \in c_1$
        \State let $c_2$ be an element of $C_2$ so that $S(G_2) \in c_2$
        \If{$|c_1| \neq |c_2|$}
            \State \textbf{return} \Comment{No valid initial mapping.}
        \EndIf
        \State $M \gets \{S(G_1) \rightarrow S(G_2)\}$
        \State $c_1' \gets c_1 \setminus \{S(G_1)\}$
        \State $c_2' \gets c_2 \setminus \{S(G_2)\}$
        \State $C_1' \gets C_1 \setminus \{c_1\}$
        \State $C_2' \gets C_2 \setminus \{c_2\}$
        \ForAll{$M' \in \Call{ACC}{G_1, G_2, M, c_1', c_2'}$}
            \State \textbf{yield all} \Call{EMRCM}{$G_1, G_2, M', C_1', C_2', \{c_1\}, \{c_2\}, \{\}, \{\}$}
        \EndFor
    \EndProcedure
\end{algorithmic}
\end{algorithm}

\begin{algorithm}
\caption{Enumerates all maximal root-completed mappings between the non-terminal symbols of $G_1$ and $G_2$.
}
\begin{algorithmic}
    \LineComment $M$: The current root-completed mapping
    \LineComment $C_1, C_2$: The connected components that haven't been added.
    \LineComment $D_1, D_2$: The connected components that have been added to $M$.
    \LineComment $T$: A set of pairs of components that have already been evaluated
    in a different subtree of the search space. We do not expand these nodes to
    ensure that we don't explore the same solution twice.
    \LineComment $U$: A subset of $T$ which can't be added to the current mapping. 
    \LineComment $Q(c)$: A function that returns the parent nodes of $c$ in one of the $H$ graphs. 
    \Procedure{EMRCM}{$G_1, G_2, M, C_1, C_2, D_1, D_2, T, U$}
        \State $T' \gets T$
        \State $U' \gets U$
        \State $S \gets \top$
        \ForAll{$c_1 \in C_1$}
        \If{$Q_1(c_1) \not\subseteq D_1$}
            \State \textbf{continue}
        \EndIf
        \ForAll{$c_2 \in C_2$}
            \If{$Q_2(c_2) \not\subseteq D_2 \lor |c_1| \neq |c_2|$}
                \State \textbf{continue}
            \EndIf
            \If{$S \land (c_1, c_2) \in T \setminus U$}
                \If{$|\Call{ACC}{ G_1, G_2}| > 0$}
                    \State $S \gets \bot$
                \Else
                    \State $U' \gets U' \cup \{(c_1, c_2)\}$
                \EndIf
            \ElsIf{$(c_1,c_2) \notin T$}
                \State $R \gets \top$
                \State $C_1' \gets C_1 \setminus \{c_1\}$
                \State $C_2' \gets C_2 \setminus \{c_2\}$
                \State $D_1' \gets D_1 \cup \{c_1\}$
                \State $D_2' \gets D_2 \cup \{c_2\}$
                \ForAll{$M' \in \Call{ACC}{G_1, G_2, M, c_1, c_2}$}
                    \State $R \gets \bot$
                    \State $S \gets \bot$
                    \State \textbf{yield all} \Call{EMRCM}{$G_1, G_2, M', C_1', C_2', D_1', D_2', T', U'$}
                \EndFor
                \State $T' \gets T' \cup \{(c_1, c_2)\}$
                \If{$R$}
                    \State $U' \gets U' \cup \{(c_1, c_2)\}$
                \EndIf
            \EndIf
        \EndFor
        \EndFor
        \If{$S$}
            \State \textbf{yield} $M$
        \EndIf
    \EndProcedure
\end{algorithmic}
\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}
\caption{Enumerates all possible ways of adding the symbols in the connected components $c_1$ and $c_2$ to $M$ in
such a way that $M$ remains a valid partial mapping from $G_1$ to $G_2$}
\begin{algorithmic}
    \Procedure{ACC}{$G_1, G_2, M, c_1, c_2$}
        \If{$|c_1|=|c_2|=0$}
            \State \textbf{yield} $M$
            \State \textbf{return}
        \EndIf
        \State let $u$ be a symbol from $c_1$.
        \ForAll{$v \in c_2$}
            \If{\Call{CanAdd}{$G_1, G_2, M, u, v$}}
                \State \textbf{yield all} \Call{ACC}{$G_1, G_2, M \cup \{u\rightarrow v\}, c_1 \setminus v_1, c_2 \setminus v_2$}
            \EndIf
        \EndFor
    \EndProcedure
\end{algorithmic}
\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}
\caption{Determines if the specified symbols can be added to the mapping. Basically checks that the set of productions using $v_1$ and $v_2$ are equivalent. In this part, we apply $M$ to productions in addition to symbols. We use this to denote mapping every symbol in the production via $M$. If a symbol doesn't have a mapping in $M$, we remove that symbol from the term.}
\begin{algorithmic}
    \Procedure{CanAdd}{$G_1, G_2, M, v_1, v_2$}
        \State $M' \gets M \cup (v_1 \rightarrow v_2)$
        \State $P_1' \gets \{p \mid p \in P(G_1) \land M'(p_0) \neq \varnothing \land \exists p_i:p_i = v_1\}$
        \State $P_2' \gets \{p \mid p \in P(G_2) \land M'^{-1}(p_0) \neq \varnothing \land \exists p_i:p_i=v_2\}$
        \State \textbf{return} $M'(P_1') = M'(M'^{-1}(P_2'))$
    \EndProcedure
\end{algorithmic}
\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



### Grammar Merging

Using the mapping created above, we can merge two graphs together by first mapping
the symbols and productions from the second grammar to their equivalents in the first grammar. Then
we can simply append the symbols and productions of the second grammar to the first grammar.
This procedure is detailed in alg. \ref{alg:merge_grammar}.

!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}
\caption{Algorithm describing the procedure for merging grammars.}\label{alg:merge_grammar}
\begin{algorithmic}[1]
\LineComment{$G_1$ and $G_2$ are the grammars to be merged.}
\LineComment{$M: V(G_1) \rightarrow V(G_2)$ maps similar symbols between $G_1$ and $G_2$.
Symbols from either grammar map to at most one symbol in the other grammar.}
\LineComment{\textsc{MapProd} is a function that maps every symbol in the production
through \textsc{MapSymbol}. It is ommitted for brevity.}
\Procedure{MergeGrammars}{$G_1, G_2, M$}
  \State $V_m \gets V(G_1) \cup \{\Call{MapSymbol}{v} \mid v \in V(G_2)\}$
  \State $P_m \gets P(G_1) \cup \{\Call{MapProd}{p} \mid p \in P(G_1)\}$
  \LineComment{$\Sigma$ should be the same in $G_1$ and $G_2$.}
  \LineComment{$S_2$ should always map to $S_1$.}
  \State $G_m = (V_m, \Sigma, P_m, S_1)$
  \State \textbf{return} $G_m$
\EndProcedure
\Statex
\LineComment{Maps $v_1 \in V(G_1) \cup \Sigma$ to the equivalent symbol in $G_2$ unless
$v_1$ doesn't have an equivalent.}
\Procedure{MapSymbol}{$M, v_1$}
  \If{$M(v_1) \neq \varnothing $}
    \State \textbf{return} $M(v_1)$
  \Else
    \State \textbf{return} $v_1$
  \EndIf
\EndProcedure
\end{algorithmic}
\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~