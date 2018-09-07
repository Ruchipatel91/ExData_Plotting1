
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot6: Compare emissions from motor vehicle sources in Baltimore City with emissions from 
          ## motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). 
          ## Which city has seen greater changes over time in motor vehicle emissions?

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

# Filter motor vehicle from NEISCC dataset 
veh_NEISCC <- NEISCC[grep("veh", NEISCC$Short.Name, ignore.case=TRUE),]

# Subset the Baltimore and LA vehicle data from NEISCC motor vehicle dataset
Bal_LA_NEISCC <- veh_NEISCC[(veh_NEISCC$fips =="24510" | veh_NEISCC$fips =="06037") & veh_NEISCC$type =="ON-ROAD" ,]

# Aggregate emission to year and fip data
agg_Balti_veh_NEISCC<- aggregate(Emissions ~ year+fips,Bal_LA_NEISCC, sum)

# Assign label "Baltimore, MD" to fip ="24510"
agg_Balti_veh_NEISCC$fips[agg_Balti_veh_NEISCC$fips == "24510"] <- "Baltimore, MD"

# Aassign label "Los Angeles, CA" to fip ="06037"
agg_Balti_veh_NEISCC$fips[agg_Balti_veh_NEISCC$fips == "06037"] <- "Los Angeles, CA"


# Plot above data using gglot2
png('Plot6.png')

# plot total emission from Baltimore and Los Angeles motor vehicles from 1999-2008
g <- ggplot(agg_Balti_veh_NEISCC,aes(x=factor(year), y=Emissions/100000)) +
  geom_bar(stat="identity",fill="lightblue") +
  facet_grid(scales = "free", space = "free",.~fips)+
  theme_classic()+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (in 10^5 Tons)")) + 
  labs(title=expression("Total emission from Baltimore and Los Angeles motor vehicles from 1999-2008"))

print(g)

#Close the graphics device
dev.off()

