data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

my_data <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))

png("./plot2.png")

plot(as.numeric(my_data$Global_active_power)/500, type = "l", ylab = "Global active power (kilowatts)", xlab = "")

dev.off()
