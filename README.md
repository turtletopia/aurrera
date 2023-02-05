
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aurrera

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/aurrera)](https://CRAN.R-project.org/package=aurrera)
[![R-CMD-check](https://github.com/turtletopia/aurrera/workflows/R-CMD-check/badge.svg)](https://github.com/turtletopia/aurrera/actions)
[![Codecov test
coverage](https://codecov.io/gh/turtletopia/aurrera/branch/master/graph/badge.svg)](https://app.codecov.io/gh/turtletopia/aurrera?branch=master)
<!-- badges: end -->

The aurrera package makes adding a progress bar easy. Inspired by [tqdm
Python package](https://github.com/tqdm/tqdm), a progress bar is just a
single function call away. Wrap the object you iterate on with
`aurrrera::pb()` and use it in most iterators like `lapply()`.

If you need a fine control over your progress bars, use [progressr
package](https://github.com/HenrikBengtsson/progressr) instead.

## Installation

You can install the development version of aurrera from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("turtletopia/aurrera")
```

## User guide

Suppose we have some slowly processing function and a vector we want to
apply this function to:

``` r
library(aurrera)

slow_paste <- function(...) {
  Sys.sleep(.2)
  paste(..., collapse = "")
}

x <- lapply(seq(3), function(i) sample(letters, 4))
```

This is the usual call you’d make:

``` r
lapply(x, slow_paste)
#> [[1]]
#> [1] "pshz"
#> 
#> [[2]]
#> [1] "ufmd"
#> 
#> [[3]]
#> [1] "pqrl"
```

To add a progress bar, simply wrap `x` in `pb()`:

``` r
lapply(pb(x), slow_paste)
#> ================================================================================
#> [[1]]
#> [1] "pshz"
#> 
#> [[2]]
#> [1] "ufmd"
#> 
#> [[3]]
#> [1] "pqrl"
```

These are some of the other iterators you can use aurrera with:

``` r
sapply(pb(x), slow_paste)
#> ================================================================================
#> [1] "pshz" "ufmd" "pqrl"

purrr::map_chr(pb(x), slow_paste)
#> ================================================================================
#> [1] "pshz" "ufmd" "pqrl"

parallel::mclapply(pb(x), slow_paste)
#> ================================================================================
#> [[1]]
#> [1] "pshz"
#> 
#> [[2]]
#> [1] "ufmd"
#> 
#> [[3]]
#> [1] "pqrl"

plyr::llply(pb(x), slow_paste)
#> ================================================================================
#> [[1]]
#> [1] "pshz"
#> 
#> [[2]]
#> [1] "ufmd"
#> 
#> [[3]]
#> [1] "pqrl"

Reduce(slow_paste, pb(x))
#> ================================================================================
#> [1] "p us fh mz d pp us fh mz d qp us fh mz d rp us fh mz d l"

purrr::reduce(pb(x), slow_paste)
#> ================================================================================
#> [1] "p us fh mz d pp us fh mz d qp us fh mz d rp us fh mz d l"

library(foreach)
foreach::foreach(el = pb(x)) %do% slow_paste(el)
#> ================================================================================
#> [[1]]
#> [1] "pshz"
#> 
#> [[2]]
#> [1] "ufmd"
#> 
#> [[3]]
#> [1] "pqrl"
```

However, progress bars do not appear when using the old plain `for`
loop… unless you make the iteration manually:

``` r
x_pb <- pb(x)
v <- character()
for (i in seq_along(x_pb)) {
  # Pretend the operation below makes sense
  v <- c(slow_paste(x_pb[[i]]), v)
}
#> ================================================================================
v
#> [1] "pqrl" "ufmd" "pshz"
```

## Known bugs

-   Progress bars do not appear when iterating within `for` loop,
    i.e. `for (el in pb(iterable))`. Use manual iteration instead (as
    presented above).

## End notes

I believe in equal rights and treatment for everybody, regardless of
their sexuality, gender identity, skin tone, nationality, and other
features beyond human control. Thus, I do not allow gglgbtq to be used
in any project that promotes hate based on the aforementioned factors.
