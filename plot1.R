## Assignment 1/ plot 1 - Global Active Power plot

##Reading file and preparing dataset (subset/conversion)
## Considering file is downloaded and work directory points to the same location
## Otherwise download.file->unzip->read.table

data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
plots_data<-subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
plots_data$DateTime<-strptime(paste(plots_data$Date, plots_data$Time), format = "%Y-%m-%d %H:%M:%S")

##plot to PNG

png(filename = "plot1.png", width = 480, height = 480)
hist(plots_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
