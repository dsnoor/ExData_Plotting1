# This R code is to draw multipanel graphs save as png file
# household_power_consumption.txt file is already available in working directory. 

#Load data
data=read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.string="?")

#Subset data between given dates
data=data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]


#Transform Date and Time formats
data$dateTime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))


# plotting graph 4

	png(filename = "plot4.png", width = 480, height = 480)   # save to png

	# set multipanel plot with 2 rows and  2 cols
	par(mfrow=c(2,2))


	#plotting first graph at row =1 and col=1
	plot(data$dateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")


	#plotting second graph at row =1 and col=2
	plot(data$dateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")


	#plotting third graph at row =2 and col=1
	plot(data$dateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")

		# adding lines
		lines(data$dateTime,data$Sub_metering_2,type="l",col="red")
		lines(data$dateTime,data$Sub_metering_3,type="l",col="blue")
	
		# adding legend
		legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")


	#plotting fourth graph at row =2 and col=2
	plot(data$dateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


# close the graphics device!
dev.off()
