# imports
library(car) # for levene's
library(asd) # for dunnett's
library(ggpubr) # for nice graphs
library(nortest) # for anderson-darling test
library(PMCMRplus) # for steel test
library(pwr2) # power and sample size analysis

# read in data
setwd("/home/git/isuese/papers/arc-mlp/analysis/")
data <- read.csv2(file = "experiments-result.csv", header = T, sep = ",", as.is = T, quote = "\"")

# Anova Analysis
rep0 <- subset(data, (data$repetition == 0))
rep1 <- subset(data, (data$repetition == 1))
summary(data)
data['sizeF'] <- as.factor(data$size)
data['stF'] <- as.factor(data$similarity_threshold)
data['nHal'] <- as.numeric(data$full.HAL)
data['deltaHAL'] = as.numeric(data$trivial.HAL) - as.numeric(data$full.HAL)
f1 <- aov(formula = data$deltaHAL ~ data$sizeF + data$stF)
summary(f1)

f2 <- lm(data$deltaHAL ~ data$sizeF + data$stF)
summary(f2)

# Friedman Test
friedman.test(rep0$deltaHAL,rep0$sizeF,rep0$stF)
friedman.test(rep1$deltaHAL,rep1$sizeF,rep1$stF)

# Q-Q Plots
par(mfrow=c(2,2))
plot(f1)

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

# Levene's Test for HOV
leveneTest(data$deltaHAL, data$sizeF)

# Normality Tests
ad.test(x = data$deltaHAL)
shapiro.test(x = data$deltaHAL)

# Dunnett's Test
dunnett.test()

# Power Analysis
pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )

# Size Analysis
ss.2way(a = 3, b = 5, alpha = 0.05, beta = 0.05, f.A = 10 , f.B = 10 , delta.A = 10, delta.B = 10, sigma.A =65000 , sigma.B = 84000, B = 1000)

# Steele's Test
steelTest()
