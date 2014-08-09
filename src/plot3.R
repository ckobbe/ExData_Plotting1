## plot3.R
## Author: ckobbe
## Provides: plot3
## Requires: data.table

# Create line plots of the values of substation meters versus date
# with a legend
# For the days of Feb 1 and 2, 2007

# All of these plotk.R scripts assume you're starting in ExData_Plotting1/src
#

plot3 <- function() {
  source("data.R")
  if (!file.exists("../plots")) {
    dir.create("../plots")
  }
  library(data.table)
  data <- fread("../data/household_power_consumption.txt",na.strings="?",colClasses="character")
  data <- data[grepl("^[12]/2/2007",data$Date,perl=T),]
  data[,dateTime:=as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %T"))]
  png("../plots/plot3.png",width=480,height=480)
  with(data,plot(dateTime,Sub_metering_1, xlab="", ylab="Energy Sub Metering",type="l"))
  with(data,points(dateTime,Sub_metering_2,col="red",type="l"))
  with(data,points(dateTime,Sub_metering_3,col="blue",type="l"))
  legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}
  
