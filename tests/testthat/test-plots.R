# Smoke tests

# Confirm that the input data is the correct size
test_that("Correct shape", {
  data <- read.csv("../../analysis/data/supp_table4.csv")
  expect_equal(nrow(data), 847)
  expect_equal(ncol(data), 6)
})
