
# Read all data and subset the desired data 
all_data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings ="?")
desired_data<-subset(all_data,Date %in% c("1/2/2007","2/2/2007"))
desired_data$Date<-as.Date(desired_data$Date,"%d/%m/%Y")  

# plot 1 and save to png
hist(desired_data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()
