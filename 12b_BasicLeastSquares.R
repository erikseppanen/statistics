#Load Galton data
library(UsingR); data(galton)
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)
hist(galton$parent,col="blue",breaks=100)

#highlight MEAN in RED
hist(galton$child,col="blue",breaks=100)
meanChild <- mean(galton$child)
lines(rep(meanChild,100),seq(0,150,length=100),col="red",lwd=5)

#plot mid-parent vs child heights
plot(galton$parent,galton$child,pch=19,col="blue")

#just add a little noise (using jitter) (so that dots will be heavier where there are more dots being overlaid)
set.seed(1234)
plot(jitter(galton$parent,factor=2),jitter(galton$child,factor=2),pch=19,col="blue")

#Avg parent = 65in tall (avg child height ~66, indicated by short line)
plot(galton$parent,galton$child,pch=19,col="blue")
near65 <- galton[abs(galton$parent - 65)<1, ]
points(near65$parent,near65$child,pch=19,col="red")
lines(seq(64,66,length=100),rep(mean(near65$child),100),col="red",lwd=4)

#Avg parent = 71in tall (avg child height ~70, indicated by short line)
plot(galton$parent,galton$child,pch=19,col="blue")
near71 <- galton[abs(galton$parent - 71)<1, ]
points(near71$parent,near71$child,pch=19,col="red")
lines(seq(70,72,length=100),rep(mean(near71$child),100),col="red",lwd=4)

#fitting a line (lm=linear model function)
plot(galton$parent,galton$child,pch=19,col="blue")
lm1 <- lm(galton$child ~ galton$parent) 
lines(galton$parent,lm1$fitted,col="red",lwd=3)

#Plot what is leftover
par(mfrow=c(1,2))
plot(galton$parent,galton$child,pch=19,col="blue")
lines(galton$parent,lm1$fitted,col="red",lwd=3)
plot(galton$parent,lm1$residuals,col="blue",pch=19)
abline(c(0,0),col="red",lwd=3)

lm1 