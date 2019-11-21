#' Simple function to tidy Strategic Analytics for Improvement and
#' Learning (SAIL) datasets from www.va.gov
#'
#' @param url a SAIL dataset url from:
#' \url{https://www.va.gov/QUALITYOFCARE/measure-up/Strategic_Analytics_for_Improvement_and_Learning_SAIL.asp}
#'
#' @return a [tibble][tibble::tibble-package] with SAIL metrics in tidy format
#'
#' @examples \dontrun{
#' url <- "https://www.va.gov/QUALITYOFCARE/SAIL_FY19_Q1/SAIL-2_albany_fy19q1.xlsx"
#' sail_tidy(url)
#'
#' sail_tidy(
#'      "https://www.va.gov/QUALITYOFCARE/SAIL_FY19_Q1/SAIL-5_clarksburg_fy19q1.xlsx")
#' }
#' @export


sail_tidy <- function(url){

  file <- curl::curl_download(url, destfile = tempfile())

  data <- suppressMessages(readxl::read_excel(file, skip = 26)) %>%
    dplyr::select(-c(2:10,12:14,17)) %>%
    tidyr::gather(.data$Site, .data$Value, c(3))

  return(data)
}


