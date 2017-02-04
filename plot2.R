# Exploratory Data Analysis: Course Project 1, Plot 2
# 2017-02-04 by Marc Boulet
household_power_consumption <- read_csv2("household_power_consumption.txt")
# subset data
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
feb_hpc <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")
# combine date & time fields
feb_hpc$DT <- paste(feb_hpc$Date, feb_hpc$Time, sep= " ")
feb_hpc$DT <- as.POSIXct(feb_hpc$DT)
# generate plot
plot(feb_hpc$DT, feb_hpc$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
# make .png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()