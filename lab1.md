# LAB 1


## Task 1
```{r}
# За допомогою download.file() завантажте любий excel файл з порталу
# http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому
# встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

# Завантаження файлу:
download.file(url = "https://data.gov.ua/dataset/c445c6ea-f0c3-4167-abb1-5afb4a0e5499/resource/d55eebcf-4660-4919-96b3-4894be5a6cda/download/nuclear_safety_q2_2019.xlsx",
              destfile = "D:/R/R2/LAB1/nuclear_safety_q2_2019.xlsx", mode="wb")

# Створення датафрейму:
NuclearSafety <- read_excel("D:/R/R2/LAB1/nuclear_safety_q2_2019.xlsx",
                            sheet = 1, col_names = TRUE, col_types = NULL,
                            na = "", skip = 0)

# Виведіть перші 6 строк отриманого фрейму даних.
head(NuclearSafety)


ANSWER
# A tibble: 6 x 16
   year quarter station   irg irg_index `iodine_ radion~ `iodine_ radion~ stable_radionuc~
  <dbl>   <dbl> <chr>   <dbl>     <dbl>            <dbl> <chr>                       <dbl>
1  2018       1 ЗАЕС       89      0.13            260   <0,01                       650  
2  2018       1 РАЕС      105      0.16            147   <0,01                       269  
3  2018       1 ЮУАЕС      45      0.1              76   <0,01                       116  
4  2018       1 ХАЕС       31      0.07             26.8 <0,01                        37.5
5  2018       2 ЗАЕС       84      0.12            262   <0,01                       640  
6  2018       2 РАЕС      113      0.17             73   <0,01                       231  
# ... with 8 more variables: `stable_ radionuclides_index` <chr>, cs_137_emission <dbl>,
#   `co_60_ emission` <dbl>, cs_137_dump <dbl>, co_60_dump <dbl>, volume <dbl>,
#   index_radioactive_releas <dbl>, index_dump <chr>
```


## Task 2
```{r}
# За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за
# посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# та завантажте дані в R. Необхідно знайти, скільки property мають value $1000000+

# Завантаження файлу:
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "D:/R/R2/LAB1/getdata_data_ss06hid.csv", mode="wb")

# Створення датафрейму:
GetData <- read.csv("D:/R/R2/LAB1/getdata_data_ss06hid.csv", header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "")

# скільки property мають value $1000000+
sum(GetData$VAL==24, na.rm=TRUE)


ANSWER
[1] 53
```


## Task 3
```{r}
# Зчитайте xml файл за посиланням
# http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# Скільки ресторанів мають zipcode 21231?

download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              "D:/R/R2/LAB1/getdata_data_restaurants.xml", method = "auto",
              quiet=FALSE, mode="wb")

# Parse the XML file and get the root node:
RestaurantsData <- xmlParse(file = "D:/R/R2/LAB1/getdata_data_restaurants.xml")
rootNode <- xmlRoot(RestaurantsData)

# Extract XML data:
data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue))

# Convert the extracted data into a data frame:
RestaurantsZip <- data.frame(t(data),row.names=NULL)


THERE IS NO ANSWER :-(
```