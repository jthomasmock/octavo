
# octavo

<!-- badges: start -->
<!-- badges: end -->

The goal of octavo is to provide a minimal example of bundling and sharing Quarto extensions as a R package.

## Installation

You can install the development version of octavo from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jthomasmock/octavo")
```

## Example



``` r
library(octavo)

# List the available extensions
available_extensions()
#> [1] "code-filename"   "grouped-tabsets"

# install them into _extensions folder for use
use_quarto_ext("code-filename")
#> Created '_extensions' folder
#> Code Filename v 0.1.0 was installed to _extensions folder in current working directory.
```

