# Basic properties of atomic vectors in R
# 13 September 2018
# SFR


#Use assignment operator
x <- 5 #preferred way to do this
x #You can print a variable to console by just calling the bare variable
print(x) #using the print statement is better tho
typeof(x) #simple way to tell type of variable
str(x) # gives you more info about a variable than typeof()
is.numeric(x)
is.character(x)


# building one dimensional vectors
# the combine function
z <- c(3.2, 5, 5, 6)
str(z)
z <- c(c(3,4),c(5,6)) #Flattens vectors
print(z)

# vectors of character strings
z <- c("perch",  "bass", "red snapper", 'trout')
print(z)

#use single or double with embedded quotes
z <- c("this is 'one' strong", 'and another')
print(z)

#logical (True/false) variables
z <- c(TRUE, TRUE, FALSE)

# variable names
z <-3 #short, but not informative

# properties of vectors:

# 1) type
z <- c(1.1, 2, 3, 4)
typeof(z)
is.character(z)
is.integer(z)


# 2) length of atomic vector
length(z)
#length(y) #non-existent variables have no length

# 3) names
z <- runif(5) #pronounced "R Unif" short for R uniform 
# names not initially assisnged
names(z)
names(z) <- c("chow", "pug", "beagle",
              "greyhound", "akita")    #Note that in R you are allowed to type on multiple lines, usually)
print(z)

#or add names when variable is created

z2 <- c(gold=3.3, silver=10, lead=2)
print(z2) 
names (z2) <- NULL #strip off the names
print(z2) 
names(z2) <- c("red", "green")
print(z2)
# names do not have to be distinct
names(z2) <- c("red", "red")
print(z2)


#Special data types
#NA values for missing data
z <- c(3.2, 3.2, NA)
typeof(z)
typeof(z[3]) #NA values get assigned the type of the stuff around them
z1 <- NA
typeof(z1) #NAs will automatically get assigned a logical type with no other context

# NA values carry through for entire vectors
is.na(z)
!is.na(z)
mean(z) #cannot make calculation
mean(!is.na(z)) #converts true and false vectors into ones and zeroes



#Three features of atomic variables
# 1) coercion
a <- c(2, 2.0)
typeof(a)
b <- c("purple", "green")
d <- c(a,b)
print(d) 
typeof(d)

# coercion order: ( -> means "gets converted to")
# logical -> integers -> doubles -> character

a<- runif(10)
print(a)
a > 0.5 
aboolean <- a > 0.5 # vector of logicals
sum(a)
sum(aboolean) #the number of elements for which a>0.5 
sum(a > 0.5) #adding and coercing a logical

z <- vector(mode = "numeric", length = 0)
print(z)
z <- c(z, 5)
print (z)


#better to preallocate vector space

z <- rep(0, 100)
str(z)
head(z)
tail(z)

# start with NAs

z <- rep(NA, 100)
head(z)
typeof(z)

z[2] <- "Adams"
head(z)
typeof(z)

# efficiently add names to an atomic vector

myVector <- runif(100)
head(myVector)
myNames <- paste("Species", seq(1: length(myVector)), sep="")
head(myNames)
tail(myNames)
names(myVector)
names(myVector) <- myNames
head(myVector)

# use rep() function to repeat elements and vector

rep(0.5, 6)
rep(x=0.5, times=6)

myVec <- c(2, 4, 1)
rep(x = myVec, times= 2)
rep(x = myVec, each= 2) # repeat each ELEMENT twice, instead of the whole vector twice
rep(x=myVec, times = myVec) 
rep(x=myVec, each = myVec) #repeated using the first element of what was put in the each, in this case it used the first element of myVec which is 2 so it repeated everything 2 times


# use seq() to create regular sequences
seq(from = 2, to=4)
2:4  #this is the same thing as using the seq function
seq(from = 2, to=4, by=0.5)
seq(from = 2, to=4, length = 7)
1:length(myVec) #this is slow and can cause problems if the vector is empty
seq_along(myVec) #slightly faster than the thing above but same thing
seq_len(5)


#quickly creating random numbers

runif(5) # 5 uniform values between [0,1]
runif(n=3, min = 100, max = 110)

rnorm(6) # mean0, sd1

rnorm(n=3, mean=100, sd=10)

# sample from an atomic vector

longVec <- LETTERS[1:10]
print (longVec)
sample(longVec) #reordering
vecTreat <- c(rep("control", 5), rep("Treatment", 5))
sample(vecTreat)
sample(x = longVec, size = 3)
# sample(x=longVec, size=16) #sample without replacement is default so this is an error
sample(x=longVec, size=16, replace=TRUE)
myWeights <- c(rep(20, 5), rep(100, 5))
sample(x=longVec, replace=TRUE, prob=myWeights)
sample(x=longVec, replace=FALSE, prob=myWeights)

