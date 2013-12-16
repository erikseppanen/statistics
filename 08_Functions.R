x <- c("a", "b", "c", "d")

for (i in seq_along(x)) {
  print(x[i])
}
for(letter in x) { 
  print(letter)
}

pow <- function(x = 4, n = 3) {
  x^n
}
pow()

library(datasets)
data(iris)
?iris

mean(iris[iris$Species=='virginica', 1])

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
split(mtcars$mpg, mtcars$cyl) #splits a vector (mpg) according to a factor [well, in this case coerced into] (cyl : 4,6, or 8)
sapply(split(mtcars$mpg, mtcars$cyl), mean) #powerful, kind of like group by cyl, mean(mpg)
sapply(split(mtcars$hp, mtcars$cyl), mean)
209.21429 - 82.63636

x <- matrix(rnorm(200), 20, 10) #200 random numbers in 20*10 matrix
apply(x, 1, quantile, probs=c(0.25,0.75)) #apply the quantile function, passing in its probs parameters

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}
z <- 10
f(3)

debug(ls)
ls

f1 <- gl(2,5); f1 #gl: generate factor levels
f2 <- gl(5,2); f2
interaction(f1, f2)