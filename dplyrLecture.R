library(dplyr)

#start with a built in dataset
data(starwars)
class(starwars)

#str(starwars) #dont do this since the list is huge and useless
glimpse(starwars) #more informative than str
head(starwars)

##Clean up our data
starwarsClean <- starwars[complete.cases(starwars[1:10]),] #subset the starwars by only keeping the complete cases from rows 1 through 10, and keeping all cases from the other rows

head(starwarsClean)


#Check for NAs

is.na(starwarsClean[1,1]) #check for NAs at a specific point
anyNA(starwarsClean) #efficiently see if there are any NAs without getting a huge list of Falses

anyNA(starwars[1:10,]) #there are NAs in the original dataset

##### filter(): pick/subset observations based on their values
### uses > >= < <= != == operators
### logical operators & | !

filter(starwarsClean, gender == "male", height < 180)
filter(starwarsClean, eye_color %in% c("blue", "brown"))
##Excludes NAs (unless you ask for them), but other rows can include NAs
filter(starwarsClean, gender == "male", height < 180, height > 100) #You can add multiple conditions
filter(starwarsClean, gender == "male", height > 180, height < 180) #Note this returns nothing because you have contradicting arguments





## arange(): reorders rows
arrange(starwarsClean, height) #order characters by height
arrange(starwarsClean, desc(height)) #reverse the order of arrangement

#tiebreak by adding more column names
arrange(starwarsClean, height, desc(mass)) #Tiebreak by decreasing mass

starwars1 <- arrange(starwars, height) #if you arrange by a colum with NAs, then all the rows with NAs in that column will be at the bottom
tail(starwars1)



### select(): choose variables by their name
glimpse(starwarsClean)
starwarsClean[1:10, ] # base R subsetting. (want first ten columns and all rows)

select(starwarsClean, 1:10)
select(starwarsClean, name: species) #want the rows from name through species
select(starwarsClean, -(films: starships)) #want all the rows except those from films to starships
select(starwarsClean, name:species)
select(starwarsClean, -(c(name, skin_color))) #rows you want or dont want dont have to be next to each other


# Moving columns around using select
select(starwarsClean, name, gender, species, everything()) #wantour first three columns to be name, gender, soecies, and then everything() gets the rest of the columns
select(starwarsClean, contains("color"))

###rename columns with select
select(starwars, haircolor = hair_color) #newName = oldName
###BUT THIS BRINGS ONLY THIS COLUMN NOT THE REST

### rename columns with rename
rename(starwarsClean, haircolor = hair_color) #newName= oldName





### mutate(): create new variables with functions of existing variables

starwarsClean <- mutate(starwarsClean, ratio = height/mass) #arithmetic operators
head(starwarsClean$ratio) #Look at first 6 ratio values

glimpse(starwarsClean)

starwars_pounds <- mutate(starwarsClean, mass_lbs = mass * 2.2)
head(starwars_pounds)

select(starwars_pounds, name:mass, mass_lbs, everything())

transmute(starwarsClean, mass_lbs = mass*2.2) #Just give us the column we create and nothing else




#### summarize() and group_by()

summarize(starwarsClean, meanHeight = mean(height)) #Gets you mean height for everyone

#### group_by() for more usefullness

starwarsGenders <- group_by(starwars, gender)
summarize(starwarsGenders, meanHeight = mean(height)) #this will give you NA back if ANY values in the calculation have NAs
summarize(starwarsGenders, meanHeight = mean(height, na.rm = TRUE)) #This will take the mean of only the ones that arent NA
summarize(starwarsGenders, meanHeight = mean(height, na.rm = TRUE), number = n()) #n() gives you sample size



#### Summarize groups via pipe
starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight = mean(height), TotalNumber = n())



