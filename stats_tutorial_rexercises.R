#read in examn data
library(haven)
swiss <- read_dta("swiss_rec.dta")
head(swiss)

#tables
table <- table(swiss$f_fertility, swiss$f_agriculture)
table
prop.table(table) #relative frequency
margin.table(table, 1) #row sum
margin.table(table, 2) #column sum

#measures
cov(swiss$Fertility, swiss$Agriculture)
var(swiss$Fertility)
sd(swiss$Fertility)

#plots
library(tidyverse)

#Scatterplot
ggplot(swiss, aes(Fertility, Agriculture))+
  geom_point()

#Scatterplot + Regression line
ggplot(swiss, aes(x=Fertility, y=Agriculture))+
  geom_point()+
  geom_smooth(method = "lm")

#Boxplot
ggplot(swiss, aes(x="", y=Fertility))+
  geom_boxplot(width=0.2)+
  scale_y_continuous(breaks = seq(40,90,10))
