pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory is a character vector of length 1 indicating
  ## the locaiton of the CSV files
  
  ##'pollutant is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate"
  
  ##'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE; Do not round the result!
  
  #setwd("~/Projects/DataScienceCoursera")
  
  files <- list.files(directory, full.names = TRUE)[id] #relies on order of files though..changed order and worked!

  x <- data.frame()
  
  for (i in files){
        x <-  rbind(x,read.csv(i))##[[pollutant]]
  }
    
  y <- mean(x[[pollutant]],na.rm=TRUE)
    
  y
  
}

###################################################
##Load of notes below (trial and error!!)
####################################################
  ##  x <- data.frame(row.names = "pollutant")

#  read.csv("specdata/001.csv")[[pollutant]]
##  print(files[1])
## print(files)
##filename <- files[id]


  ## for (i in id){
    ## id <- id[i]
    # filename <- files[id]
    ## print(filename);
     ##if(is.na(filename) == FALSE){
   ##x <-  read.csv(filename)}[[pollutant]]
  
  ## }
   #x
  ## y <- mean(x,na.rm=TRUE)
  ##  y
    ## y <- read.csv(files[i])[[pollutant]]
 ##  x <- rbind(x,y)
  ## y
  ## }
    ##  x <- mean(x,na.rm=TRUE)
      ## x
      ##x <- read.table(x,na.rm)
     ## read.csv(path)
       
     ##     if(pollutant == "sulfate"){
      ##        read.csv(path)
       ##   }
    
 ## path = "specdata/001.csv"
 ## read.csv(path)
 
