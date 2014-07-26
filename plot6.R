# Plot6
# Which city has seen greater changes over time in motor vehicle emissions? 
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Rearrange the data
data <- rbind(d.baltim <- NEI[which(NEI$fips == "24510"), ], 
    d.lac <- NEI[which(NEI$fips == "06037"), ])
data$fips[which(data$fips == "24510")] <- "Baltimore City"
data$fips[which(data$fips == "06037")] <- "Los Angeles County"
names(data)[1] <- "Cities"

# Make the plot
ggplot(data, aes(x = year, y = Emissions, fill = Cities)) + 
    geom_bar(stat = "identity", position = position_dodge()) + 
    ggtitle("Baltimore City vs. Los Angeles County")


# Copy the plot to a PNG file
dev.copy(png,file="plot6.png")

# Close the device
dev.off()
