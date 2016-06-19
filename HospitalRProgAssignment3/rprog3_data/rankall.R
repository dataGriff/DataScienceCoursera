##setwd('E:/Documents/Projects/DataScienceCoursera/HospitalRProgAssignment3/rprog3_data')
rankall <- function(outcome, num="best"){
  
  ##Use shared functions
  source("SharedFunctions.R")

  ##Check that outcome and state are valid, if they are perform function
  if(isOutcomeValid(outcome) && isNumValid(num) ){
    
    ## For each state, find the hospital of the given rank
    ##get all data for outcome specified for all states
    outcomeMortality <- getOutcomeMortality(outcome,"") 
    ##split data frame into list of data frames grouped by state
    statesFrameList <- split(outcomeMortality,f = outcomeMortality$State)
    ##order each of the states by mortality rate and hospital name
    statesFrameList <- lapply(statesFrameList, function(df){df[order(as.numeric(df$MortalityRate),df$Hospital.Name),]})
    
      ##set num to be 1 if num is best so can use the same generic statement in else
      if(num=="best"){
        num=1
      }
      ##if worst then use tail
      if(num=="worst"){
        statesFrameList <- lapply(statesFrameList, tail, 1)
      }
      ##use generic statement to get particular row
      else
      {
        statesFrameList <- lapply(statesFrameList,"[",num,,drop=FALSE)
      }
      return <- do.call("rbind",statesFrameList)
  
      ##Return a data frame with the hospital names and the (Abbreviated state name)
      names(return)[1]="hospital"
      names(return)[2]="state"
      return[,c(1,2)]
  }
}

#Notes and errors
##split(outcomeMortality[with(outcomeMortality, order(as.numeric(MortalityRate),Hospital.Name)), ],f = outcomeMortality$State)
##outcomeMortality[with(outcomeMortality, order(as.numeric(MortalityRate),Hospital.Name)), ]$Hospital.Name[num]
##lapply(x,order(as.numeric(x$MortalityRate),x$Hospital.Name))
## statesFrameList <- lapply(statesFrameList,"[",nrow(statesFrameList),,drop=FALSE)
## statesFrameList <- lapply(statesFrame
##List, function(d) {d[tail(d,5)]} ) 
## testFrameList <- lapply(statesFrameList, function(d) {d[tail(d,5)]} ) 
##   statesFramtList <- testFrameList
## lapply(statesFrameList, function(x)x[tail,1])