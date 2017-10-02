#------------

library(dplyr)
library(ggplot2)
library(stringr)

#------------

data <- read.csv('KoreanConflict.csv', header = TRUE, stringsAsFactors = FALSE)
#import the data

colnames(data)
#show the column names

data$INCIDENT_DATE
#showing just the column INCIDENT_DATE

str_detect("19940208", "\\d{8}")
#look for an 8 digit entry, shows that it works

sum(str_detect(data$INCIDENT_DATE, "\\d{8}"))
#Looks for an 8 digit entry in the column incident date

dim(data)
#shows number of rows

#------------------

for(i in 1:36574){
  #loop through all the rows
  incident<-str_detect(data$INCIDENT_DATE[i], "\\d{8}")
  #create a bool for each row one at a time at the incident date column
  if(incident == FALSE){
    #if it is false
    fatality<-str_detect(data$FATALITY[i], "\\d{8}")
    #create a bool for each row one at a time at the fatality column
    if(fatality == TRUE){
      #if fatality is true
      data$INCIDENT_DATE[i]<-data$FATALITY[i]
      #move fatality to incident date in that row
    }
  }
}
