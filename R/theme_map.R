#' Minimal ggplot theme for plotting sf without axis text
#'
#' @param ... defaults are preset
#'
#' @examples
#'  ggplot() +
#'  geom_sf(data) +
#'  theme_map()
#'
#' @export


theme_map <- function(...){
  ggplot2::theme_minimal() +
    ggplot2::theme(axis.text = ggplot2::element_blank())
}
