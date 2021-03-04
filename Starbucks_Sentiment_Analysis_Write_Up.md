Starbucks Sentiment Analysis Write Up
================
Edmond Jacob
3/3/2021

# Starbucks Sentiment Analysis

## Rating Analysis

![](https://user-images.githubusercontent.com/78123049/109853876-3e801d00-7c0b-11eb-90ce-b9250bb694f8.png)

When looking at the ratings across all survey questions, it showed that
price ratings had far more 1 and 2 ratings in comparison to any other
survey question. This might suggest that price had the most impact on
whether or not a customer would comeback to Starbucks.

``` r
library(tidyverse)
library(stringr)
library(formattable)

data <- read.csv("C:\\Users\\jacob\\OneDrive\\Desktop\\Starbucks_Sentiment_Analysis\\archive\\Starbucks_satisfactory_survey1.csv")

#Number of customers returning to Starbucks in relation to price
Price_Table <- table(data$Price_Rating, data$Will_Continue_Patronage)

names(dimnames(Price_Table)) <- c("Price Rating", "Continuing Patronage")
formattable(Price_Table)
```

    ##             Continuing Patronage
    ## Price Rating No Yes
    ##            1  8  6 
    ##            2 13 14 
    ##            3  6 42 
    ##            4  1 23 
    ##            5  0  9

By looking at the table, it seems that about half of people who had
rated the price at a 2 or lower, did not return to Starbucks. This would
suggest that about half the people who feel that Starbucks is pricey,
might not return. What about gender, age, and employment?

``` r
#Gender table in comparison to continuing patronage
Gender_Table <- table(data$Gender,data$Will_Continue_Patronage)

names(dimnames(Gender_Table)) <- c("Gender", "Continuing Patronage")
formattable(Gender_Table)
```

    ##         Continuing Patronage
    ## Gender   No Yes
    ##   Female 15 50 
    ##   Male   13 44

``` r
#Age Table in comparison to continuing patronage
Age_Table <- table(data$Age,data$Will_Continue_Patronage)

names(dimnames(Age_Table)) <- c("Age", "Continuing Patronage")
formattable(Age_Table)
```

    ##                Continuing Patronage
    ## Age             No Yes
    ##   40 and above   1  6 
    ##   Below 20       3 10 
    ##   From 20 to 29 22 63 
    ##   From 30 to 39  2 15

``` r
#Employment Status Table in comparison to continuing patronage
Employment_Table <- table(data$Employment_Status,data$Will_Continue_Patronage)

names(dimnames(Employment_Table)) <- c("Employment", "Continuing Patronage")
formattable(Employment_Table)
```

    ##                Continuing Patronage
    ## Employment      No Yes
    ##   Employed      12 49 
    ##   Housewife      0  2 
    ##   Self-employed  2 15 
    ##   Student       14 28

``` r
#Income Table in comparison to continuing patronage
Income_Table <- table(data$Income,data$Will_Continue_Patronage)

names(dimnames(Income_Table)) <- c("Income", "Continuing Patronage")
formattable(Income_Table)
```

    ##                        Continuing Patronage
    ## Income                  No Yes
    ##   Less than RM25,000    18 53 
    ##   More than RM150,000    2  4 
    ##   RM100,000 - RM150,000  1  2 
    ##   RM25,000 - RM50,000    5 20 
    ##   RM50,000 - RM100,000   2 15

The gender table provides now information since the ratio of males and
females who will or will not continue patronage at Starbucks is roughly
the same.

However, it seems that many more people between the ages of 20 to 29
frequent Starbucks in comparison to any other age group. The ratio of
those who will or will not continue patronage at Starbucks between the
Below 20 and From 20 to 29 age group is very similar. Age may not play
vital role in the continuation of patronage for Starbucks.

The employment status shows that a third of students will not continue
purchasing goods at Starbucks. This is logical since students have very
little money to spare due to costs and foregone wages of attending
school.

The income has the currency displayed in Malaysian Ringgit(RM). When
looking at the income levels of who would not continue patronage, it is
in the Less than RM25,000. This would make sense if the most customers
had not come from the lowest income level surveyed. Income might play
less of a role than previously thought in the return of customers.

What about the experience of going to Starbucks?

``` r
#Frequency Visited Table in comparison to continuing patronage
Visited_Table <- table(data$Frequency_Visited,data$Will_Continue_Patronage)

names(dimnames(Visited_Table)) <- c("Visitation", "Continuing Patronage")
formattable(Visited_Table)
```

    ##           Continuing Patronage
    ## Visitation No Yes
    ##    Daily    0  2 
    ##    Monthly  1 25 
    ##    Never    5  4 
    ##    Rarely  22 54 
    ##    Weekly   0  9

``` r
#Dine-in/Take-away Table in comparison to continuing patronage
Dine_Take_Table <- table(data$Dine_in.Take_away,data$Will_Continue_Patronage)

names(dimnames(Gender_Table)) <- c("Dine-in/Take-away", "Continuing Patronage")
formattable(Dine_Take_Table)
```

    ##                     
    ##                      No Yes
    ##   Dine in            12 34 
    ##   Drive-thru          3 17 
    ##   I dont like coffee  0  1 
    ##   Never               4  2 
    ##   Take away           9 40

``` r
#Time Spent Table in comparison to continuing patronage
Time_Spent_Table <- table(data$Time_Spent,data$Will_Continue_Patronage)

names(dimnames(Time_Spent_Table)) <- c("Time Spent", "Continuing Patronage")
formattable(Time_Spent_Table)
```

    ##                               Continuing Patronage
    ## Time Spent                     No Yes
    ##   Below 30 minutes             17 56 
    ##   Between 1 hour to 2 hours     1 11 
    ##   Between 2 hours to 3 hours    0  1 
    ##   Between 30 minutes to 1 hour  8 26 
    ##   More than 3 hours             2  0

``` r
#Nearest Location Table in comparison to continuing patronage
Location_Table <- table(data$Nearest_Location,data$Will_Continue_Patronage)

names(dimnames(Location_Table)) <- c("Location", "Continuing Patronage")
formattable(Location_Table)
```

    ##                Continuing Patronage
    ## Location        No Yes
    ##   1km - 3km      6 28 
    ##   more than 3km 17 44 
    ##   within 1km     5 22

When looking at the visitation record for patrons, most visit rarely and
thus have more people who will not comeback. What issues may have
occurred during their visitation that would not promote future
visitations?

The most people who will not continue patronage are from the dine in
section. The data could suggest that a negative experience could have
found themselves not returning but it could also be the price. However,
the most important aspect of this data is that most people preferred
take away.

Most people spent less than 30 minutes at Starbucks yet a few still
decide to not continue patronage. This could be caused by other factors.
A majority of people spend less than 30 minutes.

Most people who frequent this Starbucks live more than 3km away. A
significant number would not return. It is hard to determine whether it
is due to the location.

``` r
#Membership Table in comparison to continuing patronage
Membership_Table <- table(data$Membership,data$Will_Continue_Patronage)

names(dimnames(Membership_Table)) <- c("Membership", "Continuing Patronage")
formattable(Membership_Table)
```

    ##           Continuing Patronage
    ## Membership No Yes
    ##        No  23 39 
    ##        Yes  5 55

Membership may suggest that those with a membership are more likely to
return to Starbucks than those without a membership. The data is very
strong in this relationship, however, it might contribute to them not
returning.

``` r
#Money Spent Table
Money_Table <- table(data$Money_Spent,data$Will_Continue_Patronage)

names(dimnames(Money_Table)) <- c("Money Spent", "Continuing Patronage")
formattable(Money_Table)
```

    ##                     Continuing Patronage
    ## Money Spent          No Yes
    ##   Around RM20 - RM40  3 42 
    ##   Less than RM20     17 41 
    ##   More than RM40      0  7 
    ##   Zero                8  4

The amount of money spent in a single visit at Starbucks show that a
significant amount of people who spend less than RM20, do not return to
Starbucks. They may find buying multiple items to expensive. The
interesting aspect of this data is that those who spend nothing, are
highly likely to not continue patronage.

## Analysis of Data

The data Starbucks requested as a survey was very well put. Its data
wanted to highlight how it was doing on a day to day basis. However, I
would include a comments section as to why or why not the customers will
or will not be returning to Starbucks. Then I can categorize certain
words into a positive, negative or neutral category in order to see
specific reasons as to why customers did not want to come back. If a lot
of negative words such as expensive and pricey appeared, then it would
mean that the drinks are too expensive for those customers.

``` r
#Notification of Promotions Table
Notification_Table <- cbind(table(str_trim(unlist(strsplit(str_trim(as.character(data$Notification_of_Promotions)), ";")))))

names(dimnames(Notification_Table)) <- c("Notification of Promotions", "Numbers Notified")
formattable(Notification_Table)
```

    ##                                    Numbers Notified
    ## Notification of Promotions          [,1]
    ##   Application offer                 1   
    ##   Billboards                        11  
    ##   Deal sites (fave, iprice, etc...) 7   
    ##   Emails                            18  
    ##   In Store displays                 21  
    ##   Never hear                        1   
    ##   Social Media                      89  
    ##   Starbucks Website/Apps            35  
    ##   Through friends and word of mouth 49

When looking at how most customers hear of promotions, most hear of it
through social media. Analyzing those social media posts that tagged the
specific promotion would accurately show how the promotion is fairing.
This would further improve Starbucks’ marketing and development of
drinks.

## Future Applications

In the future, I would like to develop my skills in machine learning and
building AIs. This can be implemented with this Sentiment Analysis by
automating more survey results and expanding upon the amount of
Starbucks’ my program can analyze.
