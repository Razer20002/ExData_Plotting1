#Note that the relevant data source must be in your work directory

data <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE)
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data2$DateTime = paste(data2$Date,data2$Time)
data2$DateTime = strptime(data2$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot 3
png(file="plot3.png", width = 480, height = 480)
x <- data2$DateTime
y <- as.numeric(format(data2$Sub_metering_1, digits=4))
plot(x,y, xlab="", ylab="Energy sub metering", typ="l")
y <- as.numeric(format(data2$Sub_metering_2, digits=4))
points(x,y,typ="l",col="red")
y <- as.numeric(format(data2$Sub_metering_3, digits=4))
points(x,y,typ="l",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty=1, col=c("black","red","blue"))
dev.off()