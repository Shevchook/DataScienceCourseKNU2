# Task 0
# Підготовка даних
# Зчитування даних і заміна "?" на "NA"
consumption <- read.table(file = "./household_power_consumption.txt", header = TRUE,
                          sep = ";", na.strings = "?")

# Виокремлення даних за 2 дні
TwoDays <- subset(consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Створення нової змінної, зліпленої з двох
TwoDays$FullDate <- paste(TwoDays$Date, TwoDays$Time)

# Зміна з тексту на формат дати
TwoDays$FullDate <- strptime(TwoDays$FullDate, "%d/%m/%Y %H:%M:%S")
TwoDays$Date <- as.Date(TwoDays$Date, "%d/%m/%Y")


# Task 3

# Побудова лінійної діаграми з легендою
png(filename="./plot3.png", width=480, height=480)
plot(TwoDays$FullDate, TwoDays$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(TwoDays$FullDate, TwoDays$Sub_metering_2, type = "l", col = "red")
lines(TwoDays$FullDate, TwoDays$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.off()
