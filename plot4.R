# Getting and cleaning data for the second plot
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
powerdataset <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date =="2/2/2007")
#Converting the Date & Time variable to Time Class in R
powerdataset$Time <- paste(powerdataset$Date, powerdataset$Time)
powerdataset$Time <- strptime(powerdataset$Time, format = "%d/%m/%Y %H:%M:%S")
#Creating a png file
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
#Mulitple Base PLots
par(mfrow = c(2,2))
with(powerdataset, {
  plot(powerdataset$Time, as.numeric(as.character(powerdataset$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
  plot(powerdataset$Time, as.numeric(as.character(powerdataset$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
  plot(powerdataset$Time, as.numeric(as.character(powerdataset$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
    with(powerdataset, lines(Time, as.numeric(as.character(Sub_metering_2)),col = "red"))
    with(powerdataset, lines(Time, as.numeric(as.character(Sub_metering_3)),col = "blue"))
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(powerdataset$Time, as.numeric(as.character(powerdataset$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    })
#Device off
dev.off()
