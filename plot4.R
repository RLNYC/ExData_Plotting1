#Load in the dataset
project1_data <- read.csv("household_power_consumption.txt",header = TRUE,sep=";")

#change to correct variable type
library(lubridate)
project1_data$Date <- dmy(project1_data$Date)
project1_data$Global_active_power <- as.numeric(as.character(project1_data$Global_active_power))
project1_data$Global_reactive_power <- as.numeric(as.character(project1_data$Global_reactive_power))
project1_data$Voltage <- as.numeric(as.character(project1_data$Voltage))
project1_data$Global_intensity <- as.numeric(as.character(project1_data$Global_intensity))
project1_data$Sub_metering_1 <- as.numeric(as.character(project1_data$Sub_metering_1))
project1_data$Sub_metering_2 <- as.numeric(as.character(project1_data$Sub_metering_2))
project1_data$Sub_metering_3 <- as.numeric(as.character(project1_data$Sub_metering_3))

#subset the data for plots
analysis_data <- subset(project1_data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

#Plot fourth plot
analysis_data$my_date <- as.POSIXct(paste(analysis_data$Date, as.character(analysis_data$Time)), format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#Graph#1
with(analysis_data, plot(my_date,Global_active_power,type="l",xlab=" ",ylab="Global Active Power",cex.lab=0.8))

#Graph#2
with(analysis_data, plot(my_date,Voltage,type="l",xlab="datetime",ylab="Global Active Power",cex.lab=0.8))

#Graph#3
with(analysis_data, plot(my_date,Sub_metering_1, type = "l",col="black",xlab="", ylab="Energy sub metering"))
with(analysis_data, lines(my_date, Sub_metering_2,col="red"))
with(analysis_data, lines(my_date, Sub_metering_3,col="blue"))
legend("topright", col = c("black", "red","blue"), cex=1,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(0.5,0.5,0.5),bty="n")

#Graph#4
with(analysis_data, plot(my_date,Global_reactive_power,type="l",xlab="datetime",ylab="Global Active Power",cex.lab=0.8))

dev.off()
