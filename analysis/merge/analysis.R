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
library(cairoDevice) # for conversion to svg
library(wesanderson)
library(ggpubr)

# read in data
setwd("/home/rose/repos/arc-mlp/data/merge/")
data <- read.csv2(file = "experiments-1-result.csv", header = T, sep = ",", as.is = T, quote = "\"")

# Separate Data by experiment
# Separate Data out for MCC and HAL
dataHal <- subset(data, (data$dependent_variable == "HAL"))
dataMCC <- subset(data, (data$dependent_variable == "MCC"))

dataHal['sizeF'] <- as.factor(dataHal$size)
dataHal['stF'] <- as.factor(dataHal$similarity_threshold)
dataHal['deltaHAL'] = as.numeric(dataHal$trivial.HAL) - as.numeric(dataHal$full.HAL)

dataMCC['sizeF'] <- as.factor(dataHal$size)
dataMCC['stF'] <- as.factor(dataHal$similarity_threshold)
dataMCC['deltaMCC'] = as.numeric(dataMCC$trivial.MCC) - as.numeric(dataMCC$full.MCC)
treatment <- dataMCC$stF

deltaHAL <- dataHal$deltaHAL
simThreshold <- dataHal$stF
size <- dataHal$sizeF
levels(treatment) <- c("1.0", "0.001", "0.25", "0.5", "0.75")
rcbd <- data.frame(deltaHAL, simThreshold, size) # data-frame

deltaMCC <- dataMCC$deltaMCC
simThreshold <- dataMCC$stF
size <- dataMCC$sizeF
levels(treatment) <- c("1.0", "0.001", "0.25", "0.5", "0.75")
rcbd2 <- data.frame(deltaMCC, simThreshold, size) # data-frame

# Summary Statistics (aka Results)
## Stats
summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "small")))

summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "medium")))

summary(subset(dataHal$deltaHAL, (dataHal$sizeF == "large")))

summary(subset(dataMCC$deltaMCC, (dataMCC$sizeF == "small")))

summary(subset(dataMCC$deltaMCC, (dataMCC$sizeF == "medium")))

summary(subset(dataMCC$deltaMCC, (dataMCC$sizeF == "large")))

## Plots
# Histogram of the data
svg("hal_hist.svg")
hist(dataHal$deltaHAL, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta HAL", xlab="Delta HAL")
dev.off()
svg("mcc_hist.svg")
hist(dataMCC$deltaMCC, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta MCC", xlab="Delta MCC")
dev.off()

hist(dataHal$deltaHAL, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta HAL", xlab="Delta HAL")
hist(dataMCC$deltaMCC, breaks = 15, col=wes_palette(1, name="Moonrise3"), main="Histogram of Delta MCC", xlab="Delta MCC")

# Scatter plots of the data?
svg("hal_scatter.svg")
pairs.panels(rcbd,ellipse=F)
dev.off()
svg("mcc_scatter.svg")
pairs.panels(rcbd2,ellipse=F)
dev.off()

pairs.panels(rcbd,ellipse=F)
pairs.panels(rcbd2,ellipse=F)

# Box Plots of the data
svg("hal_box.svg")
ggboxplot(dataHal, x = "sizeF", y = "deltaHAL", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"), 
          xlab = "Size",
          ylab = "DeltaHAL")
dev.off()
svg("mcc_box.svg")
ggboxplot(dataMCC, x = "sizeF", y = "deltaMCC", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"), 
          xlab = "Size",
          ylab = "DeltaMCC")
dev.off()

ggboxplot(dataHal, x = "sizeF", y = "deltaHAL", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"), 
          xlab = "Size",
          ylab = "DeltaHAL")
ggboxplot(dataMCC, x = "sizeF", y = "deltaMCC", color = "stF",
          palette = wes_palette(n=5, name="Zissou1"), 
          xlab = "Size",
          ylab = "DeltaMCC")

# Experiment 1 HAL
## Sample Size Analysis
ss.2way(a = 3, b = 5, alpha = 0.05, beta = 0.05, f.A = 10 , f.B = 10 , delta.A = 10, delta.B = 10, sigma.A =65000 , sigma.B = 84000, B = 1000)

## ANOVA Analysis
f1 <- aov(formula = dataHal$deltaHAL ~ dataHal$sizeF * dataHal$stF)
summary(f1)

f2 <- lm(dataHal$deltaHAL ~ dataHal$sizeF * dataHal$stF)
summary(f2)

## Check the Assumptions
# Diagnostic Plots
svg("ex1_qqplots.svg")
par(mfrow=c(2,2))
plot(f1)
par(mfrow=c(1,1))
dev.off()
par(mfrow=c(2,2))
plot(f1)
par(mfrow=c(1,1))

# Interaction Plots
svg("ex1_interaction.svg")
with(dataHal, (interaction.plot(stF, sizeF, deltaHAL, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta HAL", col = wes_palette(3, name = "Zissou1"))))
dev.off()
with(dataHal, (interaction.plot(stF, sizeF, deltaHAL, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta HAL", col = wes_palette(3, name = "Zissou1"))))

# Check the HOV Assumption using Levene's Test
leveneTest(dataHal$deltaHAL, dataHal$sizeF)

# Check the Normality Assumption using Anderson-Darling and Shapiro-Wilks Tests
ad.test(x = dataHal$deltaHAL)
shapiro.test(x = dataHal$deltaHAL)

## Non-parametric methods
# Permutation F-Test
summary(aov(deltaHAL~simThreshold*size, rcbd)) # parametric test for rcbd
summary(aovp(deltaHAL~simThreshold*size, rcbd)) # permutation test for rcbd

# Steel's Multiple Comparison against Control
steelTest(deltaHAL~simThreshold, data=rcbd, alternative="greater")

# Determining if there is an order among the treatment levels
levels(rcbd$simThreshold) <- c("0.001", "0.25", "0.5", "0.75", "1.0")
rcbd$simThreshold <- ordered(rcbd$simThreshold)
jonckheere.test(rcbd$deltaHAL, rcbd$simThreshold, alternative = "decreasing", nperm=10000)

## Power Analysis
pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )

# Experiment 2 MCC
## Sample Size Analysis
ss.2way(a = 3, b = 5, alpha = 0.05, beta = 0.05, f.A = 10 , f.B = 10 , delta.A = 10, delta.B = 10, sigma.A =65000 , sigma.B = 84000, B = 1000)

## ANOVA Analysis
f1 <- aov(formula = dataMCC$deltaMCC ~ dataMCC$sizeF * dataMCC$stF)
summary(f1)

f2 <- lm(dataMCC$deltaMCC ~ dataMCC$sizeF * dataMCC$stF)
summary(f2)

## Check the Assumptions
# Diagnostic Plots
svg("ex2_qqplots.svg")
par(mfrow=c(2,2))
plot(f1)
par(mfrow=c(1,1))
dev.off()
par(mfrow=c(2,2))
plot(f1)
par(mfrow=c(1,1))

# Interaction Plots
svg("ex2_interaction.svg")
with(dataMCC, (interaction.plot(stF, sizeF, deltaMCC, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta MCC", col = wes_palette(3, name = "Zissou1"))))
dev.off()
with(dataMCC, (interaction.plot(stF, sizeF, deltaMCC, type="b", pch = c(18, 24, 22), leg.bty = "o", main="Interaction Plot of Similarity Threshold and Grammar Size", xlab = "Similarity Threshold", ylab = "Delta MCC", col = wes_palette(3, name = "Zissou1"))))

# Check the HOV Assumption using Levene's Test
leveneTest(dataMCC$deltaMCC, dataMCC$sizeF)

# Check the Normality Assumption using Anderson-Darling and Shapiro-Wilks Tests
ad.test(x = dataMCC$deltaMCC)
shapiro.test(x = dataMCC$deltaMCC)

## Non-parametric methods
# Permutation F-Test
summary(aov(deltaMCC~simThreshold*size, rcbd2)) # parametric test for rcbd
summary(aovp(deltaMCC~simThreshold*size, rcbd2)) # permutation test for rcbd

# Steel's Multiple Comparison against Control
steelTest(deltaMCC~simThreshold, data=rcbd2, alternative="greater")⎄

# Determining if there is an order among the treatment levels
levels(rcbd2$simThreshold) <- c("0.001", "0.25", "0.5", "0.75", "1.0")
rcbd2$simThreshold <- ordered(rcbd2$simThreshold)
jonckheere.test(rcbd2$deltaMCC, rcbd2$simThreshold, alternative = "decreasing", nperm=10000)

## Power Analysis
pwr.2way(a = 3, b = 5, alpha = 0.05, size.A = 5, size.B = 3, f.A = NULL, f.B = NULL, delta.A = , delta.B = , sigma.A = , sigma.B = )