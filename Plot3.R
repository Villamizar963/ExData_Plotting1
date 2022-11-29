
library(data.table)

# 1.- Loading the data

directory <- getwd()

Electric_power <- read.table(paste0(directory,"/household_power_consumption.txt"), 
                   header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

summary(Electric_power)

# 2.- Change the Date column format to date

Electric_power$Date <- as.Date(strptime(Electric_power$Date, format = "%d/%m/%Y"))

# 3.- Filter dates in date format

Electric_power2 <- subset(Electric_power, Date >= "2007-02-01" & Date <= "2007-02-02")

# 4.- Change factor to numeric "Global_active_power" 

Electric_power2$Global_active_power <- as.numeric(Electric_power2$Global_active_power)

# 5.- Create the datetime

Electric_power2$datetime <- paste(Electric_power2$Date, Electric_power2$Time, sep=" ")

Electric_power2$datetime <- strptime(Electric_power2$datetime, format = "%Y-%m-%d %H:%M:%S")

# 6.- Generating Plot 1 and png file

png(paste0(directory,"/Plot3.png"), width = 480, height = 480)

colums <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Electric_power2$datetime, Electric_power2$Sub_metering_1, type="l", col=colums[1], xlab="", ylab="Energy sub metering")
lines(Electric_power2$datetime, Electric_power2$Sub_metering_2, col=colums[2])
lines(Electric_power2$datetime, Electric_power2$Sub_metering_3, col=colums[3])
legend("topright", legend=labels, col=colums, lty="solid")

dev.off()
