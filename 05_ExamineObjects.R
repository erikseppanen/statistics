#str = structure. compactly display the internal structure of an object. Alternative to summary

str(str) #what are the arguments for the str function (it takes an object)
str(ls) #what are the arguments for the ls function?

x <- rnorm(100, 2, 4) #generate normal random variables, 100 count, mean=2, std dev=4
mode(x)
# [1] "numeric"
class(x)
# [1] "numeric"
table(x) #returns like SQL's COUNT(DISTINCT)
summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -7.782  -0.687   2.051   1.829   3.958  11.690 
str(x)
# num [1:100] 4.36 2.96 4.12 4.67 -4.34 ...
# this means it's a 100 element numeric vector, and gives you the 1st 5 elements

#I made a function called rundown which does both str & summary:
source("../global.r")
rundown(x)

library(datasets)
head(airquality)
str(airquality)
