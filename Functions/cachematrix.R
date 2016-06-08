## The first function caches the inverse of a matrix
## and the second function will use this cached matrix and return it if available in cache
## or creates it if it is not available

## This function caches the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  
  inverseMatrix <- NULL
  
  ## 1.set the value of the matrix
  set <- function(y) {
    x <<- y
    inverseMatrix <<- NULL
  }
  
  ## 2.get the value of the matrix
  get <- function() {
    x
  }
  
  ## 3.set the value of the inverse
  setsolve<- function(solve) {
    inverseMatrix <<- solve
  }
  
  ## 4.get the value of the mean
  getsolve <- function() {
    inverseMatrix
  }
  
  ##5. Returns list of functions
  list(set = set, 
       get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function returns the inverse of a matrix if cached or creates inverse if not cached

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  inverseMatrix <- x$getsolve()
  
  if(!is.null(inverseMatrix)) { #if matrix is not null (i.e. cahced) then return matrix
    message("User Information: Getting cached data.")
    return(inverseMatrix)
  }
  ##else we need to get the input matrix
  
  message("User Information: Create the matrix as it is not in the cache.")
  
  data <- x$get()
  
  ##solve it 
  inverseMatrix <- solve(data, ...)
  
  x$setsolve(inverseMatrix)
  
  inverseMatrix
}

## Example input logic for console to test #############################
## setwd("~/Projects/DataScienceCoursera")
##; source("Functions/cachematrix.R")
##; myMatrix <- matrix (1:4, nrow= 2, ncol = 2)
##; x = makeCacheMatrix(myMatrix)
##; print("Run No.1")
##; cacheSolve(x) ##Will show mesage of creating matrix as not in cache
##; print("Run No.2")
##; cacheSolve(x) ##Will show mesage of getting cached data




