#read the first line of the file
first_line<-read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep=";",nrows=1)

#skip all the rows till Feb 1st 2007 and read only the data corresponding to 02/01/2007 and 02/02/2007
hhpc <- read.csv(file="exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", header = FALSE,stringsAsFactors = FALSE,sep = ";",skip = 66637,nrows = 2880,col.names = tolower(gsub("_","",names(first_line))))

#create a png file and add the plot to it
png("plot1.png",width=480,height = 480,units = "px")

#create a histogram of Global active power data
hist(hhpc$globalactivepower,col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close the opened graphics device
dev.off()
