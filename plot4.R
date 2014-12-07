hpc<-read.table("household_power_consumption.txt",sep=";",header=T,na.string="?",stringsAsFactors=F)
hpc$Time<-paste(hpc$Date, hpc$Time)
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time<-strptime(hpc$Time,"%d/%m/%Y %H:%M:%S")
hpc_sub<-subset(hpc,hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2),cex=0.8)
#plot1
plot(hpc_sub$Time,hpc_sub$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#plot2
plot(hpc_sub$Time,hpc_sub$Voltage,type="l",ylab="Voltage",xlab="datetime")
#plot3
plot(hpc_sub$Time,hpc_sub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(hpc_sub$Time,hpc_sub$Sub_metering_2,col="red")
lines(hpc_sub$Time,hpc_sub$Sub_metering_3,col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,lty=1,col=c('black','red','blue'), bty='n')
#plot4
plot(hpc_sub$Time,hpc_sub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()