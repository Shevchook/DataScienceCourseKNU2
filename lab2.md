# LAB 1
install.packages("h5")
library("rhdf5", lib.loc="~/R/win-library/3.6")
library("Rhdf5lib", lib.loc="~/R/win-library/3.6")

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
# змінну strain. Після зчитування не забувайте закривати файл командою H5Close()
strain <- h5read("D:/R/R2/LAB2/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5","strain")
```