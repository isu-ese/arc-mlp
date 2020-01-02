The following paragraphs detail the results of the normalization procedure for each grammar. Presented first is Brainfuck with its full grammar displayed before and after normalization. Next, select portions from the normalized XML grammar are detailed. Finally, the results of transforming Java\texttrademark{}'s grammar are shown.

Fig. \ref{fig:pre_brainfuck} and Fig. \ref{fig:post_brainfuck} show Brainfuck's grammar before and after normalization. As can be seen, the normalized grammar meets all the conditions required for the normal form. In addition, both $*$ expressions have been replaced. The normalization procedure was able to recognize that the allowed syntax for the inside of square brackets is the same as that of the entire file. Finally, all of the unit rules for the operators have been replaced directly with their text.

\begin{figure}[tb]
    \centering
    \begin{bnf*}
        \bnfprod{file}{\bnfpn{A} \bnfor \bnfes} \\
        \bnfprod{statement}{\bnfts{>} \bnfor \bnfts{<} \bnfor \bnfts{+} \bnfor \bnfts{-} \bnfor \bnfts{.} \bnfor \bnfts{,} \bnfor \bnfpn{B}} \\
        \bnfprod{B}{\bnfts{[} \bnfsp \bnfpn{file} \bnfsp \bnfts{]}} \\
        \bnfprod{A}{\bnfpn{statement} \bnfsp \bnfpn{file}}
    \end{bnf*}
    \caption{Brainfuck grammar after normalization. Productions $\bnfpn{A}$ and $\bnfpn{B}$ are productions with auto-generated names.}
    \label{fig:post_brainfuck}
\end{figure}


\begin{figure}[tb]
    \centering
    \begin{bnf*}
        \bnfprod{file}{\bnfpn{statement}^*} \\
        \bnfprod{statement}{\bnfpn{opcode} \bnfor } \\
        \bnfmore{\bnfpn{LPAREN}\bnfsp \bnfpn{statement}^* \bnfsp \bnfpn{RPAREN}} \\
        \bnfprod{opcode}{\bnfpn{GT} \bnfor \bnfpn{LT} \bnfor \bnfpn{PLUS} \bnfor} \\
        \bnfmore{\bnfpn{MINUS} \bnfor \bnfpn{DOT} \bnfor \bnfpn{COMMA}} \\
        \bnfprod{GT}{\bnfts{>}} \\
        &\vdots
    \end{bnf*}
    \caption{Brainfuck grammar before normalization. Definitions for the other ops are omitted for brevity.}
    \label{fig:pre_brainfuck}
\end{figure}

<!-- brainfuck,8.0,206.32331253245206,9.0,12.0,7.0,134.7877255484939,8.0,4.0
java,406.0,23536.052664803185,145.0,222.0,580.0,33184.3761475276,136.0,372.0
xml,59.0,2671.295943016456,41.0,32.0,57.0,2706.780510632351,39.0,52.0 -->

\begin{table}
    \caption{The number of productions in each grammar before and after normalization.}
    \label{tab:final_num_productions}
    \center
    \begin{tabular}{ccc}
        \toprule
        Language & Before & After \\
        \midrule
        Brainfuck & 12 & 4 \\
        XML & 32 & 52 \\
        Java\texttrademark{} & 222 & 372 \\
        \bottomrule
    \end{tabular}
\end{table}


The exact results of XML's normalization are not shown because of their length. Table \ref{tab:final_num_productions} shows that there was a net increase in the number of productions. This is because productions in the original grammar were broken apart into simpler productions and each use of the $*$ ANTLR feature introduced two rules.

As follows is an example portion of the XML grammar before and after normalization. The production representing XML elements in the pre-normalized grammar is:

\begin{bnf*}
    \bnfprod{element}{\bnfts{<} \bnfsp \bnfsk \bnfsp \bnfts{>} \bnfsp \bnfsk \bnfsp \bnfts{</} \bnfsp \bnfsk \bnfsp \bnfts{>} \bnfor \bnfts{<} \bnfsp \bnfsk \bnfsp \bnfts{/>}} \\
\end{bnf*}

\noindent As can be seen, there are two different variants. The first variant represents XML elements with a closing and opening tag. The second variant represents XML elements with a single self closing tag. In the normalized grammar, each of these two variants were extracted into their own rules:


\begin{bnf*}
    \bnfprod{element}{\bnfpn{A} \bnfor \bnfpn{B}} \\
    \bnfprod{A}{\bnfts{<} \bnfsp \bnfsk \bnfsp \bnfts{>} \bnfsp \bnfsk \bnfsp \bnfts{</} \bnfsp \bnfsk \bnfsp \bnfts{>}} \\
    \bnfprod{B}{\bnfts{<} \bnfsp \bnfsk \bnfsp \bnfts{/>}}
\end{bnf*}

<!--  Different kinds of references were directly substituted back into content rule. -->

Like the XML grammar, Java\texttrademark{}'s grammar experienced a significant size increase from the normalization procedure. Part of the reason is because the input Java\texttrademark{} grammar had a significant number of optional expressions: expressions using $?.$ Each of these were eventually extracted out to a new production, resulting in a large number of productions of the form $\bnfpn{A} \bnfpo \mathcal{A} \bnfor \bnfes.$

An example of de-duplication involved the production defining a Java\texttrademark{} expression. In this example, the following three rules were combined:

\begin{bnf*}
    \bnfprod{parExpression}{\bnfts{(} \bnfsp \bnfpn{expression} \bnfsp \bnfts{)}} \\
    \bnfprod{expression}{\bnfpn{primary} \bnfor \bnfsk} \\
    \bnfprod{primary}{\bnfts{(} \bnfsp \bnfpn{expression} \bnfsp \bnfts{)} \bnfor \bnfsk}
\end{bnf*}

\noindent Note that the first part of $\bnfpn{primary}$'s rule is the same as $\bnfpn{parExpression}$'s rule. In the normalization process, this was detected and the equivalent portion was replaced with the $\bnfpn{parExpression}$ symbol. Finally, $\bnfpn{primary}$'s rule was substituted directly into $\bnfpn{expression}$ and eliminated. This substitution happened because of the constraint that a production cannot reference another production that has the same form. This resulted in the following rules:

\begin{bnf*}
    \bnfprod{parExpression}{\bnfts{(} \bnfsp \bnfpn{expression} \bnfsp \bnfts{)}} \\
    \bnfprod{expression}{\bnfpn{parExpression} \bnfor \bnfsk \bnfor \bnfsk}
\end{bnf*}

Other substitutions resulted in a small number of productions in the normalized grammar being extremely long. Intriguingly, these long productions were mostly $\textit{Form}_2$. Those of $\textit{Form}_1$ involved either Java\texttrademark{}'s try-catch feature or generic method declaration.

Similar to the results of normalizing Brainfuck, a large number of symbols which produced a single token were replaced with that token in Java\texttrademark{}'s normalized form. Like as in the XML grammar, expressions involving $*$ were replaced with productions. However, these expressions happened less often than in XML, making them far less noticeable.