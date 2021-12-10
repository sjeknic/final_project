# Load data and make plots
data_3a <- load_raw_data("supp_table4.csv")
plot_3a <- plot_histogram(data_3a, "Avg.lifetime", binwidth=0.5, xh=10, yh=160)

data_3b <- load_raw_data("supp_table6.csv")
plot_3b <- plot_histogram(data_3b, "Elongation.Rate..nt.s.", binwidth=05, xh=75, yh=70)

# Plot on same figure
grid.arrange(plot_3a, plot_3b, ncol=2)
