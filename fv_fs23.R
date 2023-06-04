#Loading used packages
library(tidyverse)


######## Slide 12 -----

mtcars |>
  group_by(cyl) |>
  tally(name = "absolute") |>
  ungroup() |>
  mutate(relative = absolute/sum(absolute),
         cumulative = cumsum(relative)) |>
  pivot_longer(cols = 2:4, 
               names_to = "type", 
               values_to = "value") |> #Get data in tidy format
  ggplot(aes(x= factor(cyl), y= value))+
  geom_col()+
  facet_wrap(~type, scales = "free_y")+
  labs(x= "cylinder", y="")

######## Slide 15 -----

ggplot(iris, aes(x= Sepal.Length))+
  geom_histogram(fill= "dodgerblue4")

######## Slide 20-----

median(c(30,44,45,50))

######## Slide 22-----

set.seed(123)
dist <- tibble(values=rnorm(100000))
ggplot(dist, aes(x=values))+
  geom_density()+
  geom_vline(xintercept = mean(dist$values), color= "dodgerblue4")+
  geom_vline(xintercept = median(dist$values), color= "darkred")+
  annotate("curve",
           x = -3, xend = 0,
           y = 0.35, yend = 0.25,
           curvature = 0.1,
           arrow= arrow(angle= 20))+
  annotate("text",
           x= -3, y= 0.36,
           label= "Median = arth. Mittel")+
  labs(y= "density")

set.seed(123)
dist2 <- tibble(values=sample(5000:6000, 50))
dist2[length(dist2$values)+1,1] <- 12000
dist2[length(dist2$values)+1,1] <- 12000
dist2[length(dist2$values)+1,1] <- 12000
ggplot(dist2, aes(x=values))+
  geom_density()+
  geom_vline(xintercept = mean(dist2$values), color= "dodgerblue4")+
  geom_vline(xintercept = median(dist2$values), color= "darkred")

######## Slide 25 -----

set.seed(123) #seed reproduces the same random numbers
tibble(values_1= rnorm(1000),
       values_2= rnorm(1000, sd=2),
       values_3= rnorm(1000, sd=3)) |>
  ggplot()+
  geom_vline(xintercept = 0, linetype= "dotted")+
  geom_density(aes(x= values_1), color= "dodgerblue4")+
  geom_density(aes(x= values_2), color= "darkred")+
  geom_density(aes(x= values_3), color= "orange")+
  labs(x="")

######## Slide 48 -----
set.seed(123)
samp10 <- sample(1:2, 10, replace = T)
samp100 <- sample(1:2, 100, replace = T)
samp1000 <- sample(1:2, 1000, replace = T)

mean(samp10)
mean(samp100)
mean(samp1000)


