## Theoretical Foundations {#sec:foundations}

<<<<<<< Updated upstream
Context-free grammars are defined as $G=(V,\Sigma,P,S)$, where $V$ is the set of non-terminal symbols, $\Sigma$ is the set of terminal symbols, $P$ is the set of productions, and $S$ is the start production \cite{haoxiangLanguagesMachinesIntroduction1988}. In this paper, we use a modified syntax for productions $\Phi \rightarrow R$. $\Phi$ is any non-terminal symbol and $R$ is a rule. Rules can be either a symbol, $\epsilon$ (the empty string), rules concatenated together, or rules unioned together with the $|$ operator. Rather than using multiple productions when a symbol can produce multiple rules, the rules are combined with the $|$ operator. For example productions normally written as 
\begin{bnf*}
    \bnfprod{A}{\bnfts{a}} \\
    \bnfprod{A}{\bnfts{b}}
\end{bnf*}
\noindent are written as the following instead 
\begin{bnf*}
    \bnfprod{A}{\bnfts{a} \bnfor \bnfts{b}}.
\end{bnf*}
=======
Context-free grammars are defined as $G=(V,\Sigma,P,S)$, where $V$ is the set of non-terminal symbols, $\Sigma$ is the set of terminal symbols, $P$ is the set of productions, and $S$ is the start production \cite{haoxiangLanguagesMachinesIntroduction1988}. In this paper, a subset of Extended Backus-Naur Form (EBNF) to represent productions \cite{mccracken_backus-naur_2003}. In each production $\Phi \rightarrow R$, $\Phi$ is a non-terminal symbol and $R$ is an expression representing what the non-terminal symbol can be expanded into. An expression can be either a non-terminal symbol, a terminal symbol or string, the empty string ($\epsilon$), expressions concatenated together, expressions separated with the $|$ operator, or an expression surrounded by parenthesis. The $|$ operator represents the union of sentences that can be expressed by each expression. The concatenation of expressions represents the sentences that can be formed by concatenating the sentences that each expression can form.
>>>>>>> Stashed changes

Various normal forms of grammars have been proposed by people. These normal forms have mainly been introduced to make parsing and manipulating grammars easier. The most used normal form is the Chomsky Normal Form (CNF) \cite{chomskyCertainFormalProperties1959}. Grammars are transformed into CNF and other normal forms through simple transformations which preserve the language of the grammar. Normal forms for finding and merging similar parts across grammars have not been designed.