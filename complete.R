complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  nobs <- vector()
  for (i in id) 
  {
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  for (i in id)
  {
    count <- length(which(dat$ID == i & !is.na(dat$sulfate) & !is.na(dat$nitrate)))
    nobs <- c(nobs, count)
  }
  output <- data.frame("id" = id, "nobs" = nobs)
  output
}