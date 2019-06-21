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