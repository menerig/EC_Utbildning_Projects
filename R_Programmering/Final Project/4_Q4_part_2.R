## create a scatterplot, with given x and y axis
gg <- ggplot(newimdb, aes(x= Released_Year, y= Gross))+
## legend is genre, with small size due to large number
geom_point(aes(col= Genre), size=1)+
## the labeling is as follows
  labs(title="IMDB top 100 Gross Returns",
     subtitle="From imdb dataset", y="Gross Returns",
     x="Year", caption="IMDB Demographics")+
## changes the values on x and y axis to make the data easier to understand
scale_x_continuous(breaks=seq(1920, 2020, 10))+
scale_y_continuous(breaks=seq(0, 1000000000,200000000), labels = function(x){paste0(x/1000000,'Million')})
 
#####################################################################  
  
gg2 <- ggplot(top100, aes(x=Meta_score, y=Gross)) +
  geom_point(aes(col=Genre))+
  labs(title="IMDB top 1000", subtitle="highest 100 imdb score", y="Gross Returns",
       x="Metascore", caption="IMDB Demographics")+
## Creates the text boxes around each element on the graph
    geom_text(
    label=top100$Series_Title,
## nudged slightly so the titles can be read more easily
    nudge_x = 0.5, nudge_y = 0.5,
    check_overlap = T)+
  scale_y_continuous(breaks=seq(0, 1000000000,200000000), 
                     labels = function(x){paste0(x/1000000,'Million')})

