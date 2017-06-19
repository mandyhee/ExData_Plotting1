data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#convert the data variable to Date class
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")

#subset data
subsetData<-subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert date and time
datetime<-strptime(paste(subsetData$Date, subsetData$Time), "%Y-%m-%d %H:%M:%S")

#plot2
global_active_power<-as.numeric(subsetData$Global_active_power)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

#save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
