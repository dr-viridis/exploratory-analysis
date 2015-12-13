data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

my_data <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))

png("./plot3.png")

y_limits <- c(0,0.035) # "cheating" by not calculating this on the fly

plot(as.numeric(my_data$Sub_metering_1)/1000, type = "s", ylim = y_limits)
par(col = "red")
lines(as.numeric(my_data$Sub_metering_2)/1000, type = "s")
par(col = "blue")
lines(as.numeric(my_data$Sub_metering_3)/1000, type = "s")

legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = 1, col = 1:3)

dev.off()
