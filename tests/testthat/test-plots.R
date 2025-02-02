context("Final project tests")

# Smoke tests
# Confirm that the input data is the correct size
test_that("Shape of Table 4 is correct", {
  data <- load_raw_data(here::here("analysis/data/raw_data/supp_table4.csv"), data_path='')
  expect_equal(nrow(data), 847)
  expect_equal(ncol(data), 6)
})

test_that("Confirm columns fails for nonexistent columns", {
  data <- load_raw_data(here::here("analysis/data/raw_data/supp_table4.csv"), data_path='')
  expect_error(confirm_columns(data, 'no_columns_named_like_this'))
})

# Boundary tests
test_that("Fails for nonexistent files given to load_raw_data", {
  expect_error(load_raw_data("no_such_file.csv"))
})

test_that("Confirm columns fails for empty tables", {
  data <- data.frame()
  expect_error(confirm_columns(data, 'no_columns_named_like_this'))
})

test_that("Fails for nonexistent columns in plot_histogram", {
  data <- load_raw_data(here::here("analysis/data/raw_data/supp_table4.csv"), data_path='')
  expect_error(plot_histogram(newst, "no_columns_named_like_this", binwidth=0.5, xh=10, yh=160))
})

test_that("Fails for incorrectly typed arguments in plot_histogram", {
  data <- load_raw_data(here::here("analysis/data/raw_data/supp_table4.csv"), data_path='')
  expect_error(plot_histogram('data', "Avg.lifetime", binwidth=0.5, xh=10, yh=160))
  expect_error(plot_histogram(data, "Avg.lifetime", binwidth=0.5, xh=data, yh=160))
})
