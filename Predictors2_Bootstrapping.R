library(boot); data(nuclear)
#fit a linear model to the data and plot it
nuke.lm <- lm(log(cost) ~ date, data=nuclear)
plot(nuclear$date, log(nuclear$cost), pch=19)
abline(nuke.lm, col="red", lwd=3)

#illustrate basics concept of bootstrapping, which is:
# resample from our original sample 3 times, and note that slopes are different
par(mfrow=c(1,3))
for(i in 1:3){
  nuclear0 <- nuclear[sample(1:dim(nuclear)[1],replace=TRUE),]
  nuke.lm0 <- lm(log(cost) ~ date,data=nuclear0)
  plot(nuclear0$date,log(nuclear0$cost),pch=19)
  abline(nuke.lm0,col="red",lwd=3)
}

#instead of just 3 times, do this a 1000 times using the "boot" function:
# (which takes care of the resampling, etc)
# blue line is the true slope
par(mfrow=c(1,1))
bs <- function(data, indices,formula) {
  d <- data[indices,]
  fit <- lm(formula, data=d)
  return(coef(fit))
}
results <- boot(data=nuclear, statistic=bs, R=1000, formula=log(cost) ~ date)
plot(density(results$t[,2]),col="red",lwd=3)
lines(rep(nuke.lm$coeff[2],10),seq(0,8,length=10),col="blue",lwd=3)

