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

# Generate plot1 on the screen, with red color, proper labels
    with(dataToPlot, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))

# Exporting to png file
    dev.copy(png, file = "plot1.png", width = 480, height = 480)
    dev.off()
