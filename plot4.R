## Assignment 1/ plot 4 

##Reading file and preparing dataset (subset/conversion)
## Considering file is downloaded and work directory points to the same location
## Otherwise download.file->unzip->read.table

data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
plots_data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
plots_data$DateTime<-strptime(paste(plots_data$Date, plots_data$Time), format = "%Y-%m-%d %H:%M:%S")

##plot to PNG

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
##1
plot(plots_data$DateTime, plots_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
##2
plot(plots_data$DateTime, plots_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
##3
plot(plots_data$DateTime, plots_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plots_data$DateTime, plots_data$Sub_metering_2, col = "red")
lines(plots_data$DateTime, plots_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"), bty = "n")
##4
plot(plots_data$DateTime, plots_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
