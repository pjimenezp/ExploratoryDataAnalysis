# Reading File 
powerConsumption<-read.table("household_power_consumption.txt",sep=";",nrows=70000,header=TRUE)
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
# Selecting only specific days 
pc <- powerConsumption[powerConsumption$Date>="2007-02-01" & powerConsumption$Date<="2007-02-02",]

