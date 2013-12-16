# Generate a sample dataset
set.seed(1010)
df <- data.frame(replicate(6, sample(c(1:10, -99), 10, rep = T)))
names(df) <- letters[1:6]
head(df)

fix_missing <- function(x) { x[x == -99] <- NA; x; }

#pass in one column of the data frame, which essentially is a numeric vector
#since it is a numeric vector, x[x==-99] is just indexing it as a vector, and it works
df$a <- fix_missing(df$a)
#now, lapply takes each vector of the data frame and passes it to the function
df[] <- lapply(df, fix_missing)
#now just for some vectors of the data frame (columns)
df[1:5] <- lapply(df[1:5], fix_missing)

##### LIST OF FUNCTIONS

summary <- function(x) {
  funs <- c(mean, median, sd, mad)
  lapply(funs, function(f) f(x, na.rm = TRUE))
}

lapply(df, summary)

##### CLOSURES

power <- function(exponent) {
  function(x) x ^ exponent
}

square <- power(2)
square(2)
square(4)

cube <- power(3)
cube(2)
cube(4)

as.list(environment(square))
as.list(environment(cube))