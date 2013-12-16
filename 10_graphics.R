x <- rnorm(100)
plot(x)

#Base graphics functions plot data directly to the graphics device
#Lattice graphics functions return an object of class trellis (print methods actually plot to graphics device)
#can't use base graphics functions with lattice (have to use lattice's functions)

library(nlme)
library(lattice)
xyplot(distance ~ age | Subject, data = Orthodont)
#plot distance vs. age conditioned on Subject for data set Orthodont

??Orthodont
o <- Orthodont

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)