width <- getOption("width")
x <- as.list(LETTERS[1:5])
bar <- paste0(rep("=", width), collapse = "")

# LAPPLY ----------------------------------------------------------------------
test_that("pb() prints progress bar inside lapply()", {
  expect_equal(
    capture_output(lapply(pb(x), identity), width = width),
    bar
  )
})

test_that("lapply() returns correct value", {
  suppress_output(ret <- lapply(pb(x), identity))
  expect_equal(ret, x)
})

# SAPPLY ----------------------------------------------------------------------
test_that("pb() prints progress bar inside sapply()", {
  expect_equal(
    capture_output(sapply(pb(x), identity), width = width),
    bar
  )
})

test_that("sapply() returns correct value", {
  suppress_output(ret <- sapply(pb(x), identity))
  expect_equal(ret, LETTERS[1:5])
})

# PURRR::MAP_CHR --------------------------------------------------------------
test_that("pb() prints progress bar inside purrr::map_chr()", {
  expect_equal(
    capture_output(purrr::map_chr(pb(x), identity), width = width),
    bar
  )
})

test_that("purrr::map_chr() returns correct value", {
  suppress_output(ret <- purrr::map_chr(pb(x), identity))
  expect_equal(ret, LETTERS[1:5])
})

# PARALLEL::MCLAPPLY ----------------------------------------------------------
test_that("pb() prints progress bar inside parallel::mclapply()", {
  expect_equal(
    capture_output(parallel::mclapply(pb(x), identity), width = width),
    bar
  )
})

test_that("parallel::mclapply() returns correct value", {
  suppress_output(ret <- parallel::mclapply(pb(x), identity))
  expect_equal(ret, x)
})

# PURRR::REDUCE ---------------------------------------------------------------
test_that("pb() prints progress bar inside purrr::reduce()", {
  expect_equal(
    capture_output(purrr::reduce(pb(x), c), width = width),
    bar
  )
})

test_that("purrr::reduce() returns correct value", {
  suppress_output(ret <- purrr::reduce(pb(x), c))
  expect_equal(ret, LETTERS[1:5])
})

# REDUCE ----------------------------------------------------------------------
test_that("pb() prints progress bar inside Reduce()", {
  expect_equal(
    capture_output(Reduce(c, pb(x)), width = width),
    bar
  )
})

test_that("Reduce() returns correct value", {
  suppress_output(ret <- Reduce(c, pb(x)))
  expect_equal(ret, LETTERS[1:5])
})

# PLYR::LLPLY -----------------------------------------------------------------
test_that("pb() prints progress bar inside plyr::llply()", {
  expect_equal(
    capture_output(plyr::llply(pb(x), identity), width = width),
    bar
  )
})

test_that("plyr::llply() returns correct value", {
  suppress_output(ret <- plyr::llply(pb(x), identity))
  expect_equal(ret, x)
})

# FOREACH::FOREACH ------------------------------------------------------------
test_that("pb() prints progress bar inside foreach::foreach()", {
  expect_equal(
    capture_output(foreach::`%do%`(foreach::foreach(char = pb(x)), identity(char)), width = width),
    bar
  )
})

test_that("foreach::foreach() returns correct value", {
  suppress_output(ret <- foreach::`%do%`(foreach::foreach(char = pb(x)), identity(char)))
  expect_equal(ret, x)
})
