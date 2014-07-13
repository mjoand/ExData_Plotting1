## Downloading data from the course repo and reading it into a data frame
url4<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url4, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
file4<-"household_power_consumption.txt"


# I have analysed the household_power_consumption.txt file using OpenOffice Calc
# The first line of data corresponding to the required dates is line 66638
# The last line corresponding to the required dates is line 69517
# Which corresponds to a total of 2880 lines to be read
data4<-read.table(file4,sep=";",na.strings="?",skip=66637,nrows=2880)
# retrieving the variable names and labeling the data frame
aux<-read.table(file4,sep=";",na.strings="?",nrows=1,header=TRUE)
colnames(data4)<-colnames(aux)

# creating a new column datetime by collapsing Date and Time
# and converting it in a Date object
data4$datetime <- apply(data4[ ,c("Date","Time")],1 ,paste ,collapse = " " )
data4$datetime <- as.POSIXct(strptime(data4$datetime, "%d/%m/%Y %H:%M:%S"))

## Generating, annotating and saving plot4

#The required height and widthe of 480x 480 pixels are already defined by default
# background was redefined as transparent
png(file = "plot4.png",bg="transparent")
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
 plot(data4$Global_reactive_power ~data4$datetime,type='l',xlab="datetime",ylab="Global reactive power", bg="transparent") 

dev.off()