#' Wrap an interable in a progress bar
#'
#' @export
pb <- function(object) {
  UseMethod("pb")
}

#' @rdname pb
#' @export
pb.default <- function(object) {
  attr(object, "simpleprogress_bar") <- initialize_bar(object)
  class(object) <- c("sp_iterable", class(object))
  object
}
