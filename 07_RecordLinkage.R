library(RecordLinkage)
data(RLdata500)
RLdata500[1:6, ]

#building comparison patterns
rpairs <- compare.dedup(RLdata500, identity = identity.RLdata500)
rpairs$pairs[1:5, ]

#blocking
rpairs <- compare.dedup(RLdata500, blockfld = list(1, 5:7), identity = identity.RLdata500)
head(rpairs$pairs)
rpairs$pairs[c(1:3, 1203:1204), ]

RLdata500[c(2, 43), ]

#phonetic and string comparators
rpairsfuzzy <- compare.dedup(RLdata500, blockfld = c(5,6), strcmp = TRUE)
rpairsfuzzy$pairs[1:5, ]

#stochastic record linkage
rpairs <- epiWeights(rpairs)
summary(rpairs)
str(rpairs)

getPairs(rpairs, 0.6, 0.55)

result <- epiClassify(rpairs, 0.55)
class(result)
summary(result)
result$pairs[1:5, ]

result2 <- classifyUnsup(rpairs, method = "kmeans")
summary(result2)

minTrain <- getMinimalTrain(rpairs)
minTrain <- editMatch(minTrain)