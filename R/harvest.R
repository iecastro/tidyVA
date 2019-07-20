#' set of functions to fetch VHA harvest URLs and dowload in tidy format
#'
#' harvest_get() is a wrapper for dplyr's filter() and queries should be
#' structured as such.
#'
#' @param ... keyword arguments to make homebrewed API call
#'            possible arguments: VISN, Site, Year, Quarter
#'
#' @return A tibble with download URLs that can be passed on to harvest_wrngl().
#'         If no arguments are entered, it will return URLs for all available datasets
#'
#' @examples \dontrun{
#' links <- harvest_get(Year == "2018" & VISN == "VISN 2")
#' links2 <- harves_get(Site %in% c("Syracuse", "Buffalo", "Rochester") & Year == 2017)
#' }
#'

harvest_get <- function(...){

  data <- jsonlite::fromJSON("https://www.data.va.gov/sites/default/files/VHA_DKAN_Harvest_Source_4.json")
  data <- data$dataset$distribution

  df <- purrr::map_df(data, magrittr::extract,c("title", "downloadURL","format"))

  clean <-  df %>% as_tibble() %>%
    mutate(title2 = title) %>%
    tidyr::separate(title, into = c("VISN", "Site"), sep = "\\d+") %>%
    tidyr::separate(title2, into = c("space","vnum", "Year", "Quarter"), sep = "\\D+") %>%
    tidyr::unite(VISN,VISN,vnum, sep = "") %>%
    mutate_at("Site", stringr::str_trim) %>%
    select(-space)

  return(filter(clean,...))

}


#'
#' harvest_wrngl() will import and tidy data on VA SAIL metrics.  This function requires
#' an object created with harvest_get()
#'
#' @param data a data object created with harvest_get()
#'
#' @return A tibble with SAIL metrics in tidy format
#'
#' @examples \dontrun{
#' links <- harvest_get(Year == "2018" & VISN == "VISN 2")
#' data <- harvest_wrngl(links)
#'
#' This can also be used in a pipe
#' data <- links %>% harvest_wrgnl()
#' }
#'


harvest_wrngl <- function(data){

  data <- mutate(data, id = as.character(row_number()))
  url <-  unique(data$downloadURL)

  downld <- purrr::map_df(url, function(x){

    file <- curl::curl_download(x, destfile = tempfile())

    readxl::read_excel(file, skip = 26) %>%
      select(-c(2:10,12:14,17)) %>%
      tidyr::gather(Site,Value, c(3))
  },
  .id = "id")

  merge <- left_join(downld,data, by = "id") %>%
    select(-downloadURL, -format, -Site.y, -id)

  return(merge)
}
