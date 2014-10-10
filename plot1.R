## load data
fulldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## create temp date to format date which then will be used to create subset of data
fulldata$Date_temp <- as.Date(fulldata$Date, format="%d/%m/%Y")

## create subset of data (limit data to 2007-02-01 and 2007-02-02)
subsetdata <- subset(fulldata, subset=(Date_temp>= "2007-02-01" & Date_temp <= "2007-02-02"))

## generate graph and save in png device
png(file = "plot1.png", bg = "white")
hist(subsetdata$Global_active_power, col="Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

