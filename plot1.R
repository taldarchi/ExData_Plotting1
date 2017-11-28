plot1 <- function(){
  library(chron)
  hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
  hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
  hpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  png("plot1.png", width=480, height=480)
  with(hpc, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
  dev.off()
}