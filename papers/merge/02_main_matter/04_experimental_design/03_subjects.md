## Experimental Units {#sec:subjects}

!latex
~~~
\begin{table*}[tb]
\centering
\caption{Grammars randomly selected from each size category used in the experiments.}
\label{tbl:grammar_metrics}
\begin{tabular}{|c|l|}
\hline
Category & Grammars\tabularnewline
\hline
\hline
\multirow{2}{*}{S} & brainfuck, cmake, csv, inf, lcc, pdn,\tabularnewline
\cline{2-2}
 & properties, quakemap, sexpression, tsv, url, useragent\tabularnewline
\hline
\multirow{2}{*}{M} & cto, dart2, flatbuffers, fusion-tables, lua, pascal\tabularnewline
\cline{2-2}
 & python2, romannumerals, sgf, stacktrace, webidl, z-ops\tabularnewline
\hline
\multirow{2}{*}{L} & cql3, edif300, fortran77, idl, informix, java9\tabularnewline
\cline{2-2}
 & kotlin, objc-two-step, powerbuilder, rexx, sharc, swift2\tabularnewline
\hline
\end{tabular}
\end{table*}
~~~

In these experiments, the experimental units are pairs of grammars selected from the ANTLR 4 \cite{parrDefinitiveANTLRReference2012} grammar repository\footnote{\url{https://github.com/antlr/grammars-v4}}. The sys-verilog grammar was excluded because of errors while parsing it. At the time of this writing, the repository contained 198 individual grammars from a variety of general purpose and domain specific languages.

The process used to select the grammar pairs for each experiment is depicted in @fig:selection_process and works as follows. Initially, for each of the grammars in the repository we collected a combination of metadata and metric measurements. The metadata consists of the language represented by the grammar, the version of that language (if applicable) and the following metrics (selected from the metrics suite by Power and Malloy \cite{powerMetricsSuiteGrammarbased2004}):

* TERM -- the number of terminals.
* VAR -- the number of defined non-terminals.
* PROD -- the number of productions.
* MCC -- McCabe's cyclomatic complexity.

![Activity diagram describing how control files representing each replication are created.](images/paper/select_process_1.pdf){#fig:selection_process}

Using the resulting measures of these metrics, the grammar dataset was subdivided into three categories (Small, Medium and Large) based on the logarithm of PROD (as the values were log-normal distributed). This subdivision was based on statistically construction thresholds, as per Lanza and Marinescu \cite{lanzaObjectorientedMetricsPractice2011}. Category threshold values are defined as: Small-Medium: \(10^{\mu_{PROD} - \sigma_{PROD}} = 10^{1.8404 - 0.5371} = 20.1084\) and Medium-High: \(10^{\mu_{PROD} + \sigma_{PROD}} = 10^{1.8404 + 0.5371} = 238.4995\). Using these thresholds each grammar is then grouped into one of the three categories.

Using these categories as the grouping factor in the experiments, we can then begin the sampling process. As we have selected a $3\times 5$ factorial design, each replication of each of the two experiments requires 15 grammar pairs (5 per size category). Based on our replication analysis (described in @sec:analysis_proc) we have identified a need for a total of 5 replications. Thus, for each size category we require a total of 50 grammar pairs per experiment yielding a need for 100 total grammar pairs. To meet this requirement we randomly select (without replication) 12 grammars, per size category. From these 12 grammars there are $12 \choose 2$ = 66 combinations without replication of which we randomly select 5 pairs per replication per experiment. The grammars selected and their pairings per experiment/replication are depicted in @tbl:grammar_metrics.

Once the grammar pairs are selected, they are assigned a treatment value for use during the experiment execution and data collection phase. For each size category per replication per experiment, the set of five grammar-pairs are assigned, at random, a level of the similarity threshold treatment. The possible levels that can be assigned are 0.001, 0.25, 0.5, 0.75, and 1.0 where 1.0 is the control level.

Finally, the data generated as part of the selection process is used to construct an experiment control file. This file is used to direct the experimental execution system and to ensure the validity of the process. Each control file is simply an ordered set of triples where each triple consists of the following information:

* Grammar Pair - the pair of grammars to be merged together, as selected during the selection phase.
* Treatment - the similarity threshold value assigned to the grammar pair during the selection phase.
* Size - value of the size category, for use in constructing the data table.

\noindent Each replication has a separate control file to control its execution. Thus, for each replication, the control file triples are created and put into a list which is then randomized. This randomized list is then output to a file which is later read in by the experimental execution system.
