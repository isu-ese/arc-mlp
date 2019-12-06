## Pilot Study {#sec:exp_goals}

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


To evaluate each grammar, we normalize each grammar. Before and after normalization, we measure the number of productions. After normalization, each grammar is checked manually. In this checking process, each rule is verified to be of either Form 1 or Form 2. In addition, we examine each normalized grammar for unexpected rules.
