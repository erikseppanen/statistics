# if (a) events are occuring independently in time
# and (b) the prob that an event occurs in a given length of time does not change through time,
# then X, the number of occurences in a fixed unit of time, has a Poisson dist
# remember: for Poisson, mean & variance are equal (lambda)

# multinomial distr (strongly related to binomial dist)
p <- c(6, 3, 1) #this is internally normalized to sum 1
r1 <- rmultinom(10, 1, p) #10 trials of 1 draw
r2 <- rmultinom(10, 3, p) #10 trials of 3 draws
d1 <- dmultinom(c(3,0,0), prob=p) #prob of drawing 3 1's (more probable)
d2 <- dmultinom(c(0,0,3), prob=p) #prob of drawing 3 3's (highly improbable)
d3 <- dmultinom(c(1,1,1), prob=p) #prob of drawing one of each

#NERD NOTE:  Which weapon is better, a 1d10 longsword, or a 2d4 oaken staff? 
#Sometimes the damage is written as 1-10 longsword and 2-8 quarterstaff. 
#However, these ranges disregard the greater likelihood of the quarterstaff 
#scoring 4,5,6 damage than 1,2,7,8. The longsword’s distribution 1d10 ~Uniform[1,10], while 2d4 looks like a Λ.
