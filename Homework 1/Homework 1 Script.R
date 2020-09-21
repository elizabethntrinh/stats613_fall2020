## Note, I am using Git but otherwise I would set Wwrking directory

## Read in Data  
data_file <- read.csv("weather.ads.csv", header=TRUE, sep=",") #read  file
 
weather_data <- data.frame(data_file) #convert file to a data frame 

 ### Format weather as a factor
weather_data$weather <- factor(weather_data$weather, levels=c(0:1), labels=c("Gloomy", "Sunny"))
print(weather_data)

## Subsets
gloomyOnly <- subset (weather_data, weather == "Gloomy")
sunnyOnly <- subset (weather_data, weather == "Sunny")

## For missing data, I can use na.rm=TRUE. 
## I could also delete missing values and create a new dataset without missing values using 
## newdata <- na.omit(weather_data)

## Descriptive statistics, Measures of Central Tendency
mean(weather_data$study_points, na.rm = TRUE) ## mean
median(weather_data$study_points, na.rm = TRUE) ## median

x <- (weather_data$study_points)
sort(x)
names(table(x))[table(x)==max(table(x))]
## library(modeest) - Install.packages("modeest"), but not working 
## mfv(weather_data$study_points)

## Finding mode
## install.packages("modeest")
## library(modeest)
## mlv(weather_data$study_points, method = "mfv")
y <- table(weather_data$study_points)
y
names(y)[which(y==max(y))]

sort(weather_data$study_points)
names(table(weather_data$study_points))[table(weather_data$study_points)==max(table(weather_data$study_points))]
Y
install.packages("statip")
library(statip)
mfv1(weather_data$study_points, na_rm=TRUE)

## Missing cases
table(is.na(weather_data$study_points))
sum(is.na(weather_data$study_points))

## Measures of central tendency and beyond
## install.packages("mnormt")
## install.packages("psych")
## library(psych)
## describe(weather_data$study_points)

## Creating histograms
hist(weather_data$study_points)
hist(weather_data$study_points, freq=FALSE)
hist(weather_data$study_points, breaks=8,
  main = "Study Points Histogram",
  xlab = "Study Points"
)

## Skewness and kurtosis
install.packages("moments")
library(moments)
a <- table(weather_data$study_points)
skewness(a)
kurtosis(a)


## Boxplot 
boxplot(weather_data$study_points)
boxplot(sunnyOnly)