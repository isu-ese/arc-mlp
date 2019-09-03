## Goals, Hypotheses, and Variables {#sec:exp_goals}

This subsection describes the refinement of our initial research goal, defined in @sec:introduction, into a set of actionable research questions and metrics. Based on this set of research questions we also identified the variables used in statistical models driving our analysis procedures. We begin with the research questions and metrics.

We deconstructed RG, following the GQM paradigm, into the following set of research questions:

!rq{
 \item What is the effect that this process has on the effort between the source grammars and the grammar produced by this approach?

 \textbf{Rationale:} \textit{It is expected that the merging of grammar components will reduce the maintenance effort required.}

 \item What is the effect that this process has on the complexity between the source grammars and the grammar produced by this approach?

 \textbf{Rationale:} \textit{It is expected that the merging and reduction of grammar components will reduce the complexity of the grammar, thus making the grammar easier to understand and read.}
}

\noindent In addition to these research questions we have selected the following metrics to assess the results of the approach used:

!metrics{
  \item Effort -- To assess the effort required to maintain a grammar, we utilize the Halstead Effort measure for grammars as defined by Power and Malloy \cite{power_metrics_2004}.
  \item Complexity -- To assess the complexity of a grammar, we utilize McCabe's Cyclomatic Complexity metric for grammars defined by Power and Malloy \cite{power_metrics_2004}.
}

\noindent The dependent variables in the experiments, as indicated by the above hypotheses, are effort and complexity. Specifically, we are concerned with the change between the trivial merge state and the final grammar in terms of the effort and complexity of the grammar. Thus, the dependent variables of concern are $\Delta Effort$ and $\Delta Complexity$, representing the change in effort from trivial merge to final grammar and the change in complexity from trivial merge to final grammar, respectively. The independent variables we are concerned with are:

* Similarity Threshold -- the parameter guiding the similarity measurements used in the merging process. The values used in the experiments are 0.001, 0.25, 0.5, 0.75, and 1.0.
* Size -- the size of the grammar as defined by measuring its number of productions (PROD) \cite{power_metrics_2004}, and thresholding this value into three distinct categories: Small, Medium, and Large.
