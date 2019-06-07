## Goals, Hypotheses and Variables

We hypothesize that our method for creating multilingual grammars has the following property:

* The grammar accepts exactly the sentences that are valid in any of the languages used to build the grammar. \(s \in L(G_1)\cup L(G_2) \leftrightarrow s \in L(G_{12})\).

We hope that our method maximizes the number of symbols found to be shared by the languages. We can measure this by producing a mapping from the symbols of the multilingual grammar to each of the component grammars. The symbols shared between languages will have mappings to all of the component grammars.

