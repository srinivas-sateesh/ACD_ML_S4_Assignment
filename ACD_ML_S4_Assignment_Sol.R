rm(list=ls(all=TRUE))
str(iris)
set.seed(1234)
ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
#print(ind)
train.data <- iris[ind==1, ]
test.data<- iris[ind==2,]
library(party)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length +
Petal.Width
#Binary Tree
iris_ctree <- ctree(myFormula,data=train.data)
#Check how prediction has worked
table(predict(iris_ctree),train.data$Species)

print(iris_ctree)

#Display the decision tree
plot(iris_ctree)

plot(iris_ctree,type="simple")

#Apply Decision tree on the test data
testPred<-predict(iris_ctree,newdata=test.data)

#Check how it has performed against Test data
finalPrediction<-table(testPred,test.data$Species)
print(finalPrediction)


