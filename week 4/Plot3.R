
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot3 : Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable,
   ## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
   ## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.


# get the unzipped data file from source:download_NEIdata.R 
source("download_NEIdata.R")

library(ggplot2)

# Read the data
NEI <- readRDS("./project2_week4/summarySCC_PM25.rds")

SCC <- readRDS("./project2_week4/Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimore <- NEI[NEI$fips == "24510",]

# Agg_data_baltimore_type<- aggregate(Emissions$type ~ year, baltimore, sum)
agg_baltimore<- aggregate(Emissions ~ year+type,baltimore, sum)

# Plot above data using base barplot
png('plot3.png')

# Plot Baltimore City PM"[2.5]*" Emissions 1999-2008 by Source Type
g <- ggplot(agg_baltimore,aes(factor(year),Emissions/1000000)) +
  geom_bar(stat="identity",fill="lightblue") +
  facet_grid(scales = "free", space = "free",.~type)+
  theme_classic()+
  guides(fill=FALSE)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (in 10^6 Tons)")) + 
  labs(title=expression("Baltimore City PM"[2.5]*" Emissions 1999-2008 by Source Type"))

print(g)

#Close the graphics device
dev.off()