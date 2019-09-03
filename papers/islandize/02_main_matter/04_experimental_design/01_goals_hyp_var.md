## Goals, Hypotheses, and Variables {#sec:exp_goals}

In the spirit of the GQM [@http://zotero.org/users/1776655/items/EDCA3974], we have further refined this goal into a series of directly answerable questions and their underlying rationale. The questions are as follows:

!latex
~~~~~~
\begin{enumerate}[left=1em,label=\bfseries RQ\arabic*:]
  \item How can we automate the combination of languages into a single island grammar?\\
  \textbf{Rationale:}
  \item What is the comparative readability of merged grammars?\\
  \textbf{Rationale:}
  \item What is the comparative usability of merged grammars?\\
  \textbf{Rationale:}
  \item What is the comparative maintainability of merged grammars?\\
  \textbf{Rationale:}
\end{enumerate}
~~~~~~

To facilitate answering these questions we have also defined a series of metrics, as follows:

!latex
~~~~~~
\begin{enumerate}[left=1em,label=\bfseries M\arabic*:]
  \item McCabe Cyclomatic Complexity (MCC) a measure of the complexity of a grammar $\mathcal{G}$. \\
  \textbf{Rationale:} A higher complexity represents difficulty in comprehension of the grammar and difficulty in maintaining the grammar. An island grammar is expected to have a lower complexity value than their input grammars.
  \item Halstead Effort (HAL) a measure of effort necessary to maintain grammar $\mathcal{G}$. \\
  \textbf{Rationale:} Similar to MCC, but provides a means by which the MCC is effectively relativised. Island grammars are expected to have a lower complexity and thus lower HAL than their input grammars.
  \item Size of the Set of Input Grammars (Size(G)) the cardinality of the grammars used as input for the island grammar generation. \\
  \textbf{Rationale:} The size of the input grammar set is a key factor in the overall complexity of the generated island grammar and thus should be accounted for.
  \item Size of the Set of Interest Components per grammar (Size(I)) the cardinality of the interest component set used for each grammar acting as input to the island grammar generation algorithms. \\
  \textbf{Rationale:} The size of the interest component set for each grammar used as input for an island grammar is a key factor in the overall complexity of the generated island grammar and thus should be accounted for.
  \item $version(\mathcal{G})$ indicative of the version of the language the grammar $\mathcal{G}$ recognizes. This is a qualitative measure with text data.\\
  \textbf{Rationale:}
\end{enumerate}
~~~~~~

The following describes the data to be collected, the data collection process, and how this data is to be stored.
First, we describe the data that must be collected. For each grammar under study, we extract the Grammar name, language version,
Grammar type, readability score, usability score, and maintainability score for each grammar measured from the Grammar Measure Database, as collected by the tool presented in @sec:approach. The data is then accumulated into a table, similar to the example shown in @tbl:example, with the following specifications:

* Each row of the represents data associated with a specific grammar set.
* The first column is the grammar set identifier.
* The second column represents the method for island grammar generation.
* The third column represents size of the grammar set.
* The fourth column represents the size of the interest set of each grammar in the set.
* The fifth column represents the calculated complexity of the generated island grammar.
* The sixth column represents the average complexity of the grammar set.
* The seventh column represents the calculated effort of the generated island grammar.
* The eighth column represents the average effort of the grammar set.

The data that is collected then breaks down into the following *independent* and *dependent* variable sets. The independent variables representing the properties of concern for the grammar sets are: Technique, Size(G), and Size(I). The levels associated with technique are *Naive* and *MIGG* depending on the assignment of the set to either the Naive or MIGG approaches for island grammar generation. The levels associated with Size(G) are 2, 5, or 10 which represent a sample of the possible number of grammars to be combined. Finally, the levels associated with Size(I) are 2, 5, and 10 which represent a sample of the possible number of interest components that could be selected from a particular grammar. The dependent variables of concern are $\Delta MCC$ and $\Delta HAL$. $\Delta MCC$ is the difference between the MCC of the generated grammar and the Average MCC of the source grammars. $\Delta HAL$ is the difference between the HAL of the generated grammar and the Average HAL of the source grammars.

!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{table*}[tb]
\centering
\caption{Example data table for this study.}\label{tbl:example}
\begin{tabular}{|c|c|c|c|c|c|c|c|}
\hline
Grammar Set & Method & Size(G) & Size(1) & $MCC_{IG}$ & $MCC_{avg}$ & $HAL_{IG}$ & $HAL_{avg}$\\
\hline
\hline
1 & Naive & 2 & 2 & 0.95 & 0.95 & 0.95 & 0.75\\
\hline
1 & MIGG & 2 & 5 & 0.75 & 0.95 & 0.95 & 0.925\\
\hline
\end{tabular}
\end{table*}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Based on the research questions posed above and the variables utilized to evaluate the grammars, we have constructed the following sets of hypotheses. The first set is based on evaluating the change in complexity of the grammars when reduced to a combined Island Grammar. *We expect that when a selection of languages are combined into an Island Grammar with a set of interests imposed, the generated language should be less complex than the average complexity of languages in the input set.* The statistical hypotheses used to test are:

!latex
~~~
\begin{enumerate}[left=1em,label=H\textsubscript{\arabic*,0} :]
 \item An increase in the number of grammars shows a decrease in average $\Delta MCC$
 \item An increase in the number of interests shows a decrease in average $\Delta MCC$
 \item There is a difference in average $\Delta MCC$ between the techniques used to generate island grammars, when controlling for $Size(G)$ and $Size(I)$
\end{enumerate}
~~~

The second set is based on evaluating the change in effort to maintain the grammars when reduced to a combined Island Grammar. *We expect that when a selection of languages are combined into an Island Grammar with a set of interests imposed, the generated language should less effort to maintain than the average effort of languages in the input set.* The statistical hypotheses used to test this are:

!latex
~~~
\begin{enumerate}[left=1em,label=H\textsubscript{\arabic*,0} :,start=4]
 \item An increase in the number of grammars shows a decrease in the average $\Delta HAL$
 \item An increase in the number of interests shows a decrease in the average $\Delta HAL$
 \item There is a difference in average $\Delta HAL$ between the techniques used to generate island grammars, when controlling for $Size(G)$ and $Size(I)$
\end{enumerate}
~~~
