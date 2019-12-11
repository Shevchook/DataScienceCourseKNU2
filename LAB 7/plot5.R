# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Loading libraries
library(ggplot2)
library(dplyr)


# Task 5
# Як змінилися викиди від автомобільних джерел (motor vehicle sources)
# у 1999–2008 роках у місті Балтимор?

# той самий сабсет із Task2
Baltimore <- subset(NEI, fips == "24510")
# шукаємо слово "vehicle" у змінній SCC.Level.Two
Vehicle <- grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
# не знаю, що це таке
VehicleSCC <- SCC[Vehicle,]$SCC
# створюємо новий датафрейм
VehicleBaltimore <- Baltimore[Baltimore$SCC %in% VehicleSCC,]
# рисунок
png(filename="./plot5.png", width=480, height=480)
VehicleChart <- ggplot(VehicleBaltimore, aes(factor(year), Emissions)) + geom_bar(stat = "identity", fill = "seagreen3", width = 0.5) + theme_bw() + guides(fill = FALSE) + labs(x = "year", y = expression("Total PM2.5 Emission (Tons)")) + labs(title = expression("PM2.5 Motor Vehicle Source Emissions in Baltimore 1999-2008"))
print(VehicleChart)
dev.off()

# ANSWER
# За період 1999-2008 порівняно з 1999 обсяг викидів від автомобільних джерел у
# Балтиморі зменшився.