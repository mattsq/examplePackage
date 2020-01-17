context("My tests")

test_that("No floating point errors", {
  expect_equal(example_function(1,2), example_function(1.0, 2.0), tolerance = 1)
})

test_that("Passing text in causes an error", {
  	expect_error(example_function("a",1))
	expect_error(example_function("a","b"))
})