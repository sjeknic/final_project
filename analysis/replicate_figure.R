require(tidyverse)
require(ggplot2)
require(gridExtra)

st4 <- read.csv("data/raw_data/supp_table4.csv")
st6 <- read.csv("data/raw_data/supp_table6.csv")

fig3a <- ggplot(st4, aes(x=Avg.lifetime)) + geom_histogram(binwidth=0.5) +
  xlim(0, 10) + ylim(0, 160)
fig3b <- ggplot(st6, aes(x=Elongation.Rate..nt.s.)) + geom_histogram(binwidth=5) +
  xlim(0, 75) + ylim(0, 70)

grid.arrange(fig3a, fig3b, ncol=2)
