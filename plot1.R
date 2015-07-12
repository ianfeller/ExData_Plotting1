# Exploratory Data Analysis Assignment 1 Plot 1
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

##############################
#  Plot 1 - Histogram of     #
#  Global Active Power       #
#############################

#Set up PNG Device and Plot 1 File
png(filename = "plot1.png", width = 480, height=480,)

#Set Transparent Background
par(bg = "transparent")

#Plot Histogram 
hist(x = assignment_data$Global_active_power, main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)" ,  col = "RED")

#Close Device
dev.off()
