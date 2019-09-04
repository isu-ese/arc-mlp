## Descriptive Statistics {#sec:desc_stats}

This subsection describes the data collected via a series of descriptive statistics. @tbl:descriptive shows the mean values of Delta HAL and Delta MCC for each value of the size category in the respective experiments. Along with this table the dispersion of the both DeltaHAL and DeltaMCC across size and similarity threshold values is displayed in @fig:hal_box and @fig:mcc_box, respectively. We can also see the distribution and correlations between these for both the HAL and MCC experiments in @fig:hal_scatter and @fig:mcc_scatter, respectively.

!latex
~~~
\begin{table}[tb]
\caption{Descriptive Statistics.}
\label{tbl:descriptive}
\begin{tabular}{lrr}
\hline
\textbf{Size Category} & \textbf{Mean Delta HAL} & \textbf{Mean Delta MCC}\tabularnewline
\hline
Small & 1290.2 & 32.32\tabularnewline
Medium & 18573 & 112.7\tabularnewline
Large & 149854 & 842.4\tabularnewline
\hline
\end{tabular}
\end{table}
~~~

![HAL Boxplot.](images/paper/results/hal\_box.eps){#fig:hal_box}

![MCC Boxplot.](images/paper/results/mcc\_box.eps){#fig:mcc_box}

![HAL Scatterplots.](images/paper/results/hal_scatter.eps){#fig:hal_scatter}

![MCC Scatterplots.](images/paper/results/mcc_scatter.eps){#fig:mcc_scatter}

![Experiment 1 Q-Q plots.](images/paper/results/ex1_qqplots.eps){#fig:ex1_qqplots}

As we can see from the Residuals vs. Fitted plot, depicted in @fig:ex1_qqplots, the homogeneity of variance assumption is not met. To validate this observation we used Levene's Test. In this test, the null-hypotheses ($H_0$) asserts that the variance is equally distributed. As expected, from our observations of the Residuals vs Fitted Values plot, the test produced an F-value of 19.962 and a p-value of 1.267e-07 indicating that we should reject the null hypothesis that there is a homogeneity of variance.

The Normal Q-Q plot, depicted in @fig:ex1_qqplots, indicates that the normality of the residuals assumption is also violated. To validate this observation we conducted both an Anderson-Darling GOF test and a Shapiro-Wilks GOF test against the Normal distribution. In both cases the null-hypothesis ($H_0$) is that the empirical distribution is Normal. In the case of the Anderson-Darling test the A statistic has a value of 6.8257 and an associated p-value of < 2.2e-16 while the Shapiro-Wilk normality test has a W statistic of 0.75365 with an associated 6.876e-10 both of which indicate that we are to reject the null-hypothesis. These results confirm our initial observation that the results are not normally distributed.

![Experiment 1 interaction plot.](images/paper/results/ex1_interaction.eps){#fig:ex1_interaction}

The interaction plot, depicted in @fig:ex1_interactions, indicates that their is an interaction between the small and medium levels as the similarity threshold changes from 0.75 to 1.0. This indicates that the assumption that the block and treatment do not interact and that an RCBD design is inappropriate and rather a factorial design would be correct.

![Experiment 2 Q-Q plots.](images/paper/results/ex2_qqplots.eps){#fig:ex2_qqplots}

As we can see from the Residuals vs. Fitted plot, depicted in @fig:ex2_qqplots, the homogeneity of variance assumption is not met. To validate this observation we used Levene's Test. In this test, the null-hypotheses ($H_0$) asserts that the variance is equally distributed. As expected, from our observations of the Residuals vs Fitted Values plot, the test produced an F-value of 29.856 and a p-value of 3.61e-10 indicating that we should reject the null hypothesis that there is a homogeneity of variance.

The Normal Q-Q plot, depicted in @fig:ex2_qqplots, indicates that the normality of the residuals assumption is also violated. To validate this observation we conducted both an Anderson-Darling GOF test and a Shapiro-Wilks GOF test against the Normal distribution. In both cases the null-hypothesis ($H_0$) is that the empirical distribution is Normal. In the case of the Anderson-Darling test the A statistic has a value of 9.9558 and an associated p-value of < 2.2e-16 while the Shapiro-Wilk normality test has a W statistic of 0.68204 with an associated 1.852e-11 both of which indicate that we are to reject the null-hypothesis. These results confirm our initial observation that the results are not normally distributed.

![Experiment 2 interaction plot.](images/paper/results/ex2_interaction.eps){#fig:ex2_interaction}

The interaction plot, depicted in @fig:ex2_interactions, indicates that their is an interaction between the small and medium levels as the similarity threshold changes from 0.75 to 1.0. This indicates that the assumption that the block and treatment do not interact and that an RCBD design is inappropriate and rather a factorial design would be correct.
