# Task 0
# Reading the data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Loading libraries
library(ggplot2)
library(dplyr)


# Task 4
# Як змінилися викиди від джерел спалювання вугілля (coal combustion-related
# sources) у 1999–2008 роках в США?

# шукаємо співпадання частини фрази "comb" у змінній SCC.Level.One
Combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
# шукаємо співпадання частини фрази "coal" у змінній SCC.Level.Four
Coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
# складаємо їх докупи.
CoalCombustion <- (Combustion & Coal) # Чому "&", а не "|"
# що це таке взагалі? і що таке "large factor"???
CC_SCC <- SCC[CoalCombustion,]$SCC
# створюємо новий датафрейм
CC_NEI <- NEI[NEI$SCC %in% CC_SCC,]

# рисунок
png(filename="./plot4.png", width=480, height=480)
CC <- ggplot(CC_NEI, aes(factor(year), Emissions/1000)) + geom_bar(stat = "identity", fill = "darkcyan", width = 0.5) + theme_bw() + guides(fill = FALSE) + labs(x = "year", y = expression("Total PM2.5 Emission (Thousand Tons)")) + labs(title = expression("PM2.5 Coal Combustion Source Emissions Across US 1999-2008"))
print(CC)
dev.off()

# ANSWER
# У 2008 порівняно з 1999 обсяг викидів від джерел спалювання вугілля зменшився.