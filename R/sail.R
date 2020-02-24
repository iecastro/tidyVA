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

  data <- suppressMessages(
    readxl::read_excel(file, skip = 26)) %>%
    janitor::remove_empty("cols") %>%
    tidyr::gather(c(4),
                  key = "site",
                  value = "value") %>%
    janitor::clean_names() %>%
    dplyr::rename(ntiles_10_50_90 = .data$x10th_50th_90th_ptile)

  data <- suppressWarnings(
    data %>%
      tidyr::separate(.data$measure,
                      into = c("prefix", "label"),
                      sep = "\\."))

  data <- data %>%
    dplyr::mutate(label = ifelse(is.na(.data$label),
                                 .data$prefix,
                                 .data$label),
                  label = stringr::str_trim(.data$label),
                  measure = janitor::make_clean_names(
                    .data$label,
                    case = "upper_camel")) %>%
    filter(!is.na(.data$value)) %>%
    select(-.data$prefix)

  return(data)
}


