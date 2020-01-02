# Approach {#sec:approach}

This section details the design, meta-model, and implementation of a normalization algorithm to simplify the automated merging of grammars. The automated merging of grammars requires that each of the productions of a grammar be normalized to one of two specific forms:

\textmd{$\textit{Form}_1$}

:   The rule of the production only uses the concatenation operator to concatenate symbols. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfsp \bnftd{b} \bnfsp \bnfsk.$

\textmd{$\textit{Form}_2$}

:   The rule of the production only uses the alternation (`|`) operator to combine symbols or the empty string. E.g. $\bnfpn{A} \bnfpo \bnfpn{B} \bnfor \bnftd{b} \bnfor \bnfes \bnfor \bnfsk.$

\noindent Also, the grammar is constrained such that (i) each symbol in a rule cannot have the same form as the rule it is in, (ii) unit rules are not permitted except for the case of the start symbol producing a single terminal symbol, and (iii) no pair of productions have identical right-hand sides.

!include{01_design.md}

!include{02_domain_object_model.md}

!include{03_normalization.md}
