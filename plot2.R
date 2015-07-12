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

#Plot second plot
png(filename="plot2.png",width=480,height=480)
analysis_data$my_date <- as.POSIXct(paste(analysis_data$Date, as.character(analysis_data$Time)), format="%Y-%m-%d %H:%M:%S")
plot(analysis_data$my_date,analysis_data$Global_active_power,type="l",xlab=" ",ylab="Global Active Power(Kilowatts)")
dev.off()