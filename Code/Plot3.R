# Get and Clean Data


# Original code set the working directory to where the data file was. This was removed for the purposed of publishing to GitHub.

household_data <- read.csv("household_power_consumption.txt", 
                            header = TRUE, sep = ";"
                         )

household_data$Date = as.Date(household_data$Date, format = "%d/%m/%Y")

plot_data <- household_data[household_data$Date >= "2007-02-01" & 
                            household_data$Date <= "2007-02-02", ]
                            
plot_data$Global_active_power   = as.character(plot_data$Global_active_power)
plot_data$Global_reactive_power = as.character(plot_data$Global_reactive_power) 
plot_data$Voltage               = as.character(plot_data$Voltage)               
plot_data$Global_intensity      = as.character(plot_data$Global_intensity)     
plot_data$Sub_metering_1        = as.character(plot_data$Sub_metering_1)
plot_data$Sub_metering_2        = as.character(plot_data$Sub_metering_2)

plot_data$Global_active_power   = as.numeric(plot_data$Global_active_power)
plot_data$Global_reactive_power = as.numeric(plot_data$Global_reactive_power) 
plot_data$Voltage               = as.numeric(plot_data$Voltage)               
plot_data$Global_intensity      = as.numeric(plot_data$Global_intensity)     
plot_data$Sub_metering_1        = as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2        = as.numeric(plot_data$Sub_metering_2)


# Merge date and time for x-axis. Create plot with y-axis label. 

plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), 
                                       format="%Y-%m-%d %H:%M:%S")

plot(plot_data$Sub_metering_1~plot_data$DateTime,
    xlab = "",
    ylab = "Energy sub metering",
    type = "l"
)

lines(plot_data$DateTime,plot_data$Sub_metering_2, col = "red")
lines(plot_data$DateTime,plot_data$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1), col = c("black", "red", "blue")
)
