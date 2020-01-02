## Domain Object Model

![Class diagram of grammar meta-model.](images/meta-model-class-diagram.pdf){ #fig:metamodel }

The meta-model, depicted in [@fig:metamodel], representing our grammars mirrors the structure of BNF grammars. The right-hand side of each production with an expression tree of operands and operators. 

Additional operator and operand types can easily be added to extend our model. For example, we defined operators and operands specific to ANTLR \cite{parr_definitive_2012}. Table \ref{tab:antlr_features} shows ANTLR features that we took care to represent correctly. 

\begin{table}
    \caption{ANTLR Features Not In BNF}
    \centering
    \begin{tabular}{ccc}
        \toprule
        construct & example & description \\
        \midrule
        $+$ & $\bnfts{a}+$ & one or more repetitions \\
        $*$ & $\bnfts{a}^*$ & zero or more repetitions \\
        $\sim$ & $\sim(\bnfts{a} | \bnfts{b})$ & not one of a set of characters \\
        $?$ & $\bnfts{a}?$ & zero or one repetitions \\
        `.` & `.` & any character \\
        $\dots$ & $a\dots z$ & a character range \\
        $\backslash p\{\}$ & $\backslash p\{Symbol\}$ & a character class \\
        \bottomrule
    \end{tabular}
    \label{tab:antlr_features}
\end{table}

To support these features, we implemented additional terminal types for `.`, character ranges, and character classes. We also added operators for `*` and `~`.

The `+` and `?` operators are instead substituted with equivalent expressions while being parsed. Expressions of the form $\mathcal{A}+$ are replaced with $\mathcal{A} \bnfsp \mathcal{A}^*$, while expressions of the form $\mathcal{A}?$ are replaced with $(\epsilon | \mathcal{A}).$ $\mathcal{A}$ denotes an arbitrary expression.

After parsing, every application of the `*` operator is replaced with a new production. Expressions of the form $\mathcal{A}^*$ are replaced with the production $\bnfpn{A} \bnfpo \bnfsp \bnfpn{A} \bnfor \epsilon.$

Of special note are the empty string operand and the alternation and concatenation operators. Firstly, the empty string operand is the only operand that is not a symbol. Secondly,
the alternation and concatenation operators are not binary
operators, but rather n-ary operators. Lastly, the alternation operator aggregates its
operands in a set object. This removes the ordering information
per the second problem identified earlier regarding the commutative property of the alternation operator.