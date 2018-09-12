# Explain what the heck this script is. What is it doing? What project is it associated with? Give as many details as possible so that you will understand later on what this is from!

# 6 September 2018
# SFR

#------------------------------------------------------------
# Preliminaries
library(ggplot2)
set.seed(100)
library(TeachingDemos)
char2seed("this function creates a seed based on a phrase. Heckin cool!", set = FALSE)

#char2seed("green tea", set = FALSE)

# Global variables
nRep <- 10000 # number of values

# Create or read in data
ranVar1 <- rnorm(nRep) #create nRep random variables from the standard normal distribution

#ranVar1 <- rnorm(n=nRep, mean=10, sd=3) #Can explicitly set parameters as well
#print(ranVar1) #Print is fine as long as the thing your printing isnt huge

# Peek at the data
head(ranVar1) # prints first six
tail(ranVar1) # prints last six values
length(ranVar1)
str(ranVar1) # structure of the variable. Like type and stuff
# Might also want to use the console to peek at data

# Create second variable
ranVar2 <- rnorm(nRep)

#Visualize data
qplot(x=ranVar2)
qplot(x=ranVar2,
      color = I("black"),
      fill = I("goldenrod"))



