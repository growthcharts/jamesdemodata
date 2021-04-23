
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jamesdemodata

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
fn <- system.file("extdata", "bds", "smocc", "Laura_S.json", package = "jamesdemodata")
```

Read the data into R using the `bdsreader` package:

``` r
library(bdsreader)
tgt <- bdsreader::read_bds(fn)
head(tgt)
```

    ## # A tibble: 6 x 8
    ##     age xname yname zname zref                      x     y      z
    ##   <dbl> <chr> <chr> <chr> <chr>                 <dbl> <dbl>  <dbl>
    ## 1 0     age   hgt   hgt_z nl_1997_hgt_female_nl 0      48   -1.52 
    ## 2 0.101 age   hgt   hgt_z nl_1997_hgt_female_nl 0.101  53.5 -0.499
    ## 3 0.159 age   hgt   hgt_z nl_1997_hgt_female_nl 0.159  56   -0.261
    ## 4 0.236 age   hgt   hgt_z nl_1997_hgt_female_nl 0.236  59.5  0.163
    ## 5 0.485 age   hgt   hgt_z nl_1997_hgt_female_nl 0.485  65.5 -0.259
    ## 6 0.753 age   hgt   hgt_z nl_1997_hgt_female_nl 0.753  71.5  0.131

``` r
persondata(tgt)
```

    ## # A tibble: 1 x 15
    ##      id name    dobf       dobm       src   dnr   sex      gad    ga   smo    bw
    ##   <int> <chr>   <date>     <date>     <chr> <chr> <chr>  <dbl> <dbl> <dbl> <dbl>
    ## 1    -1 Laura S NA         1961-07-22 0     <NA>  female   276    39     1  2950
    ## # … with 4 more variables: hgtm <dbl>, hgtf <dbl>, agem <dbl>, etn <chr>

See <https://github.com/growthcharts/bdsreader> for installation notes
of `bdsreader`.
