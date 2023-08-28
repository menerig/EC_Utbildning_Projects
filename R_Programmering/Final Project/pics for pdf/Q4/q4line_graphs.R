##top100 <- newimdb[1:100, ]

##rev_top100 <- apply(top100, 2, rev)
##rev_top100 <- as.data.frame(rev_top100)



mov_line <- par(lty="dashed")
plot(rev_top100$rank, rev_top100$IMDB_Rating, ylim=range(5:10))
lines(rev_top100$rank, rev_top100$Meta_score, lty="solid")
