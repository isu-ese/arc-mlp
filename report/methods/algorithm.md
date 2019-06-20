## Algorithm

Our goal is to find a way to calculate a merged grammar \(G_m\) from two grammars \( G_1 \) and \(G_2\). We wish for it to be as compatible as possible with tools that use \(G_1\) and to be able to process all sentences that are valid for both \(G_1\) and \(G_2\). To better express this, we created the following desired properties.

We focus on an approach for combining grammars that follows two steps. First, we extract out
a skeleton grammar [@klusenerDerivingTolerantGrammars2003] containing the equivalent portions of both grammars. Then
we merge the grammars on the skeleton grammar. To do the extraction process,
we can use data mining algorithms for the maximum common subgraph problem
if the grammars are first converted to a graph representation. There are many different ways
to represent a grammar as a graph. We focus on representations where each symbol and each
production in a grammar is represented by a node in the graph. Edges represent relationships
between the productions and symbols and are directed.

### Maximum Common Subgraph Algorithm

There are several different variations of the maximum common
subgraph problem and the algorithms used to solve it. The main algorithms to do
this can be classified into two categories. The first category relies on
combinatorial expansion while the second relies on reduction to the maximal clique problem.
Academic research on these methods has produced mixed evaluations on which category
of algorithms are more efficient [@bunkeComparisonAlgorithmsMaximum2002; @conteComparisonThreeMaximum2003; @wellingPerformanceAnalysisMaximal2011]. The most recent research [@wellingPerformanceAnalysisMaximal2011]
indicates that Koch's [@kochEnumeratingAllConnected2001] algorithms are the most efficient.
Because of this, we chose to use Koch's algorithm.

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

!figures(symbol_representation)(Two different ways to represent symbols in grammars.)(
  !dot(img/no_forwarding_nodes.gen.pdf { width=24% })(No forwarding nodes.)
  ~~~
  digraph S {
    S -> P1
    S -> P2
    S -> P3
    P2 -> a
    P2 -> S1
    P3 -> b
    P3 -> S2
    S1[label=S]
    S2[label=S]
  }
  ~~~
  !dot(img/forwarding_nodes.gen.pdf { width=24% })(Forwarding nodes highlighted in blue.)
  ~~~
  digraph S {
    S -> P1
    S -> P2
    S -> P3
    P2 -> a
    P2 -> F1
    P3 -> b
    P3 -> F2
    F1->S1
    F2->S2
    F1[fillcolor=lightblue,style=filled]
    F2[fillcolor=lightblue,style=filled]
    S1[label=S]
    S2[label=S]
  }
  ~~~
)


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
)(
  !dot(img/index_children_1.gen.pdf { width=24% })(`"a" "b" "c" "d" "e"`)
  ~~~~~~~~~~~~~~~~~~~~
    digraph P1 {
      rankdir=LR
      P1->a[label=0,color=lightskyblue]
      P1->b[label=1]
      P1->c[label=2]
      P1->d[label=3]
      P1->e[label=4]

      a[fillcolor=lightblue, style=filled]
      P1[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
  !dot(img/index_children_2.gen.pdf { width=24% })(`"a" "c" "d" "e" "b"`)
  ~~~
    digraph S2 {
      rankdir=RL
      P2->a[label=0,color=lightskyblue]
      P2->c[label=1]
      P2->d[label=2]
      P2->e[label=3]
      P2->b[label=4]

      a[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~
)

The second method is to link the children of a production with a linked list.
An example of this using the same grammars as before is in [@fig:linked_list_children].
This method allows terms of productions to be matched with each other regardless of position.
But, it does't work well with runs of terms that are shared between productions with holes
in them, such as the run `"a" "c" "d" "e"` in [@fig:linked_list_children]. Finally,
different runs can match even if they're in different orders. We predict
that allowing these different runs to match even in different orders will have a negative
affect on the ability of the merged grammar.


!figures(linked_list_children)(Linking children together with a linked list.)(
  !dot(img/linked_list_1.gen.pdf { width=24% })(`"a" "b" "c" "d" "e"`)
  ~~~~~~~~~~~~~~~~~~~~
    digraph P1 {
      rankdir=LR
      P1->a
      P1->f[color=lightskyblue]
      P1->b
      P1->c[color=lightskyblue]
      P1->d[color=lightskyblue]
      P1->e[color=lightskyblue]
      edge[penwidth=.5,arrowsize=.5]
      a->f
      f->b
      b->c
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      {rank=same; a f b c d e}

      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      f[fillcolor=lightblue, style=filled]
      P1[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
  !dot(img/linked_list_2.gen.pdf { width=24% })(`"a" "c" "d" "e" "b"`)
  ~~~~~~~~~~~~~~~~~~~~
    digraph P2 {
      rankdir=RL
      P2->a
      P2->c[color=lightskyblue]
      P2->d[color=lightskyblue]
      P2->e[color=lightskyblue]
      P2->b
      P2->f[color=lightskyblue]
      edge[penwidth=.5,arrowsize=.5]
      a->c
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      e->b
      b->f
      {rank=same; a c d e b f}

      f[fillcolor=lightblue, style=filled]
      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
)

A third approach that we are evaluating is to fully connect the terms in a production.
This will allow runs of terms with holes to match with each other. An example of this is in [@fig:fully_connected]. It will also not allow
runs to be reordered as in the previous method. The problems with this method is that the addition
of extra edges might increase the running time of our algorithms. 
Overall we predict this to be the most effective method.

!figures(fully_connected)(Fully connecting terms of a production.)(
  !dot(img/fully_connected_1.gen.pdf {width=24%})
  ~~~~~~~~~~~~~~~~~~~~
    digraph P1 {
      rankdir=RL
      {rank=same; a b c d e}
      a->P1[style=invis,weight=0] // Forces P1 to be on opposite side of children
      P1->a[color=lightskyblue]
      P1->c[color=lightskyblue]
      P1->d[color=lightskyblue]
      P1->e[color=lightskyblue]
      P1->b
      edge[penwidth=.5,arrowsize=.5]
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      a->c[color=lightskyblue]
      c->e[color=lightskyblue]
      a->d[color=lightskyblue]
      a->e[color=lightskyblue]
      a->b
      b->c
      b->d
      b->e

      a[fillcolor=lightblue, style=filled]
      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      P1[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
  !dot(img/fully_connected_2.gen.pdf {width=24%})
  ~~~~~~~~~~~~~~~~~~~~
    digraph S2 {
      rankdir=LR
      {rank=same; a b c d e}
      a->P2[style=invis,weight=0] // Forces P2 to be on opposite side of children.
      P2->a[color=lightskyblue]
      P2->c[color=lightskyblue]
      P2->d[color=lightskyblue]
      P2->e[color=lightskyblue]
      P2->b
      edge[penwidth=.5,arrowsize=.5]
      a->c[color=lightskyblue]
      a->d[color=lightskyblue]
      a->e[color=lightskyblue]
      c->d[color=lightskyblue]
      c->e[color=lightskyblue]
      d->e[color=lightskyblue]
      c->b
      a->b
      d->b
      e->b

      a[fillcolor=lightblue, style=filled]
      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
)

### Graph Labels

To make sure only the right kinds of nodes and relationships are merged with each other,
each type of node and relationship will recieve it's own label. In addition, terminal
nodes are all labeled with the letter of their alphabet. An example graph for the
following grammar is in [@fig:labeled_grammar_graph].

```
S = N | N O S
O = "+" | "-"
N = "0" | D1 N1
D1 = "1" | "2" | "3" | "4" | "5" |
     "6" | "7" | "8" | "9"
N1 = "" | D2 N1
D2 = "0" | D1
```

!dot(img/labeled_grammar_graph.gen.pdf {#fig:labeled_grammar_graph})(Labeled grammar. Each color is its own label. Yellow
nodes are non-terminal symbols. Red nodes represent productions. Purple nodes represent forwarding nodes. The varying shades
of turquoise nodes are terminal symbols. TODO: Color edges, update to match grammar)
~~~~~~~~~~~~~~~~~~~~
digraph S {
  node[style=filled,fillcolor="#ffff89"]
  S
  O
  N
  D1
  N1
  D2

  node[label="",style=filled,fillcolor="#ff8989"]
  P1
  P2
  P3
  P4
  P5
  P6
  P7
  P8
  P9
  P10
  P11
  P12
  P13
  P14
  P15
  P16
  P17
  P18
  P19

  node[style=filled,fillcolor="#ac89ff"]
  F1
  F2
  F3
  F4
  F5
  F6
  F7
  F8
  F9
  
  node[label="0",fillcolor=".444 .46 1"]
  "01"
  "02"
  node[label="\N"]
  "+"[fillcolor=".444 .46 !calc(11/12)"]
  "-"[fillcolor=".444 .46 !calc(10/12)"]
  "1"[fillcolor=".444 .46 !calc(9/12)"]
  "2"[fillcolor=".444 .46 !calc(8/12)"]
  "3"[fillcolor=".444 .46 !calc(7/12)"]
  "4"[fillcolor=".444 .46 !calc(6/12)"]
  node[fontcolor=white]
  "5"[fillcolor=".444 .46 !calc(5/12)"]
  "6"[fillcolor=".444 .46 !calc(4/12)"]
  "7"[fillcolor=".444 .46 !calc(3/12)"]
  "8"[fillcolor=".444 .46 !calc(2/12)"]
  "9"[fillcolor=".444 .46 !calc(1/12)"]

  node[label="\N"]
  rankdir=LR
  S -> P1
  S -> P2
  P1 -> F1
  P2 -> F2
  P2 -> F3
  P2 -> F4
  F1 -> N
  F2 -> N
  F3 -> O
  F4 -> S
  F2 -> F3 -> F4
  {rank=same; F2 F3 F4}

  O -> P3
  O -> P4
  P3 -> "+"
  P4 -> "-"

  N -> P5
  N -> P6
  P5 -> "01"
  P6 -> F5
  P6 -> F6
  F5 -> D1
  F6 -> N1
  F5 -> F6
  {rank=same; F5 F6 }

  D1 -> P9
  D1 -> P10
  D1 -> P11
  D1 -> P12
  D1 -> P13
  D1 -> P14
  D1 -> P15
  D1 -> P16
  D1 -> P17
  P9 -> "1"
  P10 -> "2"
  P11 -> "3"
  P12 -> "4"
  P13 -> "5"
  P14 -> "6"
  P15 -> "7"
  P16 -> "8"
  P17 -> "9"

  N1 -> P18
  N1 -> P19
  P19 -> F8
  P19 -> F9
  F8 -> D2
  F9 -> N1
  F8 -> F9
  {rank=same; F8 F9}

  D2 -> P7
  D2 -> P8
  P7 -> "02"
  P8 -> F7
  F7 -> D1

  {rank=same; N1, D1 }
}
~~~~~~~~~~~~~~~~~~~~
