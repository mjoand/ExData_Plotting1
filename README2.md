## ReadMe2

This assignment uses data from:
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. The Data Set was downloaded from the course web site:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> ]

The url is: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

Note that the location of the data on the course web site may not be permanent, and, as such
in future runs of the code, it may be necessary to replace the url for the one corresponding to
the location of the data at the time.

The plot on the bottom right of plot4 is slightly different from the one provided Dr Peng,
the original has "Global_reactive_power" as a y-label, while my plot has "Global reactive power".
Given that the presence of underscores in the original label is probably a typo, I have opted
for maintaining a consistent notation on the 4 sub-plots of plot 4. 
To obtain an exact replica of the plot provided by Dr Peng, the 42nd line of plot4.R should be replaced by:

** plot(data4$Global_reactive_power~data4$datetime,type='l',xlab="datetime",ylab="Global_reactive_power", bg="transparent") **

The plots were executed under a Windows software, Windows 7 and R version 3.1.0





