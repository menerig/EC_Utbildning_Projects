##hot_imdb <- as.matrix(imdb_top_1000$IMDB_Rating, ncol= 100)
##hot_imdb <- matrix(hot_imdb, nrow= 100, ncol= 100)
##my_colours <- colorRampPalette(c("firebrick1", "gold"))
##heatmap(hot_imdb, col = my_colours(1000))

number_of_bar <- nrow(mydata)
angle <-  90 - 360 * (mydata$id-0.5) /number_of_bar

mydata$hjust<-ifelse(angle < -90, 1, 0)

mydata$angle<-ifelse(angle < -90, angle+180, angle)

# Start the plot
p <- ggplot(mydata, aes(x=as.factor(id), y=Meta_score)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  # This add the bars with a blue color
  geom_bar(stat="identity", fill=alpha("skyblue", 0.7)) +
  
  # Limits of the plot = very important. The negative value controls the size of the inner circle, the positive one is useful to add size over each bar
  ylim(-20,120) +
  
  # Custom the theme: no axis title and no cartesian grid
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm")      # Adjust the margin to make in sort labels are not truncated!
  ) +
  
  # This makes the coordinate polar instead of cartesian.
  coord_polar(start = 0) +
  
  # Add the labels, using the label_data dataframe that we have created before
  geom_text(data=mydata, aes(x=id, y=Meta_score+10, label=movie_name, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=1.5, angle= mydata$angle, inherit.aes = FALSE )+

geom_text(
  x = 500, y = 1.2,
  label = "Imdb top 100\nMetascore",
  family = "Roboto Mono Medium",
  size = 10,
  lineheight = 0.87,
  color = "grey60"
)