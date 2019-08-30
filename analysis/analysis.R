# Basic Plots of data
# Box plot with multiple groups
# +++++++++++++++++++++
# Plot tooth length ("len") by groups ("dose")
# Color box plot by a second group: "supp"
ggboxplot(data, x = "sizeF", y = "nHal", color = "stF",
          palette = c("red", "green", "blue", "orange", "cyan"))
ggline(data, x = "nHal", y = "sizeF", color = "stF",
       add = c("mean_se", "dotplot"),
       palette = c("red", "green", "blue", "orange", "cyan"))

# Dunnett's Test
dunnett.test()

# Power Analysis
pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )
