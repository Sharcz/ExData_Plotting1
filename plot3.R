# Exploratory Data Analysis: Course Project 1, Plot 3
# 2017-02-04 by Marc Boulet
household_power_consumption <- read_csv2("household_power_consumption.txt")
# subset data
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
feb_hpc <- subset(household_power_consumption, Date == "2007-02-01" | Date =="2007-02-02")
# combine date & time fields
feb_hpc$DT <- paste(feb_hpc$Date, feb_hpc$Time, sep= " ")
feb_hpc$DT <- as.POSIXct(feb_hpc$DT)
collist = c("black", "red", "blue")
# generate plot
plot(feb_hpc$DT, feb_hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(feb_hpc$DT, feb_hpc$Sub_metering_2, col = collist[2])
lines(feb_hpc$DT, feb_hpc$Sub_metering_3, col = collist[3])
legend("topright", colnames(feb_hpc[1,7:9]), lwd=1, col = collist)
## make .png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()