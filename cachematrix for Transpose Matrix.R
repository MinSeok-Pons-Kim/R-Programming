makeCacheMatrix <- function(x = matrix()) {
    # set transpose as NULL in the first time
    trans <- NULL
    
    # when got new matrix, replace old one with new one and set transpose matrix NULL
    set <- function(y) {
        x <<- y
        trans <<- NULL
    }
    
    # get the matrix
    get <- function() x
    
    # set the transpose matrix with new transpose_matrix
    set_transpose <- function(transpose_matrix) trans <<- transpose_matrix
    
    # get the transpose matrix
    get_transpose <- function() trans
    
    # return the list
    list(set = set, get = get,
    set_transpose = set_transpose,
    get_transpose = get_transpose)
    
}

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the transpose of 'x'
    
    transpose_matrix <- x$get_transpose()
    
    #if there is no transpose matrix in cache then make a new one and also save it in cache
    if(!is.null(transpose_matrix)){
        message("getting transpose matrix")
        return(transpose_matrix)
    }
    
    transpose_matrix <- matrix(, nrow <- nrow(x$get()), ncol <- 0)
    # or you can replace as matrix(nrow <- dim(x$get(x))[1], ncol <- 0)
    for(n in 1:nrow(x$get())){ # stuff data transpose
        transpose_matrix <- cbind(transpose_matrix, a[n,])
    }
    #set transpose_matrix
    x$set_transpose(transpose_matrix)
    
    #return transpose_matrix
    transpose_matrix
    
}