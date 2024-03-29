
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

Test en demo data are stored in the `inst/extdata` directory. In order
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

    ## # A tibble: 1 × 22
    ##      id name    dob        dobm       dobf   src   dnr   sex      gad    ga
    ##   <int> <chr>   <date>     <date>     <date> <chr> <chr> <chr>  <dbl> <dbl>
    ## 1    -1 Laura S 1989-01-21 1961-07-22 NA     0     <NA>  female   276    39
    ## # ℹ 12 more variables: smo <dbl>, bw <dbl>, hgtm <dbl>, hgtf <dbl>, agem <dbl>,
    ## #   etn <chr>, pc4 <chr>, blbf <int>, blbm <int>, eduf <int>, edum <int>,
    ## #   par <int>

``` r
timedata(tgt)
```

    ## # A tibble: 58 × 8
    ##      age xname yname zname zref                      x     y      z
    ##    <dbl> <chr> <chr> <chr> <chr>                 <dbl> <dbl>  <dbl>
    ##  1 0     age   hgt   hgt_z nl_1997_hgt_female_nl 0      48   -1.52 
    ##  2 0.101 age   hgt   hgt_z nl_1997_hgt_female_nl 0.101  53.5 -0.499
    ##  3 0.159 age   hgt   hgt_z nl_1997_hgt_female_nl 0.159  56   -0.261
    ##  4 0.236 age   hgt   hgt_z nl_1997_hgt_female_nl 0.236  59.5  0.163
    ##  5 0.485 age   hgt   hgt_z nl_1997_hgt_female_nl 0.485  65.5 -0.259
    ##  6 0.753 age   hgt   hgt_z nl_1997_hgt_female_nl 0.753  71.5  0.131
    ##  7 1.02  age   hgt   hgt_z nl_1997_hgt_female_nl 1.02   75   -0.18 
    ##  8 1.25  age   hgt   hgt_z nl_1997_hgt_female_nl 1.25   80    0.421
    ##  9 1.54  age   hgt   hgt_z nl_1997_hgt_female_nl 1.54   84    0.527
    ## 10 2.04  age   hgt   hgt_z nl_1997_hgt_female_nl 2.04   90    0.67 
    ## # ℹ 48 more rows

See <https://github.com/growthcharts/bdsreader> for installation notes
of `bdsreader`.
