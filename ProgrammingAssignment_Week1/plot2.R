# Read all data and subset the desired data 
all_data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings ="?")
desired_data<-subset(all_data,Date %in% c("1/2/2007","2/2/2007"))
desired_data$Date<-as.Date(desired_data$Date,"%d/%m/%Y")  
time<-paste(as.Date(desired_data$Date),desired_data$Time)
desired_data$time <- as.POSIXct(time)

# plot 2 and save to png
with(desired_data,plot(Global_active_power~time,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()

