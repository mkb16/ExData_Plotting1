unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- read.table("household_power_consumption.txt" , header=TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- subset(data,Date >="2007/2/1" & Date <= "2007/2/2")
datetime <- as.POSIXct(paste(data$Date , data$Time))
data <- cbind(data ,datetime)

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(data$datetime, data$Sub_metering_1, xlab = '', ylab = 'Energy Sub Metering ', type = 'l')
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col = c('black', 'red', 'blue') , lwd = 1)

dev.off()



