
## create a dataframe
gg4 <- ggplot(newimdb, aes(x=Genre, y=Gross, fill=Genre)) + 
## Call the boxplot function 
  geom_boxplot() +
## use genre as the organising principle
  xlab("Genre") +
## there is no legend as there wasn't room on the page
  theme(legend.position="none") +
  xlab("") +
  xlab("")+
  
  labs(title="Highest Grossing films by Genre")+
## changed the values on the y axis so they're easier to read and understand
scale_y_continuous(breaks=seq(0, 1000000000,200000000), 
                   labels = function(x){paste0(x/1000000,'Million')})

