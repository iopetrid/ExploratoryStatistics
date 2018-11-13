# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510" fips=="24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question. 
library(dplyr)
d1<-tbl_df(NEI)
d11<-select(d1,fips,Emissions,year)
d12<-d11[d11$fips==24510,] #Baltimore (Maryland)

emissions_per_year_Maryland<-aggregate(Emissions~year, d12, sum)
with(emissions_per_year_Maryland,plot(year,Emissions,type = "b",xlab="Years",ylab="Emissions PM25",main="Total Emissions in Baltimore (Maryland)"))
dev.copy(png,filename="plot2.png",width=480, height=480)
dev.off()

