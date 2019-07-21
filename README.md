
<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/iecastro/tidyVA.svg?branch=master)](https://travis-ci.org/iecastro/tidyVA)
<!-- badges: end -->

# tidyVA

The goal of **tidyVA** is to provide [simple
features](https://r-spatial.github.io/sf/articles/sf1.html) of Veterans
Health Administration geographies. Data included are *tidy* dataframes
of VHA spatial data obtained from
[data.va.gov](https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties).

The benefit of simple features in R is that they allow for [tidy spatial
analysis](https://edzer.github.io/UseR2017/geostat2018.html#tidyverse-list-columns).

# Installation

You can install **tidyVA** from GitHub with:

``` r
remotes::install_github("iecastro/tidyVA")
```

# Datasets

## VHA Geographies

The following included datasets are sf tibbles of VHA geographies and
have a common CRS - EPSG: 4326.

Summarized descriptions from
[data.va.gov](https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties)

`county`: The county layer is the base geographic unit of the
VISN-Market-Submarket-Sector-County hierarchy.

`sector`: A sector is a cluster of geographically adjacent counties
within a VA Submarket.

`submarket`: Submarkets reflect a clustering of the enrollee population
within a market and are an aggregation of Sectors.

`market`: Each market is built from submarkets and represent an
aggregated geographic area having sufficient population and geographic
size to benefit from planning healthcare services. Markets cross state
borders where neccesary to keep the catchment area within the same
market

`visn`: VISNs are the upper echelon in the VHA hierarchy. VISN
boundaries align with those of their constituent markets and can span
across non-contiguous areas.

### Other Data

`states`: Simple features of states and territories of the US (CRS -
EPSG: 4326). Used for spatial joins and geometric manipulations.

`VAloc`: Simple features (CRS - EPSG: 4326) of all VA facilities - from
all Administrations: Veterans Health Administration, Veterans Benefits
Administration, and National Cemetery Administration

## Example

This is a basic example which shows you how to solve a common problem:

VHA Submarkets are an aggregation of Sectors; and Sectors are comprised
of one or more counties. Since each VISN is defined in a hierarchy, this
dataset contains attributes of all echelons above submarket - that is,
Market and VISN.

``` r
library(ggplot2)
library(dplyr)
library(tidyVA)

data("submarket")

ggplot() + 
  geom_sf(data = submarket, fill = NA)
```

<img src="man/figures/README-example-1.png" width="100%" />

Although accurate, this output is not very easy to work with. But, since
this is in tidy format, we can easily filter and manipulate the data.

``` r
glimpse(submarket)
#> Observations: 153
#> Variables: 6
#> $ VISN       <chr> "01", "01", "01", "01", "02", "02", "02", "02", "02...
#> $ MARKET     <chr> "01-a", "01-b", "01-c", "01-d", "02-a", "02-b", "02...
#> $ SUBMARKET  <chr> "01-a-9", "01-b-9", "01-c-9", "01-d-9", "02-a-9", "...
#> $ Shape_Leng <dbl> 38.391428, 81.160361, 13.413957, 14.839457, 13.0815...
#> $ Shape_Area <dbl> 1.78751288, 9.66806953, 5.47709016, 2.19550641, 4.9...
#> $ geometry   <MULTIPOLYGON [Â°]> MULTIPOLYGON (((-71.56974 4..., MULTI...
```

``` r
visn2 <- submarket %>% 
  filter(VISN == "02")

visn2
#> Simple feature collection with 10 features and 5 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -79.13745 ymin: 39.50577 xmax: -71.85615 ymax: 45.01585
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> # A tibble: 10 x 6
#>    VISN  MARKET SUBMARKET Shape_Leng Shape_Area                    geometry
#>    <chr> <chr>  <chr>          <dbl>      <dbl>         <MULTIPOLYGON [Â°]>
#>  1 02    02-a   02-a-9         13.1      4.91   (((-73.34312 45.01084, -73~
#>  2 02    02-b   02-b-9         18.8      4.01   (((-76.18704 43.66566, -76~
#>  3 02    02-d   02-d-9          6.58     1.25   (((-78.90518 42.93351, -78~
#>  4 02    02-e   02-e-1          2.49     0.191  (((-77.97621 43.36874, -77~
#>  5 02    02-e   02-e-2          6.01     0.656  (((-76.94668 43.25894, -76~
#>  6 02    02-f   02-f-2          6.14     1.63   (((-76.94756 42.76441, -76~
#>  7 02    02-g   02-g-9         25.2      0.335  (((-73.72961 40.59637, -73~
#>  8 02    02-h   02-h-1          9.51     0.999  (((-73.89687 40.79565, -73~
#>  9 02    02-h   02-h-3          5.92     0.0717 (((-74.20241 40.57956, -74~
#> 10 02    02-i   02-i-9         17.4      1.24   (((-74.30019 39.50628, -74~
```

``` r
ggplot() + 
  geom_sf(data = visn2, aes(fill = MARKET), color = NA) +
  geom_sf(data = visn2, fill = NA, color = "#ffffff", size = .25)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

# Functions

### `shift_geo`

`shift_geo()` will project and reposition Alaska and Hawaii, When
supplied a complete dataset (from VHA Geographies).

``` r
shift_geo(submarket) %>% 
  ggplot() + 
  geom_sf(fill = NA) +
  theme_minimal()
#> Please note: Alaska and Hawaii are being shifted and are not to scale.
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

### `theme_va()`

`theme_va()` is a ggplot theme with some default colors and plotting
parameters. The core of this function is `theme_ipsum` from
[hrbrthemes](https://hrbrmstr.github.io/hrbrthemes/), with some
modifications and defaults.

``` r
data("visn")

visn %>% 
  ggplot(aes(reorder(VISN,Shape_Area), Shape_Area)) +
  geom_col() + 
  labs(x = "VISN", y = "Shape Area", 
       caption = "CRS - EPSG:4326") +
  ggtitle("Shape Area of VA Service Networks", 
          subtitle = "This is an example plot") +
  theme_va(grid = "Y")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

### `sail_tidy`

`sail_tidy` will return a tibble of VA SAIL metrics when provided a
[data table
url](https://www.va.gov/QUALITYOFCARE/measure-up/Strategic_Analytics_for_Improvement_and_Learning_SAIL.asp).

``` r
sail_tidy("https://www.va.gov/QUALITYOFCARE/SAIL_FY19_Q1/SAIL-5_clarksburg_fy19q1.xlsx")
#> # A tibble: 79 x 6
#>    Measure          `Measure Unit` `Best 10%` `10th-50th-90th ~ Site  Value
#>    <chr>            <chr>          <chr>      <chr>             <chr> <chr>
#>  1 Acute care mort~ <NA>           <NA>       <NA>              Clar~ <NA> 
#>  2 1. Acute care S~ O/E            0.469      0.469 - 0.857 - ~ Clar~ 1.360
#>  3 2. Acute care 3~ O/E            0.740      0.740 - 0.952 - ~ Clar~ 1.109
#>  4 a. AMI RSMR      %              7.219      7.219 - 7.666 - ~ Clar~ 8.106
#>  5 b. CHF RSMR      %              5.676      5.676 - 6.820 - ~ Clar~ 8.300
#>  6 c. Pneumonia RS~ %              7.820      7.820 - 9.026 - ~ Clar~ 11.9~
#>  7 d. COPD RSMR     %              4.402      4.402 - 5.942 - ~ Clar~ 5.965
#>  8 e. Stroke RSMR   %              5.134      5.134 - 5.933 - ~ Clar~ 5.531
#>  9 Avoidable adver~ <NA>           <NA>       <NA>              Clar~ <NA> 
#> 10 1. In-hospital ~ O/E            0.000      0.000 - 0.834 - ~ Clar~ 1.580
#> # ... with 69 more rows
```

### Harvest functions

``` 
  These functions have been removed from the namespace due to the VA Open Data site being taken down.
```

> These functions serve as a homebrewed API for fetching Hospital
> Performance datasets. VA Open Data uses a harvesting framework from
> [DKAN](https://docs.getdkan.com/en/latest/components/harvest.html).
> Currently the [VHA
> Harvest](https://www.data.va.gov/harvest_source/vha-harvest-datasets)
> only includes hospital performance datasets.
> 
> `harvest_get()` will return a tibble of URLs and attributes for each
> dataset.
> 
> `harvest_wrngl()` will import and tidy datasets from an object created
> with `harvest_get`

# Info

Development of this package is partly supported by a research grant from
the National Institute on Alcohol Abuse and Alcoholism - NIH Grant
\#R34AA026745-01.

This product is not endorsed nor certified by either the VA or
NIH/NIAAA.
