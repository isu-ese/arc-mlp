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