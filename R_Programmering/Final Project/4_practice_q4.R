## downloaded ggally package in order to create parallel coordinates
gg3 <- ggparcoord(rev_top100,
      ## the columns used the graph first, and genre as the gathering column
           columns = c(1,5,7,9), groupColumn = 6, order= "anyClass",
           showPoints = TRUE, 
           title = "Top 100 movies from scores to votes",
      ## alpha makes the lines somewhat transparent
           alphaLines = 0.3
) + 
  
  ## this was the theme and colour scheme I used.
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum()+
  theme(
    plot.title = element_text(size=10)
  )

