
<!-- README.md is generated from README.Rmd. Please edit that file -->

# finalproject

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh///master?urlpath=rstudio)

This Final Project is designed to replicate the analysis contained
within “Genome-wide study of mRNA degradation and transcript elongation
in Escherichia coli”, specifically to replicate Figure 3a: Distributions
of lifetimes and elongation rates measured for exponentially growing
cells.

### How to cite

Please cite this compendium as:

> Jeknic, Stevan et al. (2021). Genome-wide study of mRNA degradation
> and transcript elongation in Escherichia coli - a replication.
> Accessed 09 Dec 2021. Online at
> <https://github.com/sjeknic/finalproject>.

## How to run in your browser or download and run locally

This research compendium has been developed using the statistical
programming language R. To work with the compendium, you will need
installed on your computer the [R
software](https://cloud.r-project.org/) itself and optionally [RStudio
Desktop](https://rstudio.com/products/rstudio/download/).

You can clone the repository from this URL:
[finalproject](https://github.com/sjeknic/finalproject). After
unzipping: - open the `.Rproj` file in RStudio - run
`devtools::install()` to ensure you have the packages this analysis
depends on (also listed in the [DESCRIPTION](/DESCRIPTION) file).

## Usage

``` r
library(tidyverse)
library(ggplot2)
library(gridExtra)
library(finalproject)
```

Use `load_raw_data` to load the data you would like to plot for
analysis. This function takes the file name and data path as its
arguments.

To confirm the columns within the dataframe are appropriately labelled,
you can call the `confirm_columns` function, this takes the output of
the above function, and a specific column name as arguments, and checks
that they exist within the dataframe.

To visualize the output, use the `plot_histogram` function with the
`input_data` generated from `load_raw_data`.

An example of this in action is used to plot the histogram from the
supplemental table 4 within the original paper.

``` r
newst <- load_raw_data("supp_table4.csv")
#> [1] "analysis/data/raw_data/supp_table4.csv"
plot <- plot_histogram(newst, "Avg.lifetime", binwidth=0.5, xh=10, yh=160)
plot
#> Warning: Removed 47 rows containing non-finite values (stat_bin).
#> Warning: Removed 2 rows containing missing values (geom_bar).
```

![](analysis/figuresunnamed-chunk-3-1.png)<!-- -->

## Contents

The **analysis** directory contains:

-   [:file_folder: paper](/analysis/paper): R Markdown source document
    for manuscript. Includes code to reproduce the figures and tables
    generated by the analysis. It also has a rendered version,
    `paper.docx`, suitable for reading (the code is replaced by figures
    and tables in this file)
-   [:file_folder: data](/analysis/data/raw_data): Data used in the
    analysis.
-   [:file_folder: figures](/analysis/figures): Plots and other
    illustrations
-   [:file_folder:
    supplementary-materials](/analysis/supplementary-materials):
    Supplementary materials including notes and other documents prepared
    and collected during the analysis.

### Licenses

**Text and figures :**
[CC-BY-4.0](http://creativecommons.org/licenses/by/4.0/)

**Code :** See the [DESCRIPTION](DESCRIPTION) file

**Data :** [CC-0](http://creativecommons.org/publicdomain/zero/1.0/)
attribution requested in reuse

### Contributions

We welcome contributions from everyone. Before you get started, please
see our [contributor guidelines](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.
