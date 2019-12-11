# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")



# Task 1
# Чи зменшилися загальні викиди PM2.5 у США з 1999 по 2008 рік? Використовуючи
# base plotting system, складіть графік, що показує загальні (total) викіди PM2.5
# з усіх джерел за кожний з 1999, 2002, 2005 та 2008 років.

# Calculate sums by year
SumByYear <- aggregate(Emissions ~ year, NEI, sum)

# 1-й варіант, стовпчиковий графік
barplot((SumByYear$Emissions)/1000000, names.arg = SumByYear$year, ylim = c(0,8),
        xlab = "Year", ylab = "PM2.5(in mln Tons)",
        main = "Total PM2.5 Emission from all sources", col = "lightsteelblue2")

# 2-й варіант, лінійний графік
plot(SumByYear$year, (SumByYear$Emissions)/1000000, type = "l", ylim = c(0,8), 
     lwd = 5, main = "Total PM2.5 Emission from all sources", xlab = "Year", 
     ylab = "PM2.5 (in mln Tons)", col = "blue")

# Завдання параметрів якості (кількості пікселів)
png(filename="./plot1.png", width=480, height=480)
# Побудова лінійного графіка
plot(SumByYear$year, (SumByYear$Emissions)/1000000, type = "l", ylim = c(0,8), 
     lwd = 5, main = "Total PM2.5 Emission from all sources", xlab = "Year", 
     ylab = "PM2.5 (in mln Tons)", col = "blue")
# Функція dev.off призначена, щоб наступний графік не записався на попередній
dev.off()

# ANSWER
# Так, за період 1999-2008 обсяг викидів зменшився