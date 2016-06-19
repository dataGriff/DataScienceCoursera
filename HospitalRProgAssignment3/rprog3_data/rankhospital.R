##setwd('E:/Documents/Projects/DataScienceCoursera/HospitalRProgAssignment3/rprog3_data')
rankhospital <- function(state,outcome, num="best"){

  
    ##Check that state and outcome are valid and num are valid
  if(isStateValid(state) && isOutcomeValid(outcome) && isNumValid(num)){
    
      ##Return hospital name in that state with the given rank
      ## 30-day death rate
      ##get all data for outcome specified for specific state
      outcomeMortality <- getOutcomeMortality(outcome,state)
      ##find out number of rows so can get last one for "worst"
      rows = nrow(outcomeMortality)
      ##set to 1 if best
      if(num=="best"){
          num=1
      }
      ##set to number of rows if worst
      if(num=="worst"){
          num = rows
      }
      ##return the num row
      outcomeMortality[with(outcomeMortality, order(as.numeric(MortalityRate),Hospital.Name)), ]$Hospital.Name[num]
  }
  
}

##Notes and Errors
##rows = nrow(outcomeMortality)
##if(num=="best"){
##  num=1
##}
##if(num=="worst"){
##  num = rows
##}
##if(rows < num)
##{
##  return
##}
##tail(head(outcomeMortality[with(outcomeMortality, order(as.numeric(MortalityRate),Hospital.Name)), ],num),1)$Hospital.Name