# An R interface to the DataTables library

[![Build Status](https://travis-ci.org/rstudio/DT.svg)](https://travis-ci.org/rstudio/DT)
[![Downloads from the RStudio CRAN mirror](https://cranlogs.r-pkg.org/badges/DT)](https://cran.r-project.org/package=DT)

This package provides a function `datatable()` to display R data via the [DataTables](http://datatables.net/) library (N.B. not to be confused with the **data.table** package).

## Installation

You may install the stable version from CRAN, or the development version using **devtools**:

```r
# install from CRAN
install.packages('DT')

# or the development version if necessary
remotes::install_github('rstudio/DT')

# then try DT::datatable(iris) as a hello world example
```

See the full documentation at <https://rstudio.github.io/DT>. Please use [Github issues](https://github.com/rstudio/DT/issues) only if you want to file bug reports or feature requests, and you are expected to ask questions on [StackOverflow](https://stackoverflow.com/questions/tagged/dt) with at least the tags `r` and `dt`.
