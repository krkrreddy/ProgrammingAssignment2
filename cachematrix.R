## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function Function makeCacheMatrix gets a matrix as an input, set the value of the matrix,
#get the value of the matrix, set the inverse Matrix and get the inverse Matrix. The matrix object
#can cache its own object.
#<<- operator is used to assign a value to an object in an environment that is different from the current environment 

#take the matrix as an input
makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
#set the value of the Matrix
 set <- function(y){
   x <<- y
   m <<- NULL
 }
 
#get the value of the Matrix
 get <- function()x 
#set the value of the invertible matrix 
 setInverse <- function(solve){
   m <<- solve
 }
#get the value of the invertible matrix
   getInverse <- function(){
   m
 }
 list(set = set, get = get, setInverse = setInverse,getInverse )
   
}


## Write a short comment describing this function
## The function cacheSolve takes the output of the previous matrix makeCacheMatrix(matrix) as an 
# input and checks inverse matrix from makeCacheMatrix(matrix) has any value in it or not.
# In case inverse matrix from makeCacheMatrix((matrix) is empty, it gets the original matrix data from 
# and set the invertible  matrix by using the solve function.
# In case inverse matrix from makeCacheMatrix((matrix) has some value in it (always works
#after running the code 1st time), it returns a message  "getting cached data" 
#and the cached object
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
#get the value of the invertible matrix from the makeCacheMatrix function  
  m <- x$getInverse()
  if( !is.null(m)){               #if inverse matrix is not NULL
    message("getting cached data")#Type message: Getting Cached Invertible Matrix 
    return(m)                     #return the invertible matrix
  }
#if value of the invertible matrix is NULL then  
  data <- x$get()                 #get the original Matrix Data 
  m <- solve(data)                #use solve function to inverse the matrix
  x$setInverse(m)                 #set the invertible matrix 
  m
  }
