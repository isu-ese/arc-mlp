## Algorithms

This subsection details the algorithms used in our approach to construct and evaluate multilingual island grammars. Herein we detail three algorithms: the first is defines the approach to constructing multi-lingual island grammars, the second a naive approach to combining grammars (simply for comparison), and the third defines a method to generate sets of interest components. We begin with our multilingual island grammar generation algorithm.

### Grammar Meta-Model {-}

!widefig(![Metamodel for grammars from [@http://zotero.org/users/1776655/items/62I6AWPB].](images/paper/model.eps){#fig:model})

The generation of multilingual island grammars begins with the loading of grammars into memory. Due to the fact that their are multiple formalisms for describing grammars and even more file formats available, we have developed a unifying model to represent grammars in memory. This model is depicted in @fig:model. The model centers around the concept of a grammar which is the composition of a set of productions representing the non-terminal symbols and their derivation rules. Each production is then a composition of rules, where rules represent the body of a production. Each rule also represents the different options for deriving a non-terminal symbol in the grammar. Rules are then an aggregation of a set of symbols, which can either be terminal, non-terminal, or symbol groups. Non-terminal and Terminal symbols are managed via an implementation of the Flyweight design pattern [@http://zotero.org/users/1776655/items/458QBQAK]. Symbol groups are can then either represent a repetition of a set of alternations or a set of optional alternations. An alternation is then a set of symbols.

Surrounding these basic grammar concepts are the utilities used to manipulate and measure the grammar. These include the GrammarLoader which is used to load an individual grammar from its file representation into memory. This is achieved using a parser and parser listener for the given grammar representation language. Finally, controlling all of this is the CommandLineInterface which handles execution of the system as well as interpreting the arguments fed to the program via the Main class and the command line.

### Multilingual Island Grammar Generation {-}

!latex
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\begin{algorithm}[tb]
 \caption{Multilingual Island Grammar Generation (MIGG)}\label{multi-ig}

 \begin{algorithmic}[1]
   \algrenewcommand{\algorithmiccomment}[1]{// #1}
   \Procedure{Inject}{$persist$, $extern$, $efferent$}
   \Comment{Mark each Interest item in productions of $\mathcal{G}$}
   \ForAll{$i \in \mathcal{I}$}

   \EndFor
   \Comment{Create fresh start, water, and island productions in $\mathcal{G}'$}
   \State $\mathcal{S} \longrightarrow (\mathcal{W}\*\,\mathcal{I}+)+$
   \State $\mathcal{G}' \longleftarrow (\mathcal{V},\Sigma,\mathcal{P},\mathcal{S})$
   \Comment{Construct Island Production, $\mathcal{I}$}
   \ForAll{$p \in $\Call{Marked}{$\mathcal{G}$}}

   \EndFor
   \Comment{Construct Water Production, $\mathcal{W}$}
   \ForAll{$p \notin $\Call{Marked}{$\mathcal{G}$}}

   \EndFor
   \State $\mathcal{W} \longleftarrow $ \Call{reduceAndMerge}{$\mathcal{W}$}
   \State \Return{$\mathcal{G}'$}
   \EndProcedure
 \end{algorithmic}

\end{algorithm}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Naive Island Grammar Generation {-}

The experiment detailed in @sec:exp_design is designed to evaluate the results of applying the previous algorithm to a grammar. In order to evaluated its effect we are in need of a control treatment which acts as if nothing was effectively applied. In this case, we need some means by which we can combine multiple grammars together into a single grammar, but leave them intact. Thus, we have developed what we call the *Naive Island Grammar Generation* algorithm, depicted in @lst:nmigg. This algorithm is quite simple in its operation. In lines 2--4 of the algorithm the three set components, $V,\Sigma,P$ are constructed via a union across the same components of each of the grammars to be combined. In line 5 of the algorithm, a start production is constructed for the new grammar and its body is the unioned set of start symbols from all combined grammars separated by alternation symbols. Finally, in lines 6 and 7 the new grammar is constructed as a tuple of initial components and then returned as the results of the algorithm.

!latex
~~~~
\begin{algorithm}[tb]
 \caption{Naive Island Grammar Generation}\label{lst:nmigg}

 \begin{algorithmic}[1]
   \Procedure{NaiveGen}{$\mathcal{G}$}
    \LineComment Initilize components of Island Grammar to be combinations of components of input grammars
    \State $V \longleftarrow \bigcup_{g \in \mathcal{G}} V_g$
    \State $\Sigma \longleftarrow \bigcup_{g \in \mathcal{G}} \Sigma_g$
    \State $P \longleftarrow \bigcup_{g \in \mathcal{G}} P_g$
    \LineComment Create fresh start production as alternation among input grammar starts
    \State $S \longleftarrow \bigcup_{g \in \mathcal{G}} S_g$
    \LineComment Construct and return the grammar
    \State $G' \longleftarrow (V, \Sigma, P, S)$
    \State \Return $G'$
   \EndProcedure
 \end{algorithmic}
\end{algorithm}
~~~~

### Interest Configuration Generation {-}

Key to the creation of an Island Grammar is the set of interested components. As part of the design of the approach to generate island grammars we developed a model to represent these sets. This also included the definition of an XML schema to represent these concepts outside of the code. The underlying model for these is depicted in @fig:interest.

![Interest Configuration Model](images/paper/interests.eps){#fig:interest}

As part of the experiment detailed in @sec:exp_design we need the ability to generate interest configurations for each grammar. We have developed a simple algorithm, depicted in @lst:interest, to do just that. The algorithm takes two parameters $G$ the initial grammar and $n$ the number of interest components to extract. Using this information, the algorithm constructs an empty list, $P$ which is then filled with the non-terminal symbols of the grammar. This list is then randomly shuffled and the top $n$ are selected and returned.

!latex
~~~~
\begin{algorithm}[tb]
 \caption{Interest Configuration Generation}\label{lst:interest}

 \begin{algorithmic}[1]
   \Procedure{Generate}{$G$, $n$}
   \State $P \longleftarrow [\,]$
   \State $P \longleftarrow G.\Sigma / G.S$
   \State \Call{Shuffle}{$P$}
   \State \Return $P[1..n]$
   \EndProcedure
 \end{algorithmic}
\end{algorithm}
~~~~
