
## The first function, makeVector creates a special "vector"
## , which is really a list containing a function to

makeVector <- function(x = numeric()) {
  
  m <- NULL
  
  ## 1.set the value of the vector
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## 2.get the value of the vector
  get <- function() {
    x
  }
  
  ## 3.set the value of the mean
  setmean <- function(mean) {
    m <<- mean
  }
  
  ## 4.get the value of the mean
  getmean <- function() {
    m
  }
  
  ##5. Returns list of functions
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
  
}

##The following function calculates the mean of the special 
##"vector" created with the above function. 
##However, it first checks to see if the mean 
##has already been calculated. If so, it gets the mean 
##from the cache and skips the computation. Otherwise, 
##it calculates the mean of the data and sets the value 
##of the mean in the cache via the setmean function.

cachemean <- function(x, ...) {
  
  m <- x$getmean()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- mean(data, ...)
  
  x$setmean(m)
  
  m
}