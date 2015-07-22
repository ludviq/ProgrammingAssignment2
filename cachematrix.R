## Put comments here that give an overall description of what your
## functions do

## Function makeCacheMatrix create list of functions to store, get and set matrix 
## and invertion of matrix.

makeCacheMatrix <- function(x = matrix()) {
  ## init values of unassignet invertion matrix
  s <- matrix(, nrow = 1, ncol = 1)
  # function to set new matrix
  set<- function(y=matrix()) {
      x<<-y
      ## if new matrix is setting, invertion must be recalculated so empty matrix
      s<<-matrix(, nrow = 1, ncol = 1)   
  }
  
  ## get the matrix function
  get<-function() x
  
  ## invertion function of matrix (matrix supplied must be always invertible)
  setSolve <- function(Solve) s <<-Solve
  
  ## get the solve matrix
  getSolve <-function() s
  
  ## returning list of above functions
  list(set=set,get=get,setSolve=setSolve,getSolve=getSolve) 

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    s<- x$getSolve()
    if(!identical(s,matrix(, nrow = 1, ncol = 1) ) )
    {
        message("getting cached data")
        return(s)
    }
    ##
    data<-x$get()
    s<-solve(data)
    x$setSolve(s)
    s
}
