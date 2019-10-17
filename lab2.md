# LAB 1
```{r}
Installing packages for R 3.6.1
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install()
install.packages("h5")
library(rhdf5)
created = h5createFile("example.h5")
created
```

## Task1
```{r}
# Завантажте файл з даними:
download.file(url = "https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5",
              destfile = "D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5")
```

## Task2
```{r}
# Встановить в R пакет для роботи з HDF5 файлами
install.packages("BiocManager")
BiocManager::install("rhdf5")
library("rhdf5")
```

## Task 3
```{r}
# Виведіть зміст файлу командою h5ls()
h5ls ("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", recursive = TRUE,
        all = FALSE, 
        datasetinfo = TRUE,
        index_type = h5default("H5_INDEX"),
        order = h5default("H5_ITER"))

ANSWER:        
                 group            name       otype  dclass      dim
0                    /            meta   H5I_GROUP                 
1                /meta     Description H5I_DATASET  STRING    ( 0 )
2                /meta  DescriptionURL H5I_DATASET  STRING    ( 0 )
3                /meta        Detector H5I_DATASET  STRING    ( 0 )
4                /meta        Duration H5I_DATASET INTEGER    ( 0 )
5                /meta        GPSstart H5I_DATASET INTEGER    ( 0 )
6                /meta     Observatory H5I_DATASET  STRING    ( 0 )
7                /meta            Type H5I_DATASET  STRING    ( 0 )
8                /meta        UTCstart H5I_DATASET  STRING    ( 0 )
9                    /         quality   H5I_GROUP                 
10            /quality          detail   H5I_GROUP                 
11            /quality      injections   H5I_GROUP                 
12 /quality/injections InjDescriptions H5I_DATASET  STRING        5
13 /quality/injections   InjShortnames H5I_DATASET  STRING        5
14 /quality/injections         Injmask H5I_DATASET INTEGER     4096
15            /quality          simple   H5I_GROUP                 
16     /quality/simple  DQDescriptions H5I_DATASET  STRING        7
17     /quality/simple    DQShortnames H5I_DATASET  STRING        7
18     /quality/simple          DQmask H5I_DATASET INTEGER     4096
19                   /          strain   H5I_GROUP                 
20             /strain          Strain H5I_DATASET   FLOAT 16777216
```

## Task 4
```{r}
# Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain в
# змінну strain. Після зчитування файл закривати не треба. Лише після відкривання.
# Якщо відкрити файл file <- h5file("file_name"), то закривати файл командою H5Close()

strain <- h5read("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5","strain")
```

## Task 5
```{r}
# з «strain/Strain» зчитайте атрибут (функція h5readAttributes) Xspacing
# в змінну st та виведіть її. Це інтервал часу між вимірами.

ANSWER:
st <- h5readAttributes("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "strain/Strain")$Xspacing
> st
[1] 0.0002441406
```


## Task 6
```{r}
# Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте
# в змінну gpsStart name GPSstart та в змінну duration name Duration.

gpsStart <- h5read("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", 
                       "meta/GPSstart")
duration <- h5read("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", 
                             "meta/Duration")

ANSWER:
> gpsStart
[1] 1187006834

> duration
[1] 4096
```


## Task 7
```{r}
# Знайдіть час закінчення події та збережіть його в змінну gpsEnd

gpsEnd <- gpsStart + duration

ANSWER:
> gpsEnd
[1] 1187010930
```


## Task 8
```{r}
# Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок
# послідовності – gpsStart, кінець – gpsEnd, крок – st

myTime <- seq(gpsStart, gpsEnd, st)
```

## Task 9
```{r}
# Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть
# змінну numSamples, яка дорівнює 1000000

numSamples <- 1000000
```


## Task 10
```{r}
# Побудуйте графік за допомогою функції plot(myTime[0:numSamples],
# strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")

plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")

ANSWER:
Error in xy.coords(x, y, xlabel, ylabel, log) : 
  (list) object cannot be coerced to type 'double'
```