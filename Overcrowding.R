#########################################################################
## Zarni Htet                                                          ##
## Summer 2017                                                         ##
## Overcrowding on a bus at a particular bus stop was calculated using ##
## different bus types to determine if there is any relations between  ##
## overcrowding and backdoor entries. We did not find any              ##
## significant relationship for the highest backdoor entry CBG that we ##
## use the code for.                                                   ##  
#########################################################################

## Libraries
library(dplyr) # for data manipulation

## Steps to calculate overcrowding at each bus stop
#0. Calculate number of passenger on a bus at each bus stop
#1. Group that dataset by: Route, TripID, Bus, Bus_Type, Stops
#2. Use mutate chain to determine whether a bus is overcrowded and by how much?

##BUS TYPE and its capacity
# M = 30’ bus
# L = regular 40’ bus
# K = 60’ articulated bus

# Below we use 2 different cut-off points. Initially, we consider a bus to be overcrowded
# if there are 10 people in excess of its capacity. In a different way, we also consider it
# to be overcrowded if a bus is beyond its stated capacity immediately.

southdc_cbg_non_zero_intm_02 <- southdc_cbg_non_zero_intm %>%
  group_by(ROUTE, TRIPID,BUS_ID, BUS_STOP_ID, BUS_TYPE) %>%
  mutate(OC_40_50 = ifelse(BUS_TYPE == "L" & TRIDERS > 50, 1,
                           ifelse(BUS_TYPE == "M" & TRIDERS > 40, 1,
                                  ifelse(BUS_TYPE == "T" & TRIDERS > 50, 1,0)))) %>%
  mutate(OC_40_50_Volume = ifelse(BUS_TYPE == "L" & TRIDERS > 50, TRIDERS -50,
                                  ifelse(BUS_TYPE == "M" & TRIDERS > 40, TRIDERS - 40,
                                         ifelse(BUS_TYPE == "T" & TRIDERS > 50, TRIDERS -50,0)))) %>%
  mutate(OC_30_40 = ifelse(BUS_TYPE == "L" & TRIDERS > 40, 1,
                           ifelse(BUS_TYPE == "M" & TRIDERS > 30, 1,
                                  ifelse(BUS_TYPE == "T" & TRIDERS > 40, 1,0)))) %>%
  mutate(OC_30_40_Volume = ifelse(BUS_TYPE == "L" & TRIDERS > 40, TRIDERS - 40,
                                  ifelse(BUS_TYPE == "M" & TRIDERS > 30, TRIDERS - 30,
                                         ifelse(BUS_TYPE == "T" & TRIDERS > 40, TRIDERS - 40,0))))




