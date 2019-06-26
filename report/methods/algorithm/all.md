## Algorithm

We focus on an island grammar based approach to merging grammars.
First, we detect portions of the grammars that are structurally similar to each other.
We then extract the constructs in the grammars that differ from each other. These constructs
of interest are our islands. The similar parts are our water. We can then merge our
water and islands together to produce an island grammar describing both grammars.

Detecting parts of the grammars that are similar to each other is a difficult problem.
If we model our grammars as graphs, our problem is equivalent to the problem
of identifying maximal equivalent subgraphs shared between the graphs representing each
grammar. If we limit ourselves to two grammars being combined, this is the Maximum
Common Subgraph (MCS) problem. In the case of multiple grammars, this becomes the Maximal
Frequent Subgraph problem. In this paper, we focus on only combining two grammars at a
time.

In order to use algorithms for MCS on our grammars, we have to convert them into a graph
form. The details for converting them to a graph form, extracting the MCS, and then
merging the grammars is detailed in the following sections.

### Graph Representation

In order to represent our grammar as a graph, we have to represent the symbols and
productions and the relationships between them with vertices and edges. Our goal
is to create a mapping where the maximum common subgraph between two graphs extracts
compatible parts of a grammar out. We decided to evaluate approaches where each symbol and production is mapped to a labeled vertex and the relationships between symbols and productions are
expressed as labeled edges. We came up with two different ways to express
symbols and productions as nodes and three different ways to express the relationships
between them as edges.

There are two different ways to represent the symbols and productions of a graph
as vertices in both cases, each symbol and production is represented by a node.
But what differs is the introduction of a forwarding node for when non-terminal
symbols are used in a production. You can see an example of each for the simple grammar

~~~
S = "" | "a" S | "b" S
~~~

in [@fig:symbol_representation]. The advantages of using forwarding nodes is that
it prevents problems from relationships between terms in different productions getting mixed up
with each other. The disadvantage is that the extraction algorithm might decide
to not equate two forwarding nodes as equal while equating the productions they
point to as equal. This could complicate the merging process.

!figures(symbol_representation)(Two different ways of representing non-terminal symbols in terms.)(!include(symbol_representation_figure.md))


The three different ways to express the relationships differ only on how to express
the terms in productions. The order of these terms is important, so we can't
simple leave unlabeled edges between a production and each term in it. This could
allow our algorithm to match content that is ordered differently. To prevent this,
we have come up with three different ways to express the terms in a production.

The first approach that we are evaluating is to simply label the edges between
productions and their terms with a number to indicate its order. An example of this
using the two productions `"a" "b" "c" "d" "e"` and `"a" "c" "d" "e" "b"` is in
[@fig:index_children]. While this representation is simple and does make
sure that order of terms is preserved in a matching, it does have flaws. The biggest
is that this only matches terms that are in the same position of a production.
If the difference between two productions is a single leading term, this will cause
none of the terms to match. This can lead to confusing matchings where far better
matchings might be apparent.

!figures(index_children)(
  Simple method of representing terms of a production.
  The maximum common subgraph of these two productions is highlighted in blue.
)(!include(index_children_figure.md))

The second method is to link the children of a production with a linked list.
An example of this using the same grammars as before is in [@fig:linked_list_children].
This method allows terms of productions to be matched with each other regardless of position.
But, it does't work well with runs of terms that are shared between productions with holes
in them, such as the run `"a" "c" "d" "e"` in [@fig:linked_list_children]. Finally,
different runs can match even if they're in different orders. We predict
that allowing these different runs to match even in different orders will have a negative
affect on the ability of the merged grammar.

!figures(linked_list_children)(Linking children together with a linked list.)(!include(linked_list_figure.md))

A third approach that we are evaluating is to fully connect the terms in a production.
This will allow runs of terms with holes to match with each other. An example of this is in [@fig:fully_connected]. It will also not allow
runs to be reordered as in the previous method. The problems with this method is that the addition
of extra edges might increase the running time of our algorithms. 
Overall we predict this to be the most effective method.

!figures(fully_connected)(Fully connecting terms of a production.)(!include(fully_connected_figure.md))

### Graph Labels

To make sure only the right kinds of nodes and relationships are merged with each other,
each type of node and relationship will recieve it's own label. In addition, terminal
nodes are all labeled with the letter of their alphabet. An example graph for the
following grammar is in [@fig:labeled_grammar_graph].

!latex
~~~~~~~~~~~~~~~~~~~~~
\begin{grammar}
<S> ::= <N> | <N> <O> <S>

<O> ::= `+' | `-'

<N> ::= `0' | <D1> <D2>

<D1> ::= `1' | `2' | `3' | `4' | `5' | `6' | `7' | `8' | `9'

<N1> ::= $\varepsilon$ | <D2> <N1>

<D2> ::= `0' | <D1>
\end{grammar}
~~~~~~~~~~~~~~~~~~~~~

!dot(img/labeled_grammar_graph.gen.pdf {#fig:labeled_grammar_graph})(
    Labeled grammar. Each color is its own label. Yellow
    nodes are non-terminal symbols. Red nodes represent productions. Purple nodes represent forwarding nodes. The varying shades
    of turquoise nodes are terminal symbols. Note that we are using forwarding nodes and linking terms of productions
    with a linked list in this graph.
)(!include(labeled_grammar_figure.dot))


### Maximum Common Subgraph Algorithm

We want the similar parts identified to have a number of properties.
First of all, we want the symbols to form a skeleton grammar in respect
to both grammars being merged. A skeleton
grammar is a grammar where all symbols and productions

There are several different variations of the maximum common
subgraph problem and the algorithms used to solve it. The main algorithms to do
this can be classified into two categories. The first category relies on
combinatorial expansion while the second relies on reduction to the maximal clique problem.
Academic research on these methods has produced mixed evaluations on which category
of algorithms are more efficient [@bunkeComparisonAlgorithmsMaximum2002; @conteComparisonThreeMaximum2003; @wellingPerformanceAnalysisMaximal2011]. The most recent research [@wellingPerformanceAnalysisMaximal2011]
indicates that Koch's [@kochEnumeratingAllConnected2001] algorithms are the most efficient.
Because of this, we chose to use Koch's algorithm [@kochEnumeratingAllConnected2001].

Koch's algorithm by itself isn't quite what we need. Namely, it doesn't immediately work
for directed graphs. In addition, we wish for it to ensure that the start nodes
of two grammars are equated. These two changes are simple enough to make. To allow it
to work for directed graphs, we can modify the definition of c-edges (connected edge) and d-edges
(disconnected edge) [@kochEnumeratingAllConnected2001, p. 14] to the following.

Definition (c-edge): Let \((e_1,e_2)\) and \((f_1, f_2)\) be two edge pairs of
two graphs \(G_1\) and \(G_2\) . An edge of the modular product graph \(G\) between the vertices \((e_1, e_2)\)
and \((f_1, f_2)\) is called a c-edge if there is a directed edge from \(e_1\) to \(f_1\) in \(G_1\) or there is
a directed edge from \(e_2\) to \(f_2\) in \(G_2\), otherwise the edge is called a d-edge.

The change ensuring that the start symbols are equated is even simpler. Koch's algorithm
begins with an initialization routine [@kochEnumeratingAllConnected2001, p. 16] that
iterates over every pair of nodes to initially equate. We can easily modify this initialization
routine by only considering the start case where the start symbols are equated.



### Grammar Merging

Using Koch's algorithm, we can extract out a maximum common subgraph between the symbols in
the two grammars. Using this mapping, we can merge two graphs together by first mapping
the symbols and productions from the second grammar to their equivalents in the first grammar. Then
we can simply append the symbols and productions of the second grammar to the first grammar.
This procedure is detailed in [alg. @alg:merge_grammar].

!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}
\caption{Algorithm describing the procedure for merging grammars.}\label{alg:merge_grammar}
\begin{algorithmic}[1]
\LineComment{$G_1$ and $G_2$ are the grammars to be merged.}
\LineComment{$M \subseteq V(G_1) \times V(G_2)$ maps similar symbols between $G_1$ and $G_2$.
Symbols from either grammar map to at most one symbol in the other grammar.}
\Procedure{MergeGrammars}{$G_1, G_2, M$}
  \State $V_m \gets V(G_1)$
  \ForAll{$v \in V(G_2)$}
    \State $V_m \gets V_m \cup \{\Call{MapSymbol}{v}\}$
  \EndFor
  \State $P_m \gets P(G_1)$
  \ForAll{$p \in P(G_2)$}
    \State Let $p$ be the production $p_0 \rightarrow p_1p_2...p_n$
    \State Let $p_{m_i}$ be \Call{MapSymbol}{$p_i$}
    \State $p_m \gets (p_{m_0} \rightarrow p_{m_1}p_{m_2}...p_{m_n})$
    \State $P_m \gets P_m \cup \{p_m\}$
  \EndFor
  \LineComment{$\Sigma$ should be the same in $G_1$ and $G_2$.}
  \LineComment{$S_2$ should always map to $S_1$.}
  \State $G_m = (V_m, \Sigma, P_m, S_1)$
  \State \textbf{return} $G_m$
\EndProcedure
\Statex
\LineComment{Maps $v_2 \in V(G_2) \cup \Sigma$ to the equivalent symbol in $G_1$ unless
$v_2$ doesn't have an equivalent.}
\Procedure{MapSymbol}{$M, v_2$}
  \If{$\exists v_1: (v_1, v_2) \in M$}
    \State \textbf{return} $v_1$
  \Else
    \State \textbf{return} $v_2$
  \EndIf
\EndProcedure
\end{algorithmic}
\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~