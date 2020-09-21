# R SPINE OF STATISTICS 
## PSYCH 613 2020, Dr. Adriene Beltz


# READ IN EMOTION DATA
## Set Working Directory
setwd("/Users/abeltz/Desktop/") #tell R where to look for file

## Read in Data 
data_file <- read.csv("emotion_data.csv", header=TRUE, sep=",") #read the file

emo_data <- data.frame(data_file) #convert file to a data frame 

### Format gender as a factor
emo_data$gender <- factor(emo_data$gender, levels=c(0:1), labels=c("Female", "Male"))


# USE BASIC COMMANDS TO CREATE SUBSCALES
## Emotion Subscales
### Works because no missing data
emo_data$pos <- (emo_data$interes + emo_data$excited + emo_data$strong + emo_data$enthusi +
                   emo_data$proud + emo_data$alert + emo_data$inspire + emo_data$determi +
                   emo_data$attent + emo_data$active) / 10
emo_data$neg <- (emo_data[,5] + emo_data[,7] + emo_data[,9] + emo_data[,10] +
                   emo_data[,11] + emo_data[,14] + emo_data[,16] + emo_data[,18] +
                   emo_data[,21] + emo_data[,23]) / 10


#Z-SCORES
## Could Use Function
z.score = function(xi, variable){
  z = ((xi - mean(variable)) / sd(variable))
  return(z)
}

## Call the Function, Filling in Variables
### Comparing score to sample: xi is score, variable is sample data
sub_z <- z.score(4, emo_data$neg)
sub_z

## Could Use Scale Command to Standardize All Scores in Variable
### center = TRUE for centering 
### scale = TRUE for division by standard deviation
zScores<- scale(emo_data$neg, center = TRUE, scale = TRUE)
zScores

### Finding probability for z score on the z distribution
pnorm(sub_z)       


# CONFIDENCE INTERVALS
## Run Inferential Tests & Request CIs 

### For t-tests, get CI of the group difference 
t.test(emo_data$neg ~ emo_data$gender, var.equal = TRUE, conf.level = 0.95)

### For correlations, get CI of the correlation
cor.test(emo_data$neg, emo_data$pos, conf.level = 0.95)


# EFFECT SIZE
## Correlations are Already in r
## Cohen's d in New Package
#####install.packages("effsize")
library(effsize)
?cohen.d
cohen.d(emo_data$neg,emo_data$gender)   #CI is for the d


# BAR GRAPHS
barplot(emo_data$neg)         #barplot does not "analyze" data 
?barplot

## Create Features to Plot
nWomen <- length(which(emo_data$gender=="Female"))       #calculate the sample size for women
nMen <- length(which(emo_data$gender=="Male"))           #calculate the sample size for men
meanW <- mean(emo_data$neg[emo_data$gender=="Female"])   #calculate mean for women
meanM <- mean(emo_data$neg[emo_data$gender=="Male"])     #calculate mean for men
meanWM <- c(meanW, meanM)                                #combine means
stdW <- sd(emo_data$neg[emo_data$gender=="Female"])   #calculate standard deviation for women
stdM <- sd(emo_data$neg[emo_data$gender=="Male"])     #calculate standard deviation for men
stdMW <- c(stdW,stdM)
stdErrW <- sd(emo_data$neg[emo_data$gender=="Female"]) /sqrt(nWomen)    #calculate standard error for women
stdErrM <- sd(emo_data$neg[emo_data$gender=="Male"]) /sqrt(nMen)        #calculate standard error for men
stdErrMW <- c(stdErrW,stdErrM)

## Create Graph
bars<- barplot(meanWM, 
        xlab = "Gender", xpd = FALSE,        #label x-axis, start at minimum value  
        names.arg = c("Women", "Men"), 
        axisnames=TRUE,                      #label x-axis values
        col = c("red", "blue"), border = NA,              #color bars, remove borders
        ylab = "Negative Affect", ylim=c(1,5),            #label y-axis, set to range of scale
        main = "Gender and Negative Affect")              #add title

### Add standard deviation as error bars using arrows function
arrows(bars, meanWM - stdMW, bars, 
       meanWM + stdMW, lwd = 1.5,    #lwd sets linewidth
       angle = 90,                   #angle is between arrow head and line
       code = 3, length = 0.05)      #code=3 draws head at both ends of the arrow

### Run barplot function again to "clear" error bars

### Add standard error as error bars using arrows function
arrows(bars, meanWM - stdErrMW, bars, 
       meanWM + stdErrMW, lwd = 1.5, angle = 90,
       code = 3, length = 0.05)
