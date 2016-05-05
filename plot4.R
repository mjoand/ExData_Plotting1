### Downloading data from the course repo and reading it into a data table
###
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file<-"household_power_consumption.txt"

data<-read.table(file,sep=";",na.strings="?",header=TRUE)

# We are only interested in the lines corresponding to 2007-02-01 and 2007-02-02.
#Extracting the lines corresponding to 2007-02-01
day1<-subset(data,Date=="1/2/2007")
#Extracting the lines correponding to 2007-02-02
day2<-subset(data,Date=="2/2/2007")

data4<-rbind(day1,day2)

# creating a new column datetime by collapsing Date and Time
# and converting it in a Date object
data4$datetime <- apply(data4[ ,c("Date","Time")],1 ,paste ,collapse = " " )
data4$datetime <- as.POSIXct(strptime(data4$datetime, "%d/%m/%Y %H:%M:%S"))

## Generating, annotating and saving plot4

# background was redefined as transparent
png(file = "plot4.png",bg="transparent",width=480, height=480, units="px")
par(mfrow=c(2,2))

#1st plot
plot(data4$Global_active_power~data4$datetime,type='l',xlab="",ylab="Global Active Power", bg="transparent")

#2nd plot
plot(data4$Voltage~data4$datetime,type='l',xlab="datetime",ylab="Voltage", bg="transparent")

#3rd plot
plot(data4$Sub_metering_1~data4$datetime,type='l',col="black",xlab="",ylab="Energy sub metering",bg="transparent")
lines(data4$Sub_metering_2 ~ data4$datetime, col="red")
lines(data4$Sub_metering_3 ~ data4$datetime, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty="solid",col=c("black", "red", "blue"))
         
 #4th plot 
 plot(data4$Global_reactive_power ~data4$datetime,type='l',xlab="datetime",ylab="Global_reactive_power", bg="transparent") 

dev.off()