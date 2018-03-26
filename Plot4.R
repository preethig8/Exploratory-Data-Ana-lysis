#read the first line of the file
first_line<-read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep=";",nrows=1)

#skip all the rows till Feb 1st 2007 and read only the data corresponding to 02/01/2007 and 02/02/2007
hhpc <- read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", header = FALSE,stringsAsFactors = FALSE,sep = ";",skip = 66637,nrows = 2880,col.names = tolower(gsub("_","",names(first_line))))

#create a new variable which provides the date time in a different format
hhpc <- mutate(hhpc, ts = dmy_hms(paste(date,time,sep=" "),locale = "US"))


#Function definition for plot41
plot41 <- function(hhpc){
  plot(hhpc$ts,hhpc$globalactivepower,type="l",xlab="",ylab="Global Active Power")
}

#Function definition fo plot42
plot42 <- function(hhpc){
  plot(hhpc$ts,hhpc$voltage,type="l",xlab="datetime",ylab="Voltage")
}

#Function defintion for plot43
plot43 <- function(hhpc){
  plot(hhpc$ts, pmax(hhpc$submetering1,hhpc$submetering2,hhpc$submetering3), type="n",ylab="Energy sub metering",xlab="")
  lines(hhpc$ts,hhpc$submetering1,col="black")
  lines(hhpc$ts,hhpc$submetering2,col="red")
  lines(hhpc$ts,hhpc$submetering3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1,cex = 0.75)
}

#Function definition for plot44
plot44 <- function(hhpc){
  plot(hhpc$ts, hhpc$globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
}

#create a png file of height and width equal to 480 pixels
png("plot4.png",width = 480, height = 480, units = "px")

#using par function set the layout for 2rows and 2 colums of plots
par(mfrow=c(2,2))

#creating separate functions and invoking them for each of 4 plots
plot41(hhpc)
plot42(hhpc)
plot43(hhpc)
plot44(hhpc)

#close the graphic device
dev.off()
