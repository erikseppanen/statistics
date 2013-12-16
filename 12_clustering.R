#hierarchical clustering (dendrograms)
library(datasets)
data(iris)
irisSubset <- data.matrix(iris[,1:4])
d <- dist(iris[,1:4])
hCl <- hclust(d)
plot(hCl)

#k-means clustering
a <- read.csv("https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv")
k2 <- kmeans(a[,2:3], centers=2)
k2
par(mar=rep(0.2,4))
plot(a$x, a$y, col=k2$cluster, pch=19, cex=2)
points(k2$centers, col=1:3, pch=3, cex=3, lwd=3)

#dimension reduction
library(ElemStatLearn)
data(zip.train)
# Create an image matrix for the 3rd row, which is a 4
im8 = zip2image(zip.train,8)
im18 = zip2image(zip.train,18)

svd8 <- svd(im8)
svd18 <- svd(im18)
#plot(svd8$u[,1], xlab="Row", ylab="First left singular vector", pch=19)
#plot(svd8$v[,1], xlab="Column", ylab="First right singular vector", pch=19)
par(mfrow=c(1,3))
image(im8)
plot(svd8$d, xlab="Column", ylab="Singular Value", pch=19)
plot(svd8$d^2/sum(svd8$d^2), xlab="Column", ylab="Percent of variance explained", pch=19)

par(mfrow=c(1,3))
image(im18)
plot(svd18$d, xlab="Column", ylab="Singular Value", pch=19)
plot(svd18$d^2/sum(svd18$d^2), xlab="Column", ylab="Percent of variance explained", pch=19)
