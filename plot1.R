household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")
summary(household_power_consumption$Date)
dataSmall <- subset(household_power_consumption,  subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
summary(dataSmall$Date)
rm(household_power_consumption)


datetime <- paste(as.Date(dataSmall$Date), dataSmall$Time)
dataSmall$DateTime <- as.POSIXct(datetime)

hist(dataSmall$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()