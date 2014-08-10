# This R code is to plot a graph and save a png file for the given dataset

# loading required libraries for date and time functions and unzip.
library(lubridate)
library(chron)

# Note: Downloading and unzipping source file is optional, and can be skipped if the required data file has been manually downloaded and extracted it to the working directory

# Download data from the url and unzip the file to working directory. 
 url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

 if(!file.exists("household_power_consumption.txt"))
 {
    download.file(url, "household_power_consupmption.zip")
    unzip("household_power_consupmption.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
 }

#Load data
data=read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

#Subset data between dates
data=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


#Transform Date and Time formats
data$dateTime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))

#Plot 1
png(filename = "plot1.png", width = 480, height = 480)  # save plot to PNG file.

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")

dev.off()    # Close the graphic device!