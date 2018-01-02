# Getting and cleaning data for the second plot
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
powerdataset <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date =="2/2/2007")
#Converting the Date & Time variable to Time Class in R
powerdataset$Time <- paste(powerdataset$Date, powerdataset$Time)
powerdataset$Time <- strptime(powerdataset$Time, format = "%d/%m/%Y %H:%M:%S")
#Creating a png file
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
#Creating a plot
plot(powerdataset$Time, as.numeric(as.character(powerdataset$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
with(powerdataset, lines(Time, as.numeric(as.character(Sub_metering_2)),col = "red"))
with(powerdataset, lines(Time, as.numeric(as.character(Sub_metering_3)),col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Device off
dev.off()
