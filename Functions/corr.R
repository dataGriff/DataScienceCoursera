corr <- function(directory, threshold = 0){
  ## 'directory is a character vector of length 1 indicating
  ## the locaiton of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) requireed to compute the correlation between
  ## notrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  ##You will need to use the function cor in this
  ##use ?cor to know what it does
  
  files <- list.files(directory, full.names = TRUE)
  
  workframe <- data.frame()
  
  rtn <- vector()
  
      for (i in seq_along(files)){
      filename <- files[i]
      workframe <-  read.csv(filename)
        if(sum(complete.cases(workframe)) > threshold){
          rtn <- c(rtn,cor(workframe$sulfate, workframe$nitrate, use="complete"))
        }
    }
    
  rtn
  
}

##Notes##################################

##workframe <- read.csv("specdata/001.csv"); cor(workframe$sulfate, workframe$nitrate, use="complete")

"  for (i in seq_along(files)){
    filename <- files[i]
    x <-  read.csv(filename)
      if(sum(complete.cases(x)) > threshold){
        workframe <- rbind(workframe,x,2)
      }
  }"

## workframe <- read.csv("specdata/001.csv")

##  rtn <- cor(workframe["sulfate"],workframe["nitrate"])

" 

rtn <- data.frame()
  
  for (i in seq_along(files)){
    filename <- files[i]
    x <-  read.csv(filename)
      if(sum(complete.cases(x)) > threshold){
        rtn <- rbind(rtn,head(x,2))
      }
  }
  rtn
  "