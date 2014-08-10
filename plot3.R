# This R code is to plot a graph and save as png file for the given dataset
# household_power_consumption.txt file is already available in working directory. 

#Load data
data=read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

#Subset data between given dates
data=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


#Transform Date and Time formats
data$dateTime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))

# plotting graph 3

#set plot in png
png(filename = "plot3.png", width = 480, height = 480)  # save plot to PNG file.

#plot graph  
plot(data$dateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")

#Add lines
lines(data$dateTime,data$Sub_metering_2,type="l",col="red")
lines(data$dateTime,data$Sub_metering_3,type="l",col="blue")

#Add legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

# close the graphics device!
dev.off()   
