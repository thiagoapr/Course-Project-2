# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Sum PM25 by year
totalPM25 <- with(NEI, tapply(Emissions/10^3,year, sum))

# Bar Plot
png("plot1.png", width=480, height=480)
barplot(totalPM25, main="Total PM2.5", ylab="thousand tons")
dev.off()