# This R code is to plot a graph and save a png file for the given dataset
# household_power_consumption.txt file is already available in working directory. 

#Load data
data=read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

#Subset data between given dates
data=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


#Transform Date and Time formats
data$dateTime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))

#Plot 2
png(filename = "plot2.png", width = 480, height = 480)  # save plot to PNG file.
plot(data$dateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()    # Close the graphic device!



