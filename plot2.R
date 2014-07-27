# Plot2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? 
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")

# Read the data of interest
data <- with(NEI[which(NEI$fips == "24510"), ], aggregate(Emissions, by = list(year), sum))
colnames(aggregate.24510) <- c("year", "Emissions")

# Use white background
par(bg = "white")

# Make the plot
plot(data, type = "o", ylab = expression("Emissions"), 
    xlab = "Year", main = "Emissions for Baltimore County", xlim = c(1999, 2008))
        
# Copy the plot to a PNG file
dev.copy(png,file="plot2.png")

# Close the device
dev.off()
