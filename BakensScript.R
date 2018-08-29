#### Introducing R with RStudio ####

## To send code to from a script to the console, click Run or use the shortcut Ctrl + Enter
## To run multiple lines of code at once, just highlight the lines you want and run (click Run or hit Ctrl+Enter)

## Anything after the pound symbol (#) is a comment, meaning R will ignore it when you run the code
## Comments are very useful for annotating and organizing code 

2+3*5-7 # 2 plus 3 times 5 - 7 should be 10
3*4
98-54
sqrt(5)

## To put several values into one vector, use the c() function
c() # concatenate, 5, 10, 20

## Can do functions on a vector
sqrt(c(5,10,20)) # outputs the sqrt of 5, 10, and 20 in a vector
sd(c(5,10,20))

## Assignment, the arrow (<-) is used to assign the object to the right of the arrow, to the name on the left
## Names can be anything! the only rules are that they can only contain numbers, letters, periods, or the underscore (_)
## and must start with either a letter or a period. NO SPACES!!
x <- c(5,10,20)
blah <- c(5,10,20)
blah.2 <- c(5,10,20)
blah_2 <- c(5,10,20)

## Many R commands are actually calling FUNCTIONS
## Functions always take arguments within parentheses, and arguments are separated by commas

sd(x)
sqrt(x)
mean(x)
sd(blah.2)
min(blah_2)

## Getting help!
## The help() function will take you to the R documentation for the function. The help page will show you
## what the function does, the arguments it takes, what it outputs, and some examples of using the function
help(sqrt)
?sqrt ## the question mark is a shortcut for the help() function
?sd

## Libraries
install.packages("ape") # Only needed once. Now all functions in that library are on your computer, 
# and all you have to do is load it into R when you open up a new R session
library(ape)
?ape

## Reading in and manipulating datasets
getwd()
setwd("/Users/ericabaken/Documents/Thesis/Data") # Hitting tab will populate and see what the options are
setwd("/Users/ericabaken/Documents/School/R resources/IntroToR")
Microhabitats <- read.csv("Microhabitat.csv")

# Object types
head(Microhabitats)
class(Microhabitats)
Microhabitats$Species
class(Microhabitats$Species)
Microhabitats$Species <- as.character(Microhabitats$Species)
Microhabitats$Species

# Subsetting
SemiAqSpecies <- subset(Microhabitats$Species, Microhabitats$ASorT == "S")
SemiAqSpecies

TerrestrialData <- subset(Microhabitats, Microhabitats$ASorT == "T")
TerrestrialData

TerrestrialData[1:4,]
TerrestrialData[,c(2,5)]
TerrestrialData[,c("AorT", "McEntire1")]
TerrestrialData[which(TerrestrialData$Species == "Bolitoglossa diaphora"),]

# Adding data
RandomData <- rnorm(nrow(Microhabitats))
Microhabitats$RandomNumbers <- RandomData
RandomData2 <- rnorm(nrow(Microhabitats), mean = 3, sd = .2)
Microhabitats$RandomNumbers2 <- RandomData2

# Exploring data
summary(Microhabitats$Species)
summary(Microhabitats$AorT)
str(Microhabitats)
min(Microhabitats$RandomNumbers)
length(Microhabitats$Species)

# Plotting
plot(Microhabitats$Classification)
hist(Microhabitats$RandomNumbers)
hist(Microhabitats$RandomNumbers, main = "Data Distribution", xlab = "Preferred Temperature of Apple Juice")
hist(Microhabitats$RandomNumbers, main = "Data Distribution", xlab = "Preferred Temperature of Apple Juice", breaks = 100)

plot(x= Microhabitats$RandomNumbers, y = Microhabitats$RandomNumbers2)
abline(v = 0, col = "red")

par(mfrow=c(1,2))
hist(Microhabitats$RandomNumbers, main = "Data1 Distribution", xlab = "Preferred Temperature of Apple Juice", breaks = 100)
plot(x= Microhabitats$RandomNumbers, y = Microhabitats$RandomNumbers2, main = "Data Correlation", xlab = "Preferred Temperature of Apple Juice", ylab = "Preferred Amount of Apple Juice")
  abline(v = 0, col = "red")
par(mfrow=c(1,1))

# T-tests
t.test(Microhabitats$RandomNumbers ~ Microhabitats$AorT)

# Google is your very best friend