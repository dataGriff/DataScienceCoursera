##setwd('E:/Documents/Projects/DataScienceCoursera/HospitalRProgAssignment3/rprog3_data')
best <- function(state,outcome){
  source("SharedFunctions.R")
  ##Read outcome data
  outcomeData <- readOutcomeData
  
  ##Check that state and outcome are valid
  if(isStateValid(state) && isOutcomeValid(outcome)){
    
    ##Return hospital name in that state with lowest
    ##30-day death rate
    ##get all data for outcome specified for specific state
    outcomeMortality <- getOutcomeMortality(outcome,state)
    ##return the best (head) row
    head(outcomeMortality[with(outcomeMortality, order(as.numeric(MortalityRate),Hospital.Name)), ],1)$Hospital.Name
  }
  
}