# Plot5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Rearrange the data
SCC.motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC.motor <- SCC[SCC.motor, ]
SCC.identifiers <- as.character(SCC.motor$SCC)
NEI$SCC <- as.character(NEI$SCC)
NEI.motor <- NEI[NEI$SCC %in% SCC.identifiers, ]

# Read the data of interest
data <- with(NEI.motor[which(NEI.motor$fips == "24510"), ], aggregate(Emissions, by = list(year), 
    sum))

# Make the plot
plot(data, type = "o", ylab = "Emissions", 
    xlab = "Year", main = "Total Emissions from Motor Vehicle")

# Copy the plot to a PNG file
dev.copy(png,file="plot5.png")

# Close the device
dev.off()
