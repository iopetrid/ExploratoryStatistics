# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library(dplyr)
d1<-tbl_df(NEI)
d11<-select(d1,Emissions,year)

emissions_per_year<-aggregate(Emissions~year, d11, sum)
with(emissions_per_year,plot(year,Emissions,type = "b",xlab="Years",ylab="Emissions PM25",main="Total Emissions"))
dev.copy(png,filename="plot1.png",width=480, height=480)
dev.off()

