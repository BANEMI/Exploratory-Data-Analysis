
#### reading data file "household_power_consumption.txt" stored in WD


data <- read.csv("household_power_consumption.txt", header = T, sep = ';',quote = '\"',stringsAsFactors=F,nrows= 2075259,na.strings = "?")

#### converint date into date fromat

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#### selecting only part of data that is required to reproduce plots

DateSubSet <- subset(data, subset = (Date == "2007-02-01" | Date == "2007-02-02"))


#### Creating a plot

png("plot1.png", width = 480, height = 480)
hist(DateSubSet$Global_active_power,col = "red" , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
dev.off()