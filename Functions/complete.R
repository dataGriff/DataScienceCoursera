complete <- function(directory, id= 1:332){
  ## 'directory is a character vector of length 1 indicating
  ## the locaiton of the CSV files
  
  ##'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form@
  ##id nobs
  ##1 117
  ##2 1041
  ##...
  ##wher 'id is the monitor ID number and 'nobs is the 
  ##number of complete cases
  
  files <- list.files(directory, full.names = TRUE)[id]
  
  rtn <- data.frame()
  
  for (i in seq_along(files)){
      filename <- files[i]
      x <-  read.csv(filename)
      nobs <- sum(complete.cases(x))
      ido <- id[i]
      fileresult <- data.frame(ido, nobs)
      rtn <- rbind(rtn,fileresult)
  }
  
  rtn
}


##Notes##############################

##setwd("~/Projects/DataScienceCoursera"); 
##source("Functions/complete.R"); x <- complete("specdata", 1); x

"
for (file in files){
    x <-  read.csv(file)
    nobs <- sum(complete.cases(x))
    ido <- id[seq_along(files)]
    print(ido)
   ## print(seq_along(files))
    fileresult <- data.frame(ido, nobs)
    ##print(fileresult)
    rtn <- rbind(rtn,fileresult)
   # print(ido)
  ## print(rw)
  }"