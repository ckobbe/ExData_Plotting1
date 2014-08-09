## plot2.R
## Author: ckobbe
## Provides: plot2
## Requires: data.table

# Create a line plot of the values of Global Active Power versus date
# For the days of Feb 1 and 2, 2007

# All of these plotk.R scripts assume you're starting in ExData_Plotting1/src
#

plot2 <- function() {
  source("data.R")
  if (!file.exists("../plots")) {
    dir.create("../plots")
  }
  library(data.table)
  data <- fread("../data/household_power_consumption.txt",na.strings="?",colClasses="character")
  data <- data[grepl("^[12]/2/2007",data$Date,perl=T),]
  data[,dateTime:=as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %T"))]
  png("../plots/plot2.png",width=480,height=480)
  with(data,plot(dateTime,Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l"))
  dev.off()
}
  
