setwd("~/Desktop/coursera/exploratory data")
t<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
x<-subset(t, Date=="2/2/2007"|Date=="1/2/2007")

x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$Global_active_power<-as.numeric(as.character(x$Global_active_power))  #convert factor to numeric

#converting date
datatime<-paste(x$Date,x$Time)
x$Datetime<-as.POSIXct(datatime)

png(filename = "plot2.png",width = 480, height = 480) 
with(x,plot(Global_active_power~Datetime, type ="l", lwd=1, xlab="", ylab = "Global Active Power(kilowatts)"))
dev.off() #close the png file device