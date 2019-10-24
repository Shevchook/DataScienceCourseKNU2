# Lab 4

# Required packages
```{r}
install.packages("DBI")
install.packages("RSQLite")
```

# Task 1
```{r}
# Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки
# статті с типом виступу Spotlight. Сортування по назві статті.
res1 <- dbSendQuery(conn, "SELECT Title, EventType FROM Papers WHERE EventType='Spotlight' ORDER BY Title")
task1 <- dbFetch(res1, n=10)

ANSWER:
> task1
                                                                                          Title EventType
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding Spotlight
2                                    Accelerated Mirror Descent in Continuous and Discrete Time Spotlight
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games Spotlight
4                                                                      Adaptive Online Learning Spotlight
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization Spotlight
6                                                 Attention-Based Models for Speech Recognition Spotlight
7                                                       Automatic Variational Inference in Stan Spotlight
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing Spotlight
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff Spotlight
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception Spotlight
```

# Task 2
```{r}
# Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви
# статей для автора «Josh Tenenbaum». Сортування по назві статті.
res2 <- dbSendQuery(conn, "SELECT Papers.Title, Authors.Name
                    FROM Papers JOIN PaperAuthors ON Papers.Id = PaperAuthors.PaperId
                    JOIN Authors ON Authors.Id = PaperAuthors.AuthorId
                    WHERE Name = 'Josh Tenenbaum' ORDER BY Title")
task2 <- dbFetch(res2)

ANSWER:
> task2
                                                                                              Title
1                                                       Deep Convolutional Inverse Graphics Network
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3                                                Softstar: Heuristic-Guided Probabilistic Inference
4                                                        Unsupervised Learning by Program Synthesis
            Name
1 Josh Tenenbaum
2 Josh Tenenbaum
3 Josh Tenenbaum
4 Josh Tenenbaum
```

# Task 3
```{r}
# Вибрати всі назви статей (Title), в яких є слово «statistical».
# Сортування по назві статті.
res3 <- dbSendQuery(conn, "SELECT Title FROM Papers WHERE Title 
                    LIKE '%statistical%' ORDER BY Title")
task3 <- dbFetch(res3)

ANSWER:
> task3
                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective
```

# Task 4
```{r}
# Ім’я автору (Name), кількість статей по кожному автору (NumPapers).
# Сортування по кількості статей від більшої кількості до меньшої.
res4 <- dbSendQuery(conn, "SELECT Authors.Name, 
                    COUNT (PaperAuthors.AuthorId) AS PaperNum
                    FROM Authors JOIN PaperAuthors 
                    ON Authors.Id = PaperAuthors.AuthorId
                    GROUP BY Authors.Id
                    ORDER BY PaperNum DESC")
task4 <- dbFetch(res4, n=15) # я обмежив 15 записів, бо там їх кілька сотень

ANSWER:
> task4
                      Name PaperNum
1            Ryan P. Adams        4
2             Prateek Jain        4
3           Josh Tenenbaum        4
4        Michael I. Jordan        4
5         Csaba Szepesvari        4
6             Zhaoran Wang        4
7     Simon Lacoste-Julien        4
8           Christopher Re        4
9               Yann LeCun        3
10              Tong Zhang        3
11        Antonio Torralba        3
12           Matthias Hein        3
13 Ruslan R. Salakhutdinov        3
14            Ambuj Tewari        3
15              Elad Hazan        3
```
