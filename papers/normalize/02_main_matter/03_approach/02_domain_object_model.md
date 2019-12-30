## Domain Object Model


The meta-model representing our grammars mirrors the structure of BNF grammars. However, we also implemented it so that it's easily extensible to other grammar formats. We did this by representing the right-hand side of each production with an expression tree of operands and operators. The operands and operators are open to extension. For example, we also defined operators and operands specific to EBNF and ANTLR. Note that the empty string is a unique operand in our meta-model. Namely, it the only operand that is not a symbol. A class diagram of the meta-model is in [@fig:metamodel].

Worthy of mention is how the alternation (`|`) operator stores its operands. The alternation operator aggregates its operands in a set object. This removes the ordering information per the second ambiguity identified in our design. Finally, the alternation and concatenation operators are not binary operators, but rather n-ary operators.

![Class diagram of grammar meta-model.](images/metamodel.eps){ #fig:metamodel }