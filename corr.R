corr <- function(directory, threshold = 0) {
        #use the complete function to generate a dataframe showing the
        #number of complete cases for each monitor id
        compl <- complete(directory, id = 1:332) 
        #assign empty vectors
        metvect <- vector("numeric", length = 0)
        j <- vector("numeric", length = 0)
        #this is the vector of all the files
        id <- 1:332
        #another empty vector to be used when the threshold is not met
        notmet <- vector("numeric", length = 0)
        #for loop to see if the threshold is met
        for (j in id) {
                #if the nobs value of the current item, j, is greater
                #than the threshold, then add j to metvect
                if(compl[[j, "nobs"]] > threshold) {
                        metvect <- c(metvect, j)
                }
                else {
                        #if the threshold is not met return notmet
                        notmet
                }
        }
        #return the resulting metvect of all that met the threshold
        metvect
        #use the corcalc function to calculate the correlation
        corcalc(directory, metvect)
}
