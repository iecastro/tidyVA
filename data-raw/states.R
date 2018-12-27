library(tigris)
library(usethis)

options(tigris_class = "sf")

states <- states(cb = TRUE) %>%
  sf::st_transform(4326)

use_data(states)
