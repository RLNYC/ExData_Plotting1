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

#Plot first hist graph
png(filename="plot1",width=480,height=480)
hist(analysis_data$Global_active_power,col="red", main="Global Active Power",xlab ="Global Active Power(Kilowatts)")
dev.off()