#' Add a progress bar to an iterable
#'
#' @description
#' Makes the object spawn a progress bar in response to indexing with `[[`
#' operator. Intended to be used with most iterators in R, e.g.:
#' [base::lapply()] and some of its cousins, [base::Reduce()],
#' [plyr::llply()], [purrr::map()], [foreach::foreach()]...
#'
#' @param object `ANY`\cr
#'  An iterable that should spawn a progress bar.
#' @param ... `ANY`\cr
#'  Additional parameters to be used in the future (e.g. progress bar
#'  customization).
#'
#' @return The original object with `aurrera_iter` class prepended that handles
#' progress bar display in response to indexing.
#'
#' @examples
#' result <- lapply(pb(6:20), gmp::factorize)
#'
#' Reduce(`+`, pb(sample(1e5, 1e4)))
#'
#' # Progress bar won't display when iterating with `for` loop
#' v <- character()
#' for (letter in pb(letters[1:5])) {
#'   v <- c(letter, v)
#' }
#' v
#'
#' # On the other hand, manual indexing works properly
#' x <- pb(letters[1:5])
#' for (i in seq_along(x)) {
#'   # Just be careful with printing inside a progress bar
#'   print(x[[i]])
#' }
#'
#' @export
pb <- function(object, ...) {
  UseMethod("pb")
}

#' @importFrom utils assignInMyNamespace
#' @rdname pb
#' @export
pb.default <- function(object, ...) {
  assignInMyNamespace(".PROGRESS_BAR", initialize_bar(object, ...))
  class(object) <- c("aurrera_iter", class(object))
  object
}

#' @rdname pb
#' @export
pb.aurrera_iter <- function(object, ...) {
  object
}
