# split-apply-combine (like SQL GROUP BY or MapReduce)

# install.packages("plyr") #run this if you don't have the package already
library(plyr)

#make some example data
dd <- data.frame(matrix(rnorm(216),72,3), #3 columns of 72 rows of random normalized values
                 c(rep("A",24),rep("B",24),rep("C",24)), #24 rows of A, B, C = 72 rows total
                 c(rep("J",36),rep("K",36))) #36 rows of J, K = 72 rows total
colnames(dd) <- c("v1", "v2", "v3", "dim1", "dim2")
str(dd); summary(dd)

#ddply: accepts dataframe (d) and returns dataframe (d), therefore ddply
ddply(
  dd, #input dataframe 
  c("dim1","dim2"), #group by dim1, dim2 (this is a character vector)
  transform, #transform returns the original df, along with the aggregate below (as a new column). results are not aggregated.
  mean = mean(v1)) #apply this function to each of the groups (works the aggregates, like COUNT or SUM on GROUPS)

#another one:
ddply(
  dd, #input dataframe 
  .(dim1, dim2),  # . is a plyr function that quotes variables. 
                  # here's one more way, which is as a formula: ~dim1+dim2
  summarise,
  count=nrow(dd),
  mean=mean(v1), #if there are NA's, pass in na.rm=TRUE
  median=median(v1),
  not_na_count=sum(!is.na(v1)) #count NA's
  )

