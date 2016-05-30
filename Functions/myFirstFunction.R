#Run in console
add2 <- function (x,y){
  x+y
}
#then add2(3,5)

above10 <- function(x){
  use <- x > 10
  x[use]
}

#run in console selection
# x <- 1:20
# above(x,12)
above <- function(x,n=10){ #default set
  use <- x > n
  x[use]
}


#run in console
#columnmean((airquality))
#new parameter removes NA
columnmean <- function(y, removeNA = TRUE){
   nc <- ncol(y)
   means <- numeric(nc)
   for(i in 1:nc){
     means[i] <- mean(y[,i], na.rm = removeNA)
   }
   means
}

#run in console
#it prints a 
#then error after 45 printed as b not required for first bit
#last evaluation
lazyf <- function(a,b){
  print(a)
  print(b)
}
f(45)
  

