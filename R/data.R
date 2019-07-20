#' VHA geography - county level
#'
#' A dataset of geometry and attributes of VHA geographies at the county level
#'
#' @format A simple feature collection with 3225 rows and 12 variables:
#' \describe{
#'   \item{NAME}{County Name}
#'   \item{FIPS}{County FIPS Code}
#'   \item{STATE_NAME}{State where County is located}
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{MARKET}{VHA Market ID}
#'   \item{SUBMARKET}{VHA Submarket ID}
#'   \item{SECTOR}{Sector ID}
#'   \item{STATE_FIPS}{State FIPS Code}
#'   \item{ST}{State abbreviation}
#'   \item{FIPS}{County FIPS Code}
#'   \item{Shape_Leng}{Length of shape}
#'   \item{Shape_Area}{Area of shape}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties}
"county"


#' VHA geography - market level
#'
#' A dataset of geometry and attributes of VHA geographies at the market level
#'
#' @format A simple feature collection with 97 rows and 5 variables:
#' \describe{
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{MARKET}{VHA Market ID}
#'   \item{Shape_Leng}{Length of shape}
#'   \item{Shape_Area}{Area of shape}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties}
"market"


#' VHA geography - sector level
#'
#' A dataset of geometry and attributes of VHA geographies at the sector level
#'
#' @format A simple feature collection with 568 rows and 7 variables:
#' \describe{
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{MARKET}{VHA Market ID}
#'   \item{SUBMARKET}{VHA Submarket ID}
#'   \item{SECTOR}{Sector ID}
#'   \item{Shape_Leng}{Length of shape}
#'   \item{Shape_Area}{Area of shape}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties}
"sector"


#' VHA geography - submarket level
#'
#' A dataset of geometry and attributes of VHA geographies at the submarket level
#'
#' @format A simple feature collection with 153 rows and 6 variables:
#' \describe{
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{MARKET}{VHA Market ID}
#'   \item{SUBMARKET}{VHA Submarket ID}
#'   \item{Shape_Leng}{Length of shape}
#'   \item{Shape_Area}{Area of shape}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties}
"submarket"


#' VHA geography - visn level
#'
#' A dataset geometry and attributes of VHA geographies at the visn level
#'
#' @format A simple feature collection with 18 rows and 4 variables:
#' \describe{
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{Shape_Leng}{Length of shape}
#'   \item{Shape_Area}{Area of shape}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.data.va.gov/dataset/veterans-integrated-services-networks-visn-markets-submarkets-sectors-and-counties}
"visn"


#' VA locations
#'
#' A dataset of geometry and attributes of Veteran Affairs locations as of 9/30/2018.
#' Veterans Health Administration (VHA):
#' Medical Centers (VAMC), Community - Based Outpatient Clinics (CBOC),
#' Community Living Centers (CLC), Domiciliary Residential Rehabilitation Treatment Program (DRRTP),
#' Vet Centers (VCTR).
#' Veterans Benefits Administration (VBA):  Regional Offices (RO).
#' National Cemetery Administration (NCA):  National and State Cemeteries.
#'
#' @format A simple feature collection with 1953 rows and 50 variables:
#' \describe{
#'   \item{StationNumber}{Site ID}
#'   \item{FacilityName}{Site Name}
#'   \item{PrimaryService}{Primary service of site}
#'   \item{PrimaryAttribute}{Location type}
#'   \item{Mobile}{Whether facility is/has a Mobile VA Clinic}
#'   \item{Address1}{Address component}
#'   \item{Address2}{Address component}
#'   \item{Address3}{Address component}
#'   \item{PhoneNumber}{Site's phone number}
#'   \item{FaxNumber}{Site's fax number}
#'   \item{City}{City}
#'   \item{StateAbbreviation}{State abbreviation}
#'   \item{Zip}{ZIP Code}
#'   \item{CemeteryType}{Whether National or State}
#'   \item{CemeteryOperations}{Operations}
#'   \item{VAAdministration}{VA Administration Agency}
#'   \item{Latitude}{Latitude}
#'   \item{Longitude}{Longitude}
#'   \item{SuppService}{Supplemental Services}
#'   ...
#'   \item{STCD}{Combined ID for State FIPS and Congressional District number}
#'   \item{StateFIPS}{State FIPS Code}
#'   \item{Congressional District where facility is located}
#'   \item{LASTNAME}{U.S. Representative - Last Name}
#'   \item{FIRSTNAME}{U.S. Representative - First Name}
#'   \item{FIPS}{County FIPS Code}
#'   \item{CountyName}{County Name where facility is located}
#'   \item{VISN}{Veteran Integrated Service Network ID}
#'   \item{MARKET}{VHA Market ID}
#'   \item{SUBMARKET}{VHA Submarket ID}
#'   \item{SECTOR}{VHA Sector ID}
#'   \item{PrimaryRUCACode2010}{Primary Rural-Urban Commuting Area Code (2010 Census) of site's location}
#'   \item{SecondaryRUCACode2010}{Secondary Rural-Urban Commuting Area Code (2010 Census) of site's location*}
#'   \item{RUCA_UrbanRural}{Commuting Area Rural/Urban Classification*}
#'   \item{VADistrictCode}{VA Regional Districts: 1-Northeast, 2-Southeast, 3-Midwest, 4-Continental, 5-Pacific**}
#'   \item{geometry}{Geometry of shape}
#' }
#' @section Notes:
#' *2010 Secondary RUCA codes were revised on 7/3/2019 affecting 10,909 census tracts. \url{https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes/}
#' **In early 2019 VA Districts were restructured from five to four. \url{https://www.va.gov/opa/pressrel/pressrelease.cfm?id=5194}
#' @source \url{https://www.va.gov/vetdata/maps.asp}
"VAloc"


#' States
#'
#' A dataset of geometry and attributes of States and Equivalent Entities of the US.
#' In addition to the 50 states, the District of Columbia, Puerto Rico, American Samoa,
#' the Commonwealth of the Northern Mariana Islands, Guam, and the U.S. Virgin Islands
#' are included
#'
#' @format A simple feature collection with 56 rows and 10 variables:
#' \describe{
#'   \item{STATEFP}{State FIPS Code}
#'   \item{STATENS}{State ANSI Code}
#'   \item{AFFGEOID}{State American FactFinder GEOID}
#'   \item{GEOID}{State Geographic Identifier}
#'   \item{STUSPS}{State Abbreviation}
#'   \item{NAME}{State Name}
#'   \item{LSAD}{LSAD Code}
#'   \item{ALAND}{Land Area}
#'   \item{AWATER}{Water Area}
#'   \item{geometry}{Geometry of shape}
#' }
#' @source \url{https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html}
"states"
