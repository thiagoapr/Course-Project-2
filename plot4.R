# load packages
library (ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds") 

# Subset coal combustion related sources
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combcoal <- (comb & coal)
combcoalSCC <- SCC[combcoal,]$SCC
combcoalNEI <- NEI[NEI$SCC %in% combcoalSCC,]

# Plot
png("plot4.png", width=480, height=480)
g <- ggplot(combcoalNEI,aes(as.factor(year),Emissions/10^3)) 
g+ geom_bar(stat="identity") +
   labs(x="", y="thousand tons") +
   labs(title = "Emissions from Coal Combustion-Related Sources")
dev.off()