# Download NEI_DATA file, if it does not exist



if (!file.exists("./project2_week4")){dir.create("./project2_week4")}


NEI_File <- "./project2_week4/download_NEIdata.zip"

NEI_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  
download.file(url=NEI_URL,destfile=NEI_File, method = "curl")

unzip(zipfile = "./project2_week4/download_NEIdata.zip" , exdir = "./project2_week4")







