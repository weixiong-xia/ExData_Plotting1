HPC <- read.csv("household_power_consumption.txt",sep=";")
HPC$Date <- as.Date(HPC$Date,"%d/%m/%Y")
part1 <- subset(HPC,HPC$Date=="2007-02-01")
part2 <- subset(HPC,HPC$Date=="2007-02-02")
edata <- rbind(part1,part2)
png(file="plot2.png")
times <- as.character(edata$Time)
x <- paste(edata$Date,times)
edata$Date1 <- as.POSIXct(x, "%d/%m/%y %H:%M:%S")
plot(edata$Date1,as.numeric(as.character(edata$Global_active_power)),type = "l",ylab = "Globe Active Power (kilowatts)")
dev.off()
