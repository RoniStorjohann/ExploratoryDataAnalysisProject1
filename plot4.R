#read in the txt file
myDataTable <- read.table("C:/Users/storjrl/Documents/householdpowerconsumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset data to only includes dates told to consider
subsetDatesData <- subset(myDataTable, Date %in% c("1/2/2007", "2/2/2007"))

#modify date and time variables using strptime
datetime <- strptime(paste(subsetDatesData$Date, subsetDatesData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#open png for plot 3
png("plot4.png", width = 480, height = 480)

#set up rows and columns
par(mfrow = c(2,2))

#run plots
with(subsetDatesData, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

with(subsetDatesData, plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l", lwd = 2))

with(subsetDatesData, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
 with(subsetDatesData, lines(datetime, Sub_metering_2, type = "l", col = "red"))
 with(subsetDatesData, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=2.5)

 with(subsetDatesData, plot(datetime, Global_reactive_power, type = "l"))

#close device
 dev.off()