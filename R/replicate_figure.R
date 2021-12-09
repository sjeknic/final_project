require(tidyverse)
require(ggplot2)
require(gridExtra)

load_raw_data <- function(filename, data_path="analysis/data/raw_data") {
  fname <- file.path(data_path, filename)
  print(fname)
  if(!file.exists(fname)) {
    stop(cat("Could not find file ", fname), call. = FALSE)
  }
  df <- read.csv(file.path(data_path, filename))
}

confirm_columns <- function(input_data, colname) {
  # Confirm that the column name exists
  if(is.null(input_data[[colname]])) {
    stop(cat("Missing column ", colname, "in data frame ", deparse(substitute(input_data))), call. = FALSE)
  }
}

plot_histogram <- function(input_data, colname, binwidth=0.5, xh=10, yh=160) {
  # Confirm that the columns exist
  confirm_columns(input_data, colname)

  # Generate basic plot object
  fig <- ggplot(input_data, aes_string(x=colname)) +
         geom_histogram(binwidth=binwidth) + xlim(0, xh) + ylim(0, yh)
  fig
}

# Load data and make plots
data_3a <- load_raw_data("supp_table4.csv")
plot_3a <- plot_histogram(data_3a, "Avg.lifetime", binwidth=0.5, xh=10, yh=160)

data_3b <- load_raw_data("supp_table6.csv")
plot_3b <- plot_histogram(data_3b, "Elongation.Rate..nt.s.", binwidth=05, xh=75, yh=70)

# Plot on same figure
grid.arrange(plot_3a, plot_3b, ncol=2)
