power <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",
                    stringsAsFactors=FALSE, dec=".")
dat_power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(dat_power$Date, dat_power$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(dat_power$Global_active_power)
plot(date_time,Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off()