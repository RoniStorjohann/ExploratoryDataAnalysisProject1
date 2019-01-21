#read in the txt file
myDataTable <- read.table("C:/Users/storjrl/Documents/householdpowerconsumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset data to only includes dates told to consider
subsetDatesData <- subset(myDataTable, Date %in% c("1/2/2007", "2/2/2007"))

#modify date and time variables using strptime
datetime <- strptime(paste(subsetDatesData$Date, subsetDatesData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#open png for plot 2
png("plot2.png", width = 480, height = 480)

#plot concatenated datetime and globalActive power
with(subsetDatesData, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#turn off device
dev.off()