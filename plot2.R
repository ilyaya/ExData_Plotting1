library(data.table)
unzip("exdata-data-household_power_consumption.zip")

#read number of rows equal to minutes in two days
rows <- 60 * 24 * 2

#get column names
temp <- fread("household_power_consumption.txt", nrows=0)
columns <- colnames(temp)

temp <- fread("household_power_consumption.txt", skip="1/2/2007", header = FALSE, nrows = rows, na.strings=c("?"), col.names = columns)

png(file="plot2.png", height = 480, width = 480)

plot(as.POSIXlt(paste(temp$Date, temp$Time), format="%e/%m/%Y %H:%M:%S"), temp$Global_active_power, type="n", ylab="Global Active Power (killowats)", xlab="")
lines(as.POSIXlt(paste(temp$Date, temp$Time), format="%e/%m/%Y %H:%M:%S"), temp$Global_active_power)

dev.off()