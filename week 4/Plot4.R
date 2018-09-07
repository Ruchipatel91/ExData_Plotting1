
## RUCHI PATEL
## Exploratory Data analysis
## Programming assignmnet (COURSE PROJECT 2)
## plot4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

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

# Get coal combustion related data
coal_comb<- grepl("comb", NEISCC$Short.Name, ignore.case=TRUE) &  grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
sub_coal_comb <- NEISCC[coal_comb, ]

# Aggregate emission to year data
coal_comb_agg_data<- aggregate(Emissions ~ year,sub_coal_comb, sum)

# Plot above data using base barplot
png('Plot4.png')

# Plot how have emissions from coal combustion-related sources changed from 1999-2008 across the United states
g <- ggplot(coal_comb_agg_data,aes(factor(year),Emissions/1000000)) +
  geom_bar(stat="identity",fill=c("lightblue", "mistyrose", "lightcyan","lavender")) +
  theme_classic()+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (in 10^6 Tons)")) + 
  labs(title=expression("Total emission from coal comubstion sources from 1999-2008"))

print(g)

#Close the graphics device
dev.off()

