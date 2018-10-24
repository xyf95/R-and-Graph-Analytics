mynewgraph = delete.edges(astrocollab, which(E(astrocollab)$weight <= 1))
for (v in V(mynewgraph)) {
  edges <- incident(mynewgraph, v);
  vertex_attr(mynewgraph, "weight", index = c(v)) <- sum(edges$weight);
}
max_weight = max(V(mynewgraph)$weight)
max_weight
target_single_vertex_graph = induced.subgraph(mynewgraph, which(V(mynewgraph)$weight == max_weight))
V(target_single_vertex_graph)
