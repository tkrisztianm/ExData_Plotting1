# Download file
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, "data.zip")
    unzip("data.zip")

# Read data into R, convert date time and subset for days to be used
    data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

    strptime(d2$datetime, "%d/%m/%Y %H:%M:%S")
    data$Date <- NULL
    data$Time <- NULL

    dataToPlot <- subset(data, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

# Set canvas
    par(mfcol = c(2, 2))

# 1st graph
    with(dataToPlot, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# 2nd graph
    with(dataToPlot, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
    with(dataToPlot, lines(DateTime, Sub_metering_2, col = "red"))
    with(dataToPlot, lines(DateTime, Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.width = strwidth("100,000,000,000,000"))
    
# 3rd graph
    with(dataToPlot, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# 4th graph
    with(dataToPlot, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

# Exporting to png file
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()
