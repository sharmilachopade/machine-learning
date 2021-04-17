# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)

#regressor = lm(formula = Salary ~ YearsExperience,
#data = training_set)
# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
print(y_pred)


# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$Marketing.Spend, y = training_set$Profit),
             colour = 'red') +
  geom_line(aes(x = training_set$Marketing.Spend, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('profit vs  (Training set)') +
  xlab('attri.....') +
  ylab('profite')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')