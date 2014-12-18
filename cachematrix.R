## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


# this function works like a class by creating a list
# that contains 4 member functions: set, get, setInv
# and getInv. The <<- assignment operator prevents
# the internal variables from being exposed to the
# outside world. 

makeCacheMatrix <- function(x = matrix()) {
        
        xinv <- NULL # the result of inversion is stored here
        set <- function(y) {
                x <<- y
                xinv <<- NULL
        }
        
        get <- function() x # return the input matrix
        setInv <- function(inv) xinv <<- inv # set the inverse of the matrix
        getInv <- function() xinv # return the inverse of the matrix
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}


cacheSolve <- function(x, ...) {
        m <- x$getInv() # get the inverse of the matrix from object x
        if(!is.null(m)) { # if it contains an inversion result
                message("getting cached data")
                return(m) # return the calculated inversion
        }
        data <- x$get() # if it doesn't contain the result, x$get to get the matrix object
        m <- solve(data)
        x$setInv(m) # set it to the object
        m # return the solved result
}

# run a test using a matrix
test <- matrix(runif(9,1,100),3,3)
testCached <- makeCacheMatrix(test)
# test it using the cacheSolve function

testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
