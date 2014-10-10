## load data
fulldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## create temp date to format date which then will be used to create subset of data
fulldata$Date_temp <- as.Date(fulldata$Date, format="%d/%m/%Y")

## create subset of data (limit data to 2007-02-01 and 2007-02-02)
subsetdata <- subset(fulldata, subset=(Date_temp>= "2007-02-01" & Date_temp <= "2007-02-02"))

## create date time variable that will be used to plot data
subsetdata$datetime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format = "%d/%m/%Y %T")

## generate graph and save in png device
png(file = "plot3.png", bg = "white")
with(subsetdata, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()