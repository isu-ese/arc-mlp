## Experimental Units {#sec:subjects}

This section describes the methods of subject sampling and group allocation. For the purposes
of this experiment the experimental subjects are grammars representing software languages. Furthermore,
as we are concerned with evaluating MIGG from the perspective of creating static and dynamic analysis tools,
we have imposed the following restrictions on the types of grammars we are interested in:

* A Grammar may be considered a viable case, if it contains a minimum of 15 different productions.

  **Rationale:** the grammar should be more than a simple toy grammar.

* A Grammar may be considered a viable case, if it defines a known and oft used programming language.

  **Rationale:**

With these restrictions in mind we decided to utilize the Grammar Zoo [@http://zotero.org/users/1776655/items/2728FAY2] collection as initial pool from
which to select our grammars. Grammar Zoo (at the time of this writing) contains 1029 entries consisting
of grammars for a variety of programming languages. With the exception of a few languages most in the
collection represent languages currently used in practice by Software Engineers (e.g., Java, Python, Haskell,
Dart, etc.).

As noted in @sec:design we will need 612 individual grammars to conduct this experiment. These grammars are selected as follows:
Initially, 604 grammars are randomly selected from the initial 1029 grammars in Grammar Zoo using a simple random sampling approach.
This set is then randomly partitioned into 3 subsets of 104 grammars representing each of the individual replications of the experiment. Within
each replication, the grammars are randomly assigned to treatment groups based on the Size(G) characteristic. For each of the treatment
groups, a Size(I) level is assigned. Based on this value, a new Interest Configuration for each of the languages is generated using the
Interest Configuration generation algorithm presented in @sec:approach. Finally, each treatment group is randomly assigned a generation
approach for use in the evaluation process.
