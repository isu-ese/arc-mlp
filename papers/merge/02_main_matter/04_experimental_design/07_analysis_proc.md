## Analysis Procedures {#sec:analysis_proc}

As described in @sec:experimental_design, both experiments utilize a Factorial design \cite{montgomery_design_2013}. Typically, a factorial design experiment will utilize ANOVA to determine if there is a difference between the effects of the factors. In this case, the statistical model used is as follows:

\[y_{ijk} = \mu + st_i + size_j + (st * size)_{ij} \epsilon_{ijk}\]

\noindent Where:

* $y_{ijk}$ is the kth value of the observation (either $\Delta MCC$ or $\Delta HAL$) associated with the ith similarity threshold level and jth size level.
* $\mu$ is the baseline mean
* $st_{i}$ is the ith level of similarity threshold effect.
* $size_{j}$ is the jth level of size effect.
* $(st * size)\_{ij}$ is the similarity threshold * size interaction effect.
* $\epsilon_{ijk}$ is the random error of the kth observation from the (i, j)th cell.

\noindent The hypotheses to be tested in this case are as follows:

* $H_{1,0}$ : The effect of the levels of the interaction term are equal.
* $H_{1,A}$ : There is at least one difference between interaction level effects.
* $H_{2,0}$ : The effects of the levels of similarity threshold are equal.
* $H_{2,A}$ : There is at least one difference between similarity threshold level effects.
* $H_{3,0}$ : The effects of the levels of size are equal.
* $H_{3,A}$ : There is at least one difference between size level effects.

ANOVA has several assumptions that must first be verified. First, is the assumption of homogeneity of variance. To evaluate this assumption, we will use Levene's Test \cite{levene_robust_1960}. The next assumption is that both the factors and errors are normally distributed. To verify this assumption, we will use the Anderson-Darling Test for Goodness of Fit \cite{anderson_test_1954} to the normal distribution for both the errors and factor effects. Finally, there is the assumption of independence of the observations, which is valid due to the nature of the process.

In the case of any violations of these assumptions we will attempt to correct the violation. In the case that the assumptions are violated beyond the capability to correct, we will be forced to utilize a non-parametric approach. Specifically, we will use a permutation F-test \cite{higgins_introduction_2004}, in place of ANOVA. The permutation F-test also has a set of assumptions that must be met prior to use. ... The model for the permutation F-test is the same as that of ANOVA.

In either case, the next step is to conduct the hypothesis test and make a decision. In this case we have selected an $\alpha$ threshold of 0.95. In the case that we reject $H_{1,0}$ we will then conduct a multiple-comparison procedure to compare the individual effects of each level of the similarity threshold factor. In these experiments the similarity threshold level of 1.0 to be the control (as noted in @sec:design). We have selected to pair Dunnett's \cite{dunnett_multiple_1955} multiple comparison procedure if ANOVA is used, and Steel's \cite{steel_multiple_1959} multiple comparison procedure (a non-parametric technique analogous to Dunnett's) if using the permutation F-test. Both of these comparison procedures control the error for multiple comparisons and allow the ability to compare against a control. In the case of Dunnett's Test we will be evaluating the following hypotheses:

* $H_{4,0}$ : There is no difference between the mean effects of similarity threshold effects and control effect.
* $H_{4,A}$ : There is a difference between at least one similarity threshold level and control.

\noindent In the case of Steel's Test we will be evaluating the following hypotheses:

* $H_{4,0}$ : There is no difference between the median effects of similarity threshold effects and control effect.
* $H_{4,A}$ : There is a difference between at least one similarity threshold level and control.

\noindent For either of these tests we will use an $\alpha$ threshold of 0.95.

Additionally, we are interested if there is a strict order of the effect on $\Delta HAL$ or $\Delta MCC$ for the levels of the similarity threshold factor. To evaluate this we have selected to utilize the Jonhckheer's trend test. This is a non-parametric test to determine if there is an *a priori* ordering within independent samples \cite{jonckheere_distribution-free_1954}. The hypotheses to be tested are as follows:

* $H_{5,0}$ : There is no difference in median effects of the similarity threshold levels.
* $H_{5,A}$ : There is a increasing trend in the effects of the similarity threshold levels, with at least one being a strict inequality.

Finally, we will also conduct a sample size analysis to determine the number of repetitions necessary to achieve the power level necessary for the experiments.
