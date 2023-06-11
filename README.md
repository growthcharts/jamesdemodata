
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
fn <- system.file("extdata", "bds_v3.0", "smocc", "Laura_S.json", package = "jamesdemodata")
```

Read the data into R using the `bdsreader` package:

``` r
library(bdsreader)
tgt <- read_bds(fn)
persondata(tgt)
```

    ## # A tibble: 1 × 16
    ##      id name    dob        dobf   dobm       src   dnr   sex      gad    ga
    ##   <int> <chr>   <date>     <date> <date>     <chr> <chr> <chr>  <dbl> <dbl>
    ## 1    -1 Laura S 1989-01-21 NA     1961-07-22 0     <NA>  female   276    39
    ## # ℹ 6 more variables: smo <int>, bw <dbl>, hgtm <dbl>, hgtf <dbl>, agem <dbl>,
    ## #   etn <chr>

``` r
timedata(tgt)
```

    ## # A tibble: 58 × 8
    ##      age xname yname zname zref                      x     y      z
    ##    <dbl> <chr> <chr> <chr> <chr>                 <dbl> <dbl>  <dbl>
    ##  1 0     age   hgt   hgt_z nl_1997_hgt_female_nl 0     48    -1.52 
    ##  2 0     age   wgt   wgt_z nl_1997_wgt_female_nl 0      2.95 -1.06 
    ##  3 0     age   bmi   bmi_z nl_1997_bmi_female_nl 0     12.8   0.259
    ##  4 0.101 age   hgt   hgt_z nl_1997_hgt_female_nl 0.101 53.5  -0.499
    ##  5 0.101 age   wgt   wgt_z nl_1997_wgt_female_nl 0.101  4.18 -0.162
    ##  6 0.101 age   hdc   hdc_z nl_1997_hdc_female_nl 0.101 37.6   0.418
    ##  7 0.101 age   bmi   bmi_z nl_1997_bmi_female_nl 0.101 14.6   0.231
    ##  8 0.101 age   dsc   dsc_z ph_2023_dsc_female_40 0.101 14.8  -0.321
    ##  9 0.159 age   hgt   hgt_z nl_1997_hgt_female_nl 0.159 56    -0.261
    ## 10 0.159 age   wgt   wgt_z nl_1997_wgt_female_nl 0.159  5     0.401
    ## # ℹ 48 more rows

See <https://github.com/growthcharts/bdsreader> for installation notes
of `bdsreader`.
