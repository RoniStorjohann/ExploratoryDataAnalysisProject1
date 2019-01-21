#read in the txt file
myDataTable <- read.table("C:/Users/storjrl/Documents/householdpowerconsumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset data to only includes dates told to consider
subsetDatesData <- subset(myDataTable, Date %in% c("1/2/2007", "2/2/2007"))

#modify date and time variables using as.date 
subsetDatesData$Date <- as.Date(subsetDatesData$Date, format = "%d/%m/%Y")


#open png to create plot 1
png("plot1.png", width = 480, height = 480)

#create histogram to plot
hist(subsetDatesData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#turn off device
dev.off()