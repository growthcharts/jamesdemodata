
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jamesdemodata

<!-- badges: start -->

[![R-CMD-check](https://github.com/growthcharts/jamesdemodata/workflows/R-CMD-check/badge.svg)](https://github.com/growthcharts/jamesdemodata/actions)
[![R-CMD-check](https://github.com/growthcharts/jamesdemodata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/growthcharts/jamesdemodata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `jamesdemodata` is a lightweight repo with demo and test children.
The goal of the package is to test the **Joint Automatic Measurement and
Evaluation System (JAMES)**. JAMES is an **experimental** online
resource for creating and analysing growth charts.

## Installation

The following statements will install the `jamesdemodata` package

``` r
install.packages("remotes")
remotes::install_github("growthcharts/jamesdemodata")
```

## Example

Test- en demo data are stored in the `inst/extdata` directory. In order
to generate a file name of the SMOCC child Laura S use

``` r
fn <- system.file("extdata", "bds_v2.0", "smocc", "Laura_S.json", package = "jamesdemodata")
```

Read the data into R using the `bdsreader` package:

``` r
library(bdsreader)
tgt <- read_bds(fn)
head(tgt)
persondata(tgt)
```

See <https://github.com/growthcharts/bdsreader> for installation notes
of `bdsreader`.
