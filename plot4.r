HPC <- read.csv("household_power_consumption.txt",sep=";")
HPC$Date <- as.Date(HPC$Date,"%d/%m/%Y")
part1 <- subset(HPC,HPC$Date=="2007-02-01")
part2 <- subset(HPC,HPC$Date=="2007-02-02")
edata <- rbind(part1,part2)
png(file="plot2.png")
times <- as.character(edata$Time)
x <- paste(edata$Date,times)
edata$Date1 <- as.POSIXct(x, "%d/%m/%y %H:%M:%S")
par(mfrow = c(2,2),mar= c(3,3,2,1),oma = c(0,0,2,0))
plot(edata$Date1,as.numeric(as.character(edata$Global_active_power)),type = "l",
     ylab = "Globe Active Power (kilowatts)",xlab="")
plot(edata$Date1,as.numeric(as.character(edata$Voltage)),type = "l",
     ylab = "Voltage",xlab="datetime")
plot(edata$Date1,as.numeric(as.character(edata$Sub_metering_1)),type = "n",
     ylab = "Energy sub metering",xlab = "")
with(lines(edata$Date1,as.numeric(as.character(edata$Sub_metering_1)),col = "black"))
with(lines(edata$Date1,as.numeric(as.character(edata$Sub_metering_2)),col = "red"))
with(lines(edata$Date1,as.numeric(as.character(edata$Sub_metering_3)),col = "blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(edata$Date1,as.numeric(as.character(edata$Global_reactive_power)),type = "l",
     ylab = "Globe_reactive_power",xlab="datetime")
dev.off()
