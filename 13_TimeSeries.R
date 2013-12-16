library(xts)
#create a time series
prices <- c(132.45, 130.85, 130.00, 129.55, 130.85)
dates <- as.Date(c("2010-01-04", "2010-01-05", "2010-01-06", "2010-01-07","2010-01-08"))
ibm.daily <- zoo(prices, dates)

#simple manipulations
print(ibm.daily)
coredata(ibm.daily)
index(ibm.daily)
ibm.daily[2]
ibm.daily[2:4]

#add another time series
prices <- c(3, 31, 54)
dates <- as.Date(c("2010-01-05", "2010-01-06", "2010-01-08"))
apl.daily <- zoo(prices, dates)

##### DEMONSTRATE MERGE ####
#merge time series by date. This is like an outer join on day (union).
merge(ibm.daily, apl.daily)
#intersection instead of union
merge(ibm.daily, apl.daily, all=FALSE)

##### UPLIFT ####
#create empty time series
dates <- seq(from=as.Date("2010-01-01"), to=as.Date("2012-01-01"), by="month")
#seed <- c(0, rep(NA, length(dates)-1))
empty <- xts(,dates)
# seed <- zoo(0, as.Date("2009-12-01"))
# seeded <- cbind(empty, seed)  

e <- as.Date(c("2010-04-01", "2011-01-01"))
u <- c(0.6, 0.3)
uplift <- xts(u, e)

merged <- merge(empty, uplift)
merged[1] <- 0
locf <- na.locf(merged)

#merged[is.na(merged)] <- 0
# for (i in length(merged)){
#   merged[i] <- max(merged[i], merged[i+1])
# }

# merged + lag(merged, -1)

# rollapply(merged, 3, function(x) sum(x), align="left")


x <- c(0.5, 0.6); x
x[1] <- 1

tmp = zoo(rnorm(100), 1:10)
rollapply(tmp, 2, function(x) sum(x), align="right")
