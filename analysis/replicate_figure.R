require(tidyverse)
require(ggplot2)
require(gridExtra)

load_raw_data <- function(filename, data_path="analysis/data/raw_data") {
  fname <- file.path(data_path, filename)
  if(!file.exists(fname)) {
    stop(cat("Could not find file ", fname), call. = FALSE)
  }
  df <- read.csv(file.path(data_path, filename))
}

confirm_columns <- function(input_data, colname) {
  # Confirm that the column name exists
  if(is.null(input_data[[colname]])) {
    stop(cat("Missing column ", colname, "in data frame ", input_data), call. = FALSE)
  }
}

plot_histogram <- function(input_data, colname, binwidth=0.5, xh=10, yh=160) {
  # Confirm that the columns exist
  confirm_columns(input_data, colname)

  # Generate basic plot object
  fig <- ggplot(input_data, aes_string(x=colname)) + geom_histogram(binwidth=binwidth) + xlim(0, xlim) + ylim(0, ylim)
  fig
}

newst <- load_raw_data("supp_table4.csv")
plot <- plot_histogram(newst, "Avg.lifetime", binwidth=0.5, xh=10, yh=160)
plot
