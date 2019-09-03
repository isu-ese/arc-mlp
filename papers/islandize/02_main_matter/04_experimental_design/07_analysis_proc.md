## Analysis Procedures {#sec:analyis_proc}

The following analysis procedures are used in answering the questions posed in @sec:goals. In the first part of this study we have naturally paired samples of data. Given this, we are able to utilize very rudimentary analyses to answer the questions.

For questions RQ3 -- RQ5

\noindent The results will be in the form of confidence intervals defined at the $\alpha = 97.5\%$ confidence level.

### Exploratory Data Analysis

To understand the data collected during experimental operation we used a number of basic statistical analyses. Specifically, to understand the dispersion and typical values of the dependent variables we evaluated the mean and standard deviations of $\Delta MCC$ and $\Delta HAL$. Furthermore, to understand the nature of the relationships between the dependent and independent variables we evaluated the correlations between all variables in the experiment. Furthermore, we can graphically display all of this information in a lattice structure.

### Primary Analyses

The primary analyses used in the experiment are designed to evaluate the hypotheses identified in @sec:goals. The experimental design is a factorial design and thus would be typically evaluated using an ANOVA model. But, ANOVA has several assumptions which if not met leads to a higher chance of Type-II error. To evaluate these assumptions we will be utilizing the following tests:

* To evaluate the normality of the data we will use the Shapiro-Wilk test [@http://zotero.org/users/1776655/items/XDSBUJ53] for normality.
* To evaluate the homogeneity of variance we will use Levene's test for homogeneity of variance [@http://zotero.org/users/1776655/items/QUGJ536S].
* Given the experimental approach we know that the samples are drawn independently and sampled randomly.

In the event that the assumption of the homogeneity of variance is violated but the data is normally distributed, we will apply a weighted variance approach to correct the model. On the other hand, if both assumptions are violated, we will simply return to utilizing the nonparametric Wilcoxson Rank-Sum [] variant of the test. For both experiments evaluating HAL and MCC we will use the following model.
\[ y_{ijkl} = \mu + \tau_{ijk} + \epsilon_{ijkl} \]

\noindent Where, $y_{ijkl}$ is the observed value of HAL or MCC for the given treatment combination of {ijk} and error {l}. $\mu$ is the base line mean value of the MCC or HAL. $\tau_{ijk}$ is the treatment value for the $i^{th}$ level of $Method$, the $j^{th}$ level of $Size(G)$ and $k^{th}$ level of $Size(I)$. Finally, $\epsilon_{ijkl}$ is the error term representing random error to be controlled for. In the case of both of these experiments we are concerned with determining whether there is any difference due to different treatments, which leads to the following statistical tests:

!latex
~~~
\begin{enumerate}[left=1em,label=H\textsubscript{\arabic*,0} :]
 \item There is no difference in mean $\Delta MCC$
 \item There is no difference in mean $\Delta HAL$
\end{enumerate}
~~~

!latex
~~~
\begin{enumerate}[left=1em,label=H\textsubscript{\arabic*,A} :]
 \item There is at least one difference in $\Delta MCC$
 \item There is at least one difference in $\Delta HAL$
\end{enumerate}
~~~

\noindent In both cases ANOVA and the Rank-Sum based approach simple detect if there is a difference in the means, but does not inform us as to which variable lead to this difference. Thus, in order to detect the difference we will be applying the Tukey-HSV [@http://zotero.org/users/1776655/items/64U6XBSU] analysis to find difference in all means. Additionally, to better understand the effects of individual variables on $\Delta MCC$ and $\Delta HAL$ we will use the following 
