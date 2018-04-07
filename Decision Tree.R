library(caret) # Library for importing confusionMatrix
library(party) # Library for building the Decision Tree

#Reading the data
data = read.csv("C:/Users/satyam/Desktop/loan_prediction.csv")
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

#Building the decsion Tree model considering all attributes
dstree = ctree(loan_decision_type~.,data = train)
dstree

#Plotting the decision Tree
plot(dstree)

#Predicting the values using the testing dataset
pred = predict(dstree,test)
pred

#ConfusionMatrix for accuracy and error
confusionMatrix(pred,test$loan_decision_type)
