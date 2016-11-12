# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# load packages
library (ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset vehicles related sources
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset vBaltimore City from vehicles related sources data frame
baltNEI <- subset(vehiclesNEI, fips == "24510")

# Plot
png("plot5.png", width=480, height=480)
g <- ggplot(baltNEI,aes(as.factor(year),Emissions)) 
g+ geom_bar(stat="identity") +
    labs(x="", y="tons") +
    labs(title = "Emissions from Vehicles Related Sources in the Baltimore City, Maryland")
dev.off()