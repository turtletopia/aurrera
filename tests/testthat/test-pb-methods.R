test_that("no progress bar call is being made when using str()", {
  x <- pb(seq(10))
  pre_val <- aurrera:::.PROGRESS_BAR$getVal()
  suppress_output(str(x))
  expect_equal(
    aurrera:::.PROGRESS_BAR$getVal(),
    pre_val
  )
})

test_that("`aurrera_iter` class is preserved when using c()", {
  x <- pb(seq(10))
  expect_vector(c(x, 17:20),
                ptype = pb(1L),
                size = 14)
})
