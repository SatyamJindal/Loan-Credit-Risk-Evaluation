library(e1071)  # Library for creating a naive-bayes model
library(caret)  # Library to import ConfusionMatrix
data = read.csv("C:/Users/satyam/Desktop/loan_prediction.csv")  #Importing the data
head(data)
str(data)

#Define Split Ration for the dataset  75%--> Train   25%-->Test
smp_size = floor(0.75*nrow(data)) 
smp_size
set.seed(123)

#Mixing up the data to create a better trained model
train_ind = sample(seq_len(nrow(data)),size = smp_size)
train_ind

#Splitting the model into training and testing datasets
train = data[train_ind,]
test = data[-train_ind,]
head(train)
sum(is.na(data))

#Creating the naive-bayes model
model = naiveBayes(loan_decision_type~.,data = train)
model

#Predicting the values using the testing dataset
pred = predict(model,test)

#ConfusionMatrix for accuracy and error
confusionMatrix(pred,test$loan_decision_type)
