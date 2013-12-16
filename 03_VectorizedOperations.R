############ VECTOR OPERATIONS ########
#Intead of having to loop through elements, 
# you can use Vectorized Operations

x <- 1:4; y <- 6:9; x; y;
x + y # add the vectors together, returns a new vector
x * y
x / y
x > 2
x >= 2
y == 8

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2); x; y; #rep(10, 4) replicate 10 four times
x * y
x / y
x %*% y #true matrix multiplication

az <- letters #vector of a - z
paste(az, " ") #add space after each letter in vector

############ R FUNCTIONAL PROGRAMMING EXAMPLES ###########

married <- c("Yes","Yes","No","No","Yes","Yes","No","Yes","No","Yes"); married

#define function that converts a string ("Yes" or "No") to a (1 or 0)
ToBinary <- function(x) {switch(x, Yes = 1, No = 0)}

#sapply: apply a function over a list or vector
marriedToBits <- sapply(married, ToBinary); marriedToBits

mean(marriedToBits); #percentage of married people

??apply

#ANOTHER EXAMPLE:
# create a matrix of 10 rows x 2 columns
m <- matrix(1:20, 10, 2)

# mean of the rows
apply(m, 1, mean) #margin=1 means apply function over rows (1), not columns (2)

# mean of the columns
apply(m, 2, mean)

# divide all values by 2
apply(m, 1:2, function(x) x/2)

############## plyr ###################
library(MASS);data(crabs)
head(crabs)
library(plyr)
#GROUPBY crabs data frame by sp & sex columns .(sp,sex), then print out sample of each grouping (head(x))  
d_ply(crabs, .(sp,sex), function(x) print(head(x)))

#d_ply (take data frame and discard results)
#ddply (take data frame and return data frame)

#iris dataframe: each column is a vector, which is passed to function "class"
#lapply applies a function (eg., class) over a list (eg., iris dataframe [remember a dataframe is a list])
lapply(iris, class)

#it returns a list of classes (one for each column in iris)
x <- lapply(iris, class)
#which we pass as arguments to the concatenate function (c), which makes it a character vector
y <- do.call(c, x) 

##### MULTI-DIMENSIONAL ARRAYS ####
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
