# Plot4
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get the coal combustion-related sources
is.combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[is.combustion.coal,]

# Get their emissions
emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

# Group them by year
emissions.by.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

# Make the plot
ggplot(emissions.by.year, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("Emissions")) +
    ggtitle("Emissions from coal combustion-related sources")

# Copy the plot to a PNG file
dev.copy(png,file="plot4.png")

# Close the device
dev.off()
