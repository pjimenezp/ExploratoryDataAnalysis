# Reading File 
powerConsumption<-read.table("household_power_consumption.txt",sep=";",nrows=70000,header=TRUE)
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
# Selecting only specific days 
pc <- powerConsumption[powerConsumption$Date>="2007-02-01" & powerConsumption$Date<="2007-02-02",]

## Plot 1
pc$Global_active_power<-as.numeric(pc$Global_active_power)

png("plot1.png",480,480)
hist(pc$Global_active_power,breaks=15,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()