# week 1 Exploratory Data Analysis

# Plot1 : histogram for Global Active Power(Kilowatts) Vs Frequency for 2 day period for year 2007

#setup working directory
setwd("~/GitHub/ExData_Plotting1/Plot1.R")

#Read the data in table format and store it in to dataset variable
dataset <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")


# Get the subset from dataset fro dates 1,2 feb 2007 and convert dates to R Date class
date <- SelectByDate()
sub_dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
sub_dataset$Date <- as.Date(sub_dataset$Date , format="%d/%m/%y")


#save the plot to png format
png("plot1.png", width=480, height=480)

#Plot the histogram for Global_active_power
hist(sub_dataset$Global_active_power, main="Global Active Power",xlab="Global Active Power(kilowatts)" ,  ylab="Frequency" , col="Red")

#close the png device
dev.off()

