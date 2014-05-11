
# number of row ro be read
num__row_read = 2*24*60

# read only the dates 2007-02-01 and 2007-02-02
consumption <- read.table("C:/Users/user/Desktop/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt",
                          nrows=num__row_read, sep=";", skip=66637)

# change the data format
consumption[,1] <- as.Date(consumption[,1],"%d/%m/%Y")

# set column names
colnames(consumption) <- c("Date", "Time", "Global_active_power",
                           "Global_reactive_power", "Voltage",
                           "Global_intensity", "Sub_metering_1",
                           "Sub_metering_2", "Sub_metering_3")

# set to specific directory for saving png file
setwd("C:/Users/user/Desktop/Coursera/Exploratory Data Analysis/Course Project 1/figure")

png(filename="plot4.png", width=480, height=480)

# prepare for 2 by 2 plots
par(mfcol=c(2,2))

# FIRST PLOT
# plot line type graph without x-axis
plot(consumption$Global_active_power,type="l",xaxt='n', ylab="Global Actie Power", xlab="")
# custom x-axis
axis(side=1, at=c(1, nrow(consumption)/2, nrow(consumption)), labels=c("Thu", "Fri", "Sat"))


# SECOND PLOT
# empty plot first
plot(consumption$Sub_metering_1,type="n",xaxt='n', ylab="Energy sub meeting", xlab="")
# custom x and y axis
axis(side=1, at=c(1, nrow(consumption)/2, nrow(consumption)), labels=c("Thu", "Fri", "Sat"))
lines(consumption$Sub_metering_1, col="black")
lines(consumption$Sub_metering_2, col="red")
lines(consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("grey", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")


# THIRD PLOT
# plot line type graph without x-axis
plot(consumption$Voltage,type="l",xaxt='n', ylab="Voltage", xlab="datetime")
# custom x-axis
axis(side=1, at=c(1, nrow(consumption)/2, nrow(consumption)), labels=c("Thu", "Fri", "Sat"))


# FOURTH PLOT
# plot line type graph without x-axis
plot(consumption$Global_reactive_power, type="l", xaxt='n', ylab="Global_reactive_power", xlab="datetime")
# custom x-axis
axis(side=1, at=c(1, nrow(consumption)/2, nrow(consumption)), labels=c("Thu", "Fri", "Sat"))

# close device
dev.off()
