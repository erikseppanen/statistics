library(igraph)

# IMPORTANT NOTE: Unlike in most languages, R objects are numbered
# from 1 instead of 0, so if you want the first element in a
# vector, you would reference it by vector_name[1]. HOWEVER,
# igraph objects are numbered starting from 0. This can lead to 
# lots of confusion, since it's not always obvious at first which 
# objects are native to R and which belong to igraph. 

g <- graph.ring(10)
V(g)$number <- sample(1:100, vcount(g), replace=TRUE) #get 10 (10 vertexes=vcount) random samples that range from 1-100
V(g)$color <- "grey"
V(g)[ number < 50 ]$color <- "red"
plot(g, layout=layout.circle, vertex.color=V(g)$color, vertex.label=V(g)$number)

#useful function for printing all your environment info:
sessionInfo()