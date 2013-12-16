# Note that subsetting is really just a vector, eg. 1:4, 1, etc.

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[x > "a"] #defines index to return only elements that are greater than a (there is a lexical ordering to characters)
u <- x > "a" #create logical vector
x[u]

# sorting examples using the mtcars dataset
attach(mtcars)
# sort by mpg
newdata <- mtcars[order(mpg),]
# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]
#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),]

# List Subsetting:
x <- list(foo = 1:4, bar = 0.6); x
# double-bracket subsetting gives you back a single element of whatever class the element is
b <- x[[1]]; b; class(b)
c <- x$foo; c; class(c)
# single-bracket subsetting gives you back the same class as the original
# (in this case, returns a list that contains vector 1:4)
a <- x[1]; a; class(a)

# [[ can be used with computed indices:
name <- "foo"
x[[name]]
x$f #partial name matching "f" in "foo"

#Logical Subscripts
nums = c(12,9,8,14,7,16,3,2,9)
nums > 10
# returns logical vector:
# [1]  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
# we use this logical vector for subscripting below:
nums[nums>10]
# [1] 12 14 16
# for the closely related problem of finding indices of these elements, use R's which function:
which(nums>10)
# [1] 1 4 6
# to change the numbers that are greater than 10 to zero:
nums[nums>10] <- 0; nums
# [1] 0 9 8 0 7 0 3 2 9

# %in% operator: set all elements that are less than 6 equal to zero
x <- c(3,5,1,10,12,6); x[x %in% 1:5] <- 0; x

#union, intersection, setdiff
a <- c(1,2,3,4,5)
b <- c(2)
c <- c(6)
union(a,c)
intersect(a,b)
setdiff(a,b)