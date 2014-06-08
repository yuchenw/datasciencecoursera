# Set working directory
setwd("C:/Users/Yu-Chen Wang/Documents/My Box Files/R/Coursera/Exploratory_Data_Analysis")

# Read Data
install.packages("data.table")
library(data.table)

Electric <- fread("C:/Users/Yu-Chen Wang/Documents/My Box Files/R/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt")

# Set date and datetime class for the first two columns, repsectively
Electric$Date <- as.Date(Electric$Date, "%d/%m/%Y")
Electric$Time <- paste(Electric$Date, Electric$Time)
Electric$Time <- as.POSIXct(Electric$Time,tz="","%Y-%m-%d %H:%M:%S")

# Selcet target dates
Electric_sub <- subset(Electric, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Convert back to data.frame class
Electric_sub <- as.data.frame(Electric_sub)

# Convert character to double-precision vector
Electric_sub[,3] <- as.double(Electric_sub[,3])
Electric_sub[,4] <- as.double(Electric_sub[,4])
Electric_sub[,5] <- as.double(Electric_sub[,5])
Electric_sub[,6] <- as.double(Electric_sub[,6])
Electric_sub[,7] <- as.double(Electric_sub[,7])
Electric_sub[,8] <- as.double(Electric_sub[,8])

## Draw Plot 2
png(filename = "plot2.png", width = 480, height = 480)

plot(Electric_sub$Time,Electric_sub$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off() 
Electric_sub[,9] <- as.double(Electric_sub[,9])