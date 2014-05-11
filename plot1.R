
# number of row ro be read
num__row_read = 2*24*60

# read only the dates 2007-02-01 and 2007-02-02
consumption <- read.table("C:/Users/user/Desktop/Coursera/Exploratory Data Analysis/Course Project 1/household_power_consumption.txt",
                          nrows=num__row_read, sep=";", skip=66637)

# change the data format
consumption[,1] <- as.Date(consumption[,1],"%d/%m/%Y")


colnames(consumption) <- c("Date", "Time", "Global_active_power",
                           "Global_reactive_power", "Voltage",
                           "Global_intensity", "Sub_metering_1",
                           "Sub_metering_2", "Sub_metering_3")

# set to specific directory for saving png file
setwd("C:/Users/user/Desktop/Coursera/Exploratory Data Analysis/Course Project 1/figure")

png(filename="plot1.png", width=480, height=480, )
# plot histogram
hist(consumption$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

# close device
dev.off()
