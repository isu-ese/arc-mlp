## Hypothesis Testing {#sec:hyp_tests}

This subsection details the results of the $\Delta HAL$ experiment and $\Delta MCC$ experiment. In both cases we initially executed a sample size analysis to determine the number of replications to execute to achieve a power level of .95. The results of this analysis indicate the need to execute a total of 5 replications of each experiment.

### $\Delta HAL$ Experiment

We conducted an experiment using a factorial design based on the levels of the factors size and similarity threshold. Our goal was to determine if the algorithm when applied had an effect on the change in Halstead Effort for the combined grammars, as measured by $\Delta HAL$. Because of the violations to the assumptions of ANOVA, we opted to utilize non-parametric methods in our analysis. The initial analysis utilizes a permutation F-test approach to evaluate if there is any difference among factor levels. The results was had a p-value of $<\num{2.2e-16}$ indicating that we could reject $H_{1,0}$. We also note that the interaction indicated in @fig:ex1_interaction was shown to be significant with a p-value of $<\num{2.2e-16}$.

We were interested in determining if there was any difference between the control level (1.0) and other levels of the similarity threshold. To evaluate this we used Steel's multiple comparison against a control. The results of this test indicated for each level that there was a significant difference and that each level the mean $\Delta HAL$ was lower than that of the control value.

Finally, we were interested in evaluating the selected levels of the similarity threshold (excluding control) and if there was an implied order (that is there is a decreasing order to the change in $\Delta HAL$) as the level value is lowered in the similarity threshold. To evaluate this we used Jonchkheere's trend test for ordered differences among classes, which yields a JT statistic value of 767 and a p-value of \num{4e-4}, when executed using 10000 permutations. This indicates that we can reject $H_{3,0}$ that there is no *a priori* ordering among levels of similarity threshold on median $\Delta HAL$.

### $\Delta MCC$ Experiment

We conducted an experiment using a factorial design based on the levels of the factors size and similarity threshold. Our goal was to determine if the algorithm when applied had an effect on the change in Complexity for the combined grammars, as measured by $\Delta MCC$. Because of the violations to the assumptions of ANOVA, we opted to utilize non-parametric methods in our analysis. The initial analysis utilizes a permutation F-test approach to evaluate if there is any difference among factor levels. The results was a p-value of 0.1429 indicating that we failed to reject $H_{1,0}$.

We tested if there was any difference between the control level (1.0) and other levels of the similarity threshold. To evaluate this, we used Steel's multiple comparison against a control. The results of this test indicated for each level that there was a significant difference and that for each level the mean $\Delta MCC$ was lower than that of the control value.

Finally, we evaluated the selected levels of the similarity threshold (excluding control) to if there was a decreasing order to the change in $\Delta MCC$ as the similarity threshold values is lowered. To do this, we used Jonchkheere's trend test for ordered differences among classes, which yielded a JT statistic value of 742 and a p-value of \num{1e-04} when executed using 10000 permutations. This indicated that we can reject $H_{3,0}$: that there is no *a priori* ordering among levels of similarity threshold on median $\Delta MCC$.
