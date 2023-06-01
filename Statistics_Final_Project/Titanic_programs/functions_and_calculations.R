# to remove NA values in Age category
mean_age <- as.integer(mean(titanic$Age, na.rm = TRUE))
titanic$Age[is.na(titanic$Age)] = mean_age

# Create separate dataframe of Titanic survivors
surv <- titanic[titanic$Survived == "Yes", ]

# Create separate dataframe of First Class passengers
one_class <- titanic[titanic$Pclass == "1", ]

# Function to find mean in a set of values
find_mode <- function(x){
  u <- unique(x)
  tab <- tabulate(match(x, u))
  u[tab == max(tab)]
}

# Simple function to calculate mean in a set of values
tit_mean <- function(x){
  sum(x) / length(x)
}

# Function I found to calculate median with a vector of values
tit_median <- function(x) {
  modulo <- length(x)%%2
  if (modulo == 0) (sort(x)[ceiling(length(x)/2)]+sort(x)[ceiling
                                                          (1+length(x)/2)])/2
  else sort(x)[ceiling(length(x)/2)]
}

# Simple way to calculate variance and standard deviation
titva <- (titanic$Age - mean(titanic$Age))^2
# Variation value
titvar <- sum(titva)/length(titva -1)
# standard deviation of Ages
sdtit <- sqrt(titvar)

# Calculates the coefficient of variation
coef_var <- (sdtit / mean(titanic$Age)) * 100

# Variance and standard deviation of ages of Titanic survivors
titsur <- (surv$Age - mean(surv$Age))^2
titsurv <- sum(titsur) / length(titsur - 1)
sdsurv <- sqrt(titsurv)

# Simple way of calculating the median of Titanic ages
titmedian <- sort(titanic$Age)
x <- (length(titmedian)+1) / 2
titmedian[x]

# Rather convoluted way of working out coefficients for least squares equation
x <- sum(one_class$Fare)
y <- sum(one_class$Age)
xy <- sum(one_class$Fare * one_class$Age)
x2 <- sum(one_class$Fare^2)
b_over <- (length(one_class$Age) * xy) - (x * y)
b_under <- length(one_class$Age)*x2 - x^2
# b is slope of equation
b <- b_over / b_under
# a is where line intersects with y axis
a <- mean(one_class$Age) - (b * mean(one_class$Fare))
