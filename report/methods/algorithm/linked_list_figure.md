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