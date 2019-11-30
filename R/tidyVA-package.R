#' Tidy dataframes and simple features of VHA geographies
#'
#' @author Ivan Castro
#' @name tidyVA
#' @docType package
#' @importFrom sf st_transform st_intersection st_geometry st_set_crs st_set_geometry
#' @importFrom dplyr filter select rename mutate
#' @importFrom tibble tibble
#' @importFrom curl curl_download
#' @importFrom readxl read_excel
#' @importFrom rlang .data
#' @importFrom tidyr gather separate
#' @importFrom janitor remove_empty clean_names make_clean_names
#' @importFrom stringr str_trim
#' @importFrom ggplot2 theme_minimal theme margin element_blank element_line element_text
NULL
