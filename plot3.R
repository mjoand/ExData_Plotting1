## Downloading data from the course repo and reading it into a data frame
url3<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url3, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file3<-"household_power_consumption.txt"


# I have analysed the household_power_consumption.txt file using OpenOffice Calc
# The first line of data corresponding to the required dates is line 66638
# The last line corresponding to the required dates is line 69517
# Which corresponds to a total of 2880 lines to be read
data3<-read.table(file3,sep=";",na.strings="?",skip=66637,nrows=2880)
# retrieving the variable names and labeling the data frame
aux<-read.table(file3,sep=";",na.strings="?",nrows=1,header=TRUE)
colnames(data3)<-colnames(aux)

# creating a new column datetime by collapsing Date and Time
# and converting it in a Date object
data3$datetime <- apply(data3[ ,c("Date","Time")],1 ,paste ,collapse = " " )
data3$datetime <- as.POSIXct(strptime(data3$datetime, "%d/%m/%Y %H:%M:%S"))

## Generating, annotating and saving plot3

#The required height and widthe of 480x 480 pixels are already defined by default
# background was redefined as transparent
png(file = "plot3.png",bg="transparent")
plot(data3$Sub_metering_1~ data3$datetime,type='l',col="black",xlab="",ylab="Energy sub metering",bg="transparent")
lines(data3$Sub_metering_2 ~ data3$datetime, col="red")
lines(data3$Sub_metering_3 ~ data3$datetime, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c("solid","solid","solid"),col=c("black", "red", "blue"))
dev.off()