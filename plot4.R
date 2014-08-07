# read data file
df = read.table("household_power_consumption.txt", sep=";", head=T, stringsAsFactors=F)

# get the wanted subset of data
data = subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# reindexing data
rownames(data)=1:nrow(data)

# defines png output
#png("plot3.png", width=480, height=480)

# defines x field
x <- c(1:nrow(data))


# defines png output
png("plot4.png", width=480, height=480)

# defines par(mfrow)
par(mfrow=c(2,2))



################ drawing plot 1 ####################
plot(x, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", axes=F)
# drawing box
box(which="plot", lty="solid")
# drawing axis
axis(side=1, at=c(0,nrow(data)/2, nrow(data)), labels=c("Thu","Fri","Sat"))
axis(2)




################ drawing plot 2 ####################
plot(x, data$Voltage, type="l", xlab="datetime", ylab="Voltage", axes=F)
box(which="plot", lty="solid")
# drawing axis
axis(side=1, at=c(0,nrow(data)/2, nrow(data)), labels=c("Thu","Fri","Sat"))
axis(2)



################# drawing plot 3 ###################
plot(x, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering", axes=F)

# drawing data
lines(data$Sub_metering_2, type="l", col="red")
lines(data$Sub_metering_3, type="l", col="blue")

# drawing axis
axis(side=1, at=c(0,nrow(data)/2, nrow(data)), labels=c("Thu","Fri","Sat"))
axis(2)

# drawing legend
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty="n")

# drawing box
box(which="plot", lty="solid")




################# drawing plot 4 #####################
plot(x, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", axes=F)
box(which="plot", lty="solid")
# drawing axis
axis(side=1, at=c(0,nrow(data)/2, nrow(data)), labels=c("Thu","Fri","Sat"))
axis(2)


# save to plot4.png
dev.off()
