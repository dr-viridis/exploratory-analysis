data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

my_data <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))

png("./plot1.png")

hist(as.numeric(my_data$Global_active_power)/1000, col = "orange", xlab = "Global active power (kilowatts)", main = "Global active power")

dev.off()
