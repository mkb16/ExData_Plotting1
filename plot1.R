unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- read.table("household_power_consumption.txt" , header=TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- subset(data,Date >="2007/2/1" & Date <= "2007/2/2")
datetime <- as.POSIXct(paste(data$Date , data$Time))
data <- cbind(data ,datetime)

png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(data$Global_active_power , col ="red" ,xlab = "Global Active Power (kilowatt)" ,main = "Global Active Power")
dev.off()



