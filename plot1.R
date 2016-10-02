## setwd("C://Users//spg//Downloads//documents//data science//data")

file_name <- "getdata_power_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(file_name)){
  file_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(file_URL, file_name,mode='wb')
}  

if (!file.exists("getdata_power_dataset"))
  { 
  unzip(file_name) 
 }

mydata <- read.table("household_power_consumption.txt",
                     header = TRUE,
                     sep = ";", 
                     na.strings = "?",
                     col.names=c("Date", "Time","Global_active_power",
                                  "Global_reactive_power","Voltage","Global_intensity",
                                  "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

submydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(submydata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()