# Reading File 
powerConsumption<-read.table("household_power_consumption.txt",sep=";",nrows=70000,header=TRUE)
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
# Selecting only specific days 
pc <- powerConsumption[powerConsumption$Date>="2007-02-01" & powerConsumption$Date<="2007-02-02",]

## Plot 2
pc$Global_active_power<-as.numeric(pc$Global_active_power)
pc$DateTime <- strptime(paste(pc$Date, pc$Time), "%Y-%m-%d %H:%M")

png("plot2.png",480,480)
plot(pc$DateTime,pc$Global_active_power,type="l",xlab="Date",ylab="Global Active Power (kilowatts)")
dev.off()

