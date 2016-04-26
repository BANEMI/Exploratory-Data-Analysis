
#### reading data file "household_power_consumption.txt" stored in WD


data <- read.csv("household_power_consumption.txt", header = T, sep = ';',quote = '\"',stringsAsFactors=F,nrows= 2075259,na.strings = "?")

#### converint date into date fromat


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#### selecting only part of data that is required to reproduce plots

DateSubSet <- subset(data, subset = (Date == "2007-02-01" | Date == "2007-02-02"))



ConcatDT <- paste(as.Date(DateSubSet$Date), DateSubSet$Time)
DateSubSet$DateTime <- as.POSIXct(ConcatDT)


#### Creating a plot

png(file = "plot2.png", bg = "white",width = 480, height = 480)
plot(DateSubSet$Global_active_power ~ DateSubSet$DateTime,ylab = "Global Active Power (kilowatts)", xlab = "",type = "l")
dev.off()