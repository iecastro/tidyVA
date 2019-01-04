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
#' A dataset of geometry and attributes of Veteran Affairs locations as of 9/30/2016
#' Includes Veterans Health Administration:  Medical Centers (VAMC),
#' Community - Based Outpatient Clinics (CBOC), Community Living Centers (CLC),
#' Domiciliary Residential Rehabilitation Treatment Program (DRRTP), Vet Centers (VCTR).
#' Veterans Benefits Administration: Regional Offices (RO).
#' National Cemetery Administration:  National and State Cemeteries.
#'
#' @format A simple feature collection with 1937 rows and 45 variables:
#' \describe{
#'   \item{StationNumber}{Site ID}
#'   \item{FacilityName}{Site Name}
#'   \item{PrimaryService}{Primary service of site}
#'   \item{PrimaryAttribute}{Location type}
#'   \item{Mobile}{Whether facility is a Mobile VA Clinic}
#'   \item{Address1}{Address component}
#'   \item{Address2}{Address component}
#'   \item{Address3}{Address component}
#'   \item{PhoneNumber}{Site's phone number}
#'   \item{City}{City}
#'   \item{StateAbbreviation }{State abbreviation}
#'   \item{Zip}{ZIP Code}
#'   \item{CemeteryType}{Whether National or State}
#'   \item{CemeteryOperations}{Operations}
#'   \item{City}{City}
#'   \item{VAAdministration}{Administration ID}
#'   \item{Latitude}{Latitude}
#'   \item{Longitude}{Longitude}
#'   ...
#'   \item{geometry}{Geometry of shape}
#' }
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
