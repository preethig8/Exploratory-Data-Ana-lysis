#read the first line of the file
first_line<-read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep=";",nrows=1)

#skip all the rows till Feb 1st 2007 and read only the data corresponding to 02/01/2007 and 02/02/2007
hhpc <- read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", header = FALSE,stringsAsFactors = FALSE,sep = ";",skip = 66637,nrows = 2880,col.names = tolower(gsub("_","",names(first_line))))

#create a new variable which provides the date time in a different format
hhpc <- mutate(hhpc, ts = dmy_hms(paste(date,time,sep=" "),locale = "US"))

#create a png file of height and width equal to 480 pixels
png("plot3.png",width = 480, height = 480, units = "px")

#create a empty plot 
plot(hhpc$ts, pmax(hhpc$submetering1,hhpc$submetering2,hhpc$submetering3), xlab="",ylab="Energy sub metering",type="n")

#Add lines for each submetering data
lines(hhpc$ts, hhpc$submetering1, col="black")
lines(hhpc$ts, hhpc$submetering2, col="red")
lines(hhpc$ts, hhpc$submetering3, col="blue")

#Add legend details 
legend("topright",col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75, lty=1)

#close the png file
dev.off()

