#might have column names with numbers, like Location.1, and you want to make it easier to deal with:
cameraData <- c("test", "Location", "identity.1", "this_too") 
splitNames <- strsplit(cameraData, "\\.") #split on periods

splitNames[[2]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

sub("_", "", cameraData) #replaces the first occurence
gsub("_", "", "this_is_a_test") #replaces all occurences

#Quantitative varibles in ranges: cut()
d <- c(12, 24, 54, 11, 3, 44, 89, 20, 34, 9)

#this basically turns the number into a factor identifying which interval it falls into
ranges <- cut(d, seq(0, 100, by=25)); ranges

#count them now
table(ranges, useNA="ifany")

library(Hmisc)
r2 <- cut2(d, g=3); r2
table(r2, useNA="ifany")

#can add this as a new variable to dataframe
