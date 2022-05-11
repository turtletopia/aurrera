#' @export
`[[.sp_iterable` <- function(x, i) {
  advance_bar(x, i)
  NextMethod()
}

#' @export
as.list.sp_iterable <- function(x, ...) {
  pb(NextMethod())
}
