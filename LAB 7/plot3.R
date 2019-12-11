# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")



# Task 3
# З чотирьох типів джерел, позначених змінною type (point, non-point, onroad,
# or non-road), для якого з цих чотирьох джерел спостерігалось зменшення викидів
# у 1999–2008 роках для міста Балтімор? Для яких спостерігалося збільшення
# викидів у 1999–2008 роках? Скористайтеся системою ggplot2, для побудови
# графіків для відповіді на ці запитання.

# Loading libraries
library(ggplot2)
library(dplyr)

# Потрібен сабсет із попереднього завдання:
Baltimore <- subset(NEI, fips == "24510")

# Робимо group_by як у 5-й лаб. Це створює групувальні ознаки.
BaltimoreGrouped <- group_by(Baltimore, year, type)

# Що цей код значить взагалі? Яким чином я міг здогадатися його написати?
BaltimoreType <- ggplot(data = BaltimoreGrouped, aes(factor(year), # Чому рік це фактор?
                                                     Emissions, fill = type))
# Те саме: яким чином я міг здогадатися це все написати?
# Не зміг зробити по 80 знаків у рядку, бо R постійно сварився "invalid
# argument to unary operator" або "non-numeric argument to binary operator"
# рисунок
png(filename="./plot3.png", width=480, height=480)
SourceType <- BaltimoreType + geom_bar(stat = "identity") + theme_bw() + facet_grid(.~type) + guides(fill = F) + labs(x="year", y = expression("Total PM2.5 Emission (Tons)")) + labs(title = expression("PM2.5 Emissions, Baltimore 1999-2008 by Source Type"))
print(SourceType)
dev.off()

# ANSWER
# У 2008 порівняно з 1999 обсяг викидів зменшився від усіх джерел, крім точкових.