context("enumfactor coercion")

test_that("enumfactor can be coerced to character", {
  expect_silent(x <- enumfactor(letters[1:10], indices = 2:11))
  expect_equal(as.character(x), letters[1:10])
})

test_that("enumfactor can be coerced to integer according to indices", {
  expect_silent(x <- enumfactor(rep(c("a", "b"), 2), indices = c(2, 3)))
  expect_equal(as.integer(x), rep(c(2, 3), 2))
})

test_that("enumfactor can be coerced to numeric/double according to indices", {
  expect_silent(x <- enumfactor(rep(c("a", "b"), 2), indices = c(2, 3)))
  expect_equal(as.numeric(x), rep(c(2, 3), 2))
  expect_equal(as.double(x), rep(c(2, 3), 2))
})
