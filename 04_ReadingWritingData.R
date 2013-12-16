y <- data.frame(a = 1, b ="a"); y

#dput takes R object, and creates some R code that will reconstruct the object in R
# this is useful for "serializing" a data type, which can be pasted in an R script for easy reproducibility
dput(y)
# structure(list(a = 1, b = structure(1L, .Label = "a", class = "factor")), .Names = c("a", "b"), row.names = c(NA, -1L), class = "data.frame")

#or the serialized object could be saved to a file:
dput(y, file = "y.R") #write object out to file
new.y <- dget("y.R") #read object back in
new.y