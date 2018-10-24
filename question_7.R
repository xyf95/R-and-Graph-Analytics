library(igraph)

load("D:/blackboard/6444/project1/astrocollab.Rdata")
astrocollab <- upgrade_graph(astrocollab)
dg <- decompose.graph(astrocollab)

# largest connected graph index
lcgi <- 0

# largest connected graph vertices count
lcgvc <- 0

for (i in 1:length(dg)) {
  
  vc <- vcount(dg[[i]])
  
  if (vc > lcgvc) {
    
    lcgvc <- vc
    lcgi <- i
    
  }
  
}

# largest connected graph
lcg <- dg[[lcgi]]

# edge weights
w <- edge_attr(lcg)$weight

# largest edge
e <- which(w==max(w))

# author vector
a <- vector("character",20)

a[1] <- ends(lcg, E(lcg)[e])[1]
a[2] <- ends(lcg, E(lcg)[e])[2]

u <- union(adjacent_vertices(lcg, a[1:2])[[1]],adjacent_vertices(lcg, a[1:2])[[2]])

for (j in 3:20) {
  
  # largest diameter
  d <- 0
  
  for (i in 1:length(u)) {
    if (!(u[i]$name %in% a)) {
      # create a temporary subgraph
      tmpg <- induced_subgraph(lcg, c(a[1:j-1], u[i]$name))
      
      # compute its diameter
      n <- vcount(tmpg)
      td <- sum(distances(tmpg)) / (n * (n - 1))
      
      if (td > d) {
        d <- td
        a[j] <- u[i]$name
      }
    }
    
  }
  
  # update union set
  u <- union(u, adjacent_vertices(lcg, a[1:j])[[j]])
  
}

ldg <- induced_subgraph(lcg, a)

# shared authors
# e.g.:
# intersect(adjacent_vertices(lcg, a[1:20])[[1]]), adjacent_vertices(lcg, a[1:20])[[2]]))
sa <- c()

for (i in 1:(length(a)-1)) {
  
  r1 <- adjacent_vertices(lcg, a[1:20])[[i]]
  
  for (j in (i+1):length(a)) {
    r2 <- adjacent_vertices(lcg, a[1:20])[[j]]
    tmp <- intersect(r1, r2)
    sa <- union(sa, tmp)
  }
}
sa <- V(lcg)[sa]