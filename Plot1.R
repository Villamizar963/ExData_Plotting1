
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

# 5.- Generating Plot 1 and png file
png(paste0(directory,"/Plot1.png"), width = 480, height = 480)

plot <- hist(Electric_power2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
