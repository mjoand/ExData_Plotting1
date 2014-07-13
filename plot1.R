## Downloading data from the course repo and reading it into a data table
url1<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file1<-"household_power_consumption.txt"

# I have analysed the household_power_consumption.txt file using OpenOffice Calc
# The first line of data corresponding to the required dates is line 66638
# The last line corresponding to the required dates is line 69517
# Which corresponds to a total of 2880 lines to be read
data1<-read.table(file1,sep=";",na.strings="?",skip=66637,nrows=2880)

## Generating, annotating and saving plot1

#The required height and widthe of 480x 480 pixels are already defined by default
# background was redefined as transparent
png(file = "plot1.png",bg="transparent")
#The column corresponding to the variable Global Active Power is the 3rd column
hist(data[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red",bg="transparent")
dev.off()