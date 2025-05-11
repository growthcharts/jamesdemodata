
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jamesdemodata

<!-- badges: start -->

[![R-CMD-check](https://github.com/growthcharts/jamesdemodata/workflows/R-CMD-check/badge.svg)](https://github.com/growthcharts/jamesdemodata/actions)
[![R-CMD-check](https://github.com/growthcharts/jamesdemodata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/growthcharts/jamesdemodata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `jamesdemodata` package is a lightweight repository containing
demonstration data and example child records. Its goal is to provide
reproducible examples and test cases for the **Joint Automatic
Measurement and Evaluation System (JAMES)** — an online service that
supports real-time decision making in the monitoring and prediction of
child growth and development.

## 1. Installation

To install the `jamesdemodata` package from GitHub, use:

``` r
install.packages("remotes")
remotes::install_github("growthcharts/jamesdemodata")
```

## 2. A JSON schema for data exchange

The example datasets build upon the the [BDS JGZ
specification](https://www.ncj.nl/onderwerp/digitaal-dossier-jgz/bds-jgz-versiebeheer/)
and [NICTIZ informatiestandaarden
JGZ](https://nictiz.nl/releases/jeugdgezondheidszorg-7-1-1/) These
specifications provide a detailed description on what information can be
collected and how it should stored. The `bdsreader` package implements a
subset of BDS JGZ fields related to child growth and development into a
JSON schema that can be used for validation and electronic data
communication. The current version of this JSON schema is
[`bds_v3.0`](https://raw.githubusercontent.com/growthcharts/bdsreader/refs/heads/master/inst/schemas/bds_v3.0.json).

The examples in the `jamesdemodata` package are coded according to this
JSON schema, or a previous version of it.

## 3. Usage `json/examples`

The `json/examples` directory contains a few minimal JSON datasets for
testing and development.

### 3.1 Read the first 10 lines of a demo file

Use the `system.file()` function to construct the path to a file within
the package:

``` r
fn <- system.file("json", "examples", "maria.json", package = "jamesdemodata")
cat(paste(readLines(fn, n = 10), collapse = "\n"), "\n...")
```

    ## {
    ##   "Format": "3.0",
    ##   "organisationCode": 1234,
    ##   "reference": "Maria",
    ##   "clientDetails": [
    ##     {
    ##       "bdsNumber": 19,
    ##       "value": "2"
    ##     },
    ##     { 
    ## ...

### 3.2 Read JSON data into R using `bdsreader`

If you have the `bdsreader` package installed, you can read and inspect
the JSON data as follows:

``` r
library(bdsreader)
read_bds(fn)
```

    ## <bdsreader>
    ## $psn:
    ##   id  name  src  dnr    sex gad ga smo  bw hgtm hgtf agem blbf blbm eduf edum
    ## 1 -1 Maria 1234 <NA> female 189 27   1 990  167  190   NA   NA   NA   NA   NA
    ##   par
    ## 1  NA
    ## 
    ## $xyz:
    ## # A tibble: 13 × 8
    ##       age xname yname zname zref                        x     y      z
    ##     <dbl> <chr> <chr> <chr> <chr>                   <dbl> <dbl>  <dbl>
    ##  1 0.0849 age   hgt   hgt_z nl_2012_hgt_female_27  0.0849 38    -0.158
    ##  2 0.167  age   hgt   hgt_z nl_2012_hgt_female_27  0.167  43.5   0.047
    ##  3 0      age   wgt   wgt_z nl_2012_wgt_female_27  0       0.99  0.19 
    ##  4 0.0849 age   wgt   wgt_z nl_2012_wgt_female_27  0.0849  1.25 -0.203
    ##  5 0.167  age   wgt   wgt_z nl_2012_wgt_female_27  0.167   2.1   0.015
    ##  6 0.0849 age   hdc   hdc_z nl_2012_hdc_female_27  0.0849 27    -0.709
    ##  7 0.167  age   hdc   hdc_z nl_2012_hdc_female_27  0.167  30.5  -0.913
    ##  8 0      age   bmi   bmi_z nl_1997_bmi_female_nl  0      NA    NA    
    ##  9 0.0849 age   bmi   bmi_z nl_1997_bmi_female_nl  0.0849  8.66 -5.72 
    ## 10 0.167  age   bmi   bmi_z nl_1997_bmi_female_nl  0.167  11.1  -3.77 
    ## 11 0      hgt   wfh   wfh_z nl_2012_wfh_female_   NA       0.99 NA    
    ## 12 0.0849 hgt   wfh   wfh_z nl_2012_wfh_female_   38       1.25 -0.001
    ## 13 0.167  hgt   wfh   wfh_z nl_2012_wfh_female_   43.5     2.1   0.326

For installation instructions and further documentation, see the
[`bdsreader` GitHub
repository](https://github.com/growthcharts/bdsreader).

### 3.3 Files in `json/examples` directory

To explore what is available in `json/examples` use

``` r
json_path <- system.file("json", "examples", package = "jamesdemodata")
list.files(json_path, recursive = TRUE)
```

    ## [1] "client3.json"       "Kevin_S.json"       "Laura_S.json"      
    ## [4] "maria-mangled.json" "maria.json"         "maria1.json"       
    ## [7] "maria2.json"        "test.json"

The following table lists the files in the `json/examples` directory,
along with a brief description of each file.

| File | Description |
|----|----|
| `client3.json` | Example child record in minimal JSON format |
| `Kevin_S.json` | Preterm child Kevin_S using current JSON schema |
| `Laura_S.json` | Example child Laura_S using current JSON schema |
| `maria-mangled.json` | Same child with vastly incomplete data, for debugging |
| `maria.json` | Example child record in minimal JSON format |
| `maria1.json` | Example child record, JSON schema 1.0 (outdated) |
| `maria2.json` | Example child record, JSON schema 2.0 (outdated) |
| `test.json` | Example child record in minimal JSON format |

## 4. Usage `extdata`

The `extdata` directory includes more comprehensive child records coded
according to various versions of the BDS specification. These files are
used by the [JAMES demo
app](https://tnochildhealthstatistics.shinyapps.io/james_tryout/).

For example, to see the first 10 lines of the `Laura_S.json` file, use:

``` r
fn <- system.file("extdata", "bds_v3.0", "smocc", "Laura_S.json", package = "jamesdemodata")
cat(paste(readLines(fn, n = 10), collapse = "\n"), "\n...")
```

    ## {
    ##   "Format": "3.0",
    ##   "organisationCode": 0,
    ##   "reference": "Laura S",
    ##   "clientDetails": [
    ##     {
    ##       "bdsNumber": 19,
    ##       "value": "2"
    ##     },
    ##     { 
    ## ...

### 4.1 Subdirectories in `extdata`

The interesting parts of `extdata` are the example files using
`bds_v3.0` schema:

``` r
extdata <- system.file("extdata", package = "jamesdemodata")
dirs <- list.dirs(extdata, full.names = FALSE, recursive = TRUE)
dirs[grepl("^bds_v3\\.0", dirs)]
```

    ## [1] "bds_v3.0"           "bds_v3.0/graham"    "bds_v3.0/lollypop" 
    ## [4] "bds_v3.0/pops"      "bds_v3.0/smocc"     "bds_v3.0/terneuzen"
    ## [7] "bds_v3.0/test"

### 4.2 Exploring and working with `extdata` files

Each subdirectory contains 10 children. For example, let us explore the
files in `bds_v3.0/smocc`:

``` r
smocc <- system.file("extdata", "bds_v3.0", "smocc", package = "jamesdemodata")
list.files(smocc, recursive = TRUE)
```

    ##  [1] "Anne_S.json"   "Iris_S.json"   "Jeroen_S.json" "Kevin_S.json" 
    ##  [5] "Laura_S.json"  "Linda_S.json"  "Mark_S.json"   "Rick_S.json"  
    ##  [9] "Thomas_S.json" "Tim_S.json"

See the first few lines of the `Anne_S.json` file:

``` r
fn <- file.path(smocc, "Anne_S.json")
cat(paste(readLines(fn, n = 10), collapse = "\n"), "\n...")
```

    ## {
    ##   "Format": "3.0",
    ##   "organisationCode": 0,
    ##   "reference": "Anne S",
    ##   "clientDetails": [
    ##     {
    ##       "bdsNumber": 19,
    ##       "value": "2"
    ##     },
    ##     { 
    ## ...

As before, we can read read and inspect the JSON data using the
`bdsreader` package:

``` r
read_bds(fn)
```

    ## <bdsreader>
    ## $psn:
    ##   id   name src  dnr    sex gad ga smo   bw hgtm hgtf agem blbf blbm eduf edum
    ## 1 -1 Anne S   0 <NA> female 283 40   0 3300  172  183   NA   NA   NA   NA   NA
    ##   par
    ## 1  NA
    ## 
    ## $xyz:
    ## # A tibble: 58 × 8
    ##       age xname yname zname zref                       x     y     z
    ##     <dbl> <chr> <chr> <chr> <chr>                  <dbl> <dbl> <dbl>
    ##  1 0      age   hgt   hgt_z nl_1997_hgt_female_nl 0       51   0.052
    ##  2 0.0986 age   hgt   hgt_z nl_1997_hgt_female_nl 0.0986  54.7 0.145
    ##  3 0.137  age   hgt   hgt_z nl_1997_hgt_female_nl 0.137   56   0.114
    ##  4 0.233  age   hgt   hgt_z nl_1997_hgt_female_nl 0.233   59.5 0.206
    ##  5 0.501  age   hgt   hgt_z nl_1997_hgt_female_nl 0.501   68   0.661
    ##  6 0.788  age   hgt   hgt_z nl_1997_hgt_female_nl 0.788   73   0.498
    ##  7 0.961  age   hgt   hgt_z nl_1997_hgt_female_nl 0.961   75.5 0.375
    ##  8 1.25   age   hgt   hgt_z nl_1997_hgt_female_nl 1.25    80   0.434
    ##  9 1.51   age   hgt   hgt_z nl_1997_hgt_female_nl 1.51    83.5 0.449
    ## 10 1.97   age   hgt   hgt_z nl_1997_hgt_female_nl 1.97    89.5 0.731
    ## # ℹ 48 more rows
