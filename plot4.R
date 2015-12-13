# Stuff I still need to figure out (probably won't before deadline):
#
#
# axis scaling
# using date/times on x axis (I saw the hint in the assignment, but so far
# it eludes me)
# better formatting of the legend box in the sub metering plot

data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

my_data <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))

png("./plot4.png")

y_limits <- c(0,0.035) # "cheating" by not calculating this on the fly

par(mfcol = c(2,2))

with(my_data, {

# global active power (upper left)
par(col = "black")
plot(as.numeric(my_data$Global_active_power)/1000, type = "s", ylab = "Global Active Power", xlab = " ")

# sub metering power (lower left)
plot(as.numeric(my_data$Sub_metering_1)/1000, type = "s", ylim = y_limits, ylab = "Energy sub metering", xlab = " ")
par(col = "red")
lines(as.numeric(my_data$Sub_metering_2)/1000, type = "s")
par(col = "blue")
lines(as.numeric(my_data$Sub_metering_3)/1000, type = "s")
par(col = "black")
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = 1, col = c("black","red","blue"))


#voltage plot (upper right)

plot(as.integer(my_data$Voltage), type = "s", ylab = "Voltage", xlab = "datetime")

# global reactive power plot (lower right)
plot(as.integer(my_data$Global_reactive_power), type = "s", ylab = "Global reactive power", xlab = "datetime")


}) # end "with my_data"

dev.off()
