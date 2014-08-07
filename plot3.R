# read data file
df = read.table("household_power_consumption.txt", sep=";", head=T, stringsAsFactors=F)

# get the wanted subset of data
data = subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# reindexing data
rownames(data)=1:nrow(data)

# defines png output
png("plot3.png", width=480, height=480)

# drawing plot
x <- c(1:nrow(data))
plot(x, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering", axes=F)

# drawing data
lines(data$Sub_metering_2, type="l", col="red")
lines(data$Sub_metering_3, type="l", col="blue")

# drawing axis
axis(side=1, at=c(0,nrow(data)/2, nrow(data)), labels=c("Thu","Fri","Sat"))
axis(2)

# drawing legend
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8)

# drawing box
box(which="plot", lty="solid")

# save to plot3.png
dev.off()
