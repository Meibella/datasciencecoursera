
#Read data
power <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = c("?"))

#Convert datetime
power$Date <- strptime(power$Date, "%d/%m/%Y")

#subsetting data to the specified date range
power2 <- subset(power, Date >= strptime("01/02/2007","%d/%m/%Y") & Date < strptime("03/02/2007","%d/%m/%Y"), select =c(1:9))

#Plot 1
png(filename="plot1.png",width = 480, height = 480)
hist(power2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()

