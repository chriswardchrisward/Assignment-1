corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  nobs <- vector()
  id <- c(1:332)
  for (i in id) 
  {
    dat <- rbind(dat, read.csv(files_list[i]))  #creates one big ass dataframe
  }
  for (i in id)
  {
    count <- length(which(dat$ID == i & !is.na(dat$sulfate) & !is.na(dat$nitrate)))
    nobs <- c(nobs, count)
  }
  output <- data.frame("id" = id, "nobs" = nobs)
  x <- vector()
  for (i in c(1:332))
  {
    if (output$nobs[i] > threshold)
    {
      x <- c(x, i)
    }
  }
  x
  datsubset <- data.frame()
  correlations <- numeric()
  for (i in x)
  {
    datsubset <- subset(dat, dat$ID == i & !is.na(dat$sulfate) & !is.na(dat$nitrate))
    if (length(which(datsubset$ID == i & !is.na(datsubset$sulfate) & !is.na(datsubset$nitrate))) >= 1)
    {
      singlecorrelation <- cor(datsubset$sulfate, datsubset$nitrate)
      correlations <- c(correlations, singlecorrelation)
    }
    else if ((length(which(datsubset$ID == i & !is.na(datsubset$sulfate) & !is.na(datsubset$nitrate))) <= 1)) 
    {
      correlations <- c(correlations, 0)
    }
  }
  correlations
}