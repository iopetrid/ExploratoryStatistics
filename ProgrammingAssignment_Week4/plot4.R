# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

d1<-tbl_df(NEI)
d2<-tbl_df(SCC)

#merge data by SCC and then filters the data for coal 
d3<-merge(d1,d2,by="SCC")
d31<-d3[grepl("coal",d3$Short.Name),]

emissions_coal_year<-aggregate(Emissions~year,d31,sum)
with(emissions_coal_year,plot(year,Emissions,type="b",xlab="year",ylab = "Coal Emissions",main="Total Coal Emissions for US"))

dev.copy(png,filename="plot4.png",width=480, height=480)
dev.off()

