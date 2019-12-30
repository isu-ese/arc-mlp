## Pilot Study {#sec:exp_goals}

To evaluate the above approach, we performed a small pilot study on three grammars. We selected these grammars from the ANTLR grammar repository. To select these three grammars, we looked for three grammars of varying sizes and applications. The three grammars chosen were the Brainfuck, XML, Java grammars.

Brainfuck is an esoteric language notable for its extreme simplicity \cite{muller_brainfuckeight-instruction_1993}. It is Turing-complete despite only having 8 commands. We chose this language because its grammar is extremely small which allows it to be easily inspected. XML was also chosen because of its grammar's small size. However, it is still significantly more complex than Brainfuck. XML is commonly used for sending information between applications \cite{cerami_web_2002} and configuration files \cite{jacquemot_preparation_2007}. Java is a general purpose programming language used all over the world \cite{noauthor_stack_2019}. Its grammar is significantly more complicated than either of the two previously mentioned grammars. We chose to include this grammar because applications with a need for multilingual parsing would likely include Java as one of their languages \cite{kurniawan_java_2002, annamaa_interactive_2010, getov_mixed-language_2001}.

To evaluate each grammar, we normalize each grammar. Before and after normalization, we measure the number of productions. After normalization, each grammar is checked manually. In this checking process, each rule is verified to be of either Form 1 or Form 2. In addition, we examine each normalized grammar for unexpected rules.

One difficulty with the grammars we chose is that they are written in ANTLR and not BNF. To resolve this, we introduced additional operators and terminal symbols for constructs not easily representable in BNF. The constructs allowed in ANTLR but not in BNF are `+`---one or more repetitions, `*`---zero or more repetitions, `~`---not one of a set of characters, `?`---zero or one repetition, `.`---any character, character ranges (e.g. a...z), and character classes (e.g. word characters).

We augmented our meta-model with special terminal symbols representing `.`, character ranges, and character classes. We also added operators for `*` and `~`.

The `+` and `?` operators were substituted with equivalent expressions while being parsed. Expressions of the form $\mathcal{A}+$ were replaced with $\mathcal{A} \bnfsp \mathcal{A}^*$ while expressions of the form $\mathcal{A}?$ were replaced with $(\epsilon | \mathcal{A}).$ $\mathcal{A}$ denotes an arbitrary expression.

Finally, after parsing, every application of the `*` operator was replaced with a new production. Given an expression of the form $\mathcal{A}^*$, it was replaced with a rule with the following production

\begin{bnf*}
    \bnfprod{A}{\mathcal{A} \bnfsp \bnfpn{A} \bnfor \epsilon}
\end{bnf*}