## Read in data from file
setwd("R")
house_data <- read.table ("household_power_consumption.txt", fill=FALSE, strip.white=TRUE, na.string='?', sep=';', header=TRUE)

## Format the date
house_data$Date <- as.Date( as.character(house_data$Date), "%d/%m/%Y")
house_dateSelect <- subset(house_data, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

## Create the plot
hist(house_dateSelect$Global_active_power, col="red", main="Gobal Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,'plot1.png',width = 480, height = 480, units = "px")
dev.off()

