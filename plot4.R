library(data.table)
unzip("exdata-data-household_power_consumption.zip")

#read number of rows equal to minutes in two days
rows <- 60 * 24 * 2

#get column names
temp <- fread("household_power_consumption.txt", nrows=0)
columns <- colnames(temp)

temp <- fread("household_power_consumption.txt", skip="1/2/2007", header = FALSE, nrows = rows, na.strings=c("?"), col.names = columns)

png(file="plot4.png", height = 480, width = 480)

par(mfrow = c(2,2))
plot(dates, temp$Global_active_power, type="n", ylab="Global Active Power (killowats)", xlab="")
lines(dates, temp$Global_active_power)
plot(dates, temp$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(dates, temp$Voltage)
plot(dates, temp$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(dates, temp$Sub_metering_1, col="black")
lines(dates, temp$Sub_metering_2, col="red")
lines(dates, temp$Sub_metering_3, col="blue")
legend("topright", lty = c(1,1,1), lwd = c(2, 2, 2), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), cex=0.6)
plot(dates, temp$Global_reactive_power, type="n", ylab="Voltage", xlab="datetime")
lines(dates, temp$Global_reactive_power)

dev.off()
