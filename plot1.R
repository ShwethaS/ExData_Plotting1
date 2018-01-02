# Getting and cleaning data for the first plot
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
powerdataset <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date =="2/2/2007")
#Create a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
#Create the histograph
hist(as.numeric(as.character(powerdataset$Global_active_power)), col = "red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
