#' Wrap an interable in a progress bar
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
  class(object) <- c("sp_iterable", class(object))
  object
}

#' @rdname pb
#' @export
pb.sp_iterable <- function(object, ...) {
  object
}
