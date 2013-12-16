################################ 5 CLASSES OF OBJECTS ######################

#numeric class
x <- 5
x #same as print(x) 'autoprint'. 
# Note that x is actually a numeric vector, where 1 is the first element of the vector [1] 5
mode(x); class(x)

#character class
msg <- "hello"
mode(msg); class(msg)

#integer class
i <- 1L # the L makes it an integer
#note that this is mode=numeric, class=integer
mode(i); class(i) 

#logical class
l <- TRUE
mode(l); class(l)

#complex class
c1 <- 1 + 4i
mode(c1); class(c1)

# Inf & NaN actually exist in R as numeric class!
result <- 1/0 #this creates Inf
result <- 0/0 #this creates NaN
result
class(result)

attributes(x) # objects can have attributes:
length(msg) 

################################ VECTORS ######################

x <- 1:20; x #creates a sequence from 1 to 20
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
# [18] 18 19 20
# the [1] here means that 1 is the first element, the [18] means that 18 is the 18th element

# you can (c)oncatenate types together into a vector
x <- c(0.5, 0.6); x

# create an empty vector of certain class
x <- vector("numeric", length=10); x

################################ ARRAYS ######################

# arrays are vectors with a dimension attribute (can have 1,2 or more dimensions)
x <- array(1:4, 4); x
class(x)
attributes(x)

# if we remove dimension part its no longer an array but just a vector
dim(x) <- NULL
attributes(x)
class(x)

################################ MATRICES ######################

# Matrices are vectors (aka 2D array) with a dimension attribute of rowcount and columncount
m <- 1:10; m #creates vector of 1 to 10
dim(m) <- c(2, 5); m # assigns vector m's dimension attribute (rows+cols) to the vector 
# this is interesting because it illustrates that a matrix is a vector whose elements
#  are arranged by the columns and rows specified by its dimension vector

m <- matrix(1:6, nrow=2, ncol=3); m # note that column 1 is filled in first, then column 2, etc.
attributes(m) # The dimension attribute itself is an integer vector of length 2 (nrow, ncol)
dim(m) #can also do this

#vectors can be column-bound or row-bound to create a matrix
x <- 1:3; x; 
y <- 10:12; y;
cbind(x,y)
rbind(x,y)

#we can create arrays with more dimensions than a matrix (which is a 2D array):
x <- array(c(1:24), c(2,3,4)); x; #2 rows, 3 columns, 4 "pages"

################################ LISTS ######################
# a list is like a vector of a set of vectors, and the vectors can be of different types
list(3, "a", TRUE, 1 + 4i) #these are are all vectors of length 1
# [[1]] [1] 3 - note that doublebrackets [[1]] is list element #1, which contains a vector of length 1

#lists can consist of vectors of varying lengths:
list(1:3, letters[seq(1,10)], TRUE, 1 + 4i)

################################ FACTORS (categorical data) ######################
# factors are for categorical data
charVector <- c("yes", "yes", "no")
factorVector <- factor(charVector) #turn character vector above into a factor vector
levels(factorVector) 
nlevels(factorVector) 
class(factorVector)
summary(factorVector)
#be careful when converting numeric factor to numeric vector-it will try to convert underlying vector instead!!
# so convert using this: as.numeric(as.character(factor))

################################ DATA FRAME (tabular data) ######################
# special type of list where every vector in the list is of equal length
# unlike matrices, data frames can store different classes of objects (like lists)
x <- data.frame(foo = 1:4, bar = c(T,T,F,F)); x
row.names(x) #data frame has a special attribute called row.names
names(x) 

# you might think this would be called col.names, but remember that a data frame is actually a list,
# which contains vectors, so we just ask for the names of the vectors (see below-names)

# MORE ON DATA FRAMES
mtcars # sample dataframe included in R
mtcars[1,2] #select element from 1st row, 2nd col
mtcars["Mazda RX4", "cyl"] #can select same element using row and column names
nrow(mtcars); ncol(mtcars); #num of rows & columns
head(mtcars) #just preview first few rows of data frame
help(mtcars) #help on this dataset in R documentation
??mtcars #search help for "mtcars"
mtcars$mpg #select mpg
plot(mtcars$mpg, mtcars$hp) #plot horsepower vs. mpg

################################ ALL R OBJECTS CAN HAVE NAMES ######################

# vectors
x <- 1:3; x; names(x); 
# can assign a vector of names as to a vector as the names attribute
names(x) <- c("foo", "bar", "norf"); x; names(x)
attributes(x) # names is actually an attribute

# lists
list(a=1, b=2, c=3) #lists can have names too

############ MATRIX TO DATA FRAME

my.array = array(0, dim=c(2,3,4), dimnames=list( d1=c("A1","A2"), d2=c("B1","B2","B3"), d3=c("C1","C2","C3","C4")) ) 
library(plyr) 
adply(my.array,1:3) 
