fileUrl <- "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt"
download.file(fileUrl, destfile="earthquake.csv")
eData <- read.csv("earthquake.csv")

dim(eData)
names(eData)
nrow(eData)
quantile(eData$Lat)
summary(eData)
str(eData)
unique(eData$Src)
length(unique(eData$Src)) #number of unique values
colSums(); rowSums(); rowMeans(); colMeans(eData$VAL, rm=TRUE) #etc

table(eData$Src) #can do this to get counts of factor variable

table(eData$Src, eData$Version) #another way of displaying counts

#ANY earthquakes at latitudes larger than 40?
any(eData$Lat > 40)
all(eData$Lat > 40) #can test for ALL too!


