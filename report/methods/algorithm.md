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

!figures(index_children)(Simple method of representing terms of a production.
  The maximum common subgraph of these two productions is highlighted in blue.)(
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
An example of this using the same grammars used for [@fig:index_children] is in [@fig:linked_list_children].


!figures(linked_list_children)(Linking children together with a linked list.)(
  !dot(img/linked_list_1.gen.pdf { width=24% })(`"a" "b" "c" "d" "e"`)
  ~~~~~~~~~~~~~~~~~~~~
    digraph P1 {
      rankdir=LR
      P1->a
      P1->b
      P1->c[color=lightskyblue]
      P1->d[color=lightskyblue]
      P1->e[color=lightskyblue]
      edge[penwidth=.5,arrowsize=.5]
      a->b
      b->c
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      {rank=same; a b c d e}

      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
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
      edge[penwidth=.5,arrowsize=.5]
      a->c
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      e->b
      {rank=same; a c d e b}

      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
)

Full connected children:

!figures(fully_connected)(Children of a node are fully connected)(
  !dot(img/fully_connected_1.gen.pdf {width=24%})
  ~~~~~~~~~~~~~~~~~~~~
    digraph S1 {
      rankdir=LR
      {rank=same; a b c d e}
      S[label="S1"]
      P1[label=""]
      P2[label=""]
      S->P2[color=lightskyblue]
      S -> P1[color=lightskyblue]
      P2->a[color=lightskyblue]
      P2->c[color=lightskyblue]
      P2->d[color=lightskyblue]
      P2->e[color=lightskyblue]
      P2->b
      edge[penwidth=.5,arrowsize=.5]
      c->d[color=lightskyblue]
      d->e[color=lightskyblue]
      a->c[color=lightskyblue]
      b->d[color=lightskyblue]
      c->e[color=lightskyblue]
      a->d[color=lightskyblue]
      a->e[color=lightskyblue]
      a->b
      b->c
      b->e

      a[fillcolor=lightblue, style=filled]
      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      S[fillcolor=lightblue, style=filled]
      P1[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
  !dot(img/fully_connected_2.gen.pdf {width=24%})
  ~~~~~~~~~~~~~~~~~~~~
    digraph S2 {
      rankdir=RL
      {rank=same; a b c d e}
      S[label="S2"]
      P1[label=""]
      P2[label=""]
      S->P2[color=lightskyblue]
      S -> P1[color=lightskyblue]
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
      c->b

      a[fillcolor=lightblue, style=filled]
      c[fillcolor=lightblue, style=filled]
      d[fillcolor=lightblue, style=filled]
      e[fillcolor=lightblue, style=filled]
      S[fillcolor=lightblue, style=filled]
      P1[fillcolor=lightblue, style=filled]
      P2[fillcolor=lightblue, style=filled]
    }
  ~~~~~~~~~~~~~~~~~~~~
)

We also have to consider how we connect productions to rules that they are children of. The trivial way would be to connect them as children. This has the problem though that it could create complicated nonsensical graphs, especially if the children of a production are fully connected. Here is an example of that for the grammar of nested parenthesis:

```
S = "" | "(" S ")"
```

!dot(img/confusing.gen.pdf)
~~~
digraph S {
    S -> P1
    S->P2
    {rank=same; "(" ")"}
    P2->"("[label=child]
    P2->S[label=child]
    P2->")"[	label=child]
    S[label="Rule: S"]
    P1[label="Production"]
    P2[label="Production"]
    "(" -> S[label=next]
    "("->")"[label=next]
    S->")"[label=next]
}
~~~

In case this is problematic, we'll also test using link nodes so that productions don't connect directly to rules except for their parent rule.

!dot(img/links.gen.pdf)
~~~
digraph S {
    S -> P1
    S->P2
    {rank=same; "(" L ")"}
    P2->"("[label=child]
    P2->L[label=child]
    P2->")"[	label=child]
    S[label="Rule: S"]
    P1[label="Production"]
    P2[label="Production"]
    L[label="label: S"]
    L->S[label=link]
    edge[constraint=false]
    "(" -> L[label=next]
    "("->")"[label=next]
    L->")"[label=next]
}
~~~



A trivial grammar combining \(G_1\) and \(G_2\) can easily be created by simply concatenating the productions and symbols of the grammar and merging the productions of the start symbols. \(G_m = (R_1\cup R_2 \cup \{r_m\}, T, P_1 \cup P_2 \cup \{r_m\rightarrow r_1, r_m \rightarrow r_2\}, r_m)\).

First of all, it is impossible to achieve all of our goals. A grammar \(G_m\) can be trivially created that maintains the validity constraint. But it is impossible to guarantee the compatibility constraint is followed. Given two grammars \(G_1\) and \(G_2\) that are weakly equivalent but not structurally equivalent [@paullStructuralEquivalenceContextfree1968], it's trivial to see that the compatibility constraint cannot be applied. To see if this is a problem, we must test our method on existing grammars and code.
