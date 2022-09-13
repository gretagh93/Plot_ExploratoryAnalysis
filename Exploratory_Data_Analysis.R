
# Emissions of PM2.5 in 1999, 2002, 2005 y 2008.

# Loading Data from web

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, "Data for Peer Assessment.zip")

# Unzip rds
unzip("Data for Peer Assessment.zip")

# Read .rds files
nei <- readRDS("summarySCC_PM25.rds")
head(nei)
scc <- readRDS("Source_Classification_Code.rds")
summary(scc)

# To download images, use:
# dev.copy(png, file = "plot3.png", width=480, height=480)
# dev.off()



