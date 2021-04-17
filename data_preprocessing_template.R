# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')

library(caTools)

#set.seed(123)
split = sample.split(dataset$Salary , SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

View(training_set)
# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
regressor = lm(formula = Salary ~ Age,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)



library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$Age, y = training_set$Salary),
             colour = 'red') +
  
  geom_line(aes(x = training_set$Age, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs age (Training set)') +
  xlab('age') +
  ylab('Salary')