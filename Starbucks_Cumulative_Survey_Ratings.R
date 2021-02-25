#Unpack Packages
library(tidyr)
library(magrittr)
library(dplyr)
library(tidyverse)
library(ggplot2)

#Upload and name .csv file
data <- read.csv("C:\\Users\\jacob\\OneDrive\\Desktop\\Starbucks_Sentiment_Analysis\\archive\\Starbucks_satisfactory_survey1.csv")

#Check column names
colnames(data)

#Check if data needed to be cleaned
glimpse(data)

#Since data looked good, I did not need to replace or change any cells, columns, or rows

#Select data with ratings 1-5
ratings <- select(data, 13:19)

#Check to see if correct columns were selected
colnames(ratings)

#Gathered and counted each column for each rating type in order to make a bar plot
ratings %>%
  + gather(Var, Val) %>%
  + count(Var, Val) %>%
  + ggplot(aes(Var, n)) + geom_col(aes(fill = Val))

#Named bar plot
Ratings_Plot <- ratings %>%
  + gather(Var, Val) %>%
  + count(Var, Val) %>%
  + ggplot(aes(Var, n)) + geom_col(aes(fill = Val))

#Changed the headers and added a title for the bar plot
print(Ratings_Plot + labs(title = "Starbucks Cumulative Survey Ratings", y = "Ratings (1-5)", x = "Survey Question") + theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold")))
