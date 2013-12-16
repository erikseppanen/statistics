# Key ideas
# Sometimes there are non-linear trends in data (not everything is well-represented by a straight line)
# We can use "smoothing" to try to capture these
# Still a risk of overfitting (it may be too curvy)
# Often hard to interpret (linear models are easier to understand in terms of coefficients)

#"time": event for person infected with HIV
#"cd4": count of type of blood cells that fights infection
cd4Data <- read.table("./cd4.data", col.names=c("time", "cd4", "age", "packs", "drugs", "sex", "cesd", "id"))
cd4Data <- cd4Data[order(cd4Data$time),]
head(cd4Data)

plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)

#Lowess (loess) LOcally-wEighted Scatterplot Smoothing
#note that loess makes decisions about how much smoothing to make
lw1 <- loess(cd4 ~ time,data=cd4Data)
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
lines(cd4Data$time,lw1$fitted,col="blue",lwd=3)

#SPAN allows you to control the decisions that loess makes
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1,ylim=c(500,1500))
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.1)$fitted,col="blue",lwd=3) # 10% of all the total data is used to calculate smooth value
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.25)$fitted,col="red",lwd=3) # 25%
lines(cd4Data$time,loess(cd4 ~ time,data=cd4Data,span=0.76)$fitted,col="green",lwd=3) # 76%

##### 
#SPLINES is another type of smoother. it's basically the output of multiple functions, added together
library(splines)
#calculate natural cubic splines (ns) for the time data
#df: degrees of freedom, which is the # of functions that will be applied to the time variable
# df is equal to about the polynomial that it would take to fit this type of data (3rd order polynomial in this case)
ns1 <- ns(cd4Data$time,df=3)
#results of ns is a matrix, where each column is one of the 3 functions
par(mfrow=c(1,3))
plot(cd4Data$time,ns1[,1])
plot(cd4Data$time,ns1[,2])
plot(cd4Data$time,ns1[,3])

#Regression with splines
 # we can include the splines in a lm (use spline matrix instead of covariates)
lm1 <- lm(cd4Data$cd4 ~ ns1)
summary(lm1)
par(mfrow=c(1,1))
plot(cd4Data$time,cd4Data$cd4,pch=19,cex=0.1)
points(cd4Data$time,lm1$fitted,col="blue",pch=19,cex=0.5)
