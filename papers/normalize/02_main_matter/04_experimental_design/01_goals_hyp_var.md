To evaluate the above approach, we performed a small pilot study on three grammars selected from the ANTLR \cite{parr_definitive_2012} grammar repository\footnote{\url{https://github.com/antlr/grammars-v4}}. The grammar selection criteria were as follows: (i) selected grammars should be of varying sizes with at least one grammar of a size small enough to be easily inspected, and (ii) grammars should be of varying application. These criteria led to the selection of the Brainfuck, XML, and Java\texttrademark{} grammars.

Brainfuck is an esoteric Turing-complete language notable for its extreme simplicity, having only 8 commands \cite{muller_brainfuckeight-instruction_1993}. We chose this language because its grammar is extremely small which allows it to be easily inspected. For similar reasons we chose the more complicated XML grammar. XML is commonly used for sending information between applications \cite{cerami_web_2002} and configuration files \cite{jacquemot_preparation_2007}. Finally, Java\texttrademark{} was selected for the high likelihood it would need to be included as a base language \cite{kurniawan_java_2002, annamaa_interactive_2010, getov_mixed-language_2001}. This language is significantly more complicated than either Brainfuck or XML, as it is a widely used \cite{noauthor_stack_2019} general purpose programming language.

To evaluate each grammar, we normalize each grammar.
Before and after normalization, we measure the number of
productions \cite{power_metrics_2004}. After normalization, each grammar is checked
manually. In this checking process, each rule is verified to be
of either $\textit{Form}_1$ or $\textit{Form}_2$. In addition, we examine each
normalized grammar for unexpected rules.