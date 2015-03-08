## Plot 3 -- All submetered readings
## X-axis: Day of the Week
## Y-axis: Energy sub metering

plot3 <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  # Reformat dates
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  # Grab appropriate subset of data
  data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  # Reformat data as numeric
  for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
  
  # Create DateTime value
  datetime <- paste(as.Date(data_subset$Date),data_subset$Time)
  data_subset$DateTime <- as.POSIXct(datetime)
  
  # Instantiate graphic device
  png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
  
  # Plot first set of data
  plot(data_subset$DateTime,data_subset$Sub_metering_1, type = "l",
       ylab = "Energy sub metering", xlab = "", col = "black")
  
  ## Add second and third lines
  lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
  lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
  
  ## Add legend
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1), col = c("black", "red","blue"))
  
  # Turn off graphics device
  dev.off()
}