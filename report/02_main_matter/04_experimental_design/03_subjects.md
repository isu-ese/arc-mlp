## Experimental Units {#sec:subjects}

!latex
~~~
\begin{table*}[tb]
\centering
\caption{Evaluation grammars and their properties.}
\label{tbl:grammar_metrics}
\begin{tabular}{c|c|lc|lc}
\cline{3-6} \cline{4-6} \cline{5-6} \cline{6-6}
\multicolumn{1}{c}{} & \multicolumn{1}{c}{} & \multicolumn{2}{c|}{Replication 1} & \multicolumn{2}{c}{Replication 2}\tabularnewline
\hline
Experiment & Category & Grammar-Pair & Version-Pair & Grammar-Pair & Version-Pair\tabularnewline
\hline
\multirow{15}{*}{} & \multirow{5}{*}{S} &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
\cline{2-6} \cline{3-6} \cline{4-6} \cline{5-6} \cline{6-6}
 & \multirow{5}{*}{M} &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
\cline{2-6} \cline{3-6} \cline{4-6} \cline{5-6} \cline{6-6}
 & \multirow{5}{*}{L} &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
 &  &  &  &  & \tabularnewline
\hline
\end{tabular}
\end{table*}
~~~

This section describes the experimental units and the selection process used to select them. In these experiments, the experimental units are pairs of grammars selected from the Antlr4 \cite{parr_definitive_2012} grammar repository^[[https://github.com/antlr/grammars-v4](https://github.com/antlr/grammars-v4)]. At the time of this writing, the repository contained 198 individual grammars from a variety of general purpose and domain specific languages. The selection process used to select the grammar pairs for each experiment is depicted in @fig:selection_process and works as follows. Initially, for each of the grammars in the repository we collected a combination of metadata and metric measurements. The metadata collected consisted of the language represented by the grammar and the version of that language (if applicable). We also measured the following metrics for each grammar based on the metrics suite by Power and Malloy \cite{power_metrics_2004}:

* TERM -- the number of terminals.
* VAR -- the number of defined non-terminals.
* PROD -- the number of productions.
* MCC -- McCabe's cyclomatic complexity.

![Experimental unit selection process.](images/selection_process.eps){#fig:selection_process}

Using the results of these calculations, we subdivided the dataset into three categories based on the number of productions (as a measure of size of the grammar). This subdivision was based on statistically construction thresholds \cite{lanza_object-oriented_2011}. This process utilizes the calculation of the mean size, $MEAN(SIZE)$, for the population of grammars and the standard deviation of the size, $STDDEV(SIZE)$, for the population of grammars. Using these values we define the threshold values between the categories Small, Medium, and High as: Small-Medium: $MEAN(SIZE) - STDDEV(SIZE)$ and Medium-High: $MEAN(SIZE) + STDDEV(SIZE)$. Using these thresholds each grammar is then grouped into one of the three categories.

Using these categories as the blocking variable in the experiments, we can then begin the sampling process. For each size category we randomly select (without replication) 10 grammars. From these 10 grammars there are \(10 \choose 2\) = 45 combinations of which we randomly select 5, for each experiment. In the case that replications are necessary, this process repeats for each replication or until the number of grammars are exhausted. In this case we have selected to complete two replications of each experiment, and the selected grammar pairs for both replications of both experiments are shown in @tbl:grammar_metrics.

After the grammar pairs have been selected, they are assigned a treatment value for use during the experiment execution and data collection phase. For each size category in each replication of each experiment, the set of five grammar-pairs are assigned, at random, a value for the similarity threshold treatment. The possible values that can be assigned are 0.001, 0.25, 0.5, 0.75, and 1.0. It should be noted that a value of 1.0 is the control value.

Finally, the data generated as part of the selection process is used to construct an experiment control file. This file is used to direct the experimental execution system and to ensure the validity of the process. Each control file is simply an ordered set of triples. Where, each triple consists of the following information:

* Grammar Pair - the pair of grammars to be merged together, as selected during the selection phase.
* Treatment - the similarity threshold value assigned to the grammar pair during the selection phase.
* Size - value of the size category, for use in constructing the data table.

\noindent Each replication of each experiment has a separate control file to control its execution. Thus, for each replication of each experiment, the control file triples are created and put into a list which is then randomized. This randomized list is then output to a file which is later read in by the experimental execution system.
