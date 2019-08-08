## Analysis Procedures {#sec:analyis_proc}

Both experiments utilize a Randomized Complete Block Design (RCBD) \cite{montgomery_design_2013} with the size category of the grammar-pairs acting as the blocking variable. An assumption of the RCBD design is that there is no interaction between the blocking variable and the independent variable. We begin by initially validating this assumption via an interaction plot between size and similarity threshold. Upon confirmation of this assumption we select the appropriate analysis techniques. Prior to conducting the experiments, we conduct a sample size estimation to determine the number of repetitions necessary to achieve the power level of the tests we intend to use.

Typically, a single-factor RCBD experiment will utilize ANOVA to determine if there is a difference between the effects of the treatments. In this case, the statistical model used is as follows:

\[y_{ij} = \mu + \tau_i + \beta_j + \epsilon_{ij}\]

\noindent Where:

* $y_{ij}$ is the value of the observation (either $\Delta Complexity$ or $\Delta Effort$) associated with the ith treatment level and jth block level.
* $\mu$ is the baseline mean
* $\tau_{i}$ is the effect of the ith treatment level.
* $\beta_{j}$ is the effect of the jth block level.

\noindent The hypotheses to be tested in this case are as follows:

* $H_{1,0}$ : there is no difference between treatment effects.
* $H_{1,A}$ : there is at least one difference between treatment effects.

ANOVA has several assumptions that must first be verified. First, is the assumption of homogeneity of variance. To evaluate this assumption, we will use Levene's Test \cite{levene_robust_1960}. THe next assumption is that both the treatments and errors are normally distributed. To verify this assumption, we will use the Anderson-Darling Test for Goodness of Fit \cite{anderson_test_1954} to the normal distribution for both the errors and treatment effects. Finally, there is the assumption of independence of the observations, which is valid due to the nature of the process.

In the case of any violations of these assumptions we will attempt to correct the violation. If the homogeneity of variance assumption has been violated, we will attempt to correct this via either by using a Box-Cox \cite{box_analysis_1964} transformations or via the application of a weighted least squares. Similarly, to correct issues with the normality of the errors we will also attempt a transformation of the data. Finally, in the case that the assumptions are violated beyond the capability to correct, we will be forced to utilize a non-parametric approach.

In the case that the ANOVA assumptions have been seriously violated and cannot be reasonably corrected, we will utilize the Friedman Test \cite{friedman_use_1937} instead. The Friedman Test also has a set of assumptions that must be met prior to use. First, the blocks must be mutually independent of one another and must contain the same number of experimental units as there are treatments. Second, the observations both within and among blocks must be independent. Third, the variable of interest must be continuous. Finally, the measurement scale of the block variable must be at least ordinal. In the case of both experiments each of these assumptions are met.

The model for the Friedman Test is similar to that of ANOVA, but focuses on the median rather than the mean. Thus, the hypotheses to be tested in this case are as follows:

* $H_{1,0}$ : there is no difference between median values
* $H_{1,A}$ : there is at least one difference between median values

Regardless of whether ANOVA or the Friedman test is used, the next step is to conduct the hypothesis test and make a decision. In this case we have selected an $\alpha$ threshold of 0.95. In the case that we reject $H_{1,0}$ we will then conduct a multiple-comparison procedure to compare the individual effects of each level of the similarity threshold treatment. Specific to these experiments, we consider the similarity threshold level of 1.0 to be the control (as noted in @sec:design). We have selected to pair Dunnett's \cite{dunnett_multiple_1955} multiple comparison procedure if ANOVA is used, and Steel's \cite{steel_multiple_1959} multiple comparison procedure (a non-parametric technique analogous to Dunnett's) if using the Friedman test. Both of these comparison procedures control the error for multiple comparisons and allow the ability to compare against a control. In the case of Dunnett's Test we will be evaluating the following hypotheses:

* $H_{1,0}$ : $\mu_i = \mu_{control}$ for some treatment $i$.
* $H_{1,A}$ : $\mu_i < \mu_{control}$ for some treatment $i$.
* Where, $\mu$ is the mean value of the effect.

\noindent In the case of Steel's Test we will be evaluating the following hypotheses:

* $H_{1,0}$ : $M_i = M_{control}$ for some treatment $i$.
* $H_{1,A}$ : $M_i = M_{control}$ for some treatment $i$.
* Where, $M$ is the median value of the effect.

\noindent For either of these tests we will use an $\alpha$ threshold of 0.95.

Finally, for either approach we will conduct a power analysis to ensure the Type-II error rate is within tolerance. This final analysis also ensures that the original sample size and repetition analysis was correct.
