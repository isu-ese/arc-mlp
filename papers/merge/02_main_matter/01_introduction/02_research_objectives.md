Island grammars have been shown to be a solution to the problem of developing multilingual parsers \cite{synytskyy_robust_2003}. Though useful, the technique requires the manual combination of selected components from source grammars, a process which can be cumbersome to maintain as these grammars evolve. To overcome this, we propose an automated method to reduce the initial time-consuming manual process and the further difficulty of maintaining the constructed island grammar. In this paper we discuss a key component to the automated construction of island grammars. Specifically, the capability to correctly combine grammar productions together without reducing the grammar's ability to define key aspects of interest.

The automated merging of grammars is an important and necessary step in the evolution of island grammar research. The capability to automate grammar merging addresses the key issues found in the initial construction and further maintenance of island grammars. To evaluate this hypothesis, we used the Goal-Question-Metric (GQM) paradigm \cite{caldiera_goal_1994} to form the following research goal (RG):

!rg{
  \item Evaluate an automated approach for the purpose of automating the merging of grammar rules with respect to the maintenance effort and complexity from the point of view of software language engineers in the context of the creation of tolerant and island grammars.
}

\noindent The solution proposed will allow tool designers to develop source code analysis tools which support multiple programming languages in an efficient and maintainable way.
