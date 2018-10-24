astrocollab<-upgrade_graph(astrocollab)

degreenumber<-degree(astrocollab,mode="total")

sort(degreenumber,decreasing=TRUE)
