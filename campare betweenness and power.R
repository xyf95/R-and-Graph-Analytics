new_graph=delete.vertices(astrocollab,which(degree(astrocollab)<150))

result=eigen_centrality(new_graph)

result1=power_centrality(new_graph)

View(result$vector)

View(result1)
