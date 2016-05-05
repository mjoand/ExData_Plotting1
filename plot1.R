### Downloading data from the course repo and reading it into a data table
###
url1<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file<-"household_power_consumption.txt"

data<-read.table(file,sep=";",na.strings="?",header=TRUE)

# We are only interested in the lines corresponding to 2007-02-01 and 2007-02-02.
#Extracting the lines corresponding to 2007-02-01
day1<-subset(data,Date=="1/2/2007")
#Extracting the lines correponding to 2007-02-02
day2<-subset(data,Date=="2/2/2007")

data<-rbind(day1,day2)

## Generating, annotating and saving plot1

# background was redefined as transparent
png(file = "plot1.png",bg="transparent",width=480, height=480, units="px")
#The column corresponding to the variable Global Active Power is the 3rd column
hist(data[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red",bg="transparent")
dev.off()
