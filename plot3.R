data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#convert the data variable to Date class
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")

#subset data
subsetData<-subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
datetime<-strptime(paste(subsetData$Date, subsetData$Time), "%Y-%m-%d %H:%M:%S")

#plot3
subMetering1<-as.numeric(subsetData$Sub_metering_1)
subMetering2<-as.numeric(subsetData$Sub_metering_2)
subMetering3<-as.numeric(subsetData$Sub_metering_3)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#save to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()