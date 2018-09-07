
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
    ## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# get the unzipped data file from source:download_NEIdata.R 
source("download_NEIdata.R")

# Read the data
NEI <- readRDS("./project2_week4/summarySCC_PM25.rds")

SCC <- readRDS("./project2_week4/Source_Classification_Code.rds")

# Get total emissions from PM2.5 decreased in the United States from 1999 to 2008
agg_data<- aggregate(Emissions ~ year,NEI, sum)

# Plot above data using base barplot
png('plot1.png')


# Here we can get only 4 years for period of 10 years between 1999 to 2008 as the report gets generated for every 3 years from NEI.
barplot(agg_data$Emissions/1000000, names.arg=agg_data$year, col=c("lightblue", "mistyrose", "lightcyan","lavender"),
        xlab="years", ylab=expression('Emission of PM'[2.5]*' (in 10^6 tons)'), 
        main=expression('Total Emission of PM'[2.5]*' for 1999 to 2008 at every 3 years'),border="Dark blue"
        )

#Close the graphics device
dev.off()



