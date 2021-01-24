##Open the graphical device png, and add the name of the plot and size
png(filename="plot1.png", width=480, height=480)

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

## plot the histogram on Plot1 with the x,y and title labeled and the histogram in red
hist(data3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## close the graphical device
dev.off()
