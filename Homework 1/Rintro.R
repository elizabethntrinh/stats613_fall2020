# R INTRODUCTION 
## PSYCH 613 2020, Dr. Adriene Beltz


# COMMANDS
9
2+4
8-4
4*6
21/3
sqrt(64)

0:50
seq(0:50 by=2)  #This is incorrect; use help or ? to troubleshoot
help(seq)
?seq
seq(0,50, by=2)

print("Yay R!")


# VARIABLES & VECTORS
## Create Variable & Assign Values using <-
### The object is on the left, and the function is on the right
x <- 5
y <- 7
y
a <- b <- c <- 3

m <- "s"  #character 
m

L <- TRUE #logical
L

gender <- c(rep(0,5), rep(1,5))   #factor
gender

### R is case sensitive
x
X

### Use commands with variables
x + y
a - b
c * a - b     #parentheses matter
c * (a - b)   #parentheses matter
sqrt(y)
sum(x, y)

## Create Vector of Values or Characters
x <- c(2, 4, 6, 8, 9)   #overwrites x
x
x <- 5    #fixed x

n <- c(2, 4, 6, 8, 9, 2, 6, 9, 10, 1)
n

ID <- c("A", "B", "C", "D", "E",
        "F", "G", "H", "I", "J")  #combines characters and went on next line
ID

### Use commands
n^2
x + n
x + ID  #does not work because ID is not numeric

### Knowing variable types
is.numeric(ID)
typeof(ID)
class(ID)     #different ways to do similar things
is.vector(ID)

is.numeric(x)
typeof(x)
class(x)
is.vector(x)

is.numeric(L)
typeof(L)
class(L)
is.vector(L)

is.numeric(gender)  #uh oh; should be a factor
class(gender)
help(factor)
gender <- factor(gender, levels = c(0:1), labels = c("female", "male"))
gender

is.numeric(gender)
typeof(gender)
class(gender)
is.vector(gender)

## Identifying Values Within A Vector
n[3]    #value in the 3rd position in n
ID[1:3]   #value in the first three positions in ID

t <- c(n[3], ID[4])   #works, but makes 6 a character
t

### Participant F dropped out, and was replaced by participant K
ID <- ID[ID != "F"]
ID
ID2 <- c(ID, "K")
ID2

ID2 <- ID2[ID2 != "K"]    #Put K in the previous position of F
ID2
ID3 <- append(ID, "K", after = 5)
ID3


# DATAFRAMES 
## Create and Modify a Dataframe
data <- data.frame(ID3, gender, n)
data

View(data)    #view as a spreadsheet

scores <- c(14, 26, 5, 14, 31, 7, 16, 29, 41, NA) #new variable with missing value

data_new <- data.frame(data, scores)  #add a column to the dataframe
data_new

data_new2 <- data_new[, c(1,2,4,3)]    #reorder the columns
data_new2

data_new3 <- data_new2[c(2,1,3:10) ,]    #reorder the rows
data_new3

colnames(data_new3) <- c("ID", "gender", "scores", "correction") #change column names
data_new3

## Commands in Dataframes Matter 
data_new3$scores + data_new3$correction
?sum
sum(data_new3$scores, data_new3$correction, na.rm = TRUE)
