## ----------------------------------------------------------------------------
## Course Project 1 for "Exploratory Data Analysis" to demonstrate ability to 
## making plots. 
## Output will be a PNG file with the name plot3.png.
## Assumption: 
##      "Individual household electric power consumption Data Set" downloaded 
##      and extracted to working directory.
## ----------------------------------------------------------------------------

## Make plot and output to PNG file
plot3 <- function() {
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
    png("plot3.png", width=480, height=480)
    with(dataset,plot(Time, Sub_metering_1, 
                      type="l", lwd=1, 
                      ylab="Energy Submetering", xlab=""))
    with(dataset,lines(Time, Sub_metering_2, type="l", lwd=1, col="red"))
    with(dataset,lines(Time, Sub_metering_3, type="l", lwd=1, col="blue"))
    #annotate legend
    legend("topright", lty=1, lwd=1, 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black", "red", "blue"))
    dev.off()
}