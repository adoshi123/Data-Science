# Churn Modeling using CAP analysis

In these Data science algorithm we will take a step further where wew will do confusion matrix, correlation using VIF function in Python and then doing CAP analysis in Excel sheet. I will make you understand about every step in detail. Here we are talking about a bank data set which distributed over geopraphies in 3 countires namely Germany, France and Spain. With various features we will try and understand which is more important what is the average of it using tableau visulization which is my other repository under the heading Dashboards-and--Visulizations. We have also performed A/B testing for many features and the analysis for each output is shared in the tableau file.

### What is A/B testing
When we try and understand a independent feature w.r.t independent variables where the independent variable has only binary or two values that can be called as a A/B testing. This can be said as apart of statistical inference test  but cannot be called as a fully functional statistical inference test.

[![Ab_testing.png](https://s7.postimg.org/4y76ts9iz/Ab_testing.png)](https://postimg.org/image/lyq32gmk7/)

### What is Confusion Matrix
We usually tend to split our original data set into a test data and train data. When after the implementation of the algorithm on the train data we predicts results of the test data. Then we compare the results of the test data dependent variable and the output of test data implemented in the algorithm's dependent variable. It will result in a matrix where it calculates the results for 4 categories i.e. where in original test data the dependent variable is 0 for a record and the algorithm also predicted 0 for it. Same way it predicts for the categories and the result would be as follows.

```Python
print(metrics.confusion_matrix(y_ans, y_pred_class))
```

[![Confusion_Matrix.png](https://s7.postimg.org/k6x47ey0r/Confusion_Matrix.png)](https://postimg.org/image/kjoidlgaf/)

### What is correlation matrix
Here using the Corr function of Sckitlearn library we will make a correlation matrix. It is a half diagonal table where the relation of every independent variable with other independent variable using a numberical value. It is generally accepted that if the value is between 0.5 to 0.8 it is a fine. If the value is beyond that then it is of high concern.

```Python
corr = bank_new1.corr()
```

[![Correlation_Matrix.png](https://s7.postimg.org/tepcnzn1n/Correlation_Matrix.png)](https://postimg.org/image/t1xyht4rr/)

### What is CAP analysis
We tend to creata a graph for the average result of probabilities of the output to the predicted probabilities by the regression algorithm. The normal average line is a straight line like a diagonal while our implemented algorithm would have a curve over the normal line. 

[![CAP_analysis.png](https://s7.postimg.org/trgqu4v0r/CAP_analysis.png)](https://postimg.org/image/5aykznu9z/)

#### Analysis of CAP curve
This is generally used to hit the customers by marketing team where the budget is less and you want to maximize the reach with minimum effort. In the image we clearly see that by the time we contact 50% of the customers the churn rate would be nearly 70% which is a good number to reach in compared to normal where we would reach a number of 20% only. This helps in understanding our data much better and better targets to choose in critical situations.


### Algorithm Implementation

We will here implement backward elimination method for the regression algorithm to improve our efficieny of the algorithm by understanding the P-values for every variable with the coeffecient genereted from the summary.
With each implementation we tend to eliminate one variable who has highest P value and reimplement the algorithm.

#### First Implementation

[![Model1.png](https://s7.postimg.org/h02knt0q3/Model1.png)](https://postimg.org/image/gnb6hmig7/)

#### Second Implementation

[![Model2.png](https://s7.postimg.org/if45cjwob/Model2.png)](https://postimg.org/image/5npz61mw7/)

#### Third Implementation

[![Model3.png](https://s7.postimg.org/v6ibj3gqz/Model3.png)](https://postimg.org/image/bono35jt3/)

We finally stop as all the variables have less P-values ideally below 0.05 i.e. 5 percent.

Further implemenation can be found in the python file and CAP analysis in the CSV file.
