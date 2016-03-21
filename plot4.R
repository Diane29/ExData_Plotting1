power <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",
                    stringsAsFactors=FALSE, dec=".")
dat_power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(dat_power$Date, dat_power$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(dat_power$Global_active_power)
Global_reactive_power <- as.numeric(dat_power$Global_reactive_power)
Voltage <- as.numeric(dat_power$Voltage)
Sub_metering_1 <- as.numeric(dat_power$Sub_metering_1) 
Sub_metering_2 <- as.numeric(dat_power$Sub_metering_2) 
Sub_metering_3 <- as.numeric(dat_power$Sub_metering_3) 

par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(date_time,Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot(date_time,Voltage, type="l",xlab="datetime")

plot(date_time,Sub_metering_1, type="l", ylab="Energy sub metering",xlab="") 
lines(date_time, Sub_metering_2,col='Red') 
lines(date_time, Sub_metering_3,col='Blue') 

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"),bty="n") 

plot(date_time,Global_reactive_power, type="l",xlab="datetime")
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off()