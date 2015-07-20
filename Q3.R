library(plyr)
library(data.table)
library(ggplot2)
options(stringsAsFactors = FALSE) # Avoid reading strings as factors
# Read the data
df <- read.table("household_power_consumption.txt", sep=";", na.strings="?",
                   header=TRUE)
times<-paste(df$Date,df$Time)
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- strptime(times, "%d/%m/%Y %H:%M:%S")

# plot1: What is the distribution of global active power

png(file="plot1.png",bg="transparent")
hist(df$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",
     main="Global Active Power")
title(main="Global Active Power")
dev.off()

# plot2: What is the typical global active power change over a week

data <- subset(df,Date >= "2010-10-31" & Date <= "2010-11-06")

png(file="plot2.png",bg="transparent")
plot(data$Time,data$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",
     xlab=NA)
lines(data$Time,data$Global_active_power,lty=1)
dev.off()