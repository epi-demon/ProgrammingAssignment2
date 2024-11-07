## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special matrix object that can cashe its inverse. It returns a list of functions to both set and get the matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
invs <- NULL
        set <- function(y) {
        x <<- y
        invs <<- NULL
}

get <- function() {
        x
}

setInverse <- function(inverse) {
        invs <<- inverse
}

getInverse <- function() {
        invs
}

list(set, get = get, setInverse = setInverse, getInverse = getInverse)
}
        
## Write a short comment describing this function
## This function calculates the inverse of the special matrix returned by the code above. If it has already been calculated, it retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
       invs <- x$getInverse()
if (!is.null(invs)) {
        message( "getting cashe data")
        return(invs)
}

mat <- x$get()
invs <- solve(mat, ...)

x$setInverse(invs)

invs
}
