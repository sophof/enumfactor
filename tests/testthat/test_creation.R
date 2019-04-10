context("creation of enumfactor")

test_that("enumfactor can be made from all neccesary info", {
  expect_silent(x <- enumfactor(letters[1:10],
                           levels = letters[1:10],
                           labels = letters[11:20],
                           indices = 21:30))
  t <- x
  attributes(t) <- NULL
  expect_true(is(x, "enumfactor"))
  expect_equivalent(t, 1:10)
  expect_equal(levels(x), letters[11:20])
  expect_equal(indices(x), 21:30)
})

test_that("enumfactor can be made from factor without custom indices", {
  x <- factor(letters[1:10])
  expect_silent(x <- enumfactor(x))
  t <- x
  attributes(t) <- NULL
  expect_true(is(x, "enumfactor"))
  expect_equivalent(t, 1:10)
  expect_equal(levels(x), letters[1:10])
  expect_equal(indices(x), 1:10)
})

test_that("enumfactor can be made from factor with custom indices", {
  expect_silent(x <- enumfactor(factor(letters[1:10]), indices = 21:30))
  expect_true(is(x, "enumfactor"))
  expect_equal(indices(x), 21:30)
})

test_that("levels can be get and set", {
  expect_silent(x <- enumfactor(factor(letters[1:10])))
  expect_equal(levels(x), letters[1:10])
  expect_silent(levels(x) <- letters[11:20])
  expect_equal(levels(x), letters[11:20])
})

test_that("indices can be get and set", {
  expect_silent(x <- enumfactor(factor(letters[1:10])))
  expect_equal(indices(x), 1:10)
  expect_silent(indices(x) <- 2:11)
  expect_equal(indices(x), 2:11)
})
