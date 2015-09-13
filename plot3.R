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

# Generate plot3 on the screen
    with(dataToPlot, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
    with(dataToPlot, lines(DateTime, Sub_metering_2, col = "red"))
    with(dataToPlot, lines(DateTime, Sub_metering_3, col = "blue"))
# I have to set text.width because when exporting the plot to png the text gets truncated.
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.width = strwidth("1,000,000,000,000,000"))

# Exporting to png file
    dev.copy(png, file = "plot3.png", width = 480, height = 480)
    dev.off()
