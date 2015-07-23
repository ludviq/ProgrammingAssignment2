## Created by ludviq for "R Programing|Coursera" course
## fill free to use and distribute

makeCacheMatrix <- function(x = matrix()) {
 # Function makeCacheMatrix create list of functions.
 # Listed function are used to store matrix and inversed matrix.
 # If inverse is not calculated, null vector (length 1) is stored as inverse.
 #
 # Args:
 # x: matrix that will be stored
 #
 # Returns:
 #  List of function:
 #  set: function to set the matrix
 #  get: function to get the matrix
 #  setSolve: function to set the inversed matrix
 #  getSolve: function to get the inversed matrix
 #  
  s<-NULL  # init values of unassignet inversed matrix 
  set<- function(y=matrix()) {  # function to set new matrix
      x<<-y
      s<<-NULL
  }  
  
  get<-function() x # function to get the matrix  
  setSolve <- function(Solve) s <<-Solve # function to set the inversed matrix  
  getSolve <-function() s # funtion to set inversed matrix
 # returning list of functions
  list(set=set,get=get,setSolve=setSolve,getSolve=getSolve) 
}

cacheSolve <- function(x, ...) {
 # Function used to calculate invertion of matrix.
 # If inverted matrix was caculated then is loaded from cache using makeCacheMatrix functoion
 #
 # Args:
 # x: cache matrix created by makeCacheMarix function
 #
 # Returns:
 # inverted matrix
 #
 # Assumptions: the input matrix is always invertible
    s<- x$getSolve()
    if(!is.null(s))
    {
        message("getting cached data")
        return(s)
    }
    data<-x$get()
    s<-solve(data) # calculat invertion using solve() function
    x$setSolve(s)
    s #inverted matrix
}
