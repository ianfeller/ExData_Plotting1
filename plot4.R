# Exploratory Data Analysis Assignment 1 Plot 4
# JHU Data Science Specialization 
# Created:  7/11/15
# Updated:  7/12/15

# Set Working directory
setwd("../Desktop")

#create Directory if doesn't exist
if (!file.exists("EDA_Assignment1")) {
    dir.create("EDA_Assignment1")
}

#Set Directory to EDA Project 1 Assignment Folder
setwd("../Desktop/EDA_Assignment1")

#Read in Data to Determine Column Names
data_names<- read.table("./household_power_consumption.txt",header=TRUE, sep=";", nrows=1)
data_names<-names(data_names)

#Read In Data - Only Dates 2007-02-01 and 2007-02-02
assignment_data<- read.table("./EDA_Assignment1/household_power_consumption.txt",
                             sep=";",skip=66637, nrows=2880)

##############################
#  Load and Clean Data       #
#                            #
#############################

#Add column Names and View Data
names(assignment_data)<-data_names

#Edit Date Variables into useable format
assignment_data$Date<-as.Date(assignment_data$Date,format = "%d/%m/%Y")

#Create Date/Time Variable
assignment_data$Date_Time<- paste(assignment_data$Date, assignment_data$Time, sep=" ")
assignment_data$Date_Time<-strptime(assignment_data$Date_Time,format ="%Y-%m-%d %X")

#############################
#  Plot 4 - Combined four   #
#  plots in the same graph  #
#  Includings plots 2 & 3   #
#############################

#Set up PNG Device and Plot 4 File
png(filename = "plot4.png", width = 480, height=480,)

#Set a Transparent Plot with Two Rows and Two Columns
par(bg="transparent", mfcol = c(2, 2))

#Plot 1 (Originally Plot 2)
plot(assignment_data$Date_Time,assignment_data$Global_active_power,type="l",
     xlab = "", ylab = "Global Active Power")

#Plot 2 (Originally Plot 3)
plot(assignment_data$Date_Time,assignment_data$Sub_metering_1,type="l",
     xlab = "", ylab = "Energy sub metering", col="black")
lines(assignment_data$Date_Time,assignment_data$Sub_metering_2, col="red")
lines(assignment_data$Date_Time,assignment_data$Sub_metering_3, col="blue")
legend("topright", bty="n", col = c("black", "red", "blue"),lwd=1, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 3 (Line Plot of Voltage Across Time)
plot(assignment_data$Date_Time,assignment_data$Voltage,type="l",
     xlab = "datetime", ylab = "Voltage", col="black")

#Plot 3 (Line Plot of Global Reactive Power Across Time)
plot(assignment_data$Date_Time,assignment_data$Global_reactive_power,type="l",
     xlab = "datetime", ylab = "Global_reactive_power", col="black")

#Close Device
dev.off()
