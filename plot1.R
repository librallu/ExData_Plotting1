

# read data file
df = read.table("household_power_consumption.txt", sep=";", head=T, stringsAsFactors=F)

# get the wanted subset of data
data = subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# convert dates
#data$Date = as.Date(data$Date, "%d/%m/%Y")

# get numeric values for Global_active_power field
data$Global_active_power = as.numeric(data$Global_active_power)

# defines png output
png("plot1.png", width=480, height=480)

# trace historgram
hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# save to plot1.png
dev.off()
