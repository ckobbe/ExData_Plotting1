## plot4.R
## Author: ckobbe
## Provides: plot4
## Requires: data.table

# Create a panel of plots: plots 2 and 3 from this project, as well as
# Voltage vs time and Global_reactive_power vs time
# For the days of Feb 1 and 2, 2007

# All of these plotk.R scripts assume you're starting in ExData_Plotting1/src
#

plot4 <- function() {
  source("data.R")
  if (!file.exists("../plots")) {
    dir.create("../plots")
  }
  library(data.table)
  data <- fread("../data/household_power_consumption.txt",na.strings="?",colClasses="character")
  data <- data[grepl("^[12]/2/2007",data$Date,perl=T),]
  data[,dateTime:=as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %T"))]
  png("../plots/plot4.png",width=480,height=480)
  par(mfcol=c(2,2))
  with(data,{
    # Global_active_power by datetime
    plot(dateTime,Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")
    # Energy Sub Metering by datetime
    plot(dateTime,Sub_metering_1, xlab="", ylab="Energy Sub Metering",type="l")
    points(dateTime,Sub_metering_2,col="red",type="l")
    points(dateTime,Sub_metering_3,col="blue",type="l")
    legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    # Voltage by datetime
    plot(dateTime,Voltage, xlab="datetime", ylab="Voltage",type="l")
    # Global_reative_power by datetime
    plot(dateTime,Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l")
  })
  dev.off()
}

