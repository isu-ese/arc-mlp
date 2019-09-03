## Data Collection Procedures {#sec:data_coll_proc}

![Data collection process for evaluating multilingual grammar islandization process.](images/paper/dc_pair.eps){#fig:dc_pair}

In this study, evaluating the effects of islandization and merging process to develop multilingual island grammars we use the process depicted in @fig:dc_pair. This process follows the path identified in @fig:dc_pair by the numbers encircled in orange, as follows:

1. Initially each grammar is loaded by the Grammar Loader and its data is extracted into the meta model depicted in @fig:model.
2. A lattice of all combinations of grammars is generated to evaluate the groupings of languages into island grammars.
2. The quality metrics from the quality model are measured on the grammar, and
3. stored in the database.
4. The grammar is then transformed using the *islandization*.
5. This requires that the interest configuration for that grammar be loaded.
6. The generated island grammar is then measured using the same metrics from step 2.
7. For the current combination approach, the set of grammars are then merged to generate a multilingual island grammar.
8. This grammar is then measured, using the same approach as in step 2, and the data is stored to the database.
9. For each grouping defined in the current partitioning of grammars, the IQR of the individual island grammars is measured, and stored to the database.
10. For the partitioning the average IQR is then calculated and stored to the database. This process restarts at step 1, until there are no partitions left.
11. Once all partitions have been processed, the data for all partitions is extracted into a data table ready for analysis.
