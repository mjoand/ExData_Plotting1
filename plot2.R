### Downloading data from the course repo and reading it into a data frame
url2<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url2, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file2<-"household_power_consumption.txt"


# I have analysed the household_power_consumption.txt file using OpenOffice Calc
# The first line of data corresponding to the required dates is line 66638
# The last line corresponding to the required dates is line 69517
# Which corresponds to a total of 2880 lines to be read
data2<-read.table(file2,sep=";",na.strings="?",skip=66637,nrows=2880)
# retrieving the variable names and labeling the data frame
aux<-read.table(file2,sep=";",na.strings="?",nrows=1,header=TRUE)
colnames(data2)<-colnames(aux)

# creating a new column datetime by collapsing Date and Time
# and converting it in a Date object
data2$datetime <- apply(data2[ ,c("Date","Time")],1 ,paste ,collapse = " " )
data2$datetime <- as.POSIXct(strptime(data2$datetime, "%d/%m/%Y %H:%M:%S"))

## Generating, annotating and saving plot2

#The required height and widthe of 480x 480 pixels are already defined by default
# background was redefined as transparent
png(file = "plot2.png",bg="transparent")
plot(data2$Global_active_power~ data2$datetime,type='l',xlab="",ylab="Global Active Power (kilowatts)",bg="transparent")
dev.off()