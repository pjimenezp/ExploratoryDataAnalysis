# Reading File 
powerConsumption<-read.table("household_power_consumption.txt",sep=";",nrows=70000,header=TRUE)
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
# Selecting only specific days 
pc <- powerConsumption[powerConsumption$Date>="2007-02-01" & powerConsumption$Date<="2007-02-02",]

## Plot 4
pc$Global_active_power<-as.numeric(pc$Global_active_power)
pc$DateTime <- strptime(paste(pc$Date, pc$Time), "%Y-%m-%d %H:%M")

png("plot4.png",480,480)
par(mfrow=c(2,2))

plot(pc$DateTime,pc$Global_active_power,type="l",xlab="Date",ylab="Global Active Power")

plot(pc$DateTime,pc$Voltage,type="l",xlab="Date",ylab="Voltage")

plot(pc$DateTime,pc$Sub_metering_1,type="l",xlab="Date",ylab="Energy sub metering")
lines(pc$DateTime,pc$Sub_metering_2,col="red",lwd=1)
lines(pc$DateTime,pc$Sub_metering_3,col="blue",lwd=1)
legend("topright",
       inset=0,
       cex = 1,
       c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),
       horiz=FALSE,
       lty=c(1,1),
       lwd=c(2,2),
       col=c("black","red","blue"),
       bg="grey96",
       text.font=3)
       
plot(pc$DateTime,pc$Global_reactive_power,type="l",xlab="Date",ylab="Global reactive power")    
       
dev.off()

