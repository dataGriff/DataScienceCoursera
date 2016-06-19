##setwd('E:/Documents/Projects/DataScienceCoursera/HospitalRProgAssignment3/rprog3_data')
##source('SharedFunctions.R')
readOutcomeData <- function(){
    read.csv("outcome-of-care-measures.csv", colClasses = "character")
}

readHospitalData <- function(){
  read.csv("hospital-data.csv", colClasses = "character")
}

outcomes <- function(){
  c("heart attack","pneumonia","heart failure")
}

states <- function(){
  unique(readOutcomeData()$State)
}

isOutcomeValid <- function(outcome){
    validOutcome <- outcome %in% outcomes()
    if(!validOutcome){
      stop("invalid outcome")
    }
    validOutcome
   
}

isStateValid <- function(state){
  validState <- state %in% states()
  if(!validState){
    stop ("invalid state")
  }
  validState
}

isNumValid <- function(num){
  validNum <- (is.numeric(num) | num =="best" | num =="worst")
  if(!validNum){
    stop ("invalid num")
  }
  validNum
}

getOutcomeMortality <- function(outcome, state = ""){
  isOutcomeValid(outcome)
  if(outcome=="heart attack"){
    n <- 11
  }
  if(outcome=="heart failure"){
    n <- 17
  }
  if(outcome=="pneumonia"){
    n <- 23
  }
  outcomeMortality <- (readOutcomeData()[,c(2,7,n)])
  ##print(colnames(outcomeMortality))
  names(outcomeMortality)[3]="MortalityRate"
  subset(outcomeMortality, MortalityRate != "Not Available" & (State == state | state == ""), select=c(1,2,3))

  
}

##Notes and failures
##utcomecol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
##Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
##Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
##Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
##outcomeMortality <- which(outcomeMortality$MortalityRate != "Not Available")
##which(outcomeMortality[complete.cases(outcomeMortality),]$MortalityRate != "Not Available")
##outcomeMortality[which(outcomeMortality$MortalityRate != "Not Available")]
##subset(outcomeMortality, is.numeric(MortalityRate))