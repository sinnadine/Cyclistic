#Step 1: installing the required packages
install.packages('tidyverse')
library(tidyverse)
library(lubridate)
install.packages("sqldf")
library(sqldf)

#Step 2: uploading 12 months datasets
q2_2019 <- read_csv(/Users/user/Documents/R/Data/Cyclistic_12_months_dataset/Divvy_Trips_2019_Q2.csv)
q3_2019 <- read.csv('/Users/user/Documents/R/Data/Cyclistic_12_months_dataset/Divvy_Trips_2019_Q3.csv')
q4_2019 <- read_csv('/Users/user/Documents/R/Data/Cyclistic_12_months_dataset/Divvy_Trips_2019_Q4.csv')
q1_2020 <- read_csv('/Users/user/Documents/R/Data/Cyclistic_12_months_dataset/Divvy_Trips_2020_Q1.csv')

#Step 3: inspecting the uploaded datasets
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)

#Pre-cleaning activities
#Step 1: rename colomns to make them consistent with q1_2020
q2_2019 <- q2_2019 %>%
  rename(
    ride_id = "01 - Rental Details Rental ID",
    rideable_type = "01 - Rental Details Bike ID",
    started_at = "01 - Rental Details Local Start Time",
    ended_at = "01 - Rental Details Local End Time",
    start_station_name = "03 - Rental Start Station Name",
    start_station_id = "03 - Rental Start Station ID",
    end_station_name = "02 - Rental End Station Name",
    end_station_id = "02 - Rental End Station ID",
    member_casual = "User Type"
  )

q3_2019 <- q3_2019 %>%
  rename(
    ride_id = trip_id,
    rideable_type = bikeid,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  )

q4_2019 <- q4_2019 %>%
  rename(
    ride_id = trip_id,
    rideable_type = bikeid,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  )

#Step 2: inspecting dataset after renaming the matching columns
head(q2_2019)
head(q3_2019)
head(q4_2019)

#Step 3: Data type conversion
q4_2019 <- mutate(q4_2019, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type))

q3_2019 <- mutate(q3_2019, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type))

q2_2019 <- mutate(q2_2019, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type))

#Step 4: Stack data frames into one big data frame
cyclistic_dataset <- bind_rows(q2_2019, q3_2019, q4_2019, q1_2020)

#Step 5: Inspecting the combined data frame
head(cyclistic_dataset)
