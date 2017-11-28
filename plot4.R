plot4 <- function(){
  hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  dateAndTime <- paste(as.Date(hpc$Date), hpc$Time)
  hpc$DateAndTime <- as.POSIXct(dateAndTime)
  png("plot4.png", width=480, height=480)
  
  par(mfcol = c(2,2))
  plot(hpc$Global_active_power~hpc$DateAndTime, type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(hpc$DateAndTime, as.numeric(as.character(hpc$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy Sub Metering")
  lines(hpc$DateAndTime, as.numeric(as.character(hpc$Sub_metering_2)), type = "l", col = "red")
  lines(hpc$DateAndTime, as.numeric(as.character(hpc$Sub_metering_3)), type = "l", col = "blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"), bty = "n", cex = 0.8)
  
  plot(as.numeric(as.character(hpc$Voltage)) ~ hpc$DateAndTime, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(as.numeric(as.character(hpc$Global_reactive_power)) ~ hpc$DateAndTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}