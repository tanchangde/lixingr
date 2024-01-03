
# lixingr

An R language wrapper for the Lixinger API.

## User Guide

### Prerequisites

Basic knowledge of R is required. If lacking, it is recommended to
quickly get started using [this
material](https://tshi.page/r-and-tidyverse-book/index.html), estimated
to take one or two hours.

### Installation

``` r
devtools::install_github('tanchangde/lixingr')
```

### Configuration

- Register and log in to Lixinger, then acquire a `Token` from the [Open
  Platform](https://www.lixinger.com/open/api/token).
- Enter `file.edit("~/.Renviron")` in the R console, then append a new
  line to the opened file: `TOKEN_LIXINGER = "acquired Token"`, save and
  close the `.Renviron` file.

## Motivation

- For creating reproducible, reusable, and version-controllable
  investment research reports.
- To reduce repetitive data copying and pasting.
- To practice API wrapping.
- To accumulate R package works.

## Goals

- [x] Beginner, implement key fundamental indicators for mainland stocks
  - [x] PB
  - [x] PE
  - [x] ROE
  - [x] Debt Ratio
  - [x] Dividend Payout Ratio
- [x] Intermediate, implement most practical indicators.
- [x] Advanced Intermediate, package into an R package.
- [ ] Advanced, provide interactive analysis services.

## Why Choose Lixinger

- [Product, Code and Investment — Product
  Chapter](https://www.lixinger.com/marketing/about-us-product)
- [Product, Code and Investment — Code
  Chapter](https://www.lixinger.com/marketing/about-us-coding)

## References

- [knitr and Reproducible Statistical
  Research](https://cosx.org/2012/06/reproducible-research-with-knitr/)
- [Lixinger Open Platform API
  Documentation](https://www.lixinger.com/open/api/doc)

## ChangeLog

- 240101 changde Refactored as an R package
- 221023 changde Added and updated functions, rearranged example code
- 220705 changde Detailed user guide
- 220630 changde Added usage
- 220629 changde
  - Adjusted goal priorities
  - Added references and refined text
- 220627 changde init
