## The overall objective of this code is to provide a set of functions that, 
## given a matrix, can invert said matrix, can cache said inverted matrix, and check
## to see whether inverted matrix is cached

## For testing purposes a simple 2x2 matrix will be provided
testmaytricks <- matrix(1:4,2,2)
## Using solve(matrix(1:4,2,2)), it's established the inverted matrix should be:
##       [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

## The 'makeCacheMatrix' function, intuitively, makes a cache of matrix 'x' that can be inverted

makeCacheMatrix <- function(x = matrix()) {
## Setting the inverse value, the matrix values, and so on
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
## Allowing it to get the value of the matrix 'x', borrowing from
## the example code syntax
  get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
## A list of the functions that we will use with the $ operator later
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Below, the cache function. This should return the inverse of matrix x if the
## inverse of matrix x has been cached and stored, and the value is the same.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
}

data <- x$get()
inv <- solve(data, ...)
x$setinverse(inv)
inv
}
