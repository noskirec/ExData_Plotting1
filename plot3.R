## Plot 3 -- All submetered readings
## X-axis: Day of the Week
## Y-axis: Energy sub metering

plot3 <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
  
  datetime <- paste(as.Date(data_subset$Date),data_subset$Time)
  data_subset$DateTime <- as.POSIXct(datetime)
  
  png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
  plot(data_subset$DateTime,data_subset$Sub_metering_1, type = "l",
       ylab = "Energy sub metering", xlab = "", col = "black")
  lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
  lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1), col = c("black", "red","blue"))
  #dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
}