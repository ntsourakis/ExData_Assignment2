# Plot3
# Of the four types of sources indicated by the type variable, which of these four sources 
# have seen decreases in emissions from 1999-2008 for Baltimore City?
library(plyr)
library(ggplot2)

# Read the data from the files
NEI <- readRDS("summarySCC_PM25.rds")

# Read the data of interest
data <- aggregate(Emissions ~ year + type,
    data=NEI[NEI$fips=="24510",],
    FUN=sum)

# Make the plot
ggplot(data, aes(x=factor(year), y=Emissions, fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(. ~ type) +
    xlab("year") +
    ylab(expression("Emission")) +
    ggtitle(" Emissions in Baltimore ")

# Copy the plot to a PNG file
dev.copy(png,file="plot3.png")

# Close the device
dev.off()
                                       