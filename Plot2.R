#include the libraries containing mutate and dmy_hms functions
library(lubridate)
library(dplyr)

#read the first line of the file
first_line<-read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep=";",nrows=1)

#skip all the rows till Feb 1st 2007 and read only the data corresponding to 02/01/2007 and 02/02/2007
hhpc <- read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", header = FALSE,stringsAsFactors = FALSE,sep = ";",skip = 66637,nrows = 2880,col.names = tolower(gsub("_","",names(first_line))))

#create a new variable which provides the date time in a different format
hhpc <- mutate(hhpc, ts = dmy_hms(paste(date,time,sep=" "),locale = "US"))

#create a png file and add the plot to it
png("plot2.png",width=480,height = 480,units = "px")

#create a plot for global active power data and weekday
plot(hhpc$ts, hhpc$globalactivepower,type="l",ylab = "Global Active Power (kilowatts)", xlab="")

  #close the opened graphics device
dev.off()
