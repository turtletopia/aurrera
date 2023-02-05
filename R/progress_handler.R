.PROGRESS_BAR <- NULL

#' @importFrom utils txtProgressBar
initialize_bar <- function(object, ...) {
  structure(
    txtProgressBar(min = 0, max = length(object), ...),
    pb_length = length(object)
  )
}

#' @importFrom utils getTxtProgressBar setTxtProgressBar
advance_bar <- function(object, i) {
  setTxtProgressBar(.PROGRESS_BAR, getTxtProgressBar(.PROGRESS_BAR) + 1)
  if (getTxtProgressBar(.PROGRESS_BAR) == attr(.PROGRESS_BAR, "pb_length", exact = TRUE)) {
    close(.PROGRESS_BAR)
    assignInMyNamespace(".PROGRESS_BAR", NULL)
  }
}
