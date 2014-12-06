# load library
library(data.table)

# load data
data <- fread("household_power_consumption.txt", sep = ";", header = T, na.strings = c("?"), colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character"))

# change data types
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset data
workData <- subset(data, Date %in% as.Date(c("01/02/2007", "02/02/2007"), "%d/%m/%Y"))

# prepare plotting to a PNG file
png("plot2.png", width = 480, height = 480)

# Graphic
plot(workData$Global_active_power, type = "l", xaxt="n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at=c(1,nrow(workData)/2, nrow(workData)), labels=c("Thu", "Fri", "Sat"))

# save the PNG file
dev.off()
