
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Get the unzipped data file from source:download_NEIdata.R 
source("download_NEIdata.R")

library(ggplot2)

# Read the data
NEI <- readRDS("./project2_week4/summarySCC_PM25.rds")

SCC <- readRDS("./project2_week4/Source_Classification_Code.rds")

# Merge the two dataset NEI and SCC if not exist
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

# filter motor vehicle from NEISCC dataset 
veh_NEISCC <- NEISCC[grep("veh", NEISCC$Short.Name, ignore.case=TRUE),]

# Subset the balimore vehicle data from NEISCC motor vehicle dataset
Balti_veh_NEISCC <- veh_NEISCC[veh_NEISCC$fips =="24510" & veh_NEISCC$type =="ON-ROAD" ,]

# Aggregate emission to year data
agg_Balti_veh_NEISCC<- aggregate(Emissions ~ year,Balti_veh_NEISCC, sum)


# Plot above data using gglot2
png('Plot5.png')

# Plot total emission from baltimore motor vehicles from 1999-2008
g<- ggplot(agg_Balti_veh_NEISCC,aes(factor(year), Emissions/100000)) +
        geom_bar(stat="identity",fill=c("lightblue", "mistyrose", "lightcyan","lavender")) +
        theme_classic()+
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (in 10^5 Tons)")) + 
        labs(title=expression("Total emission from baltimore motor vehicles from 1999-2008"))

print(g)

#Close the graphics device
dev.off()

