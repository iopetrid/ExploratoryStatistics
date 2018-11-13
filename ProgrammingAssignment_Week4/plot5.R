# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?library(dplyr)
library(dplyr)
library(ggplot2)

d1<-tbl_df(NEI)
d2<-tbl_df(SCC)

# vehicle data for baltimore
veh_d<-grepl("vehicle",d2$SCC.Level.Two, ignore.case = T)
veh_d2<-d2[veh_d,]$SCC
veh_d1<-d1[d1$SCC %in% veh_d2,]

baltimore_vehicle_data<-veh_d1[veh_d1$fips==24510,]
 
g<-qplot(factor(year),Emissions,data=baltimore_vehicle_data)
g + geom_bar(stat="identity",fill="blue",width=0.25) + ggtitle("Total Emissions for Motor Vehicles in Baltimore") + xlab("Year") + ylab("Emissions PM25 in Baltimore")


dev.copy(png,filename="plot5.png",width=480, height=480)
dev.off()
