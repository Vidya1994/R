setwd("C:/Users/Vidya Gopalan/Downloads/Machine Learning - Udemy/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing")

dataset = read.csv('Data.csv')

View(dataset)

#Handling missing values
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x,na.rm=TRUE)),
                     dataset$Age)
View(dataset)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                        ave(dataset$Salary, FUN = function(x) mean(x,na.rm=TRUE)),  
                        dataset$Salary)
View(dataset)

#Encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('Spain','France','Germany'),
                         labels = c(2,1,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('Yes','No'),labels = c(1,0))

#Splitting data into training and test
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set = subset(dataset,split==TRUE)
testing_set = subset(dataset, split==FALSE)

#Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])
testing_set[,2:3] = scale(testing_set[,2:3])