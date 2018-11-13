all_data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings ="?")
desired_data<-subset(all_data,Date %in% c("1/2/2007","2/2/2007"))
desired_data$Date<-as.Date(desired_data$Date,"%d/%m/%Y")  
time<-paste(as.Date(desired_data$Date),desired_data$Time)
desired_data$time <- as.POSIXct(time)

# plot 3 and save to png
with(desired_data,{plot(Sub_metering_1~time,type="l",xlab="",ylab="Energy sub metering")
     lines(Sub_metering_2~time,col="red")
     lines(Sub_metering_3~time,col="blue")})
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2)
dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()
