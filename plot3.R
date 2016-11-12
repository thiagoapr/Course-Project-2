# load packages
library (ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset data
baltNEI <- subset(NEI, fips == "24510")

# Sum PM25 by type and by year
totalPM25  <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Plot
png("plot3.png", width=480, height=480)
g <- ggplot(totalPM25, aes(year, Emissions, color = type))
g + geom_line(size=1) +
    labs(x="", y="tons") +
    labs(title = "Total PM2.5 in the Baltimore City, Maryland") +
    theme(legend.position="bottom")
dev.off()