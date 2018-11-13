# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 6. Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County,
# California  (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?library(dplyr)

library(ggplot2)

d1<-tbl_df(NEI) #emissions
d2<-tbl_df(SCC) #source classification

# vehicle data for baltimore and LA
vehicle_data<-d1[d1$type=="ON-ROAD" & d1$fips %in% c('24510','06037'),]

# group emission by year and by city
vehicle_data_per_city_year<-aggregate(Emissions~year+fips,data=vehicle_data,FUN=sum)
vehicle_data_per_city_year$city_name<-vehicle_data_per_city_year$fips
vehicle_data_per_city_year[which(vehicle_data_per_city_year$fips=="24510"),"city_name"]='Baltimore'
vehicle_data_per_city_year[which(vehicle_data_per_city_year$fips=="06037"),"city_name"]='Los Angeles'

g<-qplot(year,Emissions,data=vehicle_data_per_city_year,col = city_name)
g+geom_line()+xlab("Year")+ylab("Emissions PM25")+ggtitle("Total Emissions in Baltimore and Los Angeles")

dev.copy(png,filename="plot6.png",width=480, height=480)
dev.off()
