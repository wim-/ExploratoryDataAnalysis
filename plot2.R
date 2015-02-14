## Exploratory Data Analysis - course project 1
## by: github.com/wim-
## This script:
##    1) loads the required packages
##    2) reads the data, cleans it up, filters required dates
##    3) creates graph
## nota bene:
##    The script below assumes the data is contained
##    in a 'household_power_consumption' txt file.
##    This file should be located in the working directory.


## set corret locale to display english labels
Sys.setlocale(category = "LC_TIME", locale = "C")

#################################
## step 1: load packages       ##
#################################
if (!require("dplyr")) {
      install.packages("dplyr")
      library(dplyr)
}
if (!require("lubridate")) {
      install.packages("lubridate")
      library(lubridate)
}


#################################
## step 2: read and clean data ##
#################################
my_data <-
      read.csv("household_power_consumption.txt", sep=";", na.strings = "?") %>%
      tbl_df() %>%
      mutate(Time = paste(Date, Time, sep = "_")) %>%
      mutate(Time = dmy_hms(Time)) %>%
      select(-Date) %>%
      filter(Time >= dmy("1/2/2007") & Time < dmy("3/2/2007"))

#################################
## step 3: create graph        ##
#################################
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

with(my_data,
     plot(Time,
          xlab = '',
          Global_active_power,
          ylab = 'Global Active Power (kilowatts)',
          type = 'l'
          )
     )

dev.off()