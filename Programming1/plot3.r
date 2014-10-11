
#Read data
power <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = c("?"))

#Convert datetime
power$Date <- strptime(power$Date, "%d/%m/%Y")

#subsetting data to the specified date range
power2 <- subset(power, Date >= strptime("01/02/2007","%d/%m/%Y") & Date < strptime("03/02/2007","%d/%m/%Y"), select =c(1:9))

#plot 3
library(lubridate)
power2$date1 <- paste(power2$Date, power2$Time, sep=" ")
power2$dw <- strptime(power2$date1, "%Y-%m-%d %H:%M:%S") 
png(filename="plot3.png",width = 480, height = 480)
with(power2,plot(dw, Sub_metering_1, type= 'l',pch=19, xlab="", ylab="Energy Sub metering"))
with(power2,points(dw, Sub_metering_2, type= 'l',col="red", pch =19))
with(power2,points(dw, Sub_metering_3, type= 'l',col="blue", pch =19))
with(power2, legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1), col=c("black","red","blue")))
dev.off()

