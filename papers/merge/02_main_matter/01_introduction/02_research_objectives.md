Island grammars have been shown to be a solution to the problem of developing multilingual parsers \cite{synytskyy_robust_2003}. Though useful, the technique requires the manual combination of selected components from source grammars, a process which can be cumbersome when dealing with evolution of these grammars. To overcome this, we propose an automated method to reduce the initial time-consuming manual process and the further difficulty of maintaining the constructed island grammar in the face of source grammar evolution. In this paper we discuss a key to the component to the automated construction of island grammars. Specifically, the capability to correctly combine grammar productions together without reducing the grammar's ability to define key aspects of interest.

Towards this end, we believe that the automated merging of grammars is an important and necessary step in the evolution of island grammar research. The capability to automate grammar merging addresses the key issues found in the initial construction and further maintenance of island grammars. To evaluate this hypothesis, we used the Goal-Question-Metric (GQM) paradigm \cite{caldiera_goal_1994} to form the following research goal:

!rg{
  \item Develop an automated approach for merging components of a grammar to facilitate the construction of both the island and water components in an island grammar in order to reduce both the overall initial effort required in creating such grammars and the effort required to maintain such grammars.
}

\noindent The solution proposed will allow tool designers to develop source code analysis tools which support multiple programming languages in a less difficult and more maintainable way.
