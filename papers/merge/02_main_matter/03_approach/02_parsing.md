## Parsing {#sec:parsing}

![Class diagram of internal domain model used to represent grammars throughout the merging process.](images/paper/diagram.eps){#fig:grammar_class_diagram}

The initial step of the process is the translation of the textual representations of the grammars into an instance of our domain model, depicted in @fig:grammar_class_diagram. In our experiments we analyzed grammars stored in the ANTLR 4 grammar format. Thus, to create instances of our model, we processed the grammars using an ANTLR 4 grammar parser. This parser constructs an abstract syntax tree which is then converted into an instance of the domain model.

The conversion process is complicated by the fact that the ANTLR 4 representation is not fully compatible with our BNF based domain model. To resolve this, we removed or converted all non-BNF features except for *dot*, *character range*, *character class*, and *not* rules. These operators act as they do in any typical regular expression language. The *dot*, *character range*, and *character class* operators, were converted to special terminal symbols. *Not* rules were retained by extracting each into its own rule. For example:

```
        A: 'a' . ~('b' | 'c')
```

\noindent would be converted to:

!grammar
```
      <A> ::= `a' DOT <Generated-1>

      <Generated-1> ::= \textasciitilde<Generated-2>

      <Generated-2> ::= `b' | `c'
```

\noindent The *not* rules are ignored completely by this process except for when detecting and merging duplicate rules.
