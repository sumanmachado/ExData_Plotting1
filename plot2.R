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
plot(dateTimeFormat, house_dateSelect$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.copy(png,'plot2.png',width = 480, height = 480, units = "px")
dev.off()