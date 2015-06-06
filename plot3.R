## Read in data from file
setwd("R")
house_data <- read.table ("household_power_consumption.txt", fill=FALSE, strip.white=TRUE, na.string='?', sep=';', header=TRUE)

## Format the date
house_data$Date <- as.Date( as.character(house_data$Date), "%d/%m/%Y")
house_dateSelect <- subset(house_data, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

## Adding time and reformating
dateTime <- paste(as.Date(house_dateSelect$Date), house_dateSelect$Time, sep=" ")
dateTimeFormat <- strptime(dateTime,  format="%Y-%m-%d %H:%M:%S")

## Creating the plot
png('plot3.png',width = 480, height = 480, units = "px")
plot(dateTimeFormat, house_dateSelect$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(dateTimeFormat, house_dateSelect$Sub_metering_2, type="l", col="red")
lines(dateTimeFormat, house_dateSelect$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red","blue"))
dev.off()