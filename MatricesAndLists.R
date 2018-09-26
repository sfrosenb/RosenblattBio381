# Basic operations on matrices and lists
#18 september 2018
#SFR

m <- matrix(data=1:12, 
            nrow=4,
            ncol=3) #dont actually need to specify both ros and columns as one is deterimned by the other and the length but this is just being explicit
print(m)
dim(m)
m <- matrix(data = 1:12,
            nrow =4,
            byrow=TRUE) #default is to fill one column at a time but this is by row
print(m)

#change dimensions
dim(m) <- c(6, 2)
print (m)
dim(m) <- c(4,3)
print(m)
nrow(m)
ncol(m)
length(m)

# add names
rownames(m) 
rownames(m) <- c("a", "b", "c", "d")
print(m)
colnames(m) <- LETTERS[1:ncol(m)]
print(m)
print(m[2,3]) #print the i=2,j=3 element of m
print(m[1:2, 2:3]) #print the first two columns of 2nd and 3rd rows
print(m[1:2,]) #print all of the first two rows
print(m[,2:3]) #print all the 2nd and 3rd columns
#print(m[,,]) #this would work if m was 3D
print(m[,-2:-3]) #he didnt talk abotu this but it works
rownames(m) <- paste("Species", LETTERS[1:nrow(m)], sep = "")
colnames(m) <- paste("Site", 1:ncol(m), sep = "")
print(m)
m["SpeciesD", "Site2"] #This is fuckin weird. Names sort of act like variables but you have more than one thing called by the same name

dimnames(m) <- list(paste("Site", 1:nrow(m), sep=""), 
                     paste("Species"
                           , letters[1:ncol(m)], sep = ""))

#t for transpose
print(t(m)) 

#adding rows or columns to the matrix
m2 <- t(m)
m2 <- rbind(m2, c(20, 20, 30, 40)) #stands for rowbind. Kinda slow so dont build your matrix like this but its fine for adding a couple rows

# I FUCKED UP SOMEWHERE AROUND HERE
# m2 <- rbind(m2, c(20, 20, 30, 40))
# print(m2)
# rownames(m2)
# rownames(m2)[4] <- "myFix"
# rownames(m2)[5] <- "myFixX"
# print(m2)
# m2["myFix", "Site1"]
# m2[c("myFix", "myFix2"), c("Site1", "Site4")]

# Introducing Lists

myList <- list(1:10,
               matrix(1:8, nrow=4, byrow=TRUE),
                      letters[1:3],
                      pi)
myList[4] #with lists, if you try to use single brackets, the thing that comes out is a list containing the item instead of just the item
#myList[4] - 3 #Cant subtract a number from a list
myList[[4]] - 3 #pulls out the value

#list of 10 elements is like a train with 10 cars
# x[5] is the fifth car in the train
# x[[5]] is the CONTENTS of the fifth car
# x[c(4,5,6)] a new train with 3 cars

myList[[2]] # in this case the contents of the car is another list
myList[[2]][3,2]

# naming list items

myList <- list(Tester=FALSE,
               littleM = matrix(1:9, nrow=3))
#myList2$littleM # prints entire matrix
myList$littleM[1,]

# unlist is a helpful function for lists!
#unRolled <- unlist(myList2) #unlist takes a list and trys to flatten it into an atomic vector. It also tries to coerce things into the same data type
#print(unRolled)

library(ggplot2)
yVar <- runif(10)
xVar <-runif(10)

myModel <- lm(yVar ~ xVar)
qplot(x=xVar, y=yVar)
print(myModel)
print(summary(myModel))
str(summary(myModel))
summary(myModel)$coefficients
summary(myModel)$coefficients[2,4]

# find what you want by unlisting the model summary

u <- unlist(summary(myModel))
u
mySlope <- u$coefficients2
myPValue <- u$coefficients8

mySlope
myPValue

# Data frame
# - a list of atomic vectors
# - all vectors(=columns) same length

#build a data frame from scratch

varA <- 1:12
varB <- rep(c("con", "LowN", "HighN", each =4))
varC <-runif(12)
dFrame <- data.frame(varA, varB, varC, stringsAsFactors=FALSE)
str(dFrame)
head(dFrame)

# add a row with rbind

newData <- list(varA=13, varB
                ="HighN", varC = 0.668)
print(newData)
str(newData)
dFrame <- rbind(dFrame, newData)
tail(dFrame)

#add a column to a data frame
newVar <- runif(13)
dFrame <- cbind(dFrame, newVar)
head(dFrame)

# build a data frame and a matrix with same structure
zMat <- matrix(data = 1:30, ncol=3, byrow=TRUE)
zDframe <- as.data.frame(zMat)

str(zMat)
str(zDframe)

head(zDframe)
head(zMat)

zMat[3,3]
zDframe[3,3] #alot of commands are the same between data frames and matrices

#column referencing
zMat[,2]
zDframe[,2]
zDframe$V2 #however dollar signs dont work for matrices but they do for data FRAAAAAAAAMES


# referencing single items
zMat[2]
zMat
zDframe[2]
zDframe[2]
zDframe["V2"]
zDframe$V2

#subscripting and dealing with missing data

set.seed(99)
z <- 1:10 # a simple sequence
z
z <- sample(z)
z
z < 4 #logical vector
z [z < 4] #subset vectORSSSS
which(z < 4) # get subscripts
z[which(z<4)] # this works the same as z[z<4] UNLESS YOU HAVE MISSING DATA

zD <- c(z, NA, NA)
zD
zD[zD <4]
zD[which(zD < 4)]

# use complete.cases to eliminate NA values. There are alot of ways to do this but gotellis says this one is the best

print(zD)
complete.cases(zD)
zD[complete.cases(zD)]

# use this to find missing slots
# now apply this to a matrix 

which (!complete.cases(zD))
# now apply this to a matrix

m<- matrix(1:20, nrow=5)
m[1,1] <- NA
m[5,4] <- NA
m

m[complete.cases(m),]

m[complete.cases(m[,c(1,2)]), ] #evaluate the complete cases only for columns one and two. 



