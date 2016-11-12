# Which city has seen greater changes over time in motor vehicle emissions?

# load packages
library (ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset vehicles related sources
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset Baltimore City from vehicles related sources data frame
baltNEI <- subset(vehiclesNEI, fips == "24510")
baltNEI$city <- "Baltimore"

# Subset Los Angeles County from vehicles related sources data frame
laNEI <- subset(vehiclesNEI, fips == "06037")
laNEI$city <- "Los Angeles"

# Combine data frames
NEI2 <- rbind(baltNEI,laNEI)

# Plot
png("plot6.png", width=480, height=480)
g <- ggplot(NEI2, aes(factor(year), Emissions))
g + geom_bar(stat="identity") +
    facet_grid(.~city) +
    labs(x="", y="tons") + 
    labs(title=expression("Emissions from Vehicles Related Sources"))
dev.off()