## plot1.R
## Author: ckobbe
## Provides: plot1
## Requires: data.table

# Create a histogram of the values of Global Active Power
# For the days of Feb 1 and 2, 2007

# All of these plotk.R scripts assume you're starting in ExData_Plotting1/src
#

plot1 <- function() {
  source("data.R")
  if (!file.exists("../plots")) {
    dir.create("../plots")
  }
  library(data.table)
  data <- fread("../data/household_power_consumption.txt",na.strings="?",colClasses="character")
  data <- data[grepl("^[12]/2/2007",data$Date,perl=T),]
  png("../plots/plot1.png",width=480,height=480)
  hist(as.numeric(data$Global_active_power),main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red1")
  dev.off()
}
  
