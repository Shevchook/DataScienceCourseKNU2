# LAB 3

```{r}
# Необхідні пакети
install.packages("xml2")
install.packages("rvest")
library("rvest")
library("xml2")
library("XML")
```

```{r}
# Зчитування даних
movies <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")
```

```{r}
# Створення векторів із html файлів
mv1 <- html_nodes(movies, ".text-primary")          # порядковий номер фільму
mv2 <- html_nodes(movies, ".lister-item-header a")  # назва фільму
mv3 <- html_nodes(movies, ".text-muted .runtime")   # тривалість фільму
```

```{r}
# Перетворення листа mv1 в числовий вектор
m1 <- as.numeric(html_text(mv1))
```

```{r}
# Забрати текст (назви фільмів) з html node
m2 <- html_text( mv2 )
```

```{r}
# Взяти текст із html node, викинути з нього частину " min" і перетворити на число
runtime <- as.numeric(gsub(" min","",         # видалення " min"
                           html_text( mv3 )   # взяти цифри у вигляді тексту з html node
))
```

```{r}
# Видалення першої назви фільму, оскільки у першого фільму немає тривалості
title <- m2[-1]
# Видалення останнього порядкового номера, щоб довжина векторів співпадала
mnumber <- m1[-100]
```

```{r}
# Створення датафрейму. Якщо R не сказати FALSE, то він любить примусово робити
# з тексту фактори
movies2017 <- data.frame(mnumber, title, runtime, stringsAsFactors = FALSE)
```


## Task 1
```{r}
# Виведіть перші 6 назв фільмів дата фрейму
head(movies2017$title)

ANSWER
> head(movies2017$title)
[1] "Воно"                                    "Зорянi вiйни: Епiзод 8 - Останнi Джедаi"
[3] "Пастка"                                  "Той, хто бiжить по лезу 2049"           
[5] "Диво-Жiнка"                              "Call Me by Your Name"       
```

## Task 2
```{r}
# Виведіть всі назви фільмів с тривалістю більше 120 хв.
movies2017$title[movies2017$runtime>120]

ANSWER
> movies2017$title[movies2017$runtime>120]
 [1] "Воно"                                     "Зорянi вiйни: Епiзод 8 - Останнi Джедаi" 
 [3] "Той, хто бiжить по лезу 2049"             "Диво-Жiнка"                              
 [5] "Call Me by Your Name"                     "Тор: Рагнарок"                           
 [7] "Людина-павук: Повернення додому"          "Мати!"                                   
 [9] "Джон Уiк 2"                               "Форма води"                              
[11] "Пiрати Карибського моря: Помста Салазара" "Король Артур: Легенда меча"              
[13] "Логан: Росомаха"                          "Темнi часи"                              
[15] "Чужий: Заповiт"                           "Гра Моллi"                               
[17] "Красуня i Чудовисько"                     "Вартовi Галактики 2"                     
[19] "Kingsman: Золоте кiльце"                  "Валерiан i мiсто тисячi планет"          
[21] "Форсаж 8"                                 "Вбивство священного оленя"               
[23] "Вороги"                                   "Трансформери: Останнiй лицар"            
[25] "Примарна нитка"                           "Saban's Могутнi рейнджери"               
[27] "1+1: Нова iсторiя"                        "Only the Brave"                          
[29] "Метелик"                                  "Зменшення"                               
[31] "Brawl in Cell Block 99"                   "Усi грошi свiту"                         
[33] "Вiйна за планету мавп"                    "War Machine"                             
[35] "Сiм сестер"                               "The Glass Castle"                        
[37] "Пострiл в безодню"                       
```

## Task 3
```{r}
# Скільки фільмів мають тривалість менше 100 хв.
length(movies2017$title[movies2017$runtime<100])

ANSWER
> length(movies2017$title[movies2017$runtime<100])
[1] 17
```