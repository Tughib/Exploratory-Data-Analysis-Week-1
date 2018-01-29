# First obtain the data
## Download the zip file
fileName <- "household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dir <- "UC Irvine ML Dataset"

## Check if the file already exists, then put it in working directory
if(!file.exists(fileName)){
        download.file(url,fileName, mode = "wb") 
}
# ... where wb = binary mode;

## Check if the directory already exists, then unzip the downloaded file, 
if(!file.exists(dir)){
        unzip("household_power_consumption.zip", files = NULL, exdir=".")
}
# where: 
# - files = vector of recorded filepaths to be extracted
# - exdir = directory to which files are extracted, created if necessary

# Provide references to the files
path_ref <- file.path("." , "UC Irvine ML Dataset")
files <- list.files(path_ref, recursive=TRUE)

## Then read in the data:

# Read in the data
alldata <- read.csv2("household_power_consumption.txt")
# "We will only be using data from the dates 2007-02-01 and 2007-02-02."
subdata <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
# Define variables, and convert to numeric
global_active_power <- as.numeric(as.character(subdata$Global_active_power))
global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))
voltage <- as.numeric(as.character(subdata$Voltage))
global_intensity <- as.numeric(as.character(subdata$Global_intensity))
sub_metering1 <- as.numeric(as.character(subdata$Sub_metering_1))
sub_metering2 <- as.numeric(as.character(subdata$Sub_metering_2))
sub_metering3 <- as.numeric(as.character(subdata$Sub_metering_3))

# Set weekdays in English 
Sys.setlocale("LC_TIME", "English")
weekdays(Sys.Date()+0:6)

# Convert to date time
date_time <- strptime(paste(subdata$Date, subdata$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

# "For each plot you should"... 
## "Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## Name each of the plot files as plot1.png, plot2.png, etc."

if(!file.exists("plot2.png"))
{
        png("plot2.png", width = 480, height = 480)
        plot(date_time, global_active_power, type = "l", xlab = "", 
             ylab = "Global Active Power (kilowatts)")
        dev.off()
}