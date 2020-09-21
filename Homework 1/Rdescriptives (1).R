# R DESCRIPTIVES 
## PSYCH 613 2020, Dr. Adriene Beltz


# READ IN EMOTION DATA
## Set Working Directory
setwd("/Users/abeltz/Desktop/") #tell R where to look for file

## Read in Data 
data_file <- read.csv("emotion_data.csv", header=TRUE, sep=",") #read the file

emo_data <- data.frame(data_file) #convert file to a data frame 
emo_data
View(emo_data)

### Format gender as a factor
emo_data$gender <- factor(emo_data$gender, levels=c(0:1), labels=c("Female", "Male"))


# USE BASIC COMMANDS TO CREATE SUBSCALES
## Emotion Subscales
### Works because no missing data
emo_data$pos <- (emo_data$interes + emo_data$excited + emo_data$strong + emo_data$enthusi +
                   emo_data$proud + emo_data$alert + emo_data$inspire + emo_data$determi +
                   emo_data$attent + emo_data$active) / 10
emo_data$pos
emo_data$neg <- (emo_data[,5] + emo_data[,7] + emo_data[,9] + emo_data[,10] +
                   emo_data[,11] + emo_data[,14] + emo_data[,16] + emo_data[,18] +
                   emo_data[,21] + emo_data[,23]) / 10
emo_data$neg


# DESCRIPTIVE STATISTICS
## Measures of Central Tendency
### Mean and median the same for positive but not negative
mean(emo_data$pos, na.rm = TRUE)
?mean
median(emo_data$pos)
range(emo_data$pos)
max(emo_data$pos) - min(emo_data$pos)

mode(emo_data$pos) #does not work

x <- (emo_data$pos) #complicated; let's look for a package
sort(x)
names(table(x))[table(x)==max(table(x))]

## Install Package
#####install.packages("modeest")
library(modeest)

mfv(emo_data$pos)  #most frequent value

### Alternative package for estimating mode
#####install.packages("statip")
library(statip)
mfv1(emo_data$pos, na_rm=TRUE)

## Measures of Central Tendency and Beyond
#####install.packages("mnormt")
#####install.packages("psych")
library(psych)

describe(emo_data$pos)
?describe

# HISTOGRAMS
## Create Histograms with Varying Bins
hist(emo_data$pos)
hist(emo_data$pos, freq=FALSE)
hist(emo_data$pos, breaks=2)
hist(emo_data$pos, breaks=10)

### Advanced formatting
hist(emo_data$pos[emo_data$gender=="Female"],           
     main = "Positive Emotion Hisotgram",       #give graph a title
     xlab = "Positive Emotion Composite",       #modify axis label
     xlim = range(0:5),                         #modify axis range
     col = "orange")                            #add color


# BOXPLOTS
## Create Boxplots by Group
boxplot(emo_data$pos)
boxplot(emo_data$neg)
boxplot(emo_data$pos~emo_data$gender)

### Advanced formatting
boxplot(emo_data$pos ~ emo_data$gender, 
        col = "orange", 
        boxwex = .3,                              #make boxes narrower
        ylab = "Positive Emotion Composite",      #modify axis labels
        xlab = "Gender",    
        ylim = c(0,5))       
