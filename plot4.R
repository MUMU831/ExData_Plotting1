setwd("~/Desktop/coursera/exploratory data")
t<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", nrows = 2075259, check.names = F, 
            stringsAsFactors = F, comment.char = "", quote = '\"')
x<-subset(t, Date=="2/2/2007"|Date=="1/2/2007")

x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$Global_active_power<-as.numeric(as.character(x$Global_active_power))  #convert factor to numeric

#converting date
datatime<-paste(x$Date,x$Time)
x$Datetime<-as.POSIXct(datatime)

x$Sub_metering_1<-as.numeric(x$Sub_metering_1)
x$Sub_metering_2<-as.numeric(x$Sub_metering_2)

png(filename = "plot4.png",width = 480, height = 480) 
par(mfrow=c(2,2))
with(x,plot(Global_active_power~Datetime, type ="l", lwd=1, col="black", xlab="", ylab = "Global Active Power"))
with(x,plot(Voltage~Datetime, type ="l", lwd=1, col="black", xlab="datetime", ylab = "Voltage"))

with(x,plot(Sub_metering_1~Datetime, type ="l", lwd=1, col="black", xlab="", ylab = "Energy sub metering"))
with(x,lines(Sub_metering_2~Datetime, type ="l", lwd=1, col="red", xlab="", ylab = "Energy sub metering"))
with(x,lines(Sub_metering_3~Datetime, type ="l", lwd=1, col="blue", xlab="", ylab = "Energy sub metering"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = "solid", x.intersp = 1, y.intersp = 1, xjust = 1, yjust = 1)

with(x,plot(Global_reactive_power~Datetime, type ="l", lwd=1, col="black", xlab="datetime", ylab = "Global_reactive_power"))
dev.off() #close the png file device