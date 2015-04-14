setwd("exdata-data-household_power_consumption/")
household <- read.table("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric", 7)), header=TRUE, na.strings="?")
DateTime <- strptime(paste(household[,"Date"],household[,"Time"]), format = "%d/%m/%Y %H:%M:%S")
electricity <- cbind(household, DateTime)
Feb1and2Data <- electricity[electricity$DateTime > as.POSIXct("2007/02/01") & electricity$DateTime < as.POSIXct("2007/02/03"), ]
good.data <- complete.cases(Feb1and2Data)
Feb1and2Data <- Feb1and2Data[good.data,]
hist(Feb1and2Data$Global_active_power, breaks=16, col="red", xaxp=c(0, 6, 3), xlab="Global Active Power (kilowatts)", main="Global Active Power", bg="white")
dev.copy(device = png, file="plot1.png")
dev.off()
