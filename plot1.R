# Exploratory Data Analysis: Course Project 1, Plot 1
# 2017-02-04 by Marc Boulet
household_power_consumption <- read_csv2("household_power_consumption.txt")
# subset data
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
feb_hpc <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")
# plot data
hist(feb_hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", xaxt="n")
axis(1, at = c(0,2,4,6))
# make .png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()