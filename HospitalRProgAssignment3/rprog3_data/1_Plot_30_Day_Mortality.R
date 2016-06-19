##setwd('E:/Documents/Projects/DataScienceCoursera/HospitalRProgAssignment3/rprog3_data')
##then source("1_Plot_30_Day_Mortality.R")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #read in outcome of care measures as characters
head(outcome) #look at the first few rows (there is lots of data)
ncol(outcome) #42 columns
names(outcome) #names of the columns
outcome[,11] <- as.numeric(outcome[,11]) #converts column 11, 30-day mortality rates from heart attack as numeric
hist(outcome[,11]) #creates historgram of 30-day mortality rate