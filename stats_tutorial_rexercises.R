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

#exam question:
#Zwei Variablen lauten «Fertility» (Fertilitätsrate einer Gemeinde = Anzahl Geburten pro 1000 Frauen) 
#und «Agriculture» (Prozentualer Anteil in der Landwirtschaft beschäftigten Männer). Uns interessiert nun,
#wie stark der lineare Zusammenhang zwischen beiden Variablen ist.
head(swiss)
?cor
cor(swiss$Fertility, swiss$Agriculture)


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

#Boxplots: exam question
ggplot(swiss, aes(x=factor(f_agriculture), y=Fertility))+
  geom_boxplot(width=0.2)+
  scale_y_continuous(breaks = seq(40,90,10))

#Why factor(f_agriculture)?
class(swiss$f_agriculture)
is.numeric(swiss$f_agriculture)
head(swiss)

ggplot(swiss, aes(x=f_agriculture, y=Fertility))+
  geom_boxplot(width=0.2)+
  scale_y_continuous(breaks = seq(40,90,10))
