pollutantmean <- function(directory, pollutant, id = 1:332 ){
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in id) 
  {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  if (pollutant == "sulfate")
  {
    mean(dat[, "sulfate"], na.rm=TRUE)
  }
  else if (pollutant == "nitrate")
  {
    mean(dat[, "nitrate"], na.rm=TRUE)
  }
}



weightmedian <- function(directory, day) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (i in 1:5) {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  #dat_subset <- dat[which(dat[, "Day"] == day),]
  #dat_subset <- dat[which(dat$Day == day)]
  #dim(dat_subset)
  #median(dat_subset[, "Weight"], na.rm=TRUE)
}

