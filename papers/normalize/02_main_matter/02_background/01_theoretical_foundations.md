## Theoretical Foundations {#sec:foundations}

Context-free grammars are defined as $G=(V,\Sigma,P,S)$, where $V$ is the set of non-terminal symbols, $\Sigma$ is the set of terminal symbols, $P$ is the set of productions, and $S$ is the start production [@haoxiangLanguagesMachinesIntroduction1988].

Island Grammars are a type of grammar designed for extracting out features of interest. Island Grammars are composed of two types of rules: land/island rules which identify the features of interested, and water rules which are catch all rules for everything that is not of interest [@moonenGeneratingRobustParsers2001]. Island grammars are advantageous to regular grammars for several reasons, including being easier/faster to write, lower complexity, and better tolerance of errors in the input [@moonenGeneratingRobustParsers2001]. Because of this, island grammars have been used for the development of multilingual parsers [@synytskyyRobustMultilingualParsing2003].

In this paper, we evaluate the normalization process of SIGMA. SIGMA uses a unique 