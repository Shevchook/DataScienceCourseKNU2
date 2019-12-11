# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Loading libraries
library(ggplot2)
library(dplyr)


# Task 6
# Порівняйте викиди від автомобільних джерел у місті Балтимор із аналогічними
# викидами в окрузі Лос-Анджелес, Каліфорнія (fips == "06037"). У якому місті
# відбулися значні зміни з часом у викидах від автомобільних джерел?

# Сабсет із двох міст
TwoCities <- subset(NEI, fips == "24510" | fips =="06037")
# шукаємо слово "vehicle" у змінній SCC.Level.Two
Vehicle1 <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
# не знаю, що це таке
VehicleSCC1 <- SCC[Vehicle1,]$SCC
# створюємо новий датафрейм
Vehicle2 <- TwoCities[TwoCities$SCC %in% VehicleSCC1,]
# заміняємо fips на назви міст
Vehicle2$fips[Vehicle2$fips == "06037"] <- "Los Angeles"
Vehicle2$fips[Vehicle2$fips == "24510"] <- "Baltimore"
# рисунок
png(filename="./plot6.png", width=480, height=480)
TwoCitiesChart <- ggplot(Vehicle2, aes(factor(year), Emissions, fill = year)) + geom_bar(stat = "identity") + facet_grid(.~fips) + theme_bw() + guides(fill=FALSE) + labs(x = "year", y = expression("Total PM2.5 Emission")) + labs(title = expression("PM2.5 Motor Vehicle Source Emissions in Baltimore & LA from 1999-2008"))
print(TwoCitiesChart)
dev.off()


# ANSWER
# В Лос-Анджелесі набагато більші викиди. Більші зміни відбулися в Балтиморі.
# На рис. 5 видно, що в Балтиморі викиди зменшилися десь утричі. Рис. 6 показує
# що в Лос-Анджелесі викиди трохи зросли.