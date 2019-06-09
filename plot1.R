library(data.table)

## Read file
file <- file.path(getwd(), "./Data/household_power_consumption.txt")
dt1 <- data.table(read.table(file,header=TRUE,sep=";",dec=".",na.strings = "?"))

## Convert Date column into date format
dt1 <- dt1[,Date:=as.Date(Date,format="%d/%m/%Y")]

## Convert Golbal_active_power column into numeric
dt1 <- dt1[,Global_active_power := as.numeric(Global_active_power)]

## Filter Dates between 2007-02-01 and 2007-02-02
dt1 <- dt1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Generates the plot1.png
hist(dt1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
