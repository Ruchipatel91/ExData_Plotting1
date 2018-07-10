

# Plot3 : #Plot the graph for sub_meterig 1,2,3 vs datetime


#setup working directory
setwd("~/GitHub/ExData_Plotting1/Plot2.R")

#Read the data in table format and store it in to dataset variable
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")

# Get the subset from dataset fro dates 1,2 feb 2007 and convert dates to R Date class and time to POSIXct
sub_dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
sub_dataset$Date <- as.Date(sub_dataset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_dataset$Date), sub_dataset$Time)
sub_dataset$Datetime <- as.POSIXct(datetime)


#save the plot to png format
png("plot3.png", width=480, height=480)

#Plot the graph for sub_meterig 1,2,3 vs datetime
with(sub_dataset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

#
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub-metering_1","Sub-metering_2","Sub-metering_3"))

#close the png device
dev.off()
