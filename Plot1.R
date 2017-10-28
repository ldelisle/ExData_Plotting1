## R code for Plot1

> textfile <- "household_power_consumption.txt"

> initial <-read.table(textfile,nrows=100)

> classes <-sapply(initial,class) ##determining the column classes to reduce time
## Determining the classes of each columns

> theData <- read.table(textfile, colClasses=classes, sep=";", nrows=2075259)
## Reading the data in R

> library(dplyr)

> theData <- mutate(theData,V1=as.Date(V1, format="%d/%m/%Y"))
## mutating the Date column as date class

> usefulData <-filter(theData, V1>= "2007-02-01" & V1 <="2007-02-02")
## filtering the useful data for the project

> names(usefulData) <- c("Date","Time", "Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
"Sub_metering_2","Sub_metering_3")
## Giving descriptive namesfor each columns

> globalactivepower <- as.numeric(as.character(usefulData$Global_active_power))
## converting the data in Global_active_power as numeric objects

> png("plot1.png",width=480, height=480)

> hist(globalactivepower, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

> dev.off()

##Constructing the plot and saving it as a png file


