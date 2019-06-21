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