## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  
  ## 1.set the value of the matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## 2.get the value of the matrix
  get <- function() {
    x
  }
  
  ## 3.set the value of the inverse
  setsolve<- function(solve) {
    m <<- solve
  }
  
  ## 4.get the value of the mean
  getsolve <- function() {
    m
  }
  
  ##5. Returns list of functions
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x = matrix(), ...) {
  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getsolve()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data, ...)
  
  x$setsolve(m)
  
  m
}
