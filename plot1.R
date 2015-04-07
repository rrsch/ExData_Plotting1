setwd("/SAFE/PII2/COURSES/ExploratoryDataAnalysis")
of <- read.csv("household_power_consumption.txt", 
    colClasses = c(Date="character",Time="character", rep("numeric",7) ),
    sep=";", na.strings="?")

#head(of)
of$dt <- as.Date(of$Date)
rel<-subset( of,  Date=="2/2/2007" | Date=="1/2/2007" )
rel$dtm_str<-paste( rel$Date, rel$Time )
rel$dt <- as.POSIXct(strptime(rel$dtm_str,"%d/%m/%Y %H:%M:%S"))


png(filename = "plot1.png", width = 480, height = 480)

hist(rel$Global_active_power,col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")

dev.off()
