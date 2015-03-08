## Plot 4
## 1: Global Active Power by datetime
## 2: Voltage by datetime
## 3: Energy sub metering by type, by datetime
## 4: Global_reactive_power by datetime

plot4 <- function(){
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
  
  png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
  
  # Set the plot matrix
  par(mfcol = c(2,2))
  
  # Plot the Global Active Power by datetime (plot2.R)
  plot(data_subset$DateTime,data_subset$Global_active_power, type = "l",
       ylab = "Global Active Power", xlab = "")
  
  # Plot the Submetering by datetime (plot3.R)
  plot(data_subset$DateTime,data_subset$Sub_metering_1, type = "l",
       ylab = "Energy sub metering", xlab = "", col = "black")
  lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
  lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1), col = c("black", "red","blue"), bty = "n")
  
  # Plot Voltage by datetime
  plot(data_subset$DateTime, data_subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  # Plot Global Reactive Power by datetime
  plot(data_subset$DateTime, data_subset$Global_reactive_power, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
  
  # Return to null device
  dev.off()
}