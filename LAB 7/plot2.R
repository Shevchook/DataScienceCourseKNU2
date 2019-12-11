# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Task 2
# Чи зменшилися загальні викиди PM2.5 у місті Балтімор, штат Меріленд
# (fips == "24510") з 1999 по 2008 рік? Скористайтеся base plotting system.

Baltimore <- subset(NEI, fips == "24510")
SumBaltimore <- aggregate(Emissions ~ year, Baltimore, sum)
# рисунок
png(filename="./plot2.png", width=480, height=480)
barplot(SumBaltimore$Emissions, names.arg = SumBaltimore$year,
        xlab = "Year", ylab = "PM2.5 (in Tons)", ylim = c(0,3500),
        main = "Total PM2.5 Emission in Baltimore", col = "aquamarine2")
dev.off()

# ANSWER
# Так, за у 2008 порівняно з 1999 обсяг викидів зменшився