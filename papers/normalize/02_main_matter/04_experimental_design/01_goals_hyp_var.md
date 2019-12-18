## Pilot Study {#sec:exp_goals}

<<<<<<< Updated upstream
To evaluate the above approach, we performed a small pilot study on three grammars. We selected these grammars from the ANTLR grammar repository. To select these three grammars, we looked for three grammars of varying sizes and applications. The three grammars that we chose were the brainfuck, Java\texttrademark, and XML grammars (Table \ref{rab:languages}). We chose the brainfuck grammar because the small size of it allows it to be easily manually inspected. Java\texttrademark's grammar was chosen because it has a relatively complex grammar and the Java\texttrademark programming language is used in corporate environments. XML's grammar was chosen because it is relatively simple, but not as simple as brainfuck's, while also having significant uses. 

\begin{table}
    \centering
    \begin{tabular}{cc}
        \toprule
        Language \\
        \midrule
        Java\texttrademark 7 \\
        Brainfuck \\
        XML \\
        \bottomrule
    \end{tabular}
    \caption{Languages used in pilot study.}
    \label{tab:languages}
\end{table}
=======
To evaluate the above approach, we performed a small pilot study on three grammars. We selected these grammars from the ANTLR grammar repository. To select these three grammars, we looked for three grammars of varying sizes and applications. The three grammars chosen were the Brainfuck, XML, Java\texttrademark{} grammars.
>>>>>>> Stashed changes

Brainfuck is an esoteric language notable for its extreme simplicity [CITE]. It is Turing-complete despite only having 8 commands. We chose this language because its grammar is extremely small which allows it to be easily inspected. XML was also chosen because of its grammar's small size. However, it is still significantly more complex than Brainfuck. XML is commonly used for sending information between applications [CITE something about SOAP] and configuration files [CITE]. Java\texttrademark{} is a general purpose programming language used all over the world [CITE]. Its grammar is significantly more complicated than either of the two previously mentioned grammars. We chose to include this grammar because applications with a need for multilingual parsing would likely include Java as one of their languages [CITE something about JSP, something about embedded languages in strings, something about mixed language systems (e.g. migration to SCALA or Kotlin)].

To evaluate each grammar, we normalize each grammar. Before and after normalization, we measure the number of productions. After normalization, each grammar is checked manually. In this checking process, each rule is verified to be of either Form 1 or Form 2. In addition, we examine each normalized grammar for unexpected rules.
