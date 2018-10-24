result = power_centrality(astrocollab, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 200))
result = power_centrality(new_graph, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 150))
result = power_centrality(new_graph, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 125))
result = power_centrality(new_graph, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 112))
result = power_centrality(new_graph, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 106))
result = power_centrality(new_graph, rescale = TRUE)

new_graph = delete.vertices(astrocollab, which(degree(astrocollab) < 105))
result = power_centrality(new_graph, rescale = TRUE)
