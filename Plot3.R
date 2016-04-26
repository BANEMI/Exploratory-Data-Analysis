#### reading data file "household_power_consumption.txt" stored in WD


data <- read.csv("household_power_consumption.txt", header = T, sep = ';',quote = '\"',stringsAsFactors=F,nrows= 2075259,na.strings = "?")

#### converint date into date fromat


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#### selecting only part of data that is required to reproduce plots

DateSubSet <- subset(data, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

#### Convertin time into time fromat 
#### creating new variable and adding it to the data set by concatinating date and time variables

ConcatDT <- paste(as.Date(DateSubSet$Date), DateSubSet$Time)
DateSubSet$DateTime <- as.POSIXct(ConcatDT)


#### Creating a plot

png(file = "plot3.png",width = 480, height = 480)


plot(DateSubSet$DateTime, DateSubSet$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(DateSubSet$DateTime,DateSubSet$Sub_metering_1, ylab="Energy sub metering", type="l")
lines(DateSubSet$DateTime,DateSubSet$Sub_metering_2, ylab="Energy sub metering", type="l", col="red")
lines(DateSubSet$DateTime,DateSubSet$Sub_metering_3, ylab="Energy sub metering", type="l", col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2,2,2),lty = c(1,1,1), col=c("black","red","blue"))
dev.off()