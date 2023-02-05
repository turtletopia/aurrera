#' @export
`[[.aurrera_iter` <- function(x, i) {
  advance_bar(x, i)
  NextMethod()
}

#' @export
as.list.aurrera_iter <- function(x, ...) {
  pb(NextMethod())
}

#' @export
str.aurrera_iter <- function(object, ...) {
  cat(sprintf("<aurrera iterable [%i]>\n", length(object)))
  class(object) <- setdiff(class(object), "aurrera_iter")
  NextMethod()
}
