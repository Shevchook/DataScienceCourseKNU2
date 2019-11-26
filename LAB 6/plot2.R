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


# Task 2

# Побудова лінійної діаграми
png(filename="./plot2.png", width=480, height=480)
plot(TwoDays$FullDate, TwoDays$Global_active_power, type = "l", xlab = "",  
     ylab = "Global Active Power (kilowatts)")
dev.off()
