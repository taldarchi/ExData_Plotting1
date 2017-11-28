plot2 <- function(){
  hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  dateAndTime <- paste(as.Date(hpc$Date), hpc$Time)
  hpc$DateAndTime <- as.POSIXct(dateAndTime)
  png("plot2.png", width=480, height=480)
  plot(hpc$Global_active_power~hpc$DateAndTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}