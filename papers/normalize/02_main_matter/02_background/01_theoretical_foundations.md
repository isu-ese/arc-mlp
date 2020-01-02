<!-- ## Theoretical Foundations {#sec:foundations} -->

Context-free grammars are defined by $G=(V,\Sigma,P,S)$\cite{haoxiang_languages_1988}. $V$ is the set of non-terminal symbols, $\Sigma$ is the set of terminal symbols, $P$ is the set of productions, and $S \in V$ is the start symbol \cite{haoxiang_languages_1988}. Extended Backus-Naur Form (EBNF) is used to represent productions in this paper \cite{mccracken_backus-naur_2003}. Each production is written as $\Phi \rightarrow R$ where $\Phi$ is a non-terminal symbol and $R$ is an expression representing a rule. Each expression can be either a symbol, the empty string ($\epsilon$), or expressions combined with an operator.

The concatenation operator is represented by concatenating the operands (e.g. $\bnfpn{A} \bnfsp \bnfts{a}$). The alternation operator is represented by `|`  seperating its operands (e.g. $\bnfpn{A} \bnfor \bnfts{a}$). Parenthesis are used to delimit expressions when doing so prevents ambiguity (e.g. $\bnfpn{A} \bnfsp (\bnfts{a} \bnfor \bnfes)$). $\bnfpn{U}$pper case letters enclosed within angle brackets denote non-terminal symbols while lowercase symbols in \texttt{monospace font} denote terminal symbols.

ISLAND GRAMMARS

CHOMSKY Normalization and a couple others
 - Appropriate for parsing, not particularly so for merging
 - Doesn't treat associativity of operators specially which can result in multiple results.

