# imports
library(car) # for levene's
library(asd) # for dunnett's
library(ggpubr) # for nice graphs
library(nortest) # for anderson-darling test
library(PMCMRplus) # for steel test
library(pwr2) # power and sample size analysis
library(MASS) # boxcox procedure
library(lmPerm) # for permutation f-test
library(psych) # for scatterplot matrix
library(clinfun) # for Jonchheere-Terpstra Test
library(RColorBrewer) # for better colors
library(wesanderson) # for better colors

# read in data
setwd("/home/git/isuese/papers/arc-mlp/analysis/")
data <- read.csv2(file = "experiments-1-result.csv", header = T, sep = ",", as.is = T, quote = "\"")

# Separate Data out for MCC and HAL
dataHal <- subset(data, (data$dependent_variable == "HAL"))
dataMCC <- subset(data, (data$dependent_variable == "MCC"))

dataHal['sizeF'] <- as.factor(dataHal$size)
dataHal['stF'] <- as.factor(dataHal$similarity_threshold)
dataHal['deltaHAL'] = as.numeric(dataHal$trivial.HAL) - as.numeric(dataHal$full.HAL)

dataMCC['sizeF'] <- as.factor(dataHal$size)
dataMCC['stF'] <- as.factor(dataHal$similarity_threshold)
dataMCC['deltaMCC'] = as.numeric(dataMCC$trivial.MCC) - as.numeric(dataMCC$full.MCC)

y <- dataHal$deltaHAL
treatment <- dataHal$stF
block <- dataHal$sizeF
levels(treatment) <- c("1.0", "0.001", "0.25", "0.5", "0.75")
rcbd <- data.frame(y, block, treatment) # data-frame

y <- dataMCC$deltaMCC
treatment <- dataMCC$stF
block <- dataMCC$sizeF
levels(treatment) <- c("1.0", "0.001", "0.25", "0.5", "0.75")
rcbd2 <- data.frame(y, block, treatment) # data-frame

# Summary Statistics (aka Results)

## Stats
summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "small")))

summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "medium")))

summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "large")))

## Plots
### Histograms
hist(dataHal$deltaHAL, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta HAL", xlab="Delta HAL")

hist(dataMCC$deltaMCC, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta MCC", xlab="Delta MCC")

### Scatter plots of the data?
pairs.panels(rcbd,ellipse=F)

pairs.panels(rcbd2,ellipse=F)


### Box Plots of the data
ggboxplot(dataHal, x = "sizeF", y = "deltaHAL", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"))

ggboxplot(dataMCC, x = "sizeF", y = "deltaMCC", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"))

# Experiment 1 HAL

## Sample Size Analysis
ss.2way(a = 3, b = 5, alpha = 0.05, beta = 0.05, f.A = 10 , f.B = 10 , delta.A = 10, delta.B = 10, sigma.A =65000 , sigma.B = 84000, B = 1000)

## ANOVA Analysis
f1 <- aov(formula = dataHal$deltaHAL ~ dataHal$sizeF * dataHal$stF)
summary(f1)

f2 <- lm(dataHal$deltaHAL ~ dataHal$sizeF * dataHal$stF)
summary(f2)

## Check the Assumptions
### Diagnostic Plots
par(mfrow=c(2,2))
plot(f1)

### Interaction Plots
with(dataHal, (interaction.plot(stF, sizeF, deltaHAL, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta HAL", col = wes_palette(3, name = "Zissou1"))))

### Check the HOV Assumption using Levene's Test
leveneTest(dataHal$deltaHAL, dataHal$sizeF)

### Check the Normality Assumption using Anderson-Darling and Shapiro-Wilks Tests**
ad.test(x = dataHal$deltaHAL)
shapiro.test(x = dataHal$deltaHAL)

## Non-parametric methods

### Permutation F-Test
summary(aov(y~treatment*block, rcbd)) # parametric test for rcbd
summary(aovp(y~treatment*block, rcbd)) # permutation test for rcbd

### Steel's Multiple Comparison against Control
steelTest(y~treatment, data=rcbd, alternative="greater")

### Determining if there is an order among the treatment levels
levels(rcbd$treatment) <- c("0.001", "0.25", "0.5", "0.75", "1.0")
rcbd$treatment <- ordered(rcbd$treatment)
jonckheere.test(rcbd$y, rcbd$treatment, alternative = "increasing", nperm=10000)

## Power Analysis
# pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )

# Experiment 2 MCC

## Sample Size Analysis
ss.2way(a = 3, b = 5, alpha = 0.05, beta = 0.05, f.A = 10 , f.B = 10 , delta.A = 10, delta.B = 10, sigma.A =65000 , sigma.B = 84000, B = 1000)

## ANOVA Analysis
f1 <- aov(formula = dataMCC$deltaMCC ~ dataMCC$sizeF * dataMCC$stF)
summary(f1)

f2 <- lm(dataMCC$deltaMCC ~ dataMCC$sizeF * dataMCC$stF)
summary(f2)

## Check the Assumptions
### Diagnostic Plots**
par(mfrow=c(2,2))
plot(f1)

### Interaction Plots
with(dataMCC, (interaction.plot(stF, sizeF, deltaMCC, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta HAL", col = wes_palette(3, name = "Zissou1"))))

### Check the HOV Assumption using Levene's Test
leveneTest(dataMCC$deltaMCC, dataMCC$sizeF)

### Check the Normality Assumption using Anderson-Darling and Shapiro-Wilks Tests
ad.test(x = dataMCC$deltaMCC)
shapiro.test(x = dataMCC$deltaMCC)

## Non-parametric methods
### Permutation F-Test
summary(aov(y~treatment*block, rcbd2)) # parametric test for rcbd
summary(aovp(y~treatment*block, rcbd2)) # permutation test for rcbd

### Steel's Multiple Comparison against Control
steelTest(y~treatment, data=rcbd2, alternative="greater")

### Determining if there is an order among the treatment levels
levels(rcbd2$treatment) <- c("0.001", "0.25", "0.5", "0.75", "1.0")
rcbd2$treatment <- ordered(rcbd2$treatment)
jonckheere.test(rcbd2$y, rcbd2$treatment, alternative = "increasing", nperm=10000)

## Power Analysis
# pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )