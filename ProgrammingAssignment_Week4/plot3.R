# read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# 3. Of the four types of sources indicated by the type type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question. 

library(dplyr)
library(ggplot2)

d1<-tbl_df(NEI)

d11<-select(d1,fips,Emissions,year,type)
d12<-d11[d11$fips==24510,] #Baltimore (Maryland)

emissions_per_year_type_Maryland<-aggregate(Emissions~year+type, d12, sum)

g<-qplot(year,Emissions,data=emissions_per_year_type_Maryland, col=type)
g + geom_line() + ggtitle("Total Emissions per Type in Baltimore") + xlab("Year") + ylab("Emissions PM25 in Baltimore")


dev.copy(png,filename="plot3.png",width=480, height=480)
dev.off()

