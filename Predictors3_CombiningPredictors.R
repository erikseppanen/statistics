# You can combine classifiers by averaging/voting
# Combining classifiers improves accuracy
# Combining classifiers reduces interpretability

# Basic intuition - majority vote
# Suppose we have 5 completely independent classifiers
# If accuracy is 70% for each:
# - 10 × (0.7)3 (0.3)2 + 5 × (0.7)4(0.3)2 + (0.7)5
# - 83.7% majority vote accuracy
# With 101 independent classifiers
# - 99.9% majority vote accuracy

# Approaches for combining classifiers
# 1. Bagging (see previous lecture)
# 2. Boosting (not covered in this class)
# 3. Combining different classifiers (we'll do this now)

################ create simlulated dataset (from scratch)
library(devtools)
install_github("medley","mewo2")
library(medley)
library(tree)

set.seed(453234)

y <- rnorm(1000)
#generate different x values based on y, all in different crazy ways
x1 <- (y > 0); x2 <- y*rnorm(1000)
x3 <- rnorm(1000,mean=y,sd=1); x4 <- (y > 0) & (y < 3)
x5 <- rbinom(1000,size=4,prob=exp(y)/(1+exp(y)))
x6 <- (y < -2) | (y > 2)
data <- data.frame(y=y,x1=x1,x2=x2,x3=x3,x4=x4,x5=x5,x6=x6)
train <- sample(1:1000,size=500)
trainData <- data[train,]; testData <- data[-train,]

#basic model 1
#fit linear model
lm1 <- lm(y ~., data=trainData) # . indicates all the remaining variables
#use predict to plug testData into the model, and use rmse to compare the outputs to the actual testData values
rmse(predict(lm1,data=testData),testData$y) 
# (the smaller the rmse, the better the predictor)
#basic model 2
#use a tree model now, and do the same thing
tree1 <- tree(y ~., data=trainData)
rmse(predict(tree1,data=testData),testData$y)
#basic model 3
#take a bootstrapped sample and use a tree model on that
tree2 <- tree(y~., data=trainData[sample(1:dim(trainData)[1]),])

#let's combine models explicitly, to illustrate the concept:
#basic combine models 1
combine1 <- predict(lm1,data=testData)/2 + predict(tree1,data=testData)/2
rmse(combine1,testData$y)
#basic combine models 2
combine2 <- (predict(lm1,data=testData)/3 + predict(tree1,data=testData)/3 + predict(tree2,data=testData)/3)
rmse(combine2,testData$y)

#now, let's use medley package to do the same thing (much easier):
library(e1071)
library(randomForest)
x <- trainData[,-1]
y <- trainData$y
newx <- testData[,-1]

#blending models (part 1)
m <- create.medley(x, y, errfunc=rmse);
for (g in 1:10) {
  m <- add.medley(m, svm, list(gamma=1e-3 * g));
}

#blending models (part 2)
for (mt in 1:2) {
  m <- add.medley(m, randomForest, list(mtry=mt));
}
m <- prune.medley(m, 0.8);
rmse(predict(m,newx),testData$y)
