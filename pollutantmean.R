#pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
#}

#dataset_url<-"http://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
#download.file(dataset_url,"specdata.zip")
#unzip("specdata.zip")


pollutantmean <-function(directory, pollutant, id=1:332){
  
  pollutantraw <- list.files(directory,full.names=T)
  dataset <-as.numeric(c(NA,NA,NA,NA))
  
  for (i in id) { #get just the files requested, defaults to all of them

    #build a subset dataframe of those csvs using read.csv(), with some tidying
      subset <- read.csv(pollutantraw[i], comment.char="")
    #build a dataset for means using row binding  
      dataset <- rbind(dataset, subset)
  }
  
  #if they opt for sulfate levels, print the rounded mean.  
  if (pollutant == "sulfate") {                 
      print(round(mean(dataset[,2], na.rm = TRUE ),3))  
  # if they opt for nitrates    
      } else if (pollutant=="nitrate") {                                      
      print(round(mean(dataset[,3], na.rm = TRUE ),3))
  # otherwise let them know    
      } else {
      print("Must specify nitrate or sulfate.")
  }
}
