household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")
summary(household_power_consumption$Date)
dataSmall <- subset(household_power_consumption,  subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
summary(dataSmall$Date)
rm(household_power_consumption)

datetime <- strptime(paste(dataSmall$Date, dataSmall$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(dataSmall$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()