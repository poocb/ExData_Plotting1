## ----------------------------------------------------------------------------
## Course Project 1 for "Exploratory Data Analysis" to demonstrate ability to 
## making plots. 
## Output will be a PNG file with the name plot1.png.
## Assumption: 
##      "Individual household electric power consumption Data Set" downloaded 
##      and extracted to working directory.
## ----------------------------------------------------------------------------

## Make plot and output to PNG file
plot1 <- function() {
    ## load data.table for fread
    library(data.table)
    ## read the input files;using fread for greater performance
    dataset <- fread("household_power_consumption.txt",header=T,na.strings="?")

    ##convert to date variable
    dataset$Date <- as.Date(dataset$Date,"%d/%m/%Y")
    ##subset first for performance consideration
    dataset <- subset(dataset,Date == as.Date("2007-02-01") | 
                              Date == as.Date("2007-02-02"))
    ##convert to time variable using suggested strptime in the instruction
    dataset[[2]] <- strptime(paste(dataset$Date, dataset$Time), 
                             "%Y-%m-%d %H:%M:%S")
    
    ##start to plot
    png("plot1.png", width=480, height=480)
    hist(dataset$Global_active_power, col="red", main="Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    dev.off()
}