library(tigris)
library(purrr)
library(usethis)

options(tigris_class = "sf")

st <- unique(tidyVA::states$STATEFP)[1:56]


all_tracts <- reduce(
  map(st, function(x) {
    tracts(state = x, cb = TRUE)
  }),
  rbind
)

tracts <- all_tracts %>%
  tidyr::unite(FIPS, STATEFP,COUNTYFP, sep ="") %>%
  sf::st_transform(4326)


data("county")

#county %>% as.data.frame() %>%
#  select(FIPS, County = NAME, State = STATE_NAME, ST,
#                  VISN,MARKET,SUBMARKET) %>%
#  right_join(tracts, by = "FIPS")




