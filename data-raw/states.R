library(tigris)
library(usethis)

options(tigris_class = "sf")

states <- states(cb = TRUE) %>%
  sf::st_transform(4326)

# visn_st <- sf::st_intersection(states, visn)

write_sf(states,"data/states.shp")

states <- read_sf("data/states.shp") %>%
  use_data()
