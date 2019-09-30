## Analysis Procedures {#sec:analysis_proc}

As described in @sec:experimental_design, both experiments utilize a Factorial design \cite{montgomery_design_2013}. Typically, a factorial design experiment will utilize ANOVA to determine if there is a difference between the effects of the treatments. In this case, the statistical model used is as follows:

\[y_{ij} = \mu + \tau_i + \beta_j + \epsilon_{ij}\]

\noindent Where:

* $y_{ij}$ is the value of the observation (either $\Delta MCC$ or $\Delta HAL$) associated with the ith treatment level and jth block level.
* $\mu$ is the baseline mean
* $\tau_{i}$ is the effect of the ith treatment level.
* $\beta_{j}$ is the effect of the jth block level.

\noindent The hypotheses to be tested in this case are as follows:

* $H_{1,0}$ : there is no difference between treatment effects.
* $H_{1,A}$ : there is at least one difference between treatment effects.

ANOVA has several assumptions that must first be verified. First, is the assumption of homogeneity of variance. To evaluate this assumption, we will use Levene's Test \cite{levene_robust_1960}. The next assumption is that both the treatments and errors are normally distributed. To verify this assumption, we will use the Anderson-Darling Test for Goodness of Fit \cite{anderson_test_1954} to the normal distribution for both the errors and treatment effects. Finally, there is the assumption of independence of the observations, which is valid due to the nature of the process.

In the case of any violations of these assumptions we will attempt to correct the violation. In the case that the assumptions are violated beyond the capability to correct, we will be forced to utilize a non-parametric approach. Specifically, we will use a permutation F-test \cite{higgins_introduction_2004}, in place of ANOVA. The permutation F-test also has a set of assumptions that must be met prior to use. ... The model for the permutation F-test is the same as that of ANOVA.

In either case, the next step is to conduct the hypothesis test and make a decision. In this case we have selected an $\alpha$ threshold of 0.95. In the case that we reject $H_{1,0}$ we will then conduct a multiple-comparison procedure to compare the individual effects of each level of the similarity threshold treatment. In these experiments the similarity threshold level of 1.0 to be the control (as noted in @sec:design). We have selected to pair Dunnett's \cite{dunnett_multiple_1955} multiple comparison procedure if ANOVA is used, and Steel's \cite{steel_multiple_1959} multiple comparison procedure (a non-parametric technique analogous to Dunnett's) if using the permutation F-test. Both of these comparison procedures control the error for multiple comparisons and allow the ability to compare against a control. In the case of Dunnett's Test we will be evaluating the following hypotheses:

* $H_{2,0}$ : $\mu_i = \mu_{control}$ for some treatment $i$.
* $H_{2,A}$ : $\mu_i < \mu_{control}$ for some treatment $i$.

  Where, $\mu$ is the mean value of the effect.

\noindent In the case of Steel's Test we will be evaluating the following hypotheses:

* $H_{2,0}$ : $M_i = M_{control}$ for some treatment $i$.
* $H_{2,A}$ : $M_i = M_{control}$ for some treatment $i$.

  Where, $M$ is the median value of the effect.

\noindent For either of these tests we will use an $\alpha$ threshold of 0.95.

Additionally, we are interested if there is a strict order of the effect on $\Delta HAL$ or $\Delta MCC$ for the levels of the similarity threshold treatment. To evaluate this we have selected to utilize the Jonhckheer's trend test. This is a non-parametric test to determine if there is an *a priori* ordering within independent samples \cite{jonckheere_distribution-free_1954}. The hypotheses to be tested are as follows:

* $H_{3,0}$ : $\theta_1 = \theta_2 = \ldots = \theta_k$
* $H_{3,A}$ : $\theta_1 \leq \theta_2 \leq \ldots \leq \theta_k$

  Where $\theta_i$ is the population median for the $i$th population and $H_{3,A}$ contains at least one strict inequality.

Finally, we will also conduct a sample size analysis to determine the number of repetitions necessary to achieve the power level necessary for the experiments.
