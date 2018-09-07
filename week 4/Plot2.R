
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot2 : Have total emissions from PM2.5 decreased in the Baltimore City, 
  ## Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot 
  ## answering this question.


# get the unzipped data file from source:download_NEIdata.R 
source("download_NEIdata.R")

# Read the data
NEI <- readRDS("./project2_week4/summarySCC_PM25.rds")

SCC <- readRDS("./project2_week4/Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimore <- NEI[NEI$fips == "24510",]

# Get total emissions from PM2.5 decreased in the United States from 1999 to 2008
agg_data_baltimore<- aggregate(Emissions ~ year, baltimore, sum)

# Plot above data using base barplot
png('plot2.png')


# Here we can get only 4 years for period of 10 years between 1999 to 2008 as the report gets generated for every 3 years from NEI.
barplot(agg_data_baltimore$Emissions/1000000, names.arg=agg_data_baltimore$year, col=c("lightblue", "mistyrose", "lightcyan","lavender"),
        xlab="years", ylab=expression('Emission of PM'[2.5]*' (in 10^6 tons)'), 
        main=expression('Total Emission of PM'[2.5]*' for baltimore city sources'), border="Dark blue")


# Close the graphics device
dev.off()