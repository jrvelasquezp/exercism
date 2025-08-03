# this is a stub function that takes a natural_number
# and should return the difference-of-squares as described
# in the README.md
sum_of_squares <- function (natural_number) {
  if (natural_number > 0) {
    result <- (natural_number ^ 2) + sum_of_squares(natural_number - 1) 
  }
  else {
    result <- 0
  }
  return(result)
}

sum_of_n <- function (natural_number) {
  if (natural_number > 0) {
    result <- natural_number + sum_of_n(natural_number - 1) 
  }
  else {
    result <- 0
  }
  return(result)
}

difference_of_squares <- function(natural_number) {
  return((sum_of_n(natural_number))^2 - sum_of_squares(natural_number))
}
