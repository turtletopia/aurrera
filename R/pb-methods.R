#' @export
`[[.sp_iterable` <- function(x, i) {
  advance_bar(x, i)
  NextMethod()
}

#' @export
as.list.sp_iterable <- function(x, ...) {
  pb(NextMethod())
}

#' @export
str.sp_iterable <- function(object, ...) {
  cat(sprintf("<aurrera iterable [%i]>\n", length(object)))
  class(object) <- setdiff(class(object), "sp_iterable")
  NextMethod()
}
