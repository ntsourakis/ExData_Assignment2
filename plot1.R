# Plot1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")

# Read the data of interest
data <- with(NEI, aggregate(Emissions, by = list(year), sum))

# Use white background
par(bg = "white")
	
# Make the plot
plot(data, type = "o", ylab = expression("Emissions"), 
    xlab = "Year", main = "Total Emissions in US")

# Copy the plot to a PNG file
dev.copy(png,file="plot1.png")

# Close the device
dev.off()
