## Click the 'Raw' button to view the console output in the actual format 
> source("cachematrix.R")
> a <- matrix(c(8,9,10,11),nrow=2,ncol=2)
> a
     [,1] [,2]
[1,]    8   10
[2,]    9   11
> result <- makeCacheMatrix(a)
> result$get()
     [,1] [,2]
[1,]    8   10
[2,]    9   11
> result$getinverse()
NULL
> cacheSolve(result)
     [,1] [,2]
[1,] -5.5    5
[2,]  4.5   -4
> result$getinverse()
     [,1] [,2]
[1,] -5.5    5
[2,]  4.5   -4
