ReadVector <- function() ##function to read values into a vector
{ 
  x <- 0
  myvector = vector()
  while(x<11) {
    n <- readline(prompt="Input day temperature: ")
    myvector = c(myvector,n)
    x <- x+1
  } 
  return (as.integer(myvector))
}

## algorithm to calculate minimum value
minimum <- function(x){
  min <- x[1]       ## asign minimum to first value
  for (i in 2:length(x)) {
    if(x[i]< min)
      min <- x[i]      ##change minimum value if next element is smaller
  }
  return(min)
}

## algorithm to calculate minimum value
maximum <- function(x){
  max <- x[1]      ## asign maximum to first value
  for (i in 2:length(x)) {
    if(x[i]> max)
      max <- x[i]       ##change maximum value if next element is smaller
  }
}

## algorithm to calculate mean value  
mean_me <- function(x){
  sum <- x[1]     ## first element is added into vector
  for (i in 2:length(x)) {
    sum <- sum + x[i]    ## all subsequent elements are added to the former
  }
  mean_me <- sum/length(x)   ##divide sum by number of elements in vector
  return(mean_me)   
}

## created 10 vectors on 10 values (it would be 30 in the real example)
temp1 <- rep(0, 10)    ## created values so the name of each vector could be changed in the inital command
temp2 <- rep(0, 10)
temp3 <- rep(0, 10)
temp4 <- rep(0, 10)
temp5 <- rep(0, 10)
temp6 <- rep(0, 10)
temp7 <- rep(0, 10)
temp8 <- rep(0, 10)
temp9 <- rep(0, 10)
temp10 <- rep(0, 10)
## Create a dataframe of all ten cities' temperatures
df <- data.frame(temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, stringsAsFactors = FALSE)

## A loop where user data is taken in and stored in a dataframe
for (i in 1:10) {
  name <- readline(prompt="Enter city name: ")
  names(df)[i] <- name
  print(paste("Enter temperatures for each day for ", names(df)[i]))
  df[ ,i] <- ReadVector() ## function to take in multiple values
}

## A loop to generate max, min & mean for all entered temperatures
for (i in 1:10) {
  maxi <- maximum(df[ ,i])
  cat(paste("\nThe maximum value in column",i,"is",maxi,"\n"))
  mini <- minimum(df[ ,i])
  cat(paste("\nThe minimum value in column",i,"is",mini,"\n"))
  meani <- mean_me(df[ ,i])
  cat(paste("\nThe mean value for column",i,"is", meani,"\n"))
}

## Loop doing the same thing above but using inbuilt 'R' functions
for (i in 1:10) {
  maxi <- max(df[ ,i])
  cat(paste("\nThe R maximum value in column",i,"is",maxi,"\n"))
  mini <- min(df[ ,i])
  cat(paste("\nThe R minimum value in column",i,"is",mini,"\n"))
  meani <- mean(df[ ,i])
  cat(paste("\nThe R mean value for column",i,"is", meani,"\n"))
}
