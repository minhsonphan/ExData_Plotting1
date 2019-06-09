library(data.table)

## Read file
file <- file.path(getwd(), "./Data/household_power_consumption.txt")
dt1 <- data.table(read.table(file,header=TRUE,sep=";",dec=".",na.strings = "?"))

## Paste Date and Time columns and convert it into DateTime format
dt1 <- dt1[, Date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Convert Golbal_active_power column into numeric
dt1 <- dt1[,Global_active_power := as.numeric(Global_active_power)]

## Filter Dates between 2007-02-01 and 2007-02-02
dt1 <- dt1[(Date_Time >= "2007-02-01") & (Date_Time < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
with(dt1,plot(x=Date_Time, y=Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
