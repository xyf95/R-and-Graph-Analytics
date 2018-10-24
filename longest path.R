longestpath<-induced.subgraph(astrocollab,which(components(astrocollab)$membership==1))

result=dfs(longestpath,root=1,dist=TRUE)$dist

sort(result,decreasing = TRUE)
