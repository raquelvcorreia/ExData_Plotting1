##Open the graphical device png, and add the name of the plot and size
png(filename="plot3.png", width=480, height=480)

##Read data into R
data <- read.csv2("household_power_consumption.txt")


##Subset data, to have only the rows where Date = 1/2/2007 or Date = 2/2/2007
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##clone data2 into data3
data3 <- data2

##replace any possible "?" within the dataframe for NA
data3[data3 == "?"] <- NA



#convert values on column Global_active_power to numeric 
data3$Global_active_power <- as.numeric(data3$Global_active_power)

#convert values on column date to actual Date class
data3$Date <- strptime(data3$Date, "%d/%m/%Y")

#adding abbreviated days of the week
data3$day <- weekdays(as.Date(data3$Date), abbreviate = TRUE)

##convert Time column to the correct class
data3$Time <- as_hms(data3$Time)

##create a column that has date and time information merged
data3$datetime <- as.POSIXct(paste(data3$Date, data3$Time), format="%Y-%m-%d %H:%M:%S")

##plot date vs Sub_metering_1, with specific x and y labels
with(data3, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"), col = "black")

#add data on Sub_metering_2
lines(data3$datetime, data3$Sub_metering_2, col = "red")

#add data on Sub_metering_3
lines(data3$datetime, data3$Sub_metering_3, col = "blue")

##add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)


##close the graphical device
dev.off()
