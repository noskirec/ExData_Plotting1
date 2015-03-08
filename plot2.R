## Plot 2
## X-axis: Day of the Week
## Y-axis: Global Active Power

plot2 <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
  
  datetime <- paste(as.Date(data_subset$Date),data_subset$Time)
  data_subset$DateTime <- as.POSIXct(datetime)
  
  png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
  plot(data_subset$DateTime,data_subset$Global_active_power, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  
  dev.off()
}