test_that("using pb() spawns a progress bar object", {
  n <- 3
  pb(seq(n))
  expect_equal(
    aurrera:::.PROGRESS_BAR,
    structure(
      txtProgressBar(min = 0, max = n),
      pb_length = n
    )
  )
})

test_that("bar is always advanced by 1", {
  pre_val <- aurrera:::.PROGRESS_BAR$getVal()
  capture.output(
    advance_bar(list(), 2),
    file = nullfile()
  )
  expect_equal(
    aurrera:::.PROGRESS_BAR$getVal(),
    pre_val + 1
  )
})

test_that("bar is nullified on finishing", {
  capture.output(
    advance_bar(list(), 6),
    advance_bar(list(), 13),
    file = nullfile()
  )
  expect_null(aurrera:::.PROGRESS_BAR)
})
