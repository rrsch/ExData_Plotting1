setwd("/SAFE/PII2/COURSES/ExploratoryDataAnalysis")
of <- read.csv("household_power_consumption.txt", 
               colClasses = c(Date="character",Time="character", rep("numeric",7) ),
               sep=";", na.strings="?")

#head(of)
of$dt <- as.Date(of$Date)
rel<-subset( of,  Date=="2/2/2007" | Date=="1/2/2007" )
rel$dtm_str<-paste( rel$Date, rel$Time )
rel$dt <- as.POSIXct(strptime(rel$dtm_str,"%d/%m/%Y %H:%M:%S"))


png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(Global_active_power ~ dt, rel, ylab="Global Active Power (kilowatts)",xlab="",type="l")
plot(Voltage ~ dt, rel, ylab="Voltage",xlab="datetime",type="l")

plot(Sub_metering_1 ~ dt, rel, ylab="Energy sub metering",xlab="",type="l")
points(Sub_metering_2 ~ dt, rel, col="red",ylab="Global Active Power (kilowatts)",type="l")
points(Sub_metering_3 ~ dt, rel, col="blue",ylab="Global Active Power (kilowatts)",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),cex=0.7, pt.cex = 1, lwd=1,bty = "n" )

plot(Global_reactive_power ~ dt, rel, ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()
