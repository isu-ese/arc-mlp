### Design Choices

Different algorithms:

Trivial: \(G_m = (R_1\cup R_2 \cup \{r_m\}, T, P_1 \cup P_2 \cup \{r_m\rightarrow r_1, r_m \rightarrow r_2\}, r_m)\).

More complicated: Convert grammars into graphs. Extract similar parts out using maximum common subgraph algorithm. Combine the grammars merging the similar parts.

- Problems: Many ways to convert a grammar into a graph.
- Maximum common subgraph algorithm has many variations.
- Merging process is difficult

Different ways to convert grammar into a graph:

Let's use two very simple grammars as examples:

::: {#fig:example_grammars}
```
S1 = "" | "a" "b" "c" "d" "e"
```

```
S2 = "" | "a" "c" "d" "e" "b"
```

Two simple grammars
:::

::: {#fig:basic_parenthesis}

!dot(img/basic_parenthesis_1.gen.pdf { width=24% })
~~~~~~~~~~~~~~~~~~~~
digraph S {
rankdir=LR
    S -> P1[color=lightskyblue]
    S->P2[color=lightskyblue]
    P2->a[label=0,color=lightskyblue]
    P2->b[label=1]
    P2->c[label=2]
    P2->d[label=3]
    P2->e[label=4]
    S[label="S1"]
    P1[label=""]
    P2[label=""]
    
    a[fillcolor=lightblue, style=filled]
    S[fillcolor=lightblue, style=filled]
    P1[fillcolor=lightblue, style=filled]
    P2[fillcolor=lightblue, style=filled]
}
~~~~~~~~~~~~~~~~~~~~
!dot(img/basic_parenthesis_2.gen.pdf { width=24% })
~~~
digraph S2 {
rankdir=RL
    S -> P1[color=lightskyblue]
    S->P2[color=lightskyblue]
    P2->a[label=0,color=lightskyblue]
    P2->c[label=1]
    P2->d[label=2]
    P2->e[label=3]
    P2->b[label=4]
    S[label="S2"]
    P1[label=""]
    P2[label=""]
  
    a[fillcolor=lightblue, style=filled]
    S[fillcolor=lightblue, style=filled]
    P1[fillcolor=lightblue, style=filled]
    P2[fillcolor=lightblue, style=filled]
}
~~~

Simple method of combining grammars with shared parts highlighted.
:::

Pros: Simple and easy to create.

Flaws: The children of similar productions won't match unless they start with the same symbols.

Linked list of children:

::: {#fig:linked_list}
!dot(img/linked_list_1.gen.pdf { width=24% })
~~~~~~~~~~~~~~~~~~~~
digraph S1 {
rankdir=LR
    S -> P1[color=lightskyblue]
    S->P2[color=lightskyblue]
    P2->a
    P2->b
    P2->c[color=lightskyblue]
    P2->d[color=lightskyblue]
    P2->e[color=lightskyblue]
    S[label="S1"]
    P1[label=""]
    P2[label=""]
    edge[penwidth=.5,arrowsize=.5]
    a->b
    b->c
    c->d[color=lightskyblue]
    d->e[color=lightskyblue]
    {rank=same; a b c d e}
  
    c[fillcolor=lightblue, style=filled]
    d[fillcolor=lightblue, style=filled]
    e[fillcolor=lightblue, style=filled]
    S[fillcolor=lightblue, style=filled]
    P1[fillcolor=lightblue, style=filled]
    P2[fillcolor=lightblue, style=filled]
}
~~~~~~~~~~~~~~~~~~~~
!dot(img/linked_list_2.gen.pdf { width=24% })
~~~~~~~~~~~~~~~~~~~~
digraph S2 {
rankdir=RL
    S -> P1[color=lightskyblue]
    S->P2[color=lightskyblue]
    P2->a
    P2->c[color=lightskyblue]
    P2->d[color=lightskyblue]
    P2->e[color=lightskyblue]
    P2->b
    S[label="S1"]
    P1[label=""]
    P2[label=""]
    edge[penwidth=.5,arrowsize=.5]
    a->c
    c->d[color=lightskyblue]
    d->e[color=lightskyblue]
    e->b
    {rank=same; a c d e b}
  
    c[fillcolor=lightblue, style=filled]
    d[fillcolor=lightblue, style=filled]
    e[fillcolor=lightblue, style=filled]
    S[fillcolor=lightblue, style=filled]
    P1[fillcolor=lightblue, style=filled]
    P2[fillcolor=lightblue, style=filled]
}
~~~~~~~~~~~~~~~~~~~~

Linking children together with a linked list
:::

Full connected children:

::: {#fig:fully_connected}
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

Children of a node are fully connected.
:::

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