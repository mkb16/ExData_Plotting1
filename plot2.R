unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- read.table("household_power_consumption.txt" , header=TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- subset(data,Date >="2007/2/1" & Date <= "2007/2/2")
datetime <- as.POSIXct(paste(data$Date , data$Time))
data <- cbind(data ,datetime)

png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(data$datetime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()



