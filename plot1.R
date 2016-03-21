power <- read.table("household_power_consumption.txt", header=TRUE,sep = ";",
                    stringsAsFactors=FALSE, dec=".")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subsetting a 2-day period in February 2007
dat_power <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

Global_active_power <- as.numeric(dat_power$Global_active_power)
hist(Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red",ylim=c(1,1200))
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
