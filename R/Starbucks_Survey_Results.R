library(gtsummary)
library(tidyverse)
library(stringr)
library(formattable)

#Upload and name .csv file
data <- read.csv("C:\\Users\\jacob\\OneDrive\\Desktop\\Starbucks_Sentiment_Analysis\\archive\\Starbucks_satisfactory_survey1.csv")

#List of column names for creating tables
colnames(data)

#Number of customers returning to Starbucks despite the high price
Price_Table <- table(data$Price_Rating, data$Will_Continue_Patronage)

names(dimnames(Price_Table)) <- c("Price Rating", "Continuing Patronage")
Price_Table

#Gender table in comparison to continuing patronage
Gender_Table <- table(data$Gender,data$Will_Continue_Patronage)

names(dimnames(Gender_Table)) <- c("Gender", "Continuing Patronage")
formattable(Gender_Table)

#Age Table in comparison to continuing patronage
Age_Table <- table(data$Age,data$Will_Continue_Patronage)

names(dimnames(Age_Table)) <- c("Age", "Continuing Patronage")
formattable(Age_Table)

#Employment Status Table in comparison to continuing patronage
Employment_Table <- table(data$Employment_Status,data$Will_Continue_Patronage)

names(dimnames(Employment_Table)) <- c("Employment", "Continuing Patronage")
formattable(Employment_Table)

#Income Table in comparison to continuing patronage
Income_Table <- table(data$Income,data$Will_Continue_Patronage)

names(dimnames(Income_Table)) <- c("Income", "Continuing Patronage")
formattable(Income_Table)

#Frequency Visited Table in comparison to continuing patronage
Visited_Table <- table(data$Frequency_Visited,data$Will_Continue_Patronage)

names(dimnames(Visited_Table)) <- c("Visitation", "Continuing Patronage")
formattable(Visited_Table)

#Dine-in/Take-away Table in comparison to continuing patronage
Dine_Take_Table <- table(data$Dine_in.Take_away,data$Will_Continue_Patronage)

names(dimnames(Gender_Table)) <- c("Dine-in/Take-away", "Continuing Patronage")
formattable(Dine_Take_Table)

#Time Spent Table in comparison to continuing patronage
Time_Spent_Table <- table(data$Time_Spent,data$Will_Continue_Patronage)

names(dimnames(Time_Spent_Table)) <- c("Time Spent", "Continuing Patronage")
formattable(Time_Spent_Table)

#Nearest Location Table in comparison to continuing patronage
Location_Table <- table(data$Nearest_Location,data$Will_Continue_Patronage)

names(dimnames(Location_Table)) <- c("Location", "Continuing Patronage")
formattable(Location_Table)

#Membership Table in comparison to continuing patronage
Membership_Table <- table(data$Membership,data$Will_Continue_Patronage)

names(dimnames(Membership_Table)) <- c("Membership", "Continuing Patronage")
formattable(Membership_Table)

#Frequent Drink Purchased Table (Product Analysis)
Drink_Purchased <- cbind(table(str_trim(unlist(strsplit(str_trim(as.character(data$Frequent_Drink_Purchased)), ";")))))

names(dimnames(Drink_Purchased)) <- c("Items", "Number of Items Purchased")
formattable(Drink_Purchased)

#Money Spent Table
Money_Table <- table(data$Money_Spent,data$Will_Continue_Patronage)

names(dimnames(Money_Table)) <- c("Money Spent", "Continuing Patronage")
formattable(Money_Table)

#Notification of Promotions Table
Notification_Table <- cbind(table(str_trim(unlist(strsplit(str_trim(as.character(data$Notification_of_Promotions)), ";")))))

names(dimnames(Notification_Table)) <- c("Notification of Promotions", "Numbers Notified")
formattable(Notification_Table)
