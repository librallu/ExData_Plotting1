# read data file
df = read.table("household_power_consumption.txt", sep=";", head=T, stringsAsFactors=F)

# get the wanted subset of data
data = subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# reindexing data
rownames(data)=1:nrow(data)

# suppress levels in date
data$Date = levels(data$Date)[data$Date]

# get numeric values for Global_active_power field and suppress levels
data$Global_active_power = as.numeric(data$Global_active_power)

# defines png output
png("plot2.png", width=480, height=480)

# trace plot
x <- c(1:nrow(data))
plot(x, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", axes=F)
axis(side=1, at=c(0,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"))
axis(side=2)
box(which="plot", lty="solid")

# save to plot2.png
dev.off()
