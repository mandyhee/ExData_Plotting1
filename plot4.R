data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#convert the data variable to Date class
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")

#subset data
subsetData<-subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
datetime<-strptime(paste(subsetData$Date, subsetData$Time), "%Y-%m-%d %H:%M:%S")

#plot3
global_active_power<-as.numeric(subsetData$Global_active_power)
global_reactive_power<-as.numeric(subsetData$Global_reactive_power)
voltage<-as.numeric(subsetData$Voltage)
subMetering1<-as.numeric(subsetData$Sub_metering_1)
subMetering2<-as.numeric(subsetData$Sub_metering_2)
subMetering3<-as.numeric(subsetData$Sub_metering_3)
par(mfrow=c(2,2))
plot(datetime, global_active_power, type="l", ylab="Global_active_power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty=0)

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
