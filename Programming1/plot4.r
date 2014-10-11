
#Read data
power <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = c("?"))

#Convert datetime
power$Date <- strptime(power$Date, "%d/%m/%Y")

#subsetting data to the specified date range
power2 <- subset(power, Date >= strptime("01/02/2007","%d/%m/%Y") & Date < strptime("03/02/2007","%d/%m/%Y"), select =c(1:9))


#plot 4
png(filename="plot4.png",width = 480, height = 480)
library(lubridate)
power2$date1 <- paste(power2$Date, power2$Time, sep=" ")
power2$dw <- strptime(power2$date1, "%Y-%m-%d %H:%M:%S") 
par(mfrow=c(2,2))

#1,1
with(power2, plot(dw, Global_active_power, type='l', xlab="", ylab="Global Active Power"))
#1,2
with(power2, plot(dw, Voltage, type='l', xlab="datetime", ylab="Voltage"))
#2,1
with(power2,plot(dw, Sub_metering_1, type= 'l',pch=19, xlab="",ylab="Energy sub metering"))
with(power2,points(dw, Sub_metering_2, type= 'l',col="red", pch =19))
with(power2,points(dw, Sub_metering_3, type= 'l',col="blue", pch =19))
with(power2, legend("topright",legend=c("sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1), col=c("black","red","blue"), bty = "n"))
#2,2
with(power2, plot(dw, Global_reactive_power, type='l',  ylim=c(0.0,0.5), xlab="datetime", ylab="Global_reactive_Power"))
dev.off()