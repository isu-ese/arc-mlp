## Data Collection Procedures {#sec:data_coll_proc}

![Data collection procedure.](images/paper/data_collect.eps){#fig:dc_proc}

Data collection is performed via the experiment execution system specifically developed for this study. This system is depicted in @fig:dc_proc and is controlled via the control files created during the experimental unit selection process.

The data collection process follows the activity diagram depicted in @fig:dc_proc, as follows. First, the control file is read into the system and stored in an ordered list construct. Next, for each of the triples in the list, the following occurs: 1.) The selected similarity threshold value is applied. 2.) The grammars located, read in, and trivially merged together. 3.) The combined grammar's effort or complexity is then measured and recorded. 4.) The normalization process is executed. 5.) The grammar is then normalized using our technique. 6.) The final merging process is applied resulting in the final grammar. 7.) The resulting grammar's effort or complexity is then measured and recorded.

Once all experimental units have been processed the results are exported to a data table. The results from multiple replications of each experiment are then combined into a single data table. Finally, the data table is then used during the analysis phase.
