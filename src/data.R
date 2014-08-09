## data.R
## Author: ckobbe
##

wd <- getwd()

# Get to the base directory, ExData_Plotting1
# If we didn't start in it, or in a direct subdirectory, fail

if (basename(dirname(wd)) == "ExData_Plotting1") {
  setwd("../")
} else if (!basename(wd) == "ExData_Plotting1") {
  stop("Not in ExData_Plotting1 or a first-tier subdirectory")
}

# create a data dir, if missing

if (!file.exists("data")) {
  dir.create("data")
}
setwd("data")

# Obtain the zipfile and unzip it, if missing

if (!file.exists("power_consumption_data.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_consumption_data.zip","curl")
  unzip("power_consumption_data.zip")
}

# Return us to the original working directory
setwd(wd)
