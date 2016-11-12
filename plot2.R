# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset data
baltNEI <- subset(NEI, fips == "24510")

# Sum PM25 by year
totalPM25 <- with(baltNEI, tapply(Emissions,year, sum))

# Bar Plot
png("plot2.png", width=480, height=480)
barplot(totalPM25, main="Total PM2.5 in the Baltimore City, Maryland", 
        ylab="tons")
dev.off()