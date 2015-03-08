## Plot 1
## X-axis: Global Active Power
## Y-axis: Frequency of occurences

plot1 <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  # Reformat dates
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  # Grab appropriate subset of data
  data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
  
  for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
  
  png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
  
  # Testing margin settings
  #par(mar = c(6,6,5,4))
  
  hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  
  # Turn off graphics device
  dev.off()
}