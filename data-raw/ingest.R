library(tidyverse)
library(sf)

##================== VA LOCATIONS =======================
## point data of VA Facilities

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.va.gov/vetdata/docs/Maps/VAFacilitiesFY16Q4_web.gdb.zip",temp)
unzip(temp, exdir = temp2)

## all
VAloc <- read_sf(file.path(dsn=temp2,layer="VAFacilitiesFY16Q4_web.gdb")) %>% st_zm()

## save file
#st_write(VAloc,"vaspatial/VAlocations/VAloc.shp")


##=================== VA VISN shapefile =====================================
## visn level geometry

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.data.va.gov/sites/default/files/FY2017_Q4_VISN.zip",temp)
unzip(temp, exdir = temp2)

visn <- read_sf(file.path(dsn=temp2,layer="FY2017_Q4_VISN.shp"))

## save
#st_write(visn, "vaspatial/visn/visn.shp")

##================= VA MARKET shapefile ==================================
## market level geometry

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.data.va.gov/sites/default/files/FY2017_Q4_Markets.zip",temp)
unzip(temp, exdir = temp2)

market <- read_sf(file.path(dsn=temp2,layer="FY2017_Q4_Markets.shp"))

## save
#st_write(market, "vaspatial/market/market.shp")

##================ VA SUBMARKET shapefile ===================================
## submarket level geometry

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.data.va.gov/sites/default/files/FY2017_Q4_Submarkets.zip",temp)
unzip(temp, exdir = temp2)

submarket <- read_sf(file.path(dsn=temp2,layer="FY2017_Q4_Submarkets.shp"))

## save
#st_write(submarket, "vaspatial/submarket/submarket.shp")

##================ VA SECTOR shapefile ===================================
## sector level geometry

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.data.va.gov/sites/default/files/FY2017_Q4_Sectors.zip",temp)
unzip(temp, exdir = temp2)

sector <- read_sf(file.path(dsn=temp2,layer="FY2017_Q4_Sectors.shp"))

## save
#st_write(sector, "vaspatial/sector/sector.shp")


##================ VA COUNTY shapefile ===================================
## county level geometry

temp <- tempfile()
temp2 <- tempfile()
download.file("https://www.data.va.gov/sites/default/files/FY2017_Q4_Counties.zip",temp)
unzip(temp, exdir = temp2)

county <- read_sf(file.path(dsn=temp2,layer="FY2017_Q4_Counties.shp"))

## save
#st_write(county, "vaspatial/county/county.shp")

##============== geo shift ================================================
# code modified from https://github.com/rdinter/rd3albers &
# https://geocompr.robinlovelace.net/geometric-operations.html

# convert to Albers equal area
proj <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

rotate <- function(a){
  r = a * pi / 180 #degrees to radians
  matrix(c(cos(r), sin(r), -sin(r), cos(r)), nrow = 2, ncol = 2)
}

us_aea <- st_transform(county,proj)

# extract, then rotate, shrink & move alaska (and reset projection)
alaska <- us_aea %>% filter(STATE_FIPS == "02")
alaska_geom <- st_geometry(alaska)

alaska_shift <- alaska_geom + c(-3450000, -2500000)
alaska_shift <- (alaska_shift / 2.3) * rotate(-50)
alaska_shift <- st_set_crs(alaska_shift,proj)

alaska <- st_set_geometry(alaska,alaska_shift)

# extract, then rotate & shift hawaii
hawaii <- us_aea %>% filter(STATE_FIPS =="15")
hawaii_geom <- st_geometry(hawaii)

hawaii_shift <- hawaii_geom + c(4250000,-10500)
hawaii_shift <- (hawaii_shift * 1.4) *  rotate(-45)
hawaii_shift <- st_set_crs(hawaii_shift,proj)

hawaii <- st_set_geometry(hawaii,hawaii_shift)


# needs work -----------------------------------------------
# extract, then rotate & shift puerto rico

#pr <- us_aea %>% filter(STATE_FIPS == "72")
#pr_geom <- st_geometry(pr)

#pr_shift <- pr_geom +  c(-9500000, -4500000)
#pr_shift <- (pr_geom * 2) * rotatate(15)
#pr_shift <-  st_set_crs(pr_shift,proj)
#pr <- st_set_geometry(pr, pr_shift)

# remove old states and put new ones back in; note the different order
# we're also removing puerto rico in this example but you can move it
# between texas and florida via similar methods to the ones we just used

#----------------------------------------------------------------

us_aea <- us_aea %>% filter(!ST %in% c("HI", "AK","GU","AS","PI","PR", "VI"))
countyshift <- rbind(us_aea, alaska, hawaii)

## test geo shift mapping
ggplot() + geom_sf(data = countyshift, fill = NA)

#st_write(us_aea, "vaspatial/shift/countyshift.shp")


