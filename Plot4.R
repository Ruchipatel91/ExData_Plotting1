

# Plot4 : plot 4 different graphs on 2 rows x 2 column matrix

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
png("plot4.png", width=480, height=480)

#Plot 4 graphs in 2 rows and 2 columns
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(sub_dataset, {
  
  #plot1 : Global_active_power vs Datetime
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  #plot2:Voltage vs Datetime
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  
  #plot3: submetering vs Dtaetime
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #plot4: Global_reactive_power vs Datetime
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#close the png device
dev.off()
