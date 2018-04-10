#########################################################################
## Zarni Htet                                                          ##
## Summer 2017                                                         ##
## A code snippet that runs through over a million records to generate ##
## a synthetic trip ID to be able to match with another data set       ##
## I presented one of the approaches. The P.I has another. Neither were##
## used later as a new data set with trip ID was made available        ##  
#########################################################################

##############
##Objective###
##############

###################################################################################################
# The most fundamental unit in the data sets would be a combination                               #
# busID, stopID, tripID, routeID and route direction. With these id combinations                  #
# one can determine how many people fare evade on the particular bus, at a specific               #
# stop, for a patricular trip (which deterimes the time of the day) of a route going              #
# in either North, East, South or West.In one of the datasets we are missing tripID               #
# column. The goal is to create the tripID via grouping the other IDs and using time interval     #
# between rows as a determinant of different trips.                                               #
###################################################################################################


## Libraries
library(rio)   # for data importation
library(dplyr) # for data manipulaton
library(tidyr) # for data cleaning
library(lubridate) # for data time resolution

## 1) Subsetting data to the first 5 days in May 2017 and by 5:00 - 10:00 AM
bus_subset <- bus_subset[date(bus_subset$EVENT_TIME) >= "2017-05-01" & date(bus_subset$EVENT_TIME) <= "2017-05-05",]
bus_subset <- bus_subset[hour(bus_subset$EVENT_TIME) >= 5 & hour(bus_subset$EVENT_TIME) < 10,]

## 2) Creating unique ID to composed of BusID, Route and Route Direction
ID_UNIQ<-paste(bus_subset$BUS_ID,bus_subset$route,bus_subset$Route_Direction, sep="")
length(ID_UNIQ)
bus_subset$ID_UNIQ <- ID_UNIQ
bus_subset <- bus_subset[,3:length(names(bus_subset))]
names(bus_subset)

## 3) Creating Synthetic TripID 
## If the time between each row is more than 12 minutes, we consider all the subsequent
## rows in the dataset to be of a different trip.

startTime <- Sys.time()
bus_state_trip_id <-bus_subset%>%
  group_by(ID_UNIQ) %>%
  arrange(BUS_ID, route, Route_Direction,EVENT_TIME) %>%
  mutate(tlag = lag(EVENT_TIME)) %>%
  mutate(diff = as.numeric(difftime(EVENT_TIME,tlag, units = "mins"))) %>%
  tidyr::replace_na(list(diff = 100000)) %>%
  mutate(g30 = abs(diff) >= 12) %>%
  ungroup() %>%
  mutate(cum_id_nogroup = cumsum(g30))
endTime <- Sys.time()
elapsed <- startTime-endTime

