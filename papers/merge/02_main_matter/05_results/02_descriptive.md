## Descriptive Statistics {#sec:desc_stats}

This subsection describes the data collected via a series of descriptive statistics. @tbl:descriptive shows the mean values of $\Delta HAL$ and $\Delta MCC$ for each value of the size category in the respective experiments. Along with this table the dispersion of the both $\Delta HAL$ and $\Delta MCC$ across size and similarity threshold values is displayed in @fig:hal_box and @fig:mcc_box, respectively. We can also see the distribution and correlations between these for both the $\Delta HAL$ and $\Delta MCC$ experiments in @fig:hal_scatter and @fig:mcc_scatter, respectively.

!latex
~~~
\begin{table}[tb]
\caption{Descriptive Statistics.}
\label{tbl:descriptive}
\begin{tabular}{lrr}
\hline
\textbf{Size Category} & \textbf{Mean $\Delta HAL$} & \textbf{Mean $\Delta MCC$}\tabularnewline
\hline
Small & 1290.2 & 32.32\tabularnewline
Medium & 18573 & 112.7\tabularnewline
Large & 149854 & 842.4\tabularnewline
\hline
\end{tabular}
\end{table}
~~~

![Delta HAL boxplots.](images/paper/results/hal\_box.eps){#fig:hal_box}

![Delta MCC boxplots.](images/paper/results/mcc\_box.eps){#fig:mcc_box}

![Delta HAL experiment scatterplot matrix.](images/paper/results/hal_scatter.eps){#fig:hal_scatter}

![Delta MCC experiment scatterplot matrix.](images/paper/results/mcc_scatter.eps){#fig:mcc_scatter}

![Delta Hal experiment Q-Q plots.](images/paper/results/ex1_qqplots.eps){#fig:ex1_qqplots}

As we can see from the Residuals vs. Fitted plot, depicted in @fig:ex1_qqplots, the homogeneity of variance assumption is not met. To validate this observation we used Levene's Test. In this test, the null-hypotheses ($H_0$) asserts that the variance is equally distributed. As expected, from our observations of the Residuals vs Fitted Values plot, the test produced an F-value of 19.962 and a p-value of 1.267e-07 indicating that we should reject the null hypothesis that there is a homogeneity of variance.

The Normal Q-Q plot, depicted in @fig:ex1_qqplots, indicates that the normality of the residuals assumption is also violated. To validate this observation we conducted both an Anderson-Darling GOF test against the Normal distribution. In this test the null-hypothesis ($H_0$) is that the empirical distribution is Normal. The results show that the A statistic has a value of 6.8257 and an associated p-value of < 2.2e-16 which indicates that we can reject the null-hypothesis. These results confirm our initial observation that the results are not normally distributed.

![Delta HAL experiment interaction plot.](images/paper/results/ex1_interaction.eps){#fig:ex1_interaction}

The interaction plot, depicted in @fig:ex1_interaction, indicates that their is an interaction between the small and medium levels as the similarity threshold changes from 0.75 to 1.0.

![Delta MCC Experiment Q-Q plots.](images/paper/results/ex2_qqplots.eps){#fig:ex2_qqplots}

As we can see from the Residuals vs. Fitted plot, depicted in @fig:ex2_qqplots, the homogeneity of variance assumption is not met. To validate this observation we used Levene's Test. In this test, the null-hypotheses ($H_0$) asserts that the variance is equally distributed. As expected, from our observations of the Residuals vs Fitted Values plot, the test produced an F-value of 29.856 and a p-value of 3.61e-10 indicating that we should reject the null hypothesis that there is a homogeneity of variance.

The Normal Q-Q plot, depicted in @fig:ex2_qqplots, indicates that the normality of the residuals assumption is also violated. To validate this observation we conducted both an Anderson-Darling GOF test against the Normal distribution. In this test the null-hypothesis ($H_0$) is that the empirical distribution is Normal. The results show the A statistic has a value of 9.9558 and an associated p-value of < 2.2e-16 which indicates that we can reject the null-hypothesis. These results confirm our initial observation that the results are not normally distributed.

![Delta MCC experiment interaction plot.](images/paper/results/ex2_interaction.eps){#fig:ex2_interaction}

The interaction plot, depicted in @fig:ex2_interaction, indicates that their is an interaction between the small and medium levels as the similarity threshold changes from 0.75 to 1.0.
