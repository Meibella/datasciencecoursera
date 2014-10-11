
#Read data
power <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = c("?"))

#Convert datetime
power$Date <- strptime(power$Date, "%d/%m/%Y")

#subsetting data to the specified date range
power2 <- subset(power, Date >= strptime("01/02/2007","%d/%m/%Y") & Date < strptime("03/02/2007","%d/%m/%Y"), select =c(1:9))

#plot2
png(filename="plot2.png",width = 480, height = 480)
library(lubridate)
power2$date1 <- paste(power2$Date, power2$Time, sep=" ")
power2$dw <- strptime(power2$date1, "%Y-%m-%d %H:%M:%S") 
with(power2, plot(dw, Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

#plot 3

#plot 4
