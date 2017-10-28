> textfile <- "household_power_consumption.txt"

> initial <-read.table(textfile,nrows=100)

> classes <-sapply(initial,class)
## Determining the classof each columns

> theData <- read.table(textfile, colClasses=classes, sep=";", nrows=2075259)
## Reading the data into R

> library(dplyr)

> theData <- mutate(theData,V1=as.Date(V1, format="%d/%m/%Y"))
## mutating the date column as date class objects

> usefulData <-filter(theData, V1>= "2007-02-01" & V1 <="2007-02-02")
## filtering the useful data for the project

> names(usefulData) <- c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## using descriptive names for each columns

> globalactivepower <- as.numeric(as.character(usefulData$Global_active_power))
## converting the data in Global_active_power as numeric objcts

> usefulData <- mutate(usefulData, datetime= as.POSIXct(paste(usefulData$Date,usefulData$Time),format="%Y-%m-%d %H:%M:%S"))
## creating the datetime column containin the date/time objects

> png("plot2.png",width=480,height=480)

> plot(usefulData$datetime,globalactivepower,type="l",ylab="Global Active Power (kilowatts)",xlab="")

> dev.off()

## constructing the plot and saving it as a png file