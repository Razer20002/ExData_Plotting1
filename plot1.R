data <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE)
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data2$DateTime = paste(data2$Date,data2$Time)
data2$DateTime = strptime(data2$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot 1
png(file="plot1.png", width = 480, height = 480)
x <- as.numeric(format(data2$Global_active_power, digits=4))
hist(x, col= "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
