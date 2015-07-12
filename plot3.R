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

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()