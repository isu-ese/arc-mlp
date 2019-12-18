## Data Collection Procedures {#sec:data_coll_proc}

![Activity diagram showing locations in the merging process where metrics are gathered.](images/paper/data_collect.eps){#fig:dc_proc}

Data collection is performed via the experiment execution system specifically developed for this study. This system is controlled via the control files created during the experimental unit selection process. The data collection process follows the activity diagram depicted in @fig:dc_proc.

Initially, the control file is read into the system. Then, for each of the triples in the list, the following occurs: 1.) The selected similarity threshold value is applied. 2.) The grammars located, read in, and trivially merged together. 3.) The combined grammar's effort or complexity is then measured and recorded. 4.) The final merging process is applied resulting in the final grammar. 5.) The resulting grammar's effort or complexity is then measured and recorded.

Once all experimental units have been processed the results are exported to a data table. This process is repeated for each replication of each experiment. The results from each replication of each experiment are then combined into a single data table. The combined data table is then used during the analysis phase.
