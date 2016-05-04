setwd("~/Desktop/coursera/exploratory data")
t<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
x<-subset(t, Date=="2/2/2007"|Date=="1/2/2007")

x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$Global_active_power<-as.numeric(as.character(x$Global_active_power))  #convert factor to numeric

#construct the plot and save it to a PNG file
png(filename = "plot1.png",width = 480, height = 480) 
hist(x$Global_active_power, breaks = 12, plot = TRUE, col="red",main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off() #close the png file device



