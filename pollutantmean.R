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
pollutantmean <-function(directory, pollutant, id=1:332){
  for (i in id) { #get just the files requested, defaults to all of them
    filename <- 
    datasubset <- read.csv(, comment.char="", ) #build a datasubset dataframe of those csvs using read.csv()
  if (pollutant = "sulfate") {                  #if they opt for sulfate levels
    print(mean(datasubset[,2], na.rm = TRUE ))  #print the mean of the second column's entries
  } else {                                      #otherwise
    print(mean(datasubset[,3], na.rm = TRUE ))   #print the mean of the third column's entries
  }
  }
  
}