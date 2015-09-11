#Note that the relevant data source must be in your work directory

data <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE)
data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data2$DateTime = paste(data2$Date,data2$Time)
data2$DateTime = strptime(data2$DateTime, format="%d/%m/%Y %H:%M:%S")

#Plot 4
png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

x <- data2$DateTime
y <- as.numeric(format(data2$Global_active_power, digits=4))
plot(x,y, typ="l", xlab="",ylab="Global Active Power")

x <- data2$DateTime
y <- as.numeric(format(data2$Voltage, digits=6))
plot(x,y, typ="l", xlab="datetime",ylab="Voltage")

x <- data2$DateTime
y <- as.numeric(format(data2$Sub_metering_1, digits=4))
plot(x,y, xlab="", ylab="Energy sub metering", typ="l")
y <- as.numeric(format(data2$Sub_metering_2, digits=4))
points(x,y,typ="l",col="red")
y <- as.numeric(format(data2$Sub_metering_3, digits=4))
points(x,y,typ="l",col="blue")
legend("topright",cex=0.8, inset=0.01, box.lty=0, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty=1, col=c("black","red","blue"))

x <- data2$DateTime
y <- as.numeric(format(data2$Global_reactive_power, digits=6))
plot(x,y, typ="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()