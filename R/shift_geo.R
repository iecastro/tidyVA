#'  Shift VHA geographies for Alaska and Hawaii
#'
#'  @param data The shapefile with the feature geography you want to shift.
#'              Currently only supports sector and submarket shapefiles.
#'
#'  @return An sf tibble of VHA geographies and attributes
#'
#'  @references \url{ https://github.com/rdinter/rd3albers}
#'              \url{https://geocompr.robinlovelace.net/geometric-operations.html}
#'
#'  @examples
#'  shift_geo(submarket) %>% ggplot() +
#'  geom_sf(color = "#ffffff", size=.5, aes(fill = VISN)) +
#'  theme_minimal() + scale_fill_viridis_d()
#'
#'  @export

shift_geo <- function(data){ ## currently only for submarket & sector shapefiles

  # convert to Albers equal area
  proj <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

  rotate <- function(a){
    r = a * pi / 180 #degrees to radians
    matrix(c(cos(r), sin(r), -sin(r), cos(r)), nrow = 2, ncol = 2)
  }

  proj_aea <- st_transform(data,proj)

  if(data == tidyVA::states)

  # extract, then rotate, shrink & move alaska (and reset projection)
  alaska <- proj_aea %>% filter(STATEFP == "02")
  alaska_geom <- st_geometry(alaska)

  alaska_shift <- alaska_geom + c(-3450000, -2500000)
  alaska_shift <- (alaska_shift / 2.3) * rotate(-50)
  alaska_shift <- st_set_crs(alaska_shift,proj)

  alaska <- st_set_geometry(alaska,alaska_shift)

  # extract, then rotate & shift hawaii
  hawaii <- proj_aea %>% filter(STATEFP == "15")
  hawaii_geom <- st_geometry(hawaii)

  hawaii_shift <- hawaii_geom + c(4250000,-10500)
  hawaii_shift <- (hawaii_shift * 1.4) *  rotate(-45)
  hawaii_shift <- st_set_crs(hawaii_shift,proj)

  hawaii <- st_set_geometry(hawaii,hawaii_shift)

  out <- proj_aea %>% filter(!STATEFP %in% c("02","15","72","78","60","66"))
  out <- rbind(out, alaska, hawaii)

  message("Please note: Alaska and Hawaii are being shifted and are not to scale.")

  return(out)
}





