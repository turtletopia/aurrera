initialize_bar <- function(object) {
  txtProgressBar(max = length(object))
}

advance_bar <- function(object, i) {
  bar <- attr(object, "simpleprogress_bar", exact = TRUE)
  setTxtProgressBar(bar, getTxtProgressBar(bar) + 1)
}
