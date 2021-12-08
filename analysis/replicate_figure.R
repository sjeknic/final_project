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

plot_histogram <- function(input_data, colname, binwidth=1) {
  # Confirm that the columns exist
  confirm_columns(input_data, colname)

  # Generate basic plot object
  fig <- ggplot(input_data, aes(x=colname)) + geom_histogram(binwidth=binwidth)
}

refine_plot <- function(plot, ...) {
  for(arg in list(...)){
    # Check that the argument is valid
    if(!hasName(ggplot2, arg)){
      stop(cat("Only ggplot2 functions can be used for formatting.",
               "Could not find ", arg), call. = FALSE)
    }

    # Add the argument to the plot object
    plot <- plot + arg
  }
  plot
}

st4 <- read.csv("analysis/data/raw_data/supp_table4.csv")
st6 <- read.csv("analysis/data/raw_data/supp_table6.csv")

fig3a <- ggplot(st4, aes(x=Avg.lifetime)) + geom_histogram(binwidth=0.5) +
  xlim(0, 10) + ylim(0, 160)
fig3b <- ggplot(st6, aes(x=Elongation.Rate..nt.s.)) + geom_histogram(binwidth=5) +
  xlim(0, 75) + ylim(0, 70)

grid.arrange(fig3a, fig3b, ncol=2)

newst <- load_raw_data("supp_table4.csv")
plot <- plot_histogram(newst, "Avg.lifetime")
plot <- refine_plot(plot, geom_histogram(binwidth=0.5), xlim(0, 10), ylim(0, 160))
plot
