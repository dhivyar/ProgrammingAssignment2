## FUNCTION 'makeCacheMatrix' DESCRIPTION:

## This function creates functions that can set and get the value of a 'special' matrix;
## Can cache the value of the matrix inverse
## And also can get the value of the inverse of the 'special' matrix if it is available in the cache 

makeCacheMatrix <- function(x = matrix()) {
## Create a special matrix 'x'
  ## Create an empty cache, m
  m <- NULL
  ## 'set' function to read the special matrix with lexically scoped variables
  set <- function(y = matrix()) {
    x <<- y
    m <<- NULL
  }
  ## 'get' function which retrieves the data set by the 'Set' function
  get <- function() x
  ## 'setinverse' function which caches the matrix inverse
  setinverse <- function(inverse) m <<- inverse
  ## 'getinverse' function which retrieves the inverse of the matrix 'x' if available in the cache
  getinverse <- function() m
  ## This function is actually creating a list of functions that do the following:
    ## 1. set the value of the matrix
    ## 2. get the value of the matrix
    ## 3. set the value of the matrix inverse
    ## 4. get the value of the matrix inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

##------------------------------------------------------------------------------------------------------

## FUNCTION 'cacheSolve' DESCRIPTION:

## This function will retrieve the inverse of the matrix from the cache; 
## If cache is empty, it then calculates the inverse of the matrix returned by the 'makecacheMatrix' funtion
## and stores the value of the inverse in the cache

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  ## Get the cached data
  m <- x$getinverse()
  
  ## If the cached data is not NULL
  if(!is.null(m))
  {
    ## Retrieve the cached data
    message("Returning cached data ")
    ## Return the cached data, which is the inverse of the matrix
    return(m)
  }
  
  ## If the cached data is NULL
  ## Get the data from the 'makecacheMatrix' function
  data <- x$get()
  ## Compute the inverse of the matrix
  m <- solve(data, ...)
  ## Set the computed inverse of the matrix to the cache
  x$setinverse(m)
  ## Return cached data (inverse of the matrix)
  m  
}
