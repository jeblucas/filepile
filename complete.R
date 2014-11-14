  ##  complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

complete <- function(directory, id = 1:332) {
  
  # initialize the data frame and get the filelist built
  report <- data.frame(id=NULL, nobs=NULL)
  pollutantraw <- list.files(directory,full.names=T)
  #complete.cases help is obscure
  
  for (i in id) { #get just the files requested, defaults to all of them
    
    #build a chkfile of those csvs using read.csv(), with some tidying
    chkfile <- read.csv(pollutantraw[i], comment.char="")
    #build some vectors for NA testing with complete.cases()  
    chksulfates <- chkfile[,2]
    chknitrates <- chkfile[,3]
    ok <- complete.cases(chksulfates, chknitrates)
    #put the sum of  ok result and the id into the dataframe report
    element <- c(i,sum(ok))
    report <- rbind(report,element)
  }
  #fix report columnnames
  colnames(report) <- c("id", "nobs")  
  print(report)
  
}  
