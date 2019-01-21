#read in the txt file
myDataTable <- read.table("C:/Users/storjrl/Documents/householdpowerconsumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset data to only includes dates told to consider
subsetDatesData <- subset(myDataTable, Date %in% c("1/2/2007", "2/2/2007"))

#modify date and time variables using strptime
datetime <- strptime(paste(subsetDatesData$Date, subsetDatesData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#open png for plot 3
png("plot3.png", width = 480, height = 480)

#first create plot with sub metering 1 then add lines for addition variables to same plot
with(subsetDatesData, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(subsetDatesData, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(subsetDatesData, lines(datetime, Sub_metering_3, type = "l", col = "blue"))

#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd=2.5)

#turn off png device
dev.off()