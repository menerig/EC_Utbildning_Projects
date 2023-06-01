# Create the plot
plot(y = one_class$Age, x = one_class$Fare, pch = 20,
     main = "First-class Passengers - Fare paid by Age",
     xlab = "Fare", col = "brown",
     ylab = "Age")

# Previously calculated intercept and slope
a <- 39.61859339
b <- -0.03169847

# Draw line with  abline() function
abline(a, b, lty = 4, col= 'darkgreen')

