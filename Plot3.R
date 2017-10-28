> textfile <- "household_power_consumption.txt"

> initial <-read.table(textfile,nrows=100)

> classes <-sapply(initial,class)
## Determining the class of each columns

> theData <- read.table(textfile, colClasses=classes, sep=";", nrows=2075259)
##loading the data into R

> library(dplyr)

> theData <- mutate(theData,V1=as.Date(V1, format="%d/%m/%Y"))
## mutatting the date column as a date class

> usefulData <-filter(theData, V1>= "2007-02-01" & V1 <="2007-02-02")
## filtering the useful data for the class project

> names(usefulData) <- c("Date","Time", "Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
"Sub_metering_2","Sub_metering_3")
##giving descriptive names to the columns

> globalactivepower <- as.numeric(as.character(usefulData$Global_active_power))
## transforming the data of Global_active_power as numeric objects

>  usefulData <- mutate(usefulData, datetime= as.POSIXct(paste(usefulData$Date,usefulData$Time),format="%Y-%m-%d %H:%M:%S"))
## creating a new datetime variable that contains a Date/time class object

> png("plot3.png",width=480,height=480)

> plot(usefulData$datetime,as.numeric(as.character(usefulData$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")

> lines(usefulData$datetime,as.numeric(as.character(usefulData$Sub_metering_1)))

> lines(usefulData$datetime,as.numeric(as.character(usefulData$Sub_metering_2)),col="red")

> lines(usefulData$datetime,as.numeric(as.character(usefulData$Sub_metering_3)),col="blue")

> legend("topright",lwd=1:2,cex=0.8,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

> dev.off()
##constructing the plot and saving it as a png file