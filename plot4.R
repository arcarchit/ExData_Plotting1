household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")
summary(household_power_consumption$Date)
dataSmall <- subset(household_power_consumption,  subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
summary(dataSmall$Date)
rm(household_power_consumption)

datetime <- strptime(paste(dataSmall$Date, dataSmall$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
subMetering1 <- as.numeric(dataSmall$Sub_metering_1)
subMetering2 <- as.numeric(dataSmall$Sub_metering_2)
subMetering3 <- as.numeric(dataSmall$Sub_metering_3)
globalActivePower <- as.numeric(dataSmall$Global_active_power)
globalReactivePower <- as.numeric(dataSmall$Global_reactive_power)
voltage <- as.numeric(dataSmall$Voltage)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()